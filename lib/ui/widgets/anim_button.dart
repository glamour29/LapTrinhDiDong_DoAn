import 'package:flutter/material.dart';

class AnimButton extends StatefulWidget {
  const AnimButton({super.key, required this.child, required this.onTap});

  final Widget child;
  final VoidCallback onTap;

  @override
  State<AnimButton> createState() => _AnimButtonState();
}

class _AnimButtonState extends State<AnimButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Widget _child;

  @override
  void initState() {
    super.initState();
    _child = widget.child;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50),
    );
    _animation = Tween(begin: 1.0, end: 0.8).animate(
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
    _controller.forward().then((_) => _controller.reverse());
  }

  @override
  void didUpdateWidget(covariant AnimButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.child != _child) {
      setState(() => _child = widget.child);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: GestureDetector(
          onTapDown: (_) {
            _controller
                .forward()
                .then((_) => _controller.reverse())
                .then((_) => widget.onTap());
          },
          child: _child),
    );
  }
}
