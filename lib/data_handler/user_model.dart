class UserModel {
  late String name;
  late String username;
  late String email;
  late String password;

  UserModel(this.name, this.username, this.email, this.password);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic> {
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map){
    name = map['name'];
    username = map['username'];
    email = map['email'];
    password = map['password'];
  }
}