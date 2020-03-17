import 'package:flutter/material.dart';

class Products {
  final String title;
  final String images;
  final double price;
  @required
  final String id;
  final String description;
  bool isFavorite;
  Products(
      {this.isFavorite = false,
      @required this.description,
      @required this.images,
      @required this.title,
      @required this.price,
      @required this.id});
}
