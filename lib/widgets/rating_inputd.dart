import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:star_rating/provider/rating_model.dart';

Widget buildRatingInput(BuildContext context) {
  final ratingModel = Provider.of<RatingModel>(context);
  TextEditingController controller = TextEditingController();
  double rating = 0.0;

  void handleRatingInput(String value) {
    double parsedRating = double.tryParse(value) ?? 0.0;
    parsedRating = parsedRating.clamp(0.0, 5.0);
    if (parsedRating % 1 == 0.5) {
      parsedRating = parsedRating.floor() + 0.5;
    }
    rating = parsedRating;
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 50),
    child: Column(
      children: [
        TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            hintText: 'Enter rating (1-5)',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          child: ElevatedButton(
            onPressed: () {
              handleRatingInput(controller.text);
              ratingModel.setRating(rating);
              controller.clear();
            },
            child: const Text('Give Rating'),
          ),
        ),
      ],
    ),
  );
}
