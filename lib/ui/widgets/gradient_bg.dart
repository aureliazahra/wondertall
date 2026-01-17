import 'package:flutter/material.dart';
import '../../core/theme.dart';

class BlueBackground extends StatelessWidget {
  final Widget child;
  const BlueBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0, -1),
              end: Alignment(0, 0.6),
              colors: [Color(0xFFEFF5FF), Colors.white],
            ),
          ),
        ),

        Positioned(
          right: -80,
          top: -100,
          child: _SoftGlow(
            size: 260,
            color: AppColors.primary.withOpacity(0.28),
          ),
        ),

        Positioned(
          left: -90,
          bottom: 140,
          child: _SoftGlow(
            size: 280,
            color: AppColors.primary.withOpacity(0.22),
          ),
        ),

        child,
      ],
    );
  }
}

class _SoftGlow extends StatelessWidget {
  final double size;
  final Color color;
  const _SoftGlow({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,

        gradient: RadialGradient(
          colors: [color, color.withOpacity(0.0)],
          stops: const [0.0, 1.0],
          radius: 0.85,
          center: const Alignment(-0.1, -0.1),
        ),
      ),
    );
  }
}
