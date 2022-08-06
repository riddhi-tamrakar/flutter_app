import 'package:assignmentapp/core/utils/size_config.dart';
import 'package:flutter/material.dart';

import '../style/colors.dart';

class GradientScreen extends StatelessWidget {
  final Widget childWidget;

  const GradientScreen({
    Key? key,
    required this.childWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.all(SizeConfig.kPadding),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(SizeConfig.borderRadius),
        ),
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.kPadding),
          child: childWidget,
        ),
      ),
    );
  }
}
