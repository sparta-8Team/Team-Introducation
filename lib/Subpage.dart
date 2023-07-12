import 'package:flutter/material.dart';
<<<<<<< HEAD

List<String> name = ["남궁현", "김민우", "이성진", "이동규", "이현서"];
List<String> major = ["전공", "전공", "비전공", "비전공", "비전공"];

class Subpage extends StatelessWidget {
  final String imgUrl;
  final int a;
  const Subpage({Key? key, required this.imgUrl, required this.a})
      : super(key: key);
=======

class Subpage extends StatelessWidget {
  final String imgUrl;
  const Subpage({Key? key, required this.imgUrl}) : super(key: key);
>>>>>>> f2b023b1c78a6dccef22cfd6cebec8f0798a9f2f

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("멤버들을 소개합니다."),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.save))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 20, left: 125, right: 125, top: 20),
              child: Image.network(imgUrl),
            ),
            Text("${name[a]}"),
            Text("${major[a]}"),
            Text("${name[a]}"),
            Text("${major[a]}"),
            Text("${name[a]}"),
            Text("${major[a]}"),
          ],
        ),
      ),
    );
  }
}
