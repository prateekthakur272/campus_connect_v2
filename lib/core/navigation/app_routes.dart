enum AppRoutes{
  home('home'),
  login('login'),
  register('register'),
  profile('profile'),
  academics('academics');
  final String name;
  const AppRoutes(this.name);
}