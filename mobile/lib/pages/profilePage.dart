import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/apiAchievements.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.green,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "User1",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Достижения",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              height: 80,
              child: FutureBuilder(
                  future: getAchievements(),
                  builder: (context, snapshot) {
                    return achievements == [] ? Center(child: Text("Нет достижений", textAlign: TextAlign.center,)) : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: achievements.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: GestureDetector(
                              onTap: () async {
                                return await showDialog(
                                    context: (context),
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(achievements[index].name),
                                        content: Text(achievements[index].description),
                                        actions: [
                                          TextButton(onPressed: (){
                                            Get.back();
                                          }, child: Text("Ок"))
                                        ],
                                      );
                                    });
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.amber[index * 100],
                                radius: 30,
                              ),
                            ),
                          );
                        });
                  }),
            ),
            GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 30, // Number of posts
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
