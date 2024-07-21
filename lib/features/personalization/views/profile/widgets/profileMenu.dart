import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProfileMenuItem extends StatelessWidget {
  const TProfileMenuItem({
    super.key,
    required this.title,
    required this.value,
    this.icon = Iconsax.arrow_left,
    required this.onPressed,
  });
  final String title, value;
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems / 1.5),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Icon(
                  icon,
                  size: 18,
                )),
            Expanded(
              flex: 10,
              child: Text(value,
                  style: Theme.of(context).textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis),
            ),
            Expanded(
              flex: 6,
              child: Text(title,
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ),
    );
  }
}
