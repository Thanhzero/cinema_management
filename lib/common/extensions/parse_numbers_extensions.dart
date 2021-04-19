extension ParseNumbers on String {
  int parseInt() {
    return (this!=null)? int.parse(this):-1;
  }
  double parseDouble() {
    return (this!=null)? double.parse(this):-1;
  }
}