import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' hide Path;
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

LatLng point = LatLng(56.9972, 40.9714);
MapController mapController = MapController();
double _markerSize = 50;

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
    });
  }

  @override
  Widget build(BuildContext context) {
    double long = 49.5;
    double lat = -0.09;
    var location = [];

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
       mapController.move(LatLng(56.9972, 40.9714), 10);
      }, child: Icon(Icons.location_history),),
        body: FlutterMap(
      mapController: mapController,
      options: MapOptions(
        center: LatLng(56.9972, 40.9714),
        minZoom: 0,
        zoom: 10,
        maxZoom: 18.49,
        onTap: (p, s) async {
          location = await Geocoder.local.findAddressesFromCoordinates(
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
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            // urlTemplate:'https://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png',

            userAgentPackageName: 'com.example.app',
            subdomains: ['a', 'b', 'c'],
            maxNativeZoom: 20),
        MarkerLayer(
          markers: [
            Marker(
              
              anchorPos: AnchorPos.align(AnchorAlign.top),
              rotateAlignment: AlignmentGeometry.lerp(
                  Alignment.bottomCenter, Alignment.bottomCenter, 0),
              rotate: true,
              // width: 300.0,
              // height: 300.0,
              width: _markerSize,
              height: _markerSize,

              point: point,
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
                  borderRadius: BorderRadius.circular(_markerSize > 100 ? 40 : _markerSize == 50 ? 10 : 20),),
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

              point: LatLng(56.925334, 40.973885),
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
                    "https://cdn1.ozone.ru/s3/multimedia-0/6108964908.jpg",
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(_markerSize > 100 ? 40 : _markerSize == 50 ? 10 : 20),),
                ),
              ),
            ),
          ],
        )
      ],
    ));
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
