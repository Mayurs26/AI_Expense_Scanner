// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DashboardNotifier)
const dashboardProvider = DashboardNotifierProvider._();

final class DashboardNotifierProvider
    extends $AsyncNotifierProvider<DashboardNotifier, DashboardSummary> {
  const DashboardNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'dashboardProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$dashboardNotifierHash();

  @$internal
  @override
  DashboardNotifier create() => DashboardNotifier();
}

String _$dashboardNotifierHash() => r'6a624e0671f951c59bc092b5f956c17194bf3cb9';

abstract class _$DashboardNotifier extends $AsyncNotifier<DashboardSummary> {
  FutureOr<DashboardSummary> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<DashboardSummary>, DashboardSummary>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<DashboardSummary>, DashboardSummary>,
        AsyncValue<DashboardSummary>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
