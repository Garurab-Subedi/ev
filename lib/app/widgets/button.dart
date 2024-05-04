import 'package:flutter/material.dart';

class FloatingButton extends StatefulWidget {
  final activeColor;
  final inActiveColor;
  final Function(int) onChange;
  const FloatingButton({
    super.key,
    this.activeColor,
    this.inActiveColor,
    required this.onChange,
  });

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: IconTheme(
      data: IconThemeData(color: widget.inActiveColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              color: currentIndex == 0 ? widget.activeColor : null,
            ),
            onPressed: () {
              setState(() {
                currentIndex = 0;
                widget.onChange(currentIndex);
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.location_on),
            color: currentIndex == 1 ? widget.activeColor : null,
            onPressed: () {
              setState(() {
                currentIndex = 1;
                widget.onChange(currentIndex);
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            color: currentIndex == 2 ? widget.activeColor : null,
            onPressed: () {
              setState(() {
                currentIndex = 2;
                widget.onChange(currentIndex);
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            color: currentIndex == 3 ? widget.activeColor : null,
            onPressed: () {
              setState(() {
                currentIndex = 3;
                widget.onChange(currentIndex);
              });
            },
          ),
        ],
      ),
    ));
  }
}
