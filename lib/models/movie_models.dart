import 'package:flutter/material.dart';

class MovieModels {
  final String title;
  final String description;
  final Image cardData;
  bool isWishListed;

  MovieModels({
    required this.cardData,
    required this.description,
    required this.title,
    this.isWishListed = false,
  });
}
