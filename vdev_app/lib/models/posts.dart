import 'dart:convert';

Posts welcomeFromJson(String str) => Posts.fromJson(json.decode(str));

String welcomeToJson(Posts data) => json.encode(data.toJson());

class Posts {
  Posts({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  late int? userId;
  late int? id;
  late String? title;
  late String? body;

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
