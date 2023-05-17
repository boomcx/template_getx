import 'dart:async';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

mixin PagingMixin<T> {
  /// 初始页码
  int _initPage = 0;
  int _page = 0;

  PagingController<int, T> _pagingController =
      PagingController(firstPageKey: 0);
  PagingController<int, T> get pagingController => _pagingController;

  /// 控制刷新结束回调
  Completer? _refreshComplater;

  /// 数据列表
  List<T> get items => _pagingController.itemList ?? [];
  // bool _isRefreshing = false;

  /// 挂载分页器
  /// `initPage` 初始页码值
  void initPaging({int initPage = 0}) {
    // 重置分页器
    if (_initPage != initPage) {
      _initPage = initPage;
      _pagingController.dispose();
      _pagingController = PagingController(firstPageKey: initPage);
    }

    // if (!_isRefreshing) {
    _pagingController.addPageRequestListener((pageKey) {
      loadData(pageKey);
    });
    // } else {
    //   _pagingController.notifyPageRequestListeners(1);
    // }
    // ref.onDispose(() {
    // _isRefreshing = true;
    // });
  }

  /// 刷新数据
  Future onRefresh() {
    _refreshComplater = Completer();
    // retryLastFailedRequest();
    _pagingController.notifyPageRequestListeners(_initPage);
    return _refreshComplater!.future;
  }

  /// 数据加载（网络请求）
  FutureOr loadData(int page);

  /// 获取数据前调用
  void beginLoad(int page) {
    _page = page;
  }

  /// 获取数据后调用
  /// `items` 列表数据
  /// `maxCount` 数据总数，如果为0则默认通过 `items` 有无数据判断是否可以分页加载, null为非分页请求
  /// `error` 错误信息
  /// `limit` 单页显示数量限制，如果items.length < limit 则没有更多数据
  void endLoad(
    List<T>? list, {
    int? maxCount,
    // int limit = 5,
    dynamic error,
  }) {
    if (_page == _initPage) {
      _refreshComplater?.complete();
      _refreshComplater = null;
    }
    if (list != null) {
      bool hasNoMore = true;

      // 刷新清空历史数据列表
      if (_page == _initPage && this.items.isNotEmpty) {
        updateItems([]);
      }

      // 默认没有总数量 `maxCount`，用获取当前数据列表是否有值判断
      // 默认有总数量 `maxCount`, 则判断当前请求数据list+历史数据items是否小于总数
      // bool hasNoMore = !((items.length + list.length) < maxCount);
      if (maxCount != null) {
        hasNoMore = (list.length + _pagingController.itemCount) >= maxCount;
      }

      if (hasNoMore) {
        _pagingController.appendLastPage(list);
      } else {
        if (list.isNotEmpty) {
          _pagingController.appendPage(list, _page + 1);
        }
      }
    } else {
      // _pagingController.appendLastPage([]);
      _pagingController.error = error ?? '数据请求错误';
    }
  }

  /// 更新数据列表
  void updateItems(List<T> list) {
    _pagingController.itemList = list;
    // _pagingController.notifyListeners();
  }

  /// 重置加载的错误显示
  void retryLastFailedRequest() {
    _pagingController.retryLastFailedRequest();
  }
}
