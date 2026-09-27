import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:ai_expense_scanner/features/auth/presentation/providers/auth_provider.dart';
import 'package:ai_expense_scanner/features/auth/presentation/screens/splash_screen.dart';
import 'package:ai_expense_scanner/features/auth/presentation/screens/login_screen.dart';
import 'package:ai_expense_scanner/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:ai_expense_scanner/features/expenses/domain/entities/expense_entity.dart';
import 'package:ai_expense_scanner/features/expenses/presentation/screens/add_expense_screen.dart';
import 'package:ai_expense_scanner/features/expenses/presentation/screens/edit_expense_screen.dart';
import 'package:ai_expense_scanner/features/expenses/presentation/screens/expense_detail_screen.dart';
import 'package:ai_expense_scanner/features/expenses/presentation/screens/expense_history_screen.dart';
import 'package:ai_expense_scanner/features/analytics/presentation/screens/analytics_screen.dart';
import 'package:ai_expense_scanner/features/settings/presentation/screens/settings_screen.dart';
import 'package:ai_expense_scanner/features/settings/presentation/screens/manage_categories_screen.dart';
import 'package:ai_expense_scanner/features/settings/presentation/screens/budget_config_screen.dart';
import 'package:ai_expense_scanner/features/scanner/presentation/screens/scanner_screen.dart';
import 'package:ai_expense_scanner/features/ai_assistant/presentation/screens/ai_chat_screen.dart';
import 'package:ai_expense_scanner/core/constants/app_colors.dart';
import 'app_routes.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.splash,
    redirect: (context, state) {
      final authState = ref.read(authProvider);
      final isLoading = authState.isLoading;
      if (isLoading) return null;

      final isLoggedIn = authState.value != null;
      final isOnAuthRoute = state.matchedLocation == AppRoutes.splash ||
          state.matchedLocation == AppRoutes.login;

      if (!isLoggedIn && !isOnAuthRoute) return AppRoutes.login;
      return null;
    },
    routes: [
      // Splash
      GoRoute(
        path: AppRoutes.splash,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, __) => const SplashScreen(),
      ),

      // Login
      GoRoute(
        path: AppRoutes.login,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, __) => const LoginScreen(),
      ),

      // Add Expense (modal, above shell)
      GoRoute(
        path: AppRoutes.addExpense,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, state) {
          final extra = state.extra as ExpenseEntity?;
          return AddExpenseScreen(initialExpense: extra);
        },
      ),

      // Expense Detail
      GoRoute(
        path: '/expense/:id',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, state) {
          final id = int.parse(state.pathParameters['id']!);
          return ExpenseDetailScreen(expenseId: id);
        },
        routes: [
          GoRoute(
            path: 'edit',
            parentNavigatorKey: _rootNavigatorKey,
            builder: (_, state) {
              final expense = state.extra as ExpenseEntity;
              return EditExpenseScreen(expense: expense);
            },
          ),
        ],
      ),

      // Settings sub-screens (modal, above shell)
      GoRoute(
        path: AppRoutes.manageCategories,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, __) => const ManageCategoriesScreen(),
      ),
      GoRoute(
        path: AppRoutes.budgetConfig,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, __) => const BudgetConfigScreen(),
      ),

      // AI Chat (modal, above shell)
      GoRoute(
        path: AppRoutes.aiChat,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, __) => const AiChatScreen(),
      ),

      // Scanner (full-screen modal, above shell — no bottom nav bar)
      GoRoute(
        path: AppRoutes.scan,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, __) => const ScannerScreen(),
      ),

      // Main shell with bottom navigation
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return _AppShell(state: state, child: child);
        },
        routes: [
          GoRoute(
            path: AppRoutes.dashboard,
            pageBuilder: (_, state) => NoTransitionPage(
              key: state.pageKey,
              child: const DashboardScreen(),
            ),
          ),
          GoRoute(
            path: AppRoutes.history,
            pageBuilder: (_, state) => NoTransitionPage(
              key: state.pageKey,
              child: const ExpenseHistoryScreen(),
            ),
          ),
          GoRoute(
            path: AppRoutes.analytics,
            pageBuilder: (_, state) => NoTransitionPage(
              key: state.pageKey,
              child: const AnalyticsScreen(),
            ),
          ),
          GoRoute(
            path: AppRoutes.settings,
            pageBuilder: (_, state) => NoTransitionPage(
              key: state.pageKey,
              child: const SettingsScreen(),
            ),
          ),
        ],
      ),
    ],
  );
}

// ─── Shell with Bottom Navigation ─────────────────────────────────────────────

class _AppShell extends StatelessWidget {
  final Widget child;
  final GoRouterState state;

  const _AppShell({required this.child, required this.state});

  int _currentIndex(String location) {
    if (location.startsWith('/dashboard')) return 0;
    if (location.startsWith('/scan')) return 1;
    if (location.startsWith('/history')) return 2;
    if (location.startsWith('/analytics')) return 3;
    if (location.startsWith('/settings')) return 4;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final location = state.matchedLocation;
    final currentIndex = _currentIndex(location);

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              context.go(AppRoutes.dashboard);
            case 1:
              context.go(AppRoutes.scan);
            case 2:
              context.go(AppRoutes.history);
            case 3:
              context.go(AppRoutes.analytics);
            case 4:
              context.go(AppRoutes.settings);
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: _ScanIcon(),
            selectedIcon: _ScanIcon(),
            label: 'Scan',
          ),
          NavigationDestination(
            icon: Icon(Icons.history_outlined),
            selectedIcon: Icon(Icons.history_rounded),
            label: 'History',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart_rounded),
            label: 'Analytics',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings_rounded),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

/// CRED-style elevated scan button for center nav item
class _ScanIcon extends StatelessWidget {
  const _ScanIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: const BoxDecoration(
        color: AppColors.accent,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color(0x4000C896),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: const Icon(
        Icons.document_scanner_outlined,
        color: Colors.white,
        size: 22,
      ),
    );
  }
}
