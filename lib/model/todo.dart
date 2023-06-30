class Todo {
  String id;
  String todoText;
  bool isDone;

  Todo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      todoText: json['todoText'],
      isDone: json['isDone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'todoText': todoText,
      'isDone': isDone,
    };
  }

  static List<Todo> todoListFromJson(List<dynamic> json) {
    return json.map((item) => Todo.fromJson(item)).toList();
  }

  static List<dynamic> todoListToJson(List<Todo> todos) {
    return todos.map((todo) => todo.toJson()).toList();
  }
}
