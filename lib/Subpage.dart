import 'package:flutter/material.dart';

List<String> name = ["남궁현", "김민우", "이성진", "이동규", "이현서"];
List<String> major = [
  "전공(컴퓨터공학과)",
  "애매(정보통신공학과)",
  "비전공(유비쿼터스 2년차 자퇴)",
  "비전공(전자공학과)",
  "비전공(뷰티케어과)"
];
List<String> experience = [
  "JAVA, JSP, SQL을 사용한 컴퓨터 사양 추천사이트 홈페이지 구현(대학 졸업 프로젝트), Kotlin 기반 Android를 사용한 미세먼지 측정 앱(클론 코딩) 구현 등을 해보았습니다.",
  "자바스크립트 게시판 강의 따라하기정도 해보았습니다.",
  "개발 관련 경험이 이번이 처음입니다",
  "1학년때 C++을 배웠습니다.(변수,반복문,조건문,배열,포인터 정도까지) 그리고 그걸 토대로 아두이노라는 마이크로컨트롤러에 C++로 작성한 코드를 넣고 아두이노와 모터를 연결해 모터를 구동하는 조별과제를 해본적은 있습니다. 그리고 컴활 1급딸때 함수같은거 다뤄본거? 개발이라는 느낌보다는 프로그래밍이 들어간걸 간단하게라도 조금은 해보았다, 이런느낌입니다.",
  "전혀 없습니다. 1학년때 코딩강의를 간접적으로 들은적은 있습니다."
];
List<String> mbti = ["ESTJ", "ISTJ", "ENFP", "INFP", "INFJ"];
List<String> hobby = [
  "헬스",
  "책읽기",
  "책읽기, 운동, 수영",
  "산책",
  "카페 가서 힐링, 산책, 고양이 사진보기"
];
List<String> Goal = [
  "즐겁게 프로젝트 완료하고 원하는 곳 취직하기",
  "수료하겠습니다.!",
  "대학생때 포기한 꿈 여기서 열심히 해서 이뤄보겠습니다.",
  "프로젝트를 조금 해보니 각자가 가진 능력치를 잘 모으는것도 중요하다는 생각을 하였습니다.개발 능력도 갖추어 가면서 같이 개발하고픈 사람이 되었으면 좋겠습니다. ",
  "개발 지식 습득하기, 자격증 하나 더 따기"
];

class Subpage extends StatelessWidget {
  final String imgUrl;
  final int a;
  const Subpage({Key? key, required this.imgUrl, required this.a})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("멤버들을 소개합니다."),
        actions: [],
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
            Text("${experience[a]}"),
            Text("${mbti[a]}"),
            Text("${hobby[a]}"),
            Text("${Goal[a]}"),
          ],
        ),
      ),
    );
  }
}
