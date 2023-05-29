import 'package:flutter/foundation.dart';

class PagingMixinController<T> extends ValueNotifier<PagingMixinData<T>> {
  PagingMixinController(super.value);

  dynamic get error => value.error;
  List<T> get items => value.items;
  int get itemCount => items.length;
}

class PagingMixinData<T> {
  // 列表数据
  final List<T> items;

  /// 错误信息
  final dynamic error;

  PagingMixinData({required this.items, this.error});

  PagingMixinData<T> copyWith({
    List<T>? items,
    dynamic error,
  }) {
    return PagingMixinData<T>(
      items: items ?? this.items,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(covariant PagingMixinData<T> other) {
    if (identical(this, other)) return true;

    return listEquals(other.items, items) && other.error == error;
  }

  @override
  int get hashCode => items.hashCode ^ error.hashCode;
}
