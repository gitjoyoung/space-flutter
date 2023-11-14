import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget TalkSkeleton({int repeatCount = 2}) => SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: List.generate(
              repeatCount,
              (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  width: 65,
                                  height: 64,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[100]!),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10,),
                                  child: Container(
                                    height: 64,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[100]!),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  width: 80,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[100]!),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
        ),
      ),
    );
