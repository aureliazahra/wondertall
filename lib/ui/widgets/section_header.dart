import 'package:flutter/material.dart';
import '../../core/theme.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback? onAction;

  const SectionHeader({
    super.key,
    required this.title,
    this.actionText = 'View all',
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.text),
          ),
        ),
        InkWell(
          onTap: onAction,
          child: Text(
            actionText,
            style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}