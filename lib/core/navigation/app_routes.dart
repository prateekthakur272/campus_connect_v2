enum AppRoutes{
  start('start'),
  login('login'),
  register('register');
  final String name;
  const AppRoutes(this.name);
}