import 'package:flutter/material.dart';
import 'package:team_introduction/main.dart';

class Subpage extends StatelessWidget {
  const Subpage({Key? key}) : super(key: key);

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
              child: Image.network("https://i.ibb.co/4JYHHtc/Moonfall.jpg"),
            ),
            TextField(
                decoration: (InputDecoration(
                    hintText: "", labelText: "이름: ", prefixText: ""))),
            TextField(
                decoration: (InputDecoration(
                    hintText: "", labelText: "전공 유무: ", prefixText: ""))),
            TextField(
                decoration: (InputDecoration(
                    hintText: "", labelText: "개발관련 경험: ", prefixText: ""))),
            TextField(
                decoration: (InputDecoration(
                    hintText: "", labelText: "MBTI: ", prefixText: ""))),
            TextField(
                decoration: (InputDecoration(
                    hintText: "", labelText: "취미: ", prefixText: ""))),
            TextField(
                decoration: (InputDecoration(
                    hintText: "", labelText: "목표: ", prefixText: "")))
          ],
        ),
      ),
    );
  }
}
