class TodoModel {
  String title;
  bool finished;

  TodoModel({required this.title, this.finished = false});

  //สร้าง constructor อีกแบบหนึ่ง fromJson เป็นชื่อ fn
  TodoModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        finished = json["completed"]; //map กับ field completed
}
