// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_task_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$storeTaskHash() => r'5278e4d66ec0cee651cd9a436efab0336cfc0c81';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [storeTask].
@ProviderFor(storeTask)
const storeTaskProvider = StoreTaskFamily();

/// See also [storeTask].
class StoreTaskFamily extends Family<AsyncValue<TaskModel>> {
  /// See also [storeTask].
  const StoreTaskFamily();

  /// See also [storeTask].
  StoreTaskProvider call(
    TaskModel task,
  ) {
    return StoreTaskProvider(
      task,
    );
  }

  @override
  StoreTaskProvider getProviderOverride(
    covariant StoreTaskProvider provider,
  ) {
    return call(
      provider.task,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'storeTaskProvider';
}

/// See also [storeTask].
class StoreTaskProvider extends AutoDisposeFutureProvider<TaskModel> {
  /// See also [storeTask].
  StoreTaskProvider(
    TaskModel task,
  ) : this._internal(
          (ref) => storeTask(
            ref as StoreTaskRef,
            task,
          ),
          from: storeTaskProvider,
          name: r'storeTaskProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$storeTaskHash,
          dependencies: StoreTaskFamily._dependencies,
          allTransitiveDependencies: StoreTaskFamily._allTransitiveDependencies,
          task: task,
        );

  StoreTaskProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.task,
  }) : super.internal();

  final TaskModel task;

  @override
  Override overrideWith(
    FutureOr<TaskModel> Function(StoreTaskRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StoreTaskProvider._internal(
        (ref) => create(ref as StoreTaskRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        task: task,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TaskModel> createElement() {
    return _StoreTaskProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StoreTaskProvider && other.task == task;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, task.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StoreTaskRef on AutoDisposeFutureProviderRef<TaskModel> {
  /// The parameter `task` of this provider.
  TaskModel get task;
}

class _StoreTaskProviderElement
    extends AutoDisposeFutureProviderElement<TaskModel> with StoreTaskRef {
  _StoreTaskProviderElement(super.provider);

  @override
  TaskModel get task => (origin as StoreTaskProvider).task;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
