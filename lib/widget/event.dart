import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

int index = 0;
var eventWidget = Center(
  child: SizedBox(
      height: 100, // card height
      width: double.infinity,
      child: Swiper.children(
          autoplay: true,
          loop: true,
          pagination: const SwiperPagination(
            margin: EdgeInsets.only(
              right: 25.0,
              bottom: 10,
            ),
            builder: DotSwiperPaginationBuilder(color: Colors.grey),
          ),
          children: <Widget>[
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "A",
                  style: const TextStyle(fontSize: 32),
                ),
              ),
            ),
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "B",
                  style: const TextStyle(fontSize: 32),
                ),
              ),
            ),
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "C",
                  style: const TextStyle(fontSize: 32),
                ),
              ),
            ),
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "D",
                  style: const TextStyle(fontSize: 32),
                ),
              ),
            ),
          ])),
);
