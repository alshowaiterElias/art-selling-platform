import 'package:art_selling_platform/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class DealChoice extends StatelessWidget {
  const DealChoice({
    super.key,
    required this.choice,
    required this.icon,
  });

  final String choice;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: TDeviceUtils.getScreenWidth() * 0.3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton.icon(
          onPressed: () {},
          label: Text(
            choice,
            style: const TextStyle(fontSize: 12),
          ),
          icon: Icon(
            icon,
            size: 20,
          ),
        ),
      ),
    );
  }
}
