extension StringExtension on String {
  double toDouble() =>
      double.parse(this.substring(0, this.length - 2).split('.').join());
}
