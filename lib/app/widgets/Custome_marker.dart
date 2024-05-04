import 'package:flutter/material.dart';

class CustomMarker extends StatelessWidget {
  final Color color;
  final Widget widget1, widget2;

  const CustomMarker({
    Key? key,
    required this.color,
    required this.widget1,
    required this.widget2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // You may need to adjust the values according to your design
    const double markerSize = 50.0;
    const double containerSize = 50.0;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: -(containerSize / 2),
            child: Container(
              width: 4,
              height: containerSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(containerSize / 2),
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: markerSize,
            width: markerSize,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          widget1,
          Positioned(
            right: -(containerSize / 2),
            bottom: containerSize / 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: widget2,
            ),
          )
        ],
      ),
    );
  }
}
