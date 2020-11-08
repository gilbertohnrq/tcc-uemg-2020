class User {
  String uid;
  String name;
  String email;
  String profilePhoto;

  User({
    this.uid,
    this.name,
    this.email,
    this.profilePhoto,
  });

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "profilePhoto": profilePhoto,
    };
  }

  User.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData['uid'];
    this.name = mapData['name'];
    this.email = mapData['email'];
    this.profilePhoto = mapData['profilePhoto'];
  }
}
