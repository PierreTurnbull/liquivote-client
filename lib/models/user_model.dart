class User {
  final int id;
  final String username;

  User({ this.id, this.username });

  factory User.fromObject(Map<String, dynamic> object) {
    if (object == null) { return null; }
    return User(
      id: object['id'],
      username: object['username']
    );
  }
}