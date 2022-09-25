class PostModel {
  int id;
  String title;
  String body;
  int userId;

  PostModel({
    this.id = 0,
    required this.title,
    required this.body,
    required this.userId,
  });

  PostModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        body = json["body"],
        userId = json["userId"];
}
