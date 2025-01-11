import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget navigate(BuildContext context, {Widget? destination, Widget? child}) {
  return InkWell(
    onTap: () {
      if (destination != null) {
        Navigator.of(context).push(
          CupertinoPageRoute(builder: (context) => destination),
        );
      }
    },
    child: child,
  );
}

Widget roundedImage(String img, {double radius = 10}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius),
    child: Image.network(
      img,
      fit: BoxFit.cover,
      width: double.maxFinite,
      //do not set height because it causes the layout error
    ),
  );
}
