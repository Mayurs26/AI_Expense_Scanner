// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(expenseRepository)
const expenseRepositoryProvider = ExpenseRepositoryProvider._();

final class ExpenseRepositoryProvider extends $FunctionalProvider<
    ExpenseRepository,
    ExpenseRepository,
    ExpenseRepository> with $Provider<ExpenseRepository> {
  const ExpenseRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'expenseRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$expenseRepositoryHash();

  @$internal
  @override
  $ProviderElement<ExpenseRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ExpenseRepository create(Ref ref) {
    return expenseRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ExpenseRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ExpenseRepository>(value),
    );
  }
}

String _$expenseRepositoryHash() => r'2d0892f37955435a16fb136fb59f0b72bd737f1d';

@ProviderFor(CategoriesNotifier)
const categoriesProvider = CategoriesNotifierProvider._();

final class CategoriesNotifierProvider
    extends $AsyncNotifierProvider<CategoriesNotifier, List<CategoryEntity>> {
  const CategoriesNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'categoriesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$categoriesNotifierHash();

  @$internal
  @override
  CategoriesNotifier create() => CategoriesNotifier();
}

String _$categoriesNotifierHash() =>
    r'b09f19fdb67735389f5544e2bd825dc09a74288b';

abstract class _$CategoriesNotifier
    extends $AsyncNotifier<List<CategoryEntity>> {
  FutureOr<List<CategoryEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref
        as $Ref<AsyncValue<List<CategoryEntity>>, List<CategoryEntity>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<CategoryEntity>>, List<CategoryEntity>>,
        AsyncValue<List<CategoryEntity>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ExpensesNotifier)
const expensesProvider = ExpensesNotifierProvider._();

final class ExpensesNotifierProvider
    extends $AsyncNotifierProvider<ExpensesNotifier, List<ExpenseEntity>> {
  const ExpensesNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'expensesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$expensesNotifierHash();

  @$internal
  @override
  ExpensesNotifier create() => ExpensesNotifier();
}

String _$expensesNotifierHash() => r'9faa98fc5cfcae32ce669f2b792edc472743e7cb';

abstract class _$ExpensesNotifier extends $AsyncNotifier<List<ExpenseEntity>> {
  FutureOr<List<ExpenseEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<ExpenseEntity>>, List<ExpenseEntity>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<ExpenseEntity>>, List<ExpenseEntity>>,
        AsyncValue<List<ExpenseEntity>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
