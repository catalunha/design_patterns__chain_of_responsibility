abstract class Middleware {
  Middleware? next;
  Middleware linkWith(Middleware middleware) {
    next = middleware;
    return middleware;
  }

  bool check(String email, String password) {
    print('+++> Middleware.check');

    if (next == null) {
      return true;
    }
    return next!.check(email, password);
  }
}
