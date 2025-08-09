import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_portfolio_2025/res/emoji.dart';
import 'package:flutter_web_portfolio_2025/res/loading.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? url;
  final Color? color;
  final BlendMode? colorBlendMode;
  final BoxFit? boxfit;
  final Widget? child;
  const CustomNetworkImage({
    super.key,
    this.url,
    this.color,
    this.colorBlendMode,
    this.boxfit,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder:
          (context, url) => Container(color: color, child: const Loading()),
      errorWidget:
          (context, _, __) => Container(color: color, child: const Emoji('🚫')),
      useOldImageOnUrlChange: false,
      imageUrl: url!,
      // fit: BoxFit.fitHeight,
      colorBlendMode: colorBlendMode,
      color: color,
      // width: width,
      // height: height,
      imageBuilder:
          (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: boxfit ?? BoxFit.contain,
              ),
            ),
            child: child,
          ),
    );
  }
}
