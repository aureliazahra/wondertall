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
      // Dipadatkan karena teks hero dipindahkan ke area putih
      height: 150,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.gradientStart, AppColors.gradientEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: const AssetImage(Assets.profil),
            backgroundColor: Colors.white70,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hello',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                const SizedBox(height: 2),
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onBellTap,
            icon: const Icon(Icons.notifications_none, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
