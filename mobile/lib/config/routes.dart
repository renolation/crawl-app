abstract class Routes {
  static const home = '/';
  static const character = 'character';


  static const echo = '/echo';
  static const weapon = '/weapon';

  static const item = '/item';
  static const itemDetail = 'itemDetail';

}

extension RouteName on String {
  String get name => substring(1);
}
