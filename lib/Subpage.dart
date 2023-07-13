import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_service.dart';

class Subpage extends StatefulWidget {
  final String imgUrl;
  final int a;
  const Subpage({Key? key, required this.imgUrl, required this.a})
      : super(key: key);

  @override
  State<Subpage> createState() => _SubpageState();
}

class _SubpageState extends State<Subpage> {
  int _currentIndex = 0;

  void _incrementIndex() {
    setState(() {
      if (_currentIndex < context.read<TeamService>().teamList.length - 1) {
        _currentIndex++;
      }
    });
  }

  void _decrementIndex() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.a;
  }

  Widget build(BuildContext context) {
    final teamService = Provider.of<TeamService>(context);
    final team = teamService.teamList[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text("멤버들을 소개합니다."),
        actions: [
          (_currentIndex == 0)
              ? IconButton(
                  color: Colors.transparent,
                  onPressed: () {},
                  icon: Icon(Icons.arrow_left),
                )
              : IconButton(
                  onPressed: _decrementIndex,
                  icon: Icon(Icons.arrow_left),
                ),
          (_currentIndex == teamService.teamList.length - 1)
              ? IconButton(
                  color: Colors.transparent,
                  onPressed: () {},
                  icon: Icon(Icons.arrow_right),
                )
              : IconButton(
                  onPressed: _incrementIndex,
                  icon: Icon(Icons.arrow_right),
                ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
                left: 125,
                right: 125,
                top: 20,
              ),
              child: Container(
                width: 300,
                height: 300,
                child: Image.network(team.image),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      " 이름 ",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  Expanded(
                    child: Text("${team.name}"),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      " 전공유무 ",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  Expanded(child: Text("${team.major}")),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      " 개발경험 ",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  Expanded(child: Text("${team.experience}")),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      " MBTI ",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  Expanded(child: Text("${team.mbti}")),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      " 취미 ",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  Expanded(child: Text("${team.hobby}")),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      " 목표 ",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  Expanded(child: Text("${team.goal}")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
