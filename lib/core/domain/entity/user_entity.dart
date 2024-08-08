class UserEntity {
  static String className = "UserEntity";

  final int id;
  final bool isVerified;
  double balance;

  UserEntity(
      {required this.id, required this.isVerified, required this.balance});

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
        id: json['id'],
        isVerified: json['is_verified'],
        balance: json['balance']);
  }

  Map<String, dynamic> toJson(UserEntity userEntity) => {
        'id': userEntity.id,
        'is_verified': userEntity.isVerified,
        'balance': userEntity.balance
      };
}
