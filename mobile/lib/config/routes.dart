abstract class Routes {
  static const home = '/';
  static const echo = '/echo';
  static const weapon = '/weapon';
  static const item = '/item';


  static const character = 'character';


}

extension RouteName on String {
  String get name => substring(1);
}
