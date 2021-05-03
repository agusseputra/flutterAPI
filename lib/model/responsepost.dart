
class ResponsePost {
  bool success;
  String message;
  int id;
  ResponsePost({this.success, this.message, this.id});
  factory ResponsePost.fromJson(Map<String, dynamic> json) =>
      ResponsePost(
          success: json["success"],
          message: json["message"],
          id: json["id"]);
  Map<String, dynamic> toJson() =>{"success": success, "message": message, "id": id};
}