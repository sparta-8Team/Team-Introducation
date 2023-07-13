import 'package:flutter/material.dart';
import 'package:team_introduction/Subpage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main_service.dart';
import 'colors_service.dart';

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

class _TeamShotState extends State<TeamShot> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TeamService>(builder: (context, teamService, child) {
      List<Team> teamList = teamService.teamList;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.TS_P_AB_bg,
          centerTitle: true,
          title: Text(
            "'1명 없어서 슬프조'를 소개합니다",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
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
                          //fit: BoxFit.fitWidth,
                        ),
                        Container(
                          width: double.infinity,
                          height: 200,
                          // color: const Color.fromARGB(255, 130, 28, 28)
                          //  .withOpacity(0.2),
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
                            backgroundColor: AppColors.TS_P_B_bg,
                          ),
                          child: Text(
                            team.name,
                            style: TextStyle(
                              color: AppColors.TS_P_B_C_LV_TS,
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
