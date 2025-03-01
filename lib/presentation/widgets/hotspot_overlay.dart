import 'package:church_navigation/data/models/location_model.dart';
import 'package:flutter/material.dart';

class HotspotOverlay extends StatelessWidget {
  final Location location;
  final Function()? onTap;
  final double x;
  final double y;
  const HotspotOverlay({
    super.key,
    required this.location,
    required this.x,
    required this.y,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
