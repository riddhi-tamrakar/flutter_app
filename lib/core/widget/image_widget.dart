import 'package:assignmentapp/core/utils/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../style/colors.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final double borderRadius;
  const ImageWidget({
    Key? key,
    required this.imageUrl,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: SizeConfig.screenWidth * 0.15,
      width: SizeConfig.screenWidth * 0.15,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) =>
              CircularProgressIndicator(color: Theme.of(context).primaryColor),
          errorWidget: (context, url, error) => Container(
              color: Theme.of(context).canvasColor,
              padding: EdgeInsets.all(SizeConfig.kPadding),
              child: const Icon(Icons.error)),
        ),
      ),
    );
  }
}
