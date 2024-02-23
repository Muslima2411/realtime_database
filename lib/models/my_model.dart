class PostModel {
  int? id;
  late String title;
  late String desc;

  PostModel({this.id, required this.title, required this.desc});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    desc = json["desc"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "desc": desc,
    };
  }
}
