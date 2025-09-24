abstract class BaseModel {
  Map<String, dynamic> toJson();
}

class User extends BaseModel {
  String _username;
  String _email;

  User({required String username, required String email})
      : _username = username,
        _email = email;

  // Getter
  String get username => _username;
  String get email => _email;

  // Setter
  set username(String value) => _username = value;
  set email(String value) => _email = value;

  // JSON serialization
  @override
  Map<String, dynamic> toJson() => {
        'username': _username,
        'email': _email,
      };

  // factory constructor for decoding
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
    );
  }

  @override
  String toString() => 'User(username: $_username, email: $_email)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User && other._username == _username && other._email == _email;

  @override
  int get hashCode => _username.hashCode ^ _email.hashCode;
}
