import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hackaton/pages/cameraPage.dart';
import 'package:test_hackaton/pages/geolocationPage.dart';
import 'package:test_hackaton/pages/mapPage.dart';
import 'package:test_hackaton/util/camera/locator.dart';


void main() async{
  
    WidgetsFlutterBinding.ensureInitialized();
   setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
          ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
     return GetBuilder<MyHomePageController>(
        init: MyHomePageController(),
        initState: (controller) {},
        builder: (controller) {
          return Scaffold(
              body: IndexedStack(
                index: controller.tabIndex.value,
                children: pages,
              ),
              bottomNavigationBar: Obx(() => BottomNavigationBar(
                    onTap: controller.changeTabIndex,
                    currentIndex: controller.tabIndex.value,
                    iconSize: 30,
                    showSelectedLabels: true,
                    showUnselectedLabels: true,
                    unselectedFontSize: 9,
                    selectedFontSize: 9,
                    enableFeedback: true,
                    landscapeLayout:
                        BottomNavigationBarLandscapeLayout.centered,
                    type: BottomNavigationBarType.fixed,
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: pagesString[0]),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.camera_alt), label: pagesString[1]),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.map_outlined), label: pagesString[2]),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person), label: pagesString[3]),
                    ],
                  )));
        });
  }
  
}
List<Widget> pages = [
  GeolocationPage(),
  CameraPage(),
  MapPage(),
  Scaffold(body: Center(child: Text("Профиль"),),)
];
List<String> pagesString = [
  "Главная",
  "Камера",
  "Карта",
  "Профиль",
];

class MyHomePageController extends GetxController {
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    print(index);
    tabIndex.value = index;
    update();
  }
}