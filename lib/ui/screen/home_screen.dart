import 'package:flutter/material.dart';
import 'package:wondertall/ui/widgets/destination_card.dart';
import 'package:wondertall/ui/widgets/gradient_header.dart';
import 'package:wondertall/ui/widgets/search_field.dart';
import 'package:wondertall/ui/widgets/section_header.dart';
import '../../../core/routes.dart';
import 'package:wondertall/ui/screen/destination_detail_screen.dart';
import 'package:wondertall/data/dummy.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    const double overlap = 28;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const GradientHeader(name: 'Shin Tae Yong'),

            // Area putih overlap di atas header dengan rounded top
            Transform.translate(
              offset: const Offset(0, -overlap),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Teks hero
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          height: 1.25,
                          color: Colors.black87,
                        ),
                        children: [
                          const TextSpan(text: 'Find your happiness\n'),
                          TextSpan(
                            text: 'with Us',
                            style: TextStyle(
                              color: primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Search Field
                    const SearchField(),
                    const SizedBox(height: 16),

                    // Section Header
                    const SectionHeader(title: 'Popular Destination'),
                    const SizedBox(height: 12),

                    // List horizontal destinasi
                    SizedBox(
                      height: 320,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero, // sudah ada padding dari Container
                        itemCount: destination.length,
                        itemBuilder: (context, i) {
                          final d = destination[i];
                          return DestinationCard(
                            destination: d,
                            onTap: () => Navigator.pushNamed(
                              context,
                              AppRoutes.detail,
                              arguments: d,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}