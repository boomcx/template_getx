import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'paging_mixin.dart';
import 'refresh_header.dart';

/// 刷新配置
class PullRefreshControl extends StatelessWidget {
  const PullRefreshControl({
    super.key,
    required this.pagingMixin,
    required this.childBuilder,
    this.header,
    this.footer,
    this.locatorMode = false,
    this.refreshOnStart = true,
    this.startRefreshHeader,
  });

  final Header? header;
  final Footer? footer;

  final bool refreshOnStart;
  final Header? startRefreshHeader;

  /// 列表视图
  final ERChildBuilder childBuilder;

  /// 分页控制器
  final PagingMixin pagingMixin;

  /// 是否固定刷新偏移
  final bool locatorMode;

  @override
  Widget build(BuildContext context) {
    final firstRefreshHeader = startRefreshHeader ??
        BuilderHeader(
          triggerOffset: 70,
          clamping: true,
          position: IndicatorPosition.above,
          processedDuration: Duration.zero,
          builder: (ctx, state) {
            if (state.mode == IndicatorMode.inactive ||
                state.mode == IndicatorMode.done) {
              return const SizedBox();
            }
            return Container(
              padding: const EdgeInsets.only(bottom: 100),
              width: double.infinity,
              height: state.viewportDimension,
              alignment: Alignment.center,
              child: SpinKitFadingCube(
                size: 25,
                color: Theme.of(context).primaryColor,
              ),
            );
          },
        );

    return EasyRefresh.builder(
      controller: pagingMixin.pagingController,
      header: header ??
          RefreshHeader(
            clamping: locatorMode,
            position: locatorMode
                ? IndicatorPosition.locator
                : IndicatorPosition.above,
          ),
      footer: footer ?? const ClassicFooter(),
      onRefresh: pagingMixin.onRefresh,
      onLoad: pagingMixin.isLoadMore ? pagingMixin.onLoad : null,
      childBuilder: (context, physics) {
        return ValueListenableBuilder(
          valueListenable: pagingMixin.state,
          builder: (context, value, child) {
            return childBuilder.call(context, physics);
          },
        );
      },
      refreshOnStart: refreshOnStart,
      refreshOnStartHeader: firstRefreshHeader,
    );
  }
}
