
class MECUserModel {
  MECUserModel({
    this.email,
    this.displayName,
    this.phoneNumber,
    this.photoURL
  });
  String displayName;
  String email;
  String phoneNumber;
  String photoURL;

  Map<String, dynamic> toJson() => {};
}