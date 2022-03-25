import 'package:design_patterns__chain_of_responsibility/middleware.dart';

class RoleCheckMiddleware extends Middleware {
  @override
  bool check(String email, String password) {
    print('+++> RoleCheckMiddleware.check');

    if (email == 'admin@example.com') {
      print('RoleCheckMiddleware: Hello, admin!');
      return true;
    }
    print('RoleCheckMiddleware: Hello, user!');
    return super.check(email, password);
  }
}
