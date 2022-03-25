import 'dart:io';

import 'package:design_patterns__chain_of_responsibility/middleware.dart';

class ThrottlingMiddleware extends Middleware {
  final int requestPerminute;
  ThrottlingMiddleware({
    required this.requestPerminute,
  }) {
    currentTime = DateTime.now();
  }
  DateTime currentTime = DateTime.now();
  int request = 0;
  @override
  bool check(String email, String password) {
    print('+++> ThrottlingMiddleware.check');
    if (DateTime.now().isAfter(currentTime.add(Duration(minutes: 60)))) {
      request = 0;
      currentTime = DateTime.now();
    }
    request = request + 1;
    if (request > requestPerminute) {
      print('ThrottlingMiddleware: Request limit exceeded!');
      exit(0);
    }
    return super.check(email, password);
  }
}
