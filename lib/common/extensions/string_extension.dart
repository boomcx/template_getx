extension StringVerify on String {
  bool get isPhone => RegExp(r'^1[0-9]{10}$').hasMatch(this);
}
