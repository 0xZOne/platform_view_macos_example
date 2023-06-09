
import 'platform_view_macos_example_platform_interface.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformViewMacosExample {
  Future<String?> getPlatformVersion() {
    return PlatformViewMacosExamplePlatform.instance.getPlatformVersion();
  }
}

class NSBox extends StatelessWidget {
  const NSBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This is used in the platform side to register the view.
    const String viewType = '@views/simple-box-view-type';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{};

    return UiKitView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}

class DeformableNativeView extends StatelessWidget {
  const DeformableNativeView(
      {required this.angle,
      required this.opacity,
      required this.radius,
      required this.scale,
      Key? key})
      : super(key: key);
  final double opacity;
  final double radius;
  final double angle;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Transform.scale(
        scale: scale,
        child: Opacity(
          opacity: opacity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: const SizedBox(
              height: 300,
              width: 300,
              child: NSBox(),
            ),
          ),
        ),
      ),
    );
  }
}