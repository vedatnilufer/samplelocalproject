import 'package:flutter/material.dart';
import 'package:samplelocalproject/core/extension/widget_extension.dart';
import 'package:samplelocalproject/product/localization/application_localizations.dart';

class CustomTabsWidget extends StatelessWidget {
  final int count;
  final String applicationText;
  const CustomTabsWidget({
    Key? key,
    required this.count,
    required this.applicationText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(child: Text(getTranslate(context, applicationText) ?? applicationText, maxLines: 1).toFitted),
          Stack(
            children: [
              Positioned(
                child: Icon(Icons.bookmark, color: Theme.of(context).primaryColor, size: 40),
              ),
              Positioned(
                top: 10,
                right: count < 10 ? 13 : 9,
                child: Text('$count ', style: const TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
