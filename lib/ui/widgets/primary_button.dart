import 'package:flutter/material.dart';
import '../../core/theme.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? trailing;
  final bool expanded;

  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.trailing,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    final child = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
        if (trailing != null) const SizedBox(width: 8),
        if (trailing != null) Icon(trailing, size: 20, color: Colors.white,),
      ],
    );

    return SizedBox(
      width: expanded ? double.infinity : null,
      height: 56,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.primary, AppColors.primaryDark],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }
}
