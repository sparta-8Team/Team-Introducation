import 'package:flutter/material.dart';
import 'main.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// Memo 데이터의 형식을 정해줍니다. 추후 isPinned, updatedAt 등의 정보도 저장할 수 있습니다.
class Memo {
  Memo({
    required this.L,
    required this.A,
    required this.B,
    required this.C,
    required this.D,
    required this.E,
    required this.F,
  });

  String L;
  String A;
  String B;
  String C;
  String D;
  String E;
  String F;
}

class MemoService with ChangeNotifier {
  MemoService() {
    // loadMemoList();
  }
  // Memo 데이터는 모두 여기서 관리
// class MemoService extends ChangeNotifier {
  // List<Memo> memoList = [];}
}
