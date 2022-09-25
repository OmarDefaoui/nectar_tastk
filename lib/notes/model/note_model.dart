class NoteModel {
  int id;
  String title;
  String body;
  String date;

  NoteModel({
    this.id = 0,
    required this.title,
    required this.body,
    required this.date,
  });

  NoteModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        body = json["body"],
        date = json["date"];

  Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "date": date,
      };
  Map<String, dynamic> toJsonWithId() => {
        "id": id,
        "title": title,
        "body": body,
        "date": date,
      };
}
