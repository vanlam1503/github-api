import 'package:flutter/material.dart';

class PopularStackImage extends StatelessWidget {
  final String nameImage;
  final String date;
  final String title;
  const PopularStackImage({
    required this.nameImage,
    required this.date,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: Stack(
            children: [
              SizedBox(
                height: 237,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.network(
                    nameImage,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                bottom: 11,
                right: 11,
                child: Text(
                  date,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8.46,
        ),
        Expanded(
          child: Text(
            title,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
