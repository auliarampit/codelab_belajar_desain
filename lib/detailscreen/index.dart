import 'package:flutter/material.dart';

import 'package:belajar_desain_flutter/model/tourism_place.dart';
import 'package:belajar_desain_flutter/detailscreen/widget/detail_web_page.dart';
import 'package:belajar_desain_flutter/detailscreen/widget/detail_mobile_page.dart';

class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  DetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWebPage(place: place);
        } else {
          return DetailMobilePage(place: place);
        }
      },
    );
  }
}
