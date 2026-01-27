import 'package:flutter/material.dart';
import '../../../core/theme.dart';
import '../../../data/models/destination.dart';
import 'package:wondertall/ui/widgets/primary_button.dart';

class DestinationDetailScreen extends StatefulWidget {
  final Destination destination;
  const DestinationDetailScreen({super.key, required this.destination});

  @override
  State<DestinationDetailScreen> createState() => _DestinationDetailScreenState();
}

class _DestinationDetailScreenState extends State<DestinationDetailScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _sheetOffset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _sheetOffset = Tween<Offset>(
      begin: const Offset(0, 1), // mulai dari bawah (di luar layar)
      end: Offset.zero,          // berhenti di posisi semula
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    // Jalankan animasi saat halaman masuk
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final destination = widget.destination;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Header image
          Positioned.fill(
            child: Image.asset(destination.imageUrl, fit: BoxFit.cover),
          ),
          // Dark overlay
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(.35)),
          ),
          // Top bar
          SafeArea(
            child: Row(
              children: [
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                const Spacer(),
                const Text('Details',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border, color: Colors.white),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
          // Bottom sheet content (ANIMATED)
          SlideTransition(
            position: _sheetOffset,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 100),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(destination.name,
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
                      const SizedBox(height: 4),
                      Text(destination.location,
                          style: const TextStyle(color: AppColors.textSecondary)),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined,
                              color: AppColors.textSecondary, size: 18),
                          const SizedBox(width: 6),
                          Text(destination.country),
                          const SizedBox(width: 16),
                          const Icon(Icons.star, color: Color(0xFFFFC107), size: 18),
                          const SizedBox(width: 4),
                          Text(
                            '${destination.rating} (${(destination.reviews / 1000).toStringAsFixed(0)}k reviews)',
                          ),
                          const Spacer(),
                          Text(destination.priceLabel,
                              style: const TextStyle(
                                  color: AppColors.primary, fontWeight: FontWeight.w700)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 70,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: destination.gallery.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 10),
                          itemBuilder: (_, i) => ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              destination.gallery[i],
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text('About Destination',
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 160,
                        child: SingleChildScrollView(
                          child: const Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse elementum, ligula at luctus volutpat, tortor libero gravida turpis, vitae lacinia massa tellus non justo. Praesent dictum feugiat libero, in tincidunt lorem lacinia ut. Sed eu lectus pretium, laoreet leo ac, fermentum ipsum. Suspendisse volutpat, lectus nec volutpat accumsan, magna nibh egestas lorem, vel facilisis nisl neque id tortor. Quisque non tellus eu arcu ullamcorper suscipit nec eu ipsum. Duis consequat egestas lacus, in sodales turpis blandit non. In pharetra pretium felis, eget dapibus lacus vehicula a.',
                            style: TextStyle(color: AppColors.textSecondary, height: 1.5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Bottom Booking button (tetap tanpa animasi)
          Positioned(
            left: 20,
            right: 20,
            bottom: 24,
            child: PrimaryButton(label: 'Booking', onPressed: () {}),
          ),
        ],
      ),
    );
  }
}