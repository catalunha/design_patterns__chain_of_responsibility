import 'package:design_patterns__chain_of_responsibility/middleware.dart';
import 'package:design_patterns__chain_of_responsibility/server.dart';

class UserExistsMiddleware extends Middleware {
  final Server server;
  UserExistsMiddleware({
    required this.server,
  });
  @override
  bool check(String email, String password) {
    print('+++> UserExistsMiddleware.check');
    if (!server.hasEmail(email)) {
      print('UserExistsMiddleware: This email is not registered!');
      return false;
    }
    if (!server.isValidPassword(email, password)) {
      print('UserExistsMiddleware: Wrong password!');
      return false;
    }
    return super.check(email, password);
  }
}
