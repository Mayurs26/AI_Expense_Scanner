import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_expense_scanner/core/constants/app_colors.dart';
import 'package:ai_expense_scanner/core/constants/app_sizes.dart';
import 'package:ai_expense_scanner/core/constants/app_strings.dart';
import 'package:ai_expense_scanner/features/auth/domain/entities/user_entity.dart';
import 'package:ai_expense_scanner/features/settings/presentation/providers/settings_provider.dart';
import '../providers/auth_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  bool _minDelayElapsed = false;

  @override
  void initState() {
    super.initState();
    debugPrint('[SplashScreen] initState started');

    // Normal delay
    Future.delayed(const Duration(milliseconds: 2200), () {
      debugPrint('[SplashScreen] min delay elapsed');
      if (mounted) {
        setState(() => _minDelayElapsed = true);
        final auth = ref.read(authProvider);
        _handleNavigation(auth);
      }
    });

    // Fallback timeout (4 seconds)
    Future.delayed(const Duration(milliseconds: 4000), () {
      if (mounted) {
        debugPrint(
            '[SplashScreen] Fallback timeout reached. Forcing navigation.');
        context.go('/login');
      }
    });
  }

  void _handleNavigation(AsyncValue<UserEntity?> authState) async {
    if (!_minDelayElapsed) return;

    authState.when(
      data: (user) async {
        debugPrint('[SplashScreen] Auth resolved with user: ${user?.id}');
        if (!mounted) return;
        if (user != null) {
          try {
            final settings =
                await ref.read(settingsRepositoryProvider).getSettings();
            if (settings.biometricEnabled) {
              final authNotifier = ref.read(authProvider.notifier);
              final authenticated =
                  await authNotifier.authenticateWithBiometric();
              if (!authenticated) {
                await authNotifier.signOut();
                if (mounted) context.go('/login');
                return;
              }
            }
          } catch (e) {
            debugPrint('Biometric check failed: $e');
          }
          if (mounted) context.go('/dashboard');
        } else {
          context.go('/login');
        }
      },
      error: (e, st) {
        debugPrint('[SplashScreen] Auth error: $e');
        if (!mounted) return;
        context.go('/login');
      },
      loading: () {
        debugPrint('[SplashScreen] Auth still loading...');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(
        '[SplashScreen] build called. minDelayElapsed: $_minDelayElapsed');

    ref.listen(authProvider, (_, next) {
      debugPrint('[SplashScreen] authProvider listener triggered');
      _handleNavigation(next);
    });

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(AppSizes.radiusXl),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accent.withValues(alpha: 0.4),
                    blurRadius: 30,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Icon(
                Icons.receipt_long_rounded,
                color: Colors.white,
                size: 52,
              ),
            )
                .animate()
                .scale(
                  duration: 600.ms,
                  curve: Curves.elasticOut,
                  begin: const Offset(0.3, 0.3),
                )
                .fadeIn(duration: 400.ms),

            const SizedBox(height: AppSizes.xl),

            const Text(
              AppStrings.appName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.5,
              ),
            ).animate().fadeIn(delay: 400.ms, duration: 400.ms).slideY(
                  begin: 0.3,
                  delay: 400.ms,
                  duration: 400.ms,
                ),

            const SizedBox(height: AppSizes.sm),

            const Text(
              AppStrings.appTagline,
              style: TextStyle(
                color: AppColors.accent,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ).animate().fadeIn(delay: 600.ms, duration: 400.ms),

            const SizedBox(height: AppSizes.xxl * 2),

            // Loading indicator
            const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                color: AppColors.accent,
                strokeWidth: 2.5,
              ),
            ).animate().fadeIn(delay: 800.ms, duration: 400.ms),
          ],
        ),
      ),
    );
  }
}
