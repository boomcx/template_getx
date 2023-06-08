import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../widgets/empty_data_view.dart';
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

    return ValueListenableBuilder(
      valueListenable: pagingMixin.state,
      builder: (context, value, child) {
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
          refreshOnStart: refreshOnStart,
          refreshOnStartHeader: firstRefreshHeader,
          onRefresh: pagingMixin.onRefresh,
          onLoad: (pagingMixin.isLoadMore && !value.isStartEmpty)
              ? pagingMixin.onLoad
              : null,
          childBuilder: (context, physics) {
            if (value.isStartEmpty) {
              /// 原计划是点击刷新恢复到初始加载`refreshOnStart`的状态，
              /// 但没解决如何恢复到`EasyRefresh` `firstRefreshHeader`的显示
              /// `SingleChildScrollView`会缩聚内部组件，所以给个`Size`或者 `Padding`
              return SingleChildScrollView(
                physics: physics,
                child: const Padding(
                  padding: EdgeInsets.only(top: 100, bottom: 100),
                  child: DefaultEmptyDataView(
                    text: '点击重新获取数据',
                    // onPressed: () {
                    //   pagingMixin.onRefresh();
                    // },
                  ),
                ),
              );
            }
            return childBuilder.call(context, physics);
          },
        );
      },
    );
  }
}
