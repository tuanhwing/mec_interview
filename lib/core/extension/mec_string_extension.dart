
extension MECStringExtension on String {
  ///Upcase function
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach => this.split(" ").map((str) => str.inCaps).join(" ");
  String get capitalize {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}