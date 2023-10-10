import 'package:flutter/material.dart';

import 'package:star_rating/custom_paint/custom_star_icon.dart';

Widget buildRatingIndicator(double rating) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(5, (index) {
      double fillPercentage = 0.0; 
      if (index < rating.floor()) {
        fillPercentage = 1.0;
      } else if (index == rating.floor() && rating % 1 != 0) {
        fillPercentage = rating - rating.floor();
      }
      return CustomStarIcon(
        size: 40,
        color: Colors.amber,
        fillPercentage: fillPercentage,
      );
    }),
  );
}