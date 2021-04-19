import 'package:flutter/material.dart';
import 'package:flutter_cinema/common/constants/data_constants.dart';
import 'package:flutter_cinema/presentation/widgets/empty_data_wdget/empty_data_widget.dart';
import 'package:flutter_cinema/presentation/widgets/list_view_widget/load_more_widget.dart';
import 'package:flutter_cinema/presentation/widgets/list_view_widget/refresh_indicator_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListViewWidget extends StatefulWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final ScrollController scrollController;
  final Widget separator;
  final EdgeInsetsGeometry padding;
  final bool showEmptyWidget;
  final Widget emptyWidget;
  final Function(bool) loadMoreCallback;
  final Function(bool) refreshCallback;
  final Axis scrollDirection;
  final DataState state;

  ListViewWidget({
    Key key,
    @required this.itemBuilder,
    this.itemCount = 0,
    this.scrollController,
    this.separator,
    this.padding,
    this.showEmptyWidget = false,
    this.emptyWidget,
    this.loadMoreCallback,
    this.refreshCallback,
    this.scrollDirection = Axis.vertical,
    this.state = DataState.none,
  }) : super(key: key);

  @override
  _ListViewWidgetState createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  final _refreshController = RefreshController(initialRefresh: false);

  bool _disableScroll() => widget.state == DataState.refreshing;
  bool _isBeginLoadingMore = false;

  @override
  void didUpdateWidget(covariant ListViewWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state != DataState.refreshing) {
      _refreshController.refreshCompleted();
    }
    if ((widget.state == DataState.loadingMore ||
            widget.state == DataState.refreshing) &&
        _isBeginLoadingMore == true) {
      _isBeginLoadingMore = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.showEmptyWidget
            ? (widget.emptyWidget ?? EmptyDataWidget())
            : Container(),
        NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            if (scrollInfo.metrics.axis == widget.scrollDirection) {
              if (widget.state == DataState.success &&
                  _isBeginLoadingMore == false) {
                if (scrollInfo.metrics.pixels >=
                    scrollInfo.metrics.maxScrollExtent) {
                  _isBeginLoadingMore = true;
                  widget.loadMoreCallback?.call(true);
                }
              }
            }
            return false;
          },
          child: Stack(
            children: [
              SmartRefresher(
                onRefresh: () {
                  if (widget.refreshCallback != null) {
                    widget.refreshCallback?.call(true);
                  } else {
                    _refreshController.refreshCompleted();
                  }
                },
                enablePullDown: true,
                controller: _refreshController,
                header: RefreshIndicatorWidget(),
                child: ListView.separated(
                  scrollDirection: widget.scrollDirection,
                  controller: widget.scrollController,
                  padding: widget.padding ??
                      const EdgeInsets.only(
                        left: 0,
                        right: 0,
                        bottom: 40,
                        top: 0,
                      ),
                  physics: _disableScroll()
                      ? const NeverScrollableScrollPhysics()
                      : const BouncingScrollPhysics(),
                  itemBuilder: widget.itemBuilder,
                  itemCount: widget.itemCount,
                  separatorBuilder: (context, index) {
                    return widget.separator ?? Container();
                  },
                ),
              ),
              Visibility(
                visible: widget.state == DataState.loadingMore,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    LoadMoreWidget(
                        isLoading: widget.state == DataState.loadingMore)
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
