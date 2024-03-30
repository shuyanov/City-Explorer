import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart' hide Path;
import 'package:test_hackaton/util/marker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../api/apiPhoto.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

LatLng point = LatLng(56.9972, 40.9714);
MapController mapController = MapController();
double _markerSize = 50;
List<Marker> listMarker = [];

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    super.initState();
    // mapController = MapController();
    // _markerSize = 200.0; // Default marker size
  }

  // void _updateMarkerSize(double zoom) {
  //   // Update the marker size based on zoom
  //   setState(() {
  //     _markerSize = 200.0 * (zoom / 10.0);
  //   });
  // }
  void _updateMarkerSize(double zoom) {
    setState(() {
      if (zoom <= 5) {
        _markerSize = 25.0;
      } else if (zoom <= 10) {
        _markerSize = 50.0;
      } else if (zoom <= 15) {
        _markerSize = 100.0;
      } else if (zoom <= 17) {
        _markerSize = 200.0;
      } else
        _markerSize = 300.0;
      _markerSize = _markerSize;
    });
  }

  @override
  Widget build(BuildContext context) {
    double long = 49.5;
    double lat = -0.09;
    var location = [];
    listMarker = [
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.top),
        rotateAlignment: AlignmentGeometry.lerp(
            Alignment.bottomCenter, Alignment.bottomCenter, 0),
        rotate: true,
        // width: 300.0,
        // height: 300.0,
        width: _markerSize,
        height: _markerSize,

        point: LatLng(56.9972, 44.9714),
        builder: (ctx) => InkWell(
          child: Container(
            width: _markerSize,
            height: _markerSize,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: _markerSize > 50
                  ? CustomMarker(size: _markerSize)
                  : _markerSize == 50
                      ? RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))
                      : CircleBorder(),
              shadows: [
                BoxShadow(
                    color: Colors.grey,
                    // blurRadius: 1.0,
                    offset: Offset(2, 2)),
              ],
            ),
            child: ClipRRect(
              child: Image.network(
                "https://fasadnaya-kraska.ru/upload/articles/ru/0_65518000_1625121805_img.jpg",
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(_markerSize > 100
                  ? 40
                  : _markerSize == 50
                      ? 10
                      : 20),
            ),
          ),
        ),
      ),
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.top),
        rotateAlignment: AlignmentGeometry.lerp(
            Alignment.bottomCenter, Alignment.bottomCenter, 0),
        rotate: true,
        // width: 300.0,
        // height: 300.0,
        width: _markerSize,
        height: _markerSize,

        point: LatLng(54.9972, 40.9714),
        builder: (ctx) => InkWell(
          child: Container(
            width: _markerSize,
            height: _markerSize,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: _markerSize > 50
                  ? CustomMarker(size: _markerSize)
                  : _markerSize == 50
                      ? RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))
                      : CircleBorder(),
              shadows: [
                BoxShadow(
                    color: Colors.grey,
                    // blurRadius: 1.0,
                    offset: Offset(2, 2)),
              ],
            ),
            child: ClipRRect(
              child: Image.network(
                "https://fasadnaya-kraska.ru/upload/articles/ru/0_65518000_1625121805_img.jpg",
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(_markerSize > 100
                  ? 40
                  : _markerSize == 50
                      ? 10
                      : 20),
            ),
          ),
        ),
      ),
    ];

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            mapController.move(LatLng(56.9972, 40.9714), 10);
          },
          child: Icon(Icons.location_history),
        ),
        body: FutureBuilder(
            future: getPhotos(),
            builder: (context, snapshot) {
              for (int i = 0; i < photos.length; i++) {
                listMarker.add(Marker(
                  anchorPos: AnchorPos.align(AnchorAlign.top),
                  rotateAlignment: AlignmentGeometry.lerp(
                      Alignment.bottomCenter, Alignment.bottomCenter, 0),
                  rotate: true,
                  // width: 300.0,
                  // height: 300.0,
                  width: _markerSize,
                  height: _markerSize,

                  point: LatLng(photos[i].latitude, photos[i].longitude),
                  builder: (ctx) => InkWell(
                    onTap: () async {
                      return await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(photos[i].city),
                              content: ListView(
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GestureDetector(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            height: context.width,
                                            width: context.width,
                                            child: CachedNetworkImage(
                                              imageUrl: photos[i].urlImage,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(photos[i].description),
                                    ],
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text("Ок"))
                              ],
                            );
                          });
                    },
                    child: Container(
                      width: _markerSize,
                      height: _markerSize,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: _markerSize > 50
                            ? CustomMarker(size: _markerSize)
                            : _markerSize == 50
                                ? RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))
                                : CircleBorder(),
                        shadows: [
                          BoxShadow(
                              color: Colors.grey,
                              // blurRadius: 1.0,
                              offset: Offset(2, 2)),
                        ],
                      ),
                      child: ClipRRect(
                        child: Image.network(
                          photos[i].urlImage,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(_markerSize > 100
                            ? 40
                            : _markerSize == 50
                                ? 10
                                : 20),
                      ),
                    ),
                  ),
                ));
              }
              return FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  center: LatLng(56.9972, 40.9714),
                  minZoom: 0,
                  zoom: 10,
                  maxZoom: 18.49,
                  onTap: (p, s) async {
                    location = await Geocoder.local
                        .findAddressesFromCoordinates(
                            new Coordinates(s.latitude, s.longitude));

                    setState(() {
                      point = s;
                      print(s);
                    });

                    print(
                        "${location.first.countryName} - ${location.first.addressLine}");
                  },
                  onPositionChanged: (position, hasGesture) {
                    if (hasGesture) {
                      _updateMarkerSize(position.zoom!);
                    }
                  },
                ),
                nonRotatedChildren: [
                  // RichAttributionWidget(
                  //   attributions: [
                  //     TextSourceAttribution(
                  //       'OpenStreetMap contributors',
                  //       onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
                  //     ),
                  //   ],
                  // ),
                ],
                children: [
                  TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      // urlTemplate:'https://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png',

                      userAgentPackageName: 'com.example.app',
                      subdomains: ['a', 'b', 'c'],
                      maxNativeZoom: 20),
                  MarkerLayer(markers: listMarker
                      // [
                      //       Marker(

                      //         anchorPos: AnchorPos.align(AnchorAlign.top),
                      //         rotateAlignment: AlignmentGeometry.lerp(
                      //             Alignment.bottomCenter, Alignment.bottomCenter, 0),
                      //         rotate: true,
                      //         // width: 300.0,
                      //         // height: 300.0,
                      //         width: _markerSize,
                      //         height: _markerSize,

                      //         point: point,
                      //         builder: (ctx) => InkWell(
                      //           child: Container(
                      //             width: _markerSize,
                      //             height: _markerSize,
                      //             decoration: ShapeDecoration(
                      //               color: Colors.white,
                      //               shape: _markerSize > 50
                      //                   ? CustomMarker(size: _markerSize)
                      //                   : _markerSize == 50
                      //                       ? RoundedRectangleBorder(
                      //                           borderRadius: BorderRadius.circular(10))
                      //                       : CircleBorder(),
                      //               shadows: [
                      //                 BoxShadow(
                      //                     color: Colors.grey,
                      //                     // blurRadius: 1.0,
                      //                     offset: Offset(2, 2)),
                      //               ],
                      //             ),
                      //             child: ClipRRect(
                      //                 child: Image.network(
                      //               "https://fasadnaya-kraska.ru/upload/articles/ru/0_65518000_1625121805_img.jpg",
                      //               fit: BoxFit.cover,
                      //             ),
                      //             borderRadius: BorderRadius.circular(_markerSize > 100 ? 40 : _markerSize == 50 ? 10 : 20),),
                      //           ),
                      //         ),
                      //       ),
                      //       Marker(
                      //         anchorPos: AnchorPos.align(AnchorAlign.top),
                      //         rotateAlignment: AlignmentGeometry.lerp(
                      //             Alignment.bottomCenter, Alignment.bottomCenter, 0),
                      //         rotate: true,
                      //         // width: 300.0,
                      //         // height: 300.0,
                      //         width: _markerSize,
                      //         height: _markerSize,

                      //         point: LatLng(56.925334, 40.973885),
                      //         builder: (ctx) => InkWell(
                      //           child: Container(
                      //             width: _markerSize,
                      //             height: _markerSize,
                      //             decoration: ShapeDecoration(
                      //               color: Colors.white,
                      //               shape: _markerSize > 50
                      //                   ? CustomMarker(size: _markerSize)
                      //                   : _markerSize == 50
                      //                       ? RoundedRectangleBorder(
                      //                           borderRadius: BorderRadius.circular(10))
                      //                       : CircleBorder(),
                      //               shadows: [
                      //                 BoxShadow(
                      //                     color: Colors.grey,
                      //                     // blurRadius: 1.0,
                      //                     offset: Offset(2, 2)),
                      //               ],
                      //             ),
                      //             child: ClipRRect(
                      //                 child: Image.network(
                      //               "https://cdn1.ozone.ru/s3/multimedia-0/6108964908.jpg",
                      //               fit: BoxFit.cover,
                      //             ),
                      //             borderRadius: BorderRadius.circular(_markerSize > 100 ? 40 : _markerSize == 50 ? 10 : 20),),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      )
                ],
              );
            }));
  }
}

class CustomMarker extends ShapeBorder {
  double size;
  CustomMarker({required this.size});
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: 0);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    // rect = Rect.fromPoints(rect.topLeft, rect.bottomRight - Offset(0, 0));
    return Path()
      ..addRRect(
          RRect.fromRectAndRadius(rect, Radius.circular(size > 100 ? 40 : 20)))
      ..moveTo(rect.bottomCenter.dx - 10, rect.bottomCenter.dy)
      ..relativeLineTo(10, 10)
      ..relativeLineTo(10, -10);
    // ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }
}
