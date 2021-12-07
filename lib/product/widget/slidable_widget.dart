import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:samplelocalproject/product/constants/color/color_constants.dart';
import 'package:samplelocalproject/product/localization/application_localizations.dart';
import 'package:samplelocalproject/product/localization/application_text_constants.dart';

class SlidableWidget extends StatelessWidget {
  final Widget _child;
  final dynamic _viewModel;
  final dynamic _model;
  final bool left;
  const SlidableWidget({Key? key, required Widget child, required dynamic viewModel, required dynamic model, required this.left})
      : _child = child,
        _viewModel = viewModel,
        _model = model,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: left ? null : _slidableActionPane(context),
      startActionPane: left ? _slidableActionPane(context) : null,
      child: _child,
    );
  }

  ActionPane _slidableActionPane(BuildContext context) {
    return ActionPane(
      motion: const ScrollMotion(),
      children: [
        _slidableDeleteAction(context),
        _slidableShareAction(context),
      ],
    );
  }

  SlidableAction _slidableDeleteAction(BuildContext context) {
    return SlidableAction(
      onPressed: (context) async {
        await _viewModel.deleteItem(_model.id, _model);
        _viewModel.init();
      },
      backgroundColor: ColorConstants.sunsetOrange,
      foregroundColor: Colors.white,
      icon: Icons.delete,
      label: getTranslate(context, ApplicationText.delete) ?? ApplicationText.delete,
    );
  }

  SlidableAction _slidableShareAction(BuildContext context) {
    return SlidableAction(
      onPressed: (context) {},
      backgroundColor: ColorConstants.java,
      foregroundColor: Colors.white,
      icon: Icons.share,
      label: getTranslate(context, ApplicationText.share) ?? ApplicationText.share,
    );
  }
}
