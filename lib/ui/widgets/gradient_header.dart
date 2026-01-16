import 'package:flutter/material.dart';
import '../../core/theme.dart';
import 'package:wondertall/core/constanst.dart';

class GradientHeader extends StatelessWidget {
  final String name;
  final VoidCallback? onBellTap;

  const GradientHeader({super.key, required this.name, this.onBellTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.gradientStart, AppColors.gradientEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: const AssetImage(Assets.gallery1),
                backgroundColor: Colors.white70,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Hello', style: TextStyle(color: Colors.white70, fontSize: 12)),
                    Text(
                      name,
                      style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onBellTap,
                icon: const Icon(Icons.notifications_none, color: Colors.white),
              )
            ],
          ),
          const SizedBox(height: 14),
          RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.white, fontSize: 24, height: 1.3, fontWeight: FontWeight.w700),
              children: [
                TextSpan(text: 'Find your happiness\n'),
                TextSpan(text: 'with ', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600)),
                TextSpan(text: 'Us'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}