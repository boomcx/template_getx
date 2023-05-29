import 'package:flutter/material.dart';

import 'paging_mixin.dart';
import 'pull_refresh_control.dart';

/// 快速构建 `ListView` 形式的分页列表
/// 其他详细参数查看 [ListView]
class SpeedyPagedList<T> extends StatelessWidget {
  const SpeedyPagedList({
    super.key,
    required this.controller,
    required this.itemBuilder,
    this.scrollController,
    this.padding,
    double? itemExtent,
  })  : _separatorBuilder = null,
        _itemExtent = itemExtent;

  const SpeedyPagedList.separator({
    super.key,
    required this.controller,
    required this.itemBuilder,
    required IndexedWidgetBuilder separatorBuilder,
    this.scrollController,
    this.padding,
  })  : _separatorBuilder = separatorBuilder,
        _itemExtent = null;

  final PagingMixin controller;

  final Widget Function(BuildContext context, int index, T item) itemBuilder;

  /// 参照 [ScrollView.controller].
  final ScrollController? scrollController;

  /// 参照 [ListView.itemExtent].
  final EdgeInsetsGeometry? padding;

  /// 参照 [SliverChildBuilderDelegate.addSemanticIndexes].
  final IndexedWidgetBuilder? _separatorBuilder;

  /// 参照 [ListView.itemExtent].
  final double? _itemExtent;

  @override
  Widget build(BuildContext context) {
    return PullRefreshControl(
      pagingMixin: controller,
      childBuilder: (context, physics) {
        return _separatorBuilder != null
            ? ListView.separated(
                physics: physics,
                padding: padding,
                controller: scrollController,
                itemCount: controller.itemCount,
                itemBuilder: (context, index) {
                  final item = controller.items[index];
                  return itemBuilder.call(context, index, item);
                },
                separatorBuilder: _separatorBuilder!,
              )
            : ListView.builder(
                physics: physics,
                padding: padding,
                controller: scrollController,
                itemExtent: _itemExtent,
                itemCount: controller.itemCount,
                itemBuilder: (context, index) {
                  final item = controller.items[index];
                  return itemBuilder.call(context, index, item);
                },
              );
      },
    );
  }
}

/// 快速构建 `ListView` 形式的分页列表
/// 其他详细参数查看 [ListView]
class SpeedyPagedGrid<T> extends StatelessWidget {
  const SpeedyPagedGrid({
    super.key,
    required this.controller,
    required this.itemBuilder,
    required this.gridDelegate,
    this.scrollController,
    this.padding,
  });

  final PagingMixin controller;

  final Widget Function(BuildContext context, int index, T item) itemBuilder;

  /// 参照 [ScrollView.controller].
  final ScrollController? scrollController;

  /// 参照 [ListView.itemExtent].
  final EdgeInsetsGeometry? padding;

  /// 参照 [GridView.gridDelegate].
  final SliverGridDelegate gridDelegate;

  @override
  Widget build(BuildContext context) {
    return PullRefreshControl(
      pagingMixin: controller,
      childBuilder: (context, physics) {
        return GridView.builder(
          physics: physics,
          padding: padding,
          controller: scrollController,
          gridDelegate: gridDelegate,
          itemCount: controller.itemCount,
          itemBuilder: (context, index) {
            final item = controller.items[index];
            return itemBuilder.call(context, index, item);
          },
        );
      },
    );
  }
}
