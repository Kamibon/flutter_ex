class User  {
  final int id;
  final String password;
  final String name;
  final String email;
  final String avatar;

  const User({
    required this.password,
    required this.id,
    required this.email,
    required this.name,
    required this.avatar
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
       
        'id': int id,
        'name': String name,
        'email': String email,
        'password': String password,
        'avatar': String avatar,
      } =>
        User(
          id:id,
          name: name,
          email: email,
          password: password,
          avatar: avatar

        ),
      _ => throw const FormatException('Failed to load user.'),
    };
  }
}


  
  