final regex = RegExp(r'(\d)(?=(\d{3})+(?!\d))');

String replace(Match match) {
  return '${match[1]},';
}

extension DoubleExt on double {
  String get amountalize => this.toStringAsFixed(2).replaceAllMapped(regex, replace);
}
