import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/utils.dart';


class LazyLoading extends StatelessWidget {
  const LazyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const RepoCardShimmer(),
    );
  }
}



class RepoCardShimmer extends StatelessWidget {
  const RepoCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: Utils.symmetric(h: 14.0, v: 6.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
      child: Padding(
        padding: Utils.symmetric(h: 12.0, v: 10.0),
        child: Row(
          children: [
            // Circular shimmer for avatar
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title shimmer
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 16.0,
                      width: double.infinity,
                      margin: Utils.only(bottom: 8.0),
                      color: Colors.white,
                    ),
                  ),
                  // Star row shimmer
                  Row(
                    children: [
                      const Icon(Icons.star, size: 18.0, color: Colors.amber),
                      const SizedBox(width: 6.0),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 14.0,
                          width: 50.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
