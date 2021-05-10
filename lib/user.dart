class User {
  int userId;
  int id;
  String title;
  String body;

  User(int userId, int id, String title, String body) {
    this.userId = userId;
    this.id = id;
    this.title = title;
    this.body = body;
  }
  User.fromJson(Map json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        body = json['body'];

  Map toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'body': body};
  }
}