import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ai_expense_scanner/core/constants/app_colors.dart';
import 'package:ai_expense_scanner/core/constants/app_sizes.dart';
import 'package:ai_expense_scanner/core/constants/app_strings.dart';
import 'package:ai_expense_scanner/core/extensions/currency_extensions.dart';
import 'package:ai_expense_scanner/core/services/export_service.dart';
import 'package:ai_expense_scanner/core/services/haptic_service.dart';
import 'package:ai_expense_scanner/features/auth/presentation/providers/auth_provider.dart';
import 'package:ai_expense_scanner/features/expenses/presentation/providers/expenses_provider.dart';
import 'package:ai_expense_scanner/features/settings/domain/entities/app_settings.dart';
import 'package:ai_expense_scanner/features/settings/presentation/providers/settings_provider.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsync = ref.watch(settingsProvider);
    final user = ref.watch(authProvider).value;

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.settings)),
      body: settingsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (settings) => _SettingsContent(settings: settings, user: user),
      ),
    );
  }
}

class _SettingsContent extends ConsumerWidget {
  final AppSettings settings;
  final dynamic user;

  const _SettingsContent({required this.settings, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        // Profile section
        _ProfileTile(user: user),

        const Divider(height: 0),

        // Appearance
        const _SectionHeader('Appearance'),
        _SettingsTile(
          icon: Icons.palette_outlined,
          title: AppStrings.theme,
          subtitle: settings.themeMode.capitalized,
          onTap: () => _showThemeDialog(context, ref, settings.themeMode),
        ),
        _SettingsTile(
          icon: Icons.currency_exchange_rounded,
          title: AppStrings.currency,
          subtitle: '${settings.currencySymbol} (${settings.currencyCode})',
          onTap: () => _showCurrencyDialog(context, ref),
        ),

        const Divider(height: 0),

        // Finance
        const _SectionHeader('Finance'),
        _SettingsTile(
          icon: Icons.category_outlined,
          title: AppStrings.manageCategories,
          subtitle: 'Add, edit or remove categories',
          onTap: () => context.push('/settings/categories'),
          trailing: const Icon(Icons.chevron_right_rounded),
        ),
        _SettingsTile(
          icon: Icons.account_balance_wallet_outlined,
          title: AppStrings.monthlyBudget,
          subtitle: settings.totalMonthlyBudget > 0
              ? settings.totalMonthlyBudget
                  .formatted(symbol: settings.currencySymbol)
              : 'Not set',
          onTap: () => _showBudgetDialog(context, ref, settings),
        ),

        const Divider(height: 0),

        // Privacy & Security
        const _SectionHeader('Privacy & Security'),
        _SettingsSwitchTile(
          icon: Icons.fingerprint_rounded,
          title: AppStrings.biometricLock,
          subtitle: 'Require biometric to open app',
          value: settings.biometricEnabled,
          onChanged: (v) {
            HapticService.selection();
            ref.read(settingsProvider.notifier).setBiometricEnabled(v);
          },
        ),

        const Divider(height: 0),

        // Data
        const _SectionHeader('Data'),
        _SettingsTile(
          icon: Icons.download_rounded,
          title: AppStrings.exportCsv,
          subtitle: 'Export all expenses to CSV',
          onTap: () => _exportCsv(context, ref, settings),
        ),
        _SettingsTile(
          icon: Icons.delete_forever_outlined,
          title: AppStrings.clearAllData,
          subtitle: 'Permanently delete all local data',
          titleColor: AppColors.error,
          onTap: () => _confirmClearData(context, ref),
        ),

        const Divider(height: 0),

        // Account
        const _SectionHeader('Account'),
        _SettingsTile(
          icon: Icons.logout_rounded,
          title: AppStrings.signOut,
          titleColor: AppColors.error,
          onTap: () => _confirmSignOut(context, ref),
        ),

        const SizedBox(height: AppSizes.xxl),

        // Version
        const Center(
          child: Text(
            'AI Expense Scanner v1.0.0',
            style: TextStyle(color: AppColors.textHint, fontSize: 12),
          ),
        ),
        const SizedBox(height: AppSizes.xl),
      ],
    );
  }

  Future<void> _exportCsv(
      BuildContext context, WidgetRef ref, AppSettings settings) async {
    final expensesAsync = ref.read(expensesProvider);
    final expenses = expensesAsync.value ?? [];
    if (expenses.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No expenses to export')),
      );
      return;
    }
    await ExportService.exportExpensesToCsv(expenses,
        currencySymbol: settings.currencySymbol);
  }

  Future<void> _confirmClearData(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(AppStrings.clearConfirm),
        content: const Text(AppStrings.clearDesc),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text(AppStrings.cancel)),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(backgroundColor: AppColors.error),
            child: const Text(AppStrings.delete),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await HapticService.error();
      await ref.read(settingsProvider.notifier).clearAllData();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('All data cleared')),
        );
      }
    }
  }

  Future<void> _confirmSignOut(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Sign Out?'),
        content: const Text('Your local data will be preserved.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text(AppStrings.cancel)),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text(AppStrings.signOut),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(authProvider.notifier).signOut();
      if (context.mounted) {
        context.go('/login');
      }
    }
  }

  Future<void> _showThemeDialog(
      BuildContext context, WidgetRef ref, String current) {
    return showDialog(
      context: context,
      builder: (ctx) => SimpleDialog(
        title: const Text('Choose Theme'),
        children: [
          for (final mode in ['light', 'dark', 'system'])
            ListTile(
              title: Text(mode.capitalized),
              trailing: current == mode ? const Icon(Icons.check, color: AppColors.accent) : null,
              onTap: () {
                ref.read(settingsProvider.notifier).updateTheme(mode);
                Navigator.pop(ctx);
              },
            ),
        ],
      ),
    );
  }

  Future<void> _showCurrencyDialog(BuildContext context, WidgetRef ref) {
    return showDialog(
      context: context,
      builder: (ctx) => SimpleDialog(
        title: const Text('Select Currency'),
        children: SupportedCurrency.values.map((c) {
          return SimpleDialogOption(
            onPressed: () {
              ref
                  .read(settingsProvider.notifier)
                  .updateCurrency(c.symbol, c.code);
              Navigator.pop(ctx);
            },
            child: Text('${c.symbol} — ${c.label}'),
          );
        }).toList(),
      ),
    );
  }

  Future<void> _showBudgetDialog(
      BuildContext context, WidgetRef ref, AppSettings settings) {
    final ctrl = TextEditingController(
        text: settings.totalMonthlyBudget > 0
            ? settings.totalMonthlyBudget.toStringAsFixed(0)
            : '');
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Monthly Budget'),
        content: TextField(
          controller: ctrl,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            prefixText: settings.currencySymbol,
            labelText: 'Total monthly budget',
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              final amount = double.tryParse(ctrl.text) ?? 0;
              ref
                  .read(settingsProvider.notifier)
                  .updateTotalBudget(amount);
              Navigator.pop(ctx);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

// Helper extension
extension StringCapitalize on String {
  String get capitalized =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
}

// Sub-widgets

class _ProfileTile extends StatelessWidget {
  final dynamic user;
  const _ProfileTile({required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(AppSizes.pagePadding),
      leading: CircleAvatar(
        radius: AppSizes.avatarMd / 2,
        backgroundColor: AppColors.accent.withValues(alpha: 0.2),
        backgroundImage: user?.photoUrl != null
            ? CachedNetworkImageProvider(user!.photoUrl!) as ImageProvider
            : null,
        child: user?.photoUrl == null
            ? Text(
                user?.displayName?.substring(0, 1).toUpperCase() ?? 'U',
                style: const TextStyle(
                  color: AppColors.accent,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              )
            : null,
      ),
      title: Text(user?.displayName ?? 'User',
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
      subtitle: Text(user?.email ?? '', style: const TextStyle(fontSize: 13)),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppSizes.pagePadding, AppSizes.lg,
          AppSizes.pagePadding, AppSizes.xs),
      child: Text(
        title.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              letterSpacing: 1.2,
              color: AppColors.textSecondary,
            ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Color? titleColor;
  final VoidCallback? onTap;
  final Widget? trailing;

  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.titleColor,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,
          color: titleColor ?? Theme.of(context).colorScheme.primary),
      title: Text(title,
          style: TextStyle(
              color: titleColor, fontWeight: FontWeight.w600)),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: trailing ?? const Icon(Icons.chevron_right_rounded),
      onTap: onTap,
    );
  }
}

class _SettingsSwitchTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SettingsSwitchTile({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      secondary: Icon(icon),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      value: value,
      activeTrackColor: AppColors.accent.withValues(alpha: 0.5),
      activeThumbColor: AppColors.accent,
      onChanged: onChanged,
    );
  }
}
