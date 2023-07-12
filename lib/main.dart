import 'package:flutter/material.dart';
import 'package:team_introduction/Subpage.dart';
import 'package:provider/provider.dart';

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
        "test": "이성진",
        "imgUrl":
            "https://user-images.githubusercontent.com/139090280/252877245-ef2a9529-e2bd-487d-9864-cae8b733311d.jpg",
      },
      {
        "test": "이동규",
        "imgUrl":
            "https://github-production-user-asset-6210df.s3.amazonaws.com/94061061/252827449-357c96cf-3fe5-40e7-8986-47ab5a94ecad.png",
      },
      {
        "test": "이현서",
        "imgUrl":
            "https://user-images.githubusercontent.com/94061061/252844435-39e9bd05-f69a-4cc1-8ba9-0f8c49f61a97.png",
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
                MaterialPageRoute(
                    builder: (_) => Subpage(
                          imgUrl: 'category',
                        )),
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
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.network(
                        imgUrl,
                        width: 200,
                        height: 200,
                        fit: BoxFit.fitWidth,
                      ),
                      Container(
                        width: double.infinity,
                        height: 200,
                        color: const Color.fromARGB(255, 130, 28, 28)
                            .withOpacity(0.2),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Subpage(
                                      imgUrl: imgUrl,
                                    )),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          alignment: Alignment.center,
                          backgroundColor: Colors.transparent,
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
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
