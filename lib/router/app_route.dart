enum AppRoute {
  signIn(
    name: 'signIn',
    path: '/',
  ),
  signUp(
    name: 'signUp',
    path: 'signUp',
  ),
  dashboard(
    name: 'dashboard',
    path: 'dashboard',
  );

  const AppRoute({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;
}
