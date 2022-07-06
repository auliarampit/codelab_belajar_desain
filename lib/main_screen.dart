// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:belajar_desain_flutter/detailscreen/index.dart';
import 'package:belajar_desain_flutter/components/tourism_place_grid.dart';
import 'package:belajar_desain_flutter/model/tourism_place.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wisata Bandung'),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 560) {
          return TourismPlaceList();
        } else if (constraints.maxWidth <= 750) {
          return TourismPlaceGrid(gridCount: 3);
        } else if (constraints.maxWidth <= 1000) {
          return TourismPlaceGrid(gridCount: 4);
        } else if (constraints.maxWidth <= 1250) {
          return TourismPlaceGrid(gridCount: 5);
        } else {
          return TourismPlaceGrid(gridCount: 6);
        }
      }),
    );
  }
}

class TourismPlaceList extends StatelessWidget {
  TourismPlaceList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final TourismPlace place = tourismPlaceList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(place: place);
            }));
          },
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(place.imageAsset),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          place.name,
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(height: 10),
                        Text(place.location),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: tourismPlaceList.length,
    );
  }
}
