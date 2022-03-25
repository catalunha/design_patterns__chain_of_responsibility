import 'dart:convert';
import 'dart:io';

import 'package:design_patterns__chain_of_responsibility/middleware.dart';
import 'package:design_patterns__chain_of_responsibility/role_check_middleware.dart';
import 'package:design_patterns__chain_of_responsibility/server.dart';
import 'package:design_patterns__chain_of_responsibility/throttling_middleware.dart';
import 'package:design_patterns__chain_of_responsibility/user_exists_middleware.dart';

void execute() {
  print(
      'Abordando: https://refactoring.guru/pt-br/design-patterns/chain-of-responsibility');
  Server server = Server();
  server.register('admin@example.com', 'admin_pass');
  server.register('user@example.com', 'user_pass');
  Middleware middleware = ThrottlingMiddleware(requestPerminute: 2);
  middleware
      .linkWith(UserExistsMiddleware(server: server))
      .linkWith(RoleCheckMiddleware());
  server.setMiddleware(middleware);
  var success = true;
  do {
    print('============');
    print('Email:');
    var e = stdin.readLineSync(encoding: utf8);
    print('Senha:');
    var p = stdin.readLineSync(encoding: utf8);
    success = server.logIn(e!, p!);
    print(success);
  } while (!success);
  // stdout.write("Enter your name : ");
  // var name = stdin.readLineSync();
  // stdout.write(name);
  print('fim');
}
