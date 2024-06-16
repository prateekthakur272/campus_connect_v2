import 'package:flutter/material.dart';
import 'package:triton_extensions/triton_extensions.dart';

class HomeCard extends StatelessWidget {
  final String heading;
  final String body;
  final Icon icon;
  final Function() onTap;
  final ImageProvider image;
  const HomeCard(
      {super.key,
        required this.heading,
        required this.body,
        required this.icon,
        required this.image,
        required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: AspectRatio(
          aspectRatio: 5 / 2,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: image, fit: BoxFit.cover)),
            padding: 16.padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    icon,
                    8.space,
                    Text(
                      heading,
                      style: context.textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Text(
                  body,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
