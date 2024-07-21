import 'package:flutter/material.dart';
import 'package:locallense/utils/extensions.dart';

class RippleContainer extends StatefulWidget {
  const RippleContainer({super.key});

  @override
  _RippleContainerState createState() => _RippleContainerState();
}

class _RippleContainerState extends State<RippleContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animation = Tween<double>(begin: 0, end: 30).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    _controller.forward();
    // You can add any other logic on tap here
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return InkWell(
          onTap: _handleTap,
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.themeColor.primaryColor,
              boxShadow: [
                BoxShadow(
                  color: context.themeColor.primaryColor?.withOpacity(0.3) ??
                      Colors.lightBlueAccent,
                  blurRadius: _animation.value,
                  spreadRadius: _animation.value,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
