class PostModel {
  int userId = 0;
  int id = 0;
  String title = "no title";
  String body = "no body";

  PostModel({
    this.userId = 0,
    this.id = 0,
    this.title = "no title",
    this.body = "no body",
  });

  PostModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    userId = map['userId'];
    title = map['title'];
    body = map['body'];
  }
}