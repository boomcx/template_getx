import 'dart:async';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

import 'refresh_header.dart';

class PullRefreshControl extends StatelessWidget {
  const PullRefreshControl({
    super.key,
    this.header,
    required this.onRefresh,
    required this.childBuilder,
    this.locatorMode = false,
  });

  final Header? header;
  final FutureOr Function()? onRefresh;
  final ERChildBuilder childBuilder;
  final bool locatorMode;

  @override
  Widget build(BuildContext context) {
    return EasyRefresh.builder(
      header: header ??
          RefreshHeader(
            clamping: locatorMode,
            position: locatorMode
                ? IndicatorPosition.locator
                : IndicatorPosition.above,
          ),
      onRefresh: onRefresh,
      childBuilder: childBuilder,
    );
  }
}
