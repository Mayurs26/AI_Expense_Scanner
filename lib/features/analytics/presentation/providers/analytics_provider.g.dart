// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AnalyticsNotifier)
const analyticsProvider = AnalyticsNotifierProvider._();

final class AnalyticsNotifierProvider
    extends $AsyncNotifierProvider<AnalyticsNotifier, AnalyticsSummaryData> {
  const AnalyticsNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'analyticsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$analyticsNotifierHash();

  @$internal
  @override
  AnalyticsNotifier create() => AnalyticsNotifier();
}

String _$analyticsNotifierHash() => r'bd9794a6fb3cede7ae89abedd383633d6921a85f';

abstract class _$AnalyticsNotifier
    extends $AsyncNotifier<AnalyticsSummaryData> {
  FutureOr<AnalyticsSummaryData> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref
        as $Ref<AsyncValue<AnalyticsSummaryData>, AnalyticsSummaryData>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<AnalyticsSummaryData>, AnalyticsSummaryData>,
        AsyncValue<AnalyticsSummaryData>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
