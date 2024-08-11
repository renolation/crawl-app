extension StringExtension on String {
  String withUrlCheck() {
    if (!startsWith('https')) {
      return 'https://wuthering.gg/$this';
    }
    return this;
  }
}