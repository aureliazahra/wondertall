import 'package:flutter/material.dart';
import '../../core/theme.dart';

/// Latar biru lembut seperti pada desain Sign in.
/// Letakkan sebagai parent dari konten halaman.
/// Contoh:
/// BlueAuthBackground(child: SafeArea(child: ListView(children: [...]))),
class BlueBackground extends StatelessWidget {
  final Widget child;
  const BlueBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Dasar: gradasi linear tipis dari atas -> tengah -> putih
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0, -1),
              end: Alignment(0, 0.6),
              colors: [
                Color(0xFFEFF5FF), // biru sangat muda (nyaris putih)
                Colors.white,
              ],
            ),
          ),
        ),

        // Glow 1: kanan-atas
        Positioned(
          right: -80,
          top: -100,
          child: _SoftGlow(
            size: 260,
            color: AppColors.primary.withOpacity(0.28),
          ),
        ),

        // Glow 2: kiri-bawah (sekitar tombol sosial)
        Positioned(
          left: -90,
          bottom: 140,
          child: _SoftGlow(
            size: 280,
            color: AppColors.primary.withOpacity(0.22),
          ),
        ),

        // Konten halaman
        child,
      ],
    );
  }
}

/// Lingkaran radial dengan pinggiran memudar (soft)
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
        // Radial gradient: pusat berwarna, tepi transparan
        gradient: RadialGradient(
          colors: [
            color,
            color.withOpacity(0.0),
          ],
          stops: const [0.0, 1.0],
          radius: 0.85,
          center: const Alignment(-0.1, -0.1),
        ),
      ),
    );
  }
}