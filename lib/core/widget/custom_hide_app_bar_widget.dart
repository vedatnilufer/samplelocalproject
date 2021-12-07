// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class CustomHideAppBarWidget extends StatefulWidget {
  Widget? topWidget;
  Widget? bottomWidget;
  int? itemLenght;

  final Widget Function(BuildContext context, int index) builder;

  CustomHideAppBarWidget({
    Key? key,
    this.topWidget,
    this.bottomWidget,
    required this.itemLenght,
    required this.builder,
  }) : super(key: key);

  @override
  _CustomHideAppBarWidgetState createState() => _CustomHideAppBarWidgetState();
}

class _CustomHideAppBarWidgetState extends State<CustomHideAppBarWidget> {
  ScrollController? scrollController = ScrollController();
  bool topWidgetVisible = false;
  bool bottomWidgetVisible = false;
  int ctrlInt = 0;

  @override
  void initState() {
    super.initState();

    widget.itemLenght! < 12 ? topWidgetVisible = true : topWidgetVisible = false;
    widget.itemLenght! < 12 ? bottomWidgetVisible = true : bottomWidgetVisible = false;
    scrollController!.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollState) {
        if (scrollState is ScrollEndNotification) {
          if (ctrlInt > 0) {
            if (topWidgetVisible == true) {
              setState(() {
                bottomWidgetVisible = true;
                ctrlInt = 0;
              });
            } else {
              setState(() {
                topWidgetVisible = true;
              });
            }
          } else {
            if (topWidgetVisible == false && scrollState.metrics.pixels == 0) {
              ctrlInt++;
            }
          }
        } else if (scrollState is ScrollUpdateNotification) {
          topWidgetVisible = false;
          bottomWidgetVisible = false;
          ctrlInt = 0;
        }

        return false;
      },
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          Visibility(
            visible: widget.topWidget != null ? true : false,
            child: SliverToBoxAdapter(
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: topWidgetVisible ? 0 : null,
                child: widget.topWidget!,
              ),
            ),
          ),
          Visibility(
            visible: widget.bottomWidget != null ? true : false,
            child: SliverToBoxAdapter(
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: topWidgetVisible ? 0 : null,
                child: widget.topWidget!,
              ),
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate(widget.builder, childCount: widget.itemLenght)),
        ],
      ),
    );
  }
}
