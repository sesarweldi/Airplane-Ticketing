import 'package:flutter/material.dart';

class PhotoDetailItem extends StatelessWidget {
  final String imageUrl;

  const PhotoDetailItem({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image:
              DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover)),
    );
  }
}
