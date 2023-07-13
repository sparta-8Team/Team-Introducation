import 'dart:convert';

import 'package:flutter/material.dart';

import 'main.dart';

// Team 데이터의 형식을 정해줍니다.
class Team {
  Team({
    required this.image,
    required this.name,
    required this.major,
    required this.mbti,
    required this.hobby,
    required this.experience,
    required this.goal,
  });

  String image;
  String name;
  String major;
  String mbti;
  String hobby;
  String experience;
  String goal;

  Map toJson() {
    return {
      'name': name,
    };
  }

  factory Team.fromJson(json) {
    return Team(
      image: json['image'],
      name: json['name'],
      major: json['major'],
      mbti: json['mbti'],
      hobby: json['hoby'],
      experience: json['experience'],
      goal: json['goal'],
    );
  }
}

// Team 데이터는 모두 여기서 관리
class TeamService extends ChangeNotifier {
  // TeamService() {
  //   loadTeamList();
  // }

  List<Team> teamList = [
    Team(
      image:
          "https://github.com/sparta-8Team/Team-Introducation/assets/101164731/5b6a14fd-e090-461c-899a-063800fe950f",
      name: '남궁현',
      major: '컴퓨터 공학',
      mbti: 'ESTJ',
      hobby: '헬스',
      experience:
          'JAVA, JSP, SQL을 사용한 컴퓨터 사양 추천사이트 홈페이지 구현(대학 졸업 프로젝트), Kotlin 기반 Android를 사용한 미세먼지 측정 앱(클론 코딩) 구현 등을 해보았습니다.',
      goal: '즐겁게 프로젝트 완료하고 원하는 곳 취직하기',
    ),
    Team(
        image:
            "https://github.com/sparta-8Team/Team-Introducation/assets/94061061/ea96d517-36ac-4e26-8f73-24ee3b8a3450",
        name: '김민우',
        major: '정보통신공학과',
        mbti: 'ISTJ',
        hobby: '책 읽기',
        experience: '자바스크립트 게시판 강의 따라하기정도 해보았습니다.',
        goal: '수료하겠습니다.!'),
    Team(
        image:
            "https://user-images.githubusercontent.com/139090280/252877245-ef2a9529-e2bd-487d-9864-cae8b733311d.jpg",
        name: '이성진',
        major: '유비쿼터스과',
        mbti: 'ENFP',
        hobby: '책읽기, 운동, 수영',
        experience: '개발 관련 경험이 이번이 처음입니다',
        goal: '대학생때 포기한 꿈 여기서 열심히 해서 이뤄보겠습니다.'),
    Team(
        image:
            "https://user-images.githubusercontent.com/138475088/252939731-133b56fd-8e24-4c1c-9d17-8e3e64494d2f.jpg",
        name: '이동규',
        major: '전자공학과',
        mbti: 'INFP',
        hobby: '산책',
        experience:
            '1학년때 C++을 배웠습니다.(변수,반복문,조건문,배열,포인터 정도까지) 그리고 그걸 토대로 아두이노라는 마이크로컨트롤러에 C++로 작성한 코드를 넣고 아두이노와 모터를 연결해 모터를 구동하는 조별과제를 해본적은 있습니다. 그리고 컴활 1급딸때 함수같은거 다뤄본거? 개발이라는 느낌보다는 프로그래밍이 들어간걸 간단하게라도 조금은 해보았다, 이런느낌입니다.',
        goal:
            '프로젝트를 조금 해보니 각자가 가진 능력치를 잘 모으는것도 중요하다는 생각을 하였습니다.개발 능력도 갖추어 가면서 같이 개발하고픈 사람이 되었으면 좋겠습니다.'),
    Team(
        image:
            "https://user-images.githubusercontent.com/139304692/252948536-812f74de-8632-45db-84b8-e183cc14baf5.jpg",
        name: '이현서',
        major: '뷰티케어과',
        mbti: 'INFJ',
        hobby: '카페 가서 힐링, 산책, 고양이 사진보기',
        experience: '',
        goal: '개발 지식 습득하기, 자격증 하나 더 따기')
  ];

  createTeam({
    required String image,
    required String name,
    required String major,
    required String mbti,
    required String hobby,
    required String experience,
    required String goal,
  }) {
    Team team = Team(
        image: image,
        name: name,
        major: major,
        mbti: mbti,
        hobby: hobby,
        experience: experience,
        goal: goal);
    teamList.add(team);
    notifyListeners(); // Consumer<MemoService>의 builder 부분을 호출해서 화면 새로고침
    saveTeamList();
  }

  updateTeam({
    required int index,
    required String image,
    required String name,
    required String major,
    required String mbti,
    required String hobby,
    required String experience,
    required String goal,
  }) {
    Team team = teamList[index];
    team.name = name;
    team.major = major;
    team.mbti = mbti;
    team.hobby = hobby;
    team.experience = experience;
    team.goal = goal;
    notifyListeners();
    saveTeamList();
  }

  deleteTeam({required int index}) {
    teamList.removeAt(index);
    notifyListeners();
    saveTeamList();
  }

  saveTeamList() {
    List teamJsonList = teamList.map((team) => team.toJson()).toList();
    // [{"content": "1"}, {"content": "2"}]

    String jsonString = jsonEncode(teamJsonList);
    // '[{"content": "1"}, {"content": "2"}]'

    prefs.setString('teamList', jsonString);
  }

  loadTeamList() {
    String? jsonString = prefs.getString('teamList');
    // '[{"content": "1"}, {"content": "2"}]'

    if (jsonString == null) return; // null 이면 로드하지 않음

    List teamJsonList = jsonDecode(jsonString);
    // [{"content": "1"}, {"content": "2"}]

    teamList = teamJsonList.map((json) => Team.fromJson(json)).toList();
  }
}
