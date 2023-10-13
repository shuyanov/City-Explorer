import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../pages/mapPage.dart';
double _markerSize = 50;
// List<Marker> listMarker = [
//   Marker(
//               anchorPos: AnchorPos.align(AnchorAlign.top),
//               rotateAlignment: AlignmentGeometry.lerp(
//                   Alignment.bottomCenter, Alignment.bottomCenter, 0),
//               rotate: true,
//               // width: 300.0,
//               // height: 300.0,
//               width: markerSize,
//               height: markerSize,

//               point: LatLng(56.9972, 40.9714),
//               builder: (ctx) => InkWell(
//                 onTap: () async{
//                   return await showDialog(context: (context), builder: builder)
//                 },
//                 child: Container(
//                   width: markerSize,
//                   height: markerSize,
//                   decoration: ShapeDecoration(
//                     color: Colors.white,
//                     shape: markerSize > 50
//                         ? CustomMarker(size: markerSize)
//                         : markerSize == 50
//                             ? RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10))
//                             : CircleBorder(),
//                     shadows: [
//                       BoxShadow(
//                           color: Colors.grey,
//                           // blurRadius: 1.0,
//                           offset: Offset(2, 2)),
//                     ],
//                   ),
//                   child: ClipRRect(
//                       child: Image.network(
//                     "https://fasadnaya-kraska.ru/upload/articles/ru/0_65518000_1625121805_img.jpg",
//                     fit: BoxFit.cover,
//                   ),
//                   borderRadius: BorderRadius.circular(markerSize > 100 ? 40 : markerSize == 50 ? 10 : 20),),
//                 ),
//               ),
//             ),
//             Marker(
//               anchorPos: AnchorPos.align(AnchorAlign.top),
//               rotateAlignment: AlignmentGeometry.lerp(
//                   Alignment.bottomCenter, Alignment.bottomCenter, 0),
//               rotate: true,
//               // width: 300.0,
//               // height: 300.0,
//               width: markerSize,
//               height: markerSize,

//               point: LatLng(56.9972, 44.9714),
//               builder: (ctx) => InkWell(
//                 child: Container(
//                   width: markerSize,
//                   height: markerSize,
//                   decoration: ShapeDecoration(
//                     color: Colors.white,
//                     shape: markerSize > 50
//                         ? CustomMarker(size: markerSize)
//                         : markerSize == 50
//                             ? RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10))
//                             : CircleBorder(),
//                     shadows: [
//                       BoxShadow(
//                           color: Colors.grey,
//                           // blurRadius: 1.0,
//                           offset: Offset(2, 2)),
//                     ],
//                   ),
//                   child: ClipRRect(
//                       child: Image.network(
//                     "https://fasadnaya-kraska.ru/upload/articles/ru/0_65518000_1625121805_img.jpg",
//                     fit: BoxFit.cover,
//                   ),
//                   borderRadius: BorderRadius.circular(markerSize > 100 ? 40 : markerSize == 50 ? 10 : 20),),
//                 ),
//               ),
//             ),
//             Marker(
//               anchorPos: AnchorPos.align(AnchorAlign.top),
//               rotateAlignment: AlignmentGeometry.lerp(
//                   Alignment.bottomCenter, Alignment.bottomCenter, 0),
//               rotate: true,
//               // width: 300.0,
//               // height: 300.0,
//               width: markerSize,
//               height: markerSize,

//               point: LatLng(54.9972, 40.9714),
//               builder: (ctx) => InkWell(
//                 child: Container(
//                   width: markerSize,
//                   height: markerSize,
//                   decoration: ShapeDecoration(
//                     color: Colors.white,
//                     shape: markerSize > 50
//                         ? CustomMarker(size: markerSize)
//                         : markerSize == 50
//                             ? RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10))
//                             : CircleBorder(),
//                     shadows: [
//                       BoxShadow(
//                           color: Colors.grey,
//                           // blurRadius: 1.0,
//                           offset: Offset(2, 2)),
//                     ],
//                   ),
//                   child: ClipRRect(
//                       child: Image.network(
//                     "https://fasadnaya-kraska.ru/upload/articles/ru/0_65518000_1625121805_img.jpg",
//                     fit: BoxFit.cover,
//                   ),
//                   borderRadius: BorderRadius.circular(markerSize > 100 ? 40 : markerSize == 50 ? 10 : 20),),
//                 ),
//               ),
//             ),
// ];
// List<Marker> markers = [
//   Marker(
//     // Первый маркер
//     anchorPos: AnchorPos.align(AnchorAlign.top),
//     // ... остальные параметры маркера
//     builder: (ctx) => InkWell(
//       onTap: () async {
//         // Показать уникальный диалог для первого маркера
//         return await showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text('Диалоговое окно для первого маркера'),
//               // ... остальное содержимое диалогового окна
//             );
//           },
//         );
//       },
//       child: Container(
//         // ... остальные параметры контейнера маркера
//       ),
//     ),
//   ),
//   Marker(
//     // Второй маркер
//     anchorPos: AnchorPos.align(AnchorAlign.top),
//     // ... остальные параметры маркера
//     builder: (ctx) => InkWell(
//       onTap: () async {
//         // Показать уникальный диалог для второго маркера
//         return await showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text('Диалоговое окно для второго маркера'),
//               // ... остальное содержимое диалогового окна
//             );
//           },
//         );
//       },
//       child: Container(
//         // ... остальные параметры контейнера маркера
//       ),
//     ),
//   ),
//   // ... добавьте другие маркеры с уникальными диалоговыми окнами по аналогии
// ];
// Marker marker =  Marker(
//               anchorPos: AnchorPos.align(AnchorAlign.top),
//               rotateAlignment: AlignmentGeometry.lerp(
//                   Alignment.bottomCenter, Alignment.bottomCenter, 0),
//               rotate: true,
//               // width: 300.0,
//               // height: 300.0,
//               width: markerSize,
//               height: markerSize,

//               point: point,
//               builder: (ctx) => InkWell(
//                 child: Container(
//                   width: markerSize,
//                   height: markerSize,
//                   decoration: ShapeDecoration(
//                     color: Colors.white,
//                     shape: markerSize > 50
//                         ? CustomMarker(size: markerSize)
//                         : markerSize == 50
//                             ? RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10))
//                             : CircleBorder(),
//                     shadows: [
//                       BoxShadow(
//                           color: Colors.grey,
//                           // blurRadius: 1.0,
//                           offset: Offset(2, 2)),
//                     ],
//                   ),
//                   child: ClipRRect(
//                       child: Image.network(
//                     "https://fasadnaya-kraska.ru/upload/articles/ru/0_65518000_1625121805_img.jpg",
//                     fit: BoxFit.cover,
//                   ),
//                   borderRadius: BorderRadius.circular(markerSize > 100 ? 40 : markerSize == 50 ? 10 : 20),),
//                 ),
//               ),
//             );