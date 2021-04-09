
extension MECStringExtension on String {

  bool isValidEmail() {
    if (this.trim().isEmpty) return false;
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
  }


  ///Upcase function
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach => this.split(" ").map((str) => str.inCaps).join(" ");
  String get capitalize {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}