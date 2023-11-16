import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';

Widget CatchCardHomeSkeleton() {
  return Column(
    children: [
      ListTile(
        contentPadding: EdgeInsets.zero,
        title: Row(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 24,
                height: 24,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        trailing: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 24,
            height: 24,
            color: Colors.white,
          ),
        ),
      ),
      Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.strokeLine10, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 220,
                  color: Colors.white,
                ),
              ),
              flex: 2,
            ),
            Expanded(
              child: Container(
                height: 220,
                color: Colors.grey[300],
              ),
              flex: 1,
            ),
          ],
        ),
      ),
      SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(width: 10),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 24,
              height: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
      SizedBox(height: 25),
    ],
  );
}
