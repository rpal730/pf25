
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_2025/res/pagination/pagination.dart';

class PaginationBuilder extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    ScrollController scrollController,
    int childCount,
    bool Function(int index) showLoader,
  ) builder;
  final VoidCallback onLoadMore;
  final int childCount;
  final Pagination pagination;

  const PaginationBuilder({
    super.key,
    required this.builder,
    required this.onLoadMore,
    required this.childCount,
    required this.pagination,
  });

  @override
  _PaginationBuilderState createState() => _PaginationBuilderState();
}

class _PaginationBuilderState extends State<PaginationBuilder> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.atEdge && _scrollController.position.pixels != 0) {
      widget.onLoadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final childCount = widget.childCount + (widget.pagination.isLastPage ? 0 : 1);

    return widget.builder(
      context,
      _scrollController,
      
      childCount,
      (index) {

    
        return index >= widget.childCount;
      },
    );
  }
}
