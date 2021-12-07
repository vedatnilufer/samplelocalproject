import 'package:flutter/material.dart';

class BaseView<T> extends StatefulWidget {
  final Widget Function(BuildContext context, T viewModel) onBuilder;
  final T? viewModel;
  final Function(T viewModel)? onModelReady;
  final Function(T viewModel)? onDispose;

  const BaseView({Key? key, this.viewModel, required this.onBuilder, this.onModelReady, this.onDispose}) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T> extends State<BaseView<T>> {
  late T model;
  @override
  void initState() {
    model = widget.viewModel!;
    widget.onModelReady!(model);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!(model);
  }

  @override
  Widget build(BuildContext context) {
    return widget.onBuilder(context, model);
  }
}
