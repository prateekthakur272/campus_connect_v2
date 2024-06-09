enum AppRoutes{
  home('/'),
  login('login'),
  register('register'),
  profile('profile');
  final String name;
  const AppRoutes(this.name);
}