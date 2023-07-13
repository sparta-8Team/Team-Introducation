import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:team_introduction/Subpage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main_service.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TeamService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TeamShot(),
    );
  }
}

class TeamShot extends StatefulWidget {
  const TeamShot({super.key});

  @override
  State<TeamShot> createState() => _TeamShotState();
}

// 테스트 이미지 데이터
// List<Map<String, dynamic>> dataList = [
//   {
//     "test": "남궁현",
//     "imgUrl":
//         "https://github.com/sparta-8Team/Team-Introducation/assets/101164731/5b6a14fd-e090-461c-899a-063800fe950f",
//   },
//   {
//     "test": "김민우",
//     "imgUrl":
//         "https://github.com/sparta-8Team/Team-Introducation/assets/94061061/ea96d517-36ac-4e26-8f73-24ee3b8a3450",
//   },
//   {
//     "test": "이성진",
//     "imgUrl":
//         "https://user-images.githubusercontent.com/139090280/252877245-ef2a9529-e2bd-487d-9864-cae8b733311d.jpg",
//   },
//   {
//     "test": "이동규",
//     "imgUrl":
//         "https://user-images.githubusercontent.com/138475088/252939731-133b56fd-8e24-4c1c-9d17-8e3e64494d2f.jpg",
//   },
//   {
//     "test": "이현서",
//     "imgUrl":
//         "https://user-images.githubusercontent.com/139304692/252948536-812f74de-8632-45db-84b8-e183cc14baf5.jpg",
//   },
// ];
class _TeamShotState extends State<TeamShot> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TeamService>(builder: (context, teamService, child) {
      List<Team> teamList = teamService.teamList;
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
          actions: [],
        ),
        body: Column(
          children: [
            Divider(height: 1),
            Expanded(
              child: ListView.builder(
                itemCount: teamList.length,
                itemBuilder: (context, index) {
                  Team team = teamList[index];
                  return Card(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.network(
                          team.image,
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
                                      imgUrl: teamList[index].image, a: index)),
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            alignment: Alignment.center,
                            backgroundColor: Colors.transparent,
                          ),
                          child: Text(
                            team.name,
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
    });
  }
}
