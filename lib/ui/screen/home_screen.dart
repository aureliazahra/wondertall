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
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const GradientHeader(name: 'Shin Tae Yong'),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: SearchField(),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SectionHeader(title: 'Popular Destination'),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 320,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20),
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
    );
  }
}