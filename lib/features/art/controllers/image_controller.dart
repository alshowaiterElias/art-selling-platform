import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  //variables

  void showEnlargedImage(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                        vertical: TSizes.defaultSpace * 2,
                        horizontal: TSizes.defaultSpace),
                    child: CachedNetworkImage(imageUrl: image),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 150,
                      child: OutlinedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("اغلق")),
                    ),
                  )
                ],
              ),
            ));
  }
}
