enum AppRoutes{
  start('start'),
  login('login'),
  register('register'),
  profile('profile');
  final String name;
  const AppRoutes(this.name);
}