class AppRouterEndpoint {
  const AppRouterEndpoint({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;
}

class RouterEndpoints {
  static const home = AppRouterEndpoint(
    name: 'home',
    path: '/',
  );
}
