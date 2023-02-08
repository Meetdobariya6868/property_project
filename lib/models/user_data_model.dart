class UserData {
  final String uid;
  final String displayName;
  final String creationDate;
  final String email;
  final int avatar;

  const UserData ({
    required this.uid,
    required this.displayName,
    required this.creationDate,
    required this.avatar,
    required this.email,
  });

  factory UserData.fromJson(Map<String, dynamic> json){
    return UserData(
      uid: json['UID'].toString(),
      displayName: json['DisplayName'].toString(),
      creationDate: json['CreationDate'].toString(),
      email: json['email'].toString(),
      avatar: json['Avatar'] as int,
    );
  }
}