import 'package:flutter/material.dart';
import 'package:team_introduction/Subpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TeamShot(),
    );
  }
}

class TeamShot extends StatelessWidget {
  const TeamShot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// 테스트 이미지 데이터
    List<Map<String, dynamic>> dataList = [
      {
        "test": "남궁현",
        "imgUrl":
            "https://github.com/sparta-8Team/Team-Introducation/assets/101164731/5b6a14fd-e090-461c-899a-063800fe950f",
      },
      {
        "test": "김민우",
        "imgUrl":
            "https://github.com/sparta-8Team/Team-Introducation/assets/94061061/ea96d517-36ac-4e26-8f73-24ee3b8a3450",
      },
      {
        "test": "이성진님 이슈에 사진 다시올려주시면 감사하겠습니다.",
        "imgUrl":
            "https://github.com/sparta-8Team/Team-Introducation/assets/94061061/97e79ad3-d971-4a14-9827-f39cde82df66",
      },
      {
        "test": "이동규님 이슈에 사진 다시올려주시면 감사하겠습니다.",
        "imgUrl":
            "https://github-production-user-asset-6210df.s3.amazonaws.com/94061061/252827449-357c96cf-3fe5-40e7-8986-47ab5a94ecad.png",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          "1명 없어서 슬프조를 소개합니다",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Subpage()),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Divider(height: 1),
          Expanded(
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                String category = dataList[index]['test'];
                String imgUrl = dataList[index]['imgUrl'];
                return Card(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        imgUrl,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      Text(
                        category,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
