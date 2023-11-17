import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailSkeleton extends StatelessWidget {
  const DetailSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(
      5,
      (index) => Container(
        width: double.infinity,
        height: Theme.of(context).textTheme.bodyMedium!.fontSize! * 2,
        color: Colors.white,
      ),
    );

    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: Theme.of(context).textTheme.titleMedium!.fontSize! * 2,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          ...items,
        ],
      ),
    );
  }
}
