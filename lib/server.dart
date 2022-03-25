import 'package:design_patterns__chain_of_responsibility/middleware.dart';

class Server {
  var users = <String, String>{};
  Middleware? middleware;
  setMiddleware(Middleware middleware) {
    this.middleware = middleware;
  }

  bool logIn(String email, String password) {
    if (middleware!.check(email, password)) {
      print('Server: Authorization has been successful!');
      return true;
    }
    return false;
  }

  void register(String email, String password) {
    users.addAll({email: password});
  }

  bool hasEmail(String email) {
    return users.containsKey(email);
  }

  bool isValidPassword(String email, String password) {
    return users[email] == password;
  }
}
