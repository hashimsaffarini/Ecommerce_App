import 'package:flutter/material.dart';

class CustomCategories extends StatelessWidget {
  final String imgUrl;
  final String title;
  const CustomCategories(
      {super.key, required this.imgUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(134, 42, 204, 1),
            Color.fromRGBO(253, 187, 45, 1),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imgUrl,
              width: 60,
              height: 60,
            ),
            const SizedBox(height: 7),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
