// Shimmer Loading Widget
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoaderWidget extends StatelessWidget {
  const ShimmerLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Profile Header Loader
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Name & Bio Loader
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              children: [
                Container(
                  width: 180,
                  height: 20,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                Container(
                  width: 250,
                  height: 16,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Details Widgets Loader
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(3, (index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 100,
                  height: 80,
                  color: Colors.white,
                ),
              );
            }),
          ),
          const SizedBox(height: 24),

          // Chat Button Loader
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: double.infinity,
              height: 50,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),

          // Review Section Loader
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: double.infinity,
              height: 150,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
