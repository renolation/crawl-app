abstract class Routes {
  static const home = '/';
  static const character = 'character';
  static const characterDetail = 'characterDetail';


  static const echo = '/echo';
  static const echoDetail = 'echoDetail';


  static const weapon = '/weapon';
  static const weaponDetail = 'weaponDetail';

  static const item = '/item';

}

extension RouteName on String {
  String get name => substring(1);
}
