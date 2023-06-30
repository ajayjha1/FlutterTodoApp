// class Todo {
//   int id;
//   String todoText;
//   bool isDone;
//
//   Todo({
//     required this.id,
//     required this.todoText,
//     this.isDone = false,
//   });
//
//   factory Todo.fromJson(Map<String, dynamic> json) {
//     return Todo(
//       id: json['id'] as int, // Parse id as int
//       todoText: json['todoText'] as String,
//       isDone: json['isDone'] == 1,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'todoText': todoText,
//       'isDone': isDone ? 1 : 0,
//     };
//   }
// }
