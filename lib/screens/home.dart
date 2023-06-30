// import 'package:flutter/material.dart';
//
// import '../model/todo.dart';
// import '../constants/colors.dart';
// import '../widgets/todo_item.dart';
//
// class Home extends StatefulWidget {
//   Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   final todosList = Todo.todoList();
//   List<Todo> _foundToDo = [];
//   final _todoController = TextEditingController();
//
//   @override
//   void initState() {
//     _foundToDo = todosList;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(
//               horizontal: 20,
//               vertical: 15,
//             ),
//             child: Column(
//               children: [
//                 searchBox(),
//                 Expanded(
//                   child: ListView(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(
//                           bottom: 20,
//                         ),
//                         child: Text(
//                           'My Todos',
//                           style: TextStyle(
//                             fontSize: 25,
//                             fontWeight: FontWeight.w400,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       for (Todo todo in _foundToDo.reversed)
//                         ToDoItem(
//                           todo: todo,
//                           onToDoChanged: _handleToDoChange,
//                           onDeleteItem: () => _deleteToDoItem(todo.id),
//                           onEditItem: _editToDoItem,
//                         ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     margin: EdgeInsets.only(
//                       bottom: 20,
//                       right: 20,
//                       left: 20,
//                     ),
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 5,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.deepPurpleAccent,
//                       boxShadow: const [],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: TextField(
//                       controller: _todoController,
//                       decoration: InputDecoration(
//                         hintText: 'Add a new todo item',
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(
//                     bottom: 20,
//                     right: 20,
//                   ),
//                   child: ElevatedButton(
//                     child: Text(
//                       '+',
//                       style: TextStyle(
//                         fontSize: 40,
//                       ),
//                     ),
//                     onPressed: () {
//                       _addToDoItem(_todoController.text);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       primary: tdBlue,
//                       minimumSize: Size(60, 60),
//                       elevation: 10,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _handleToDoChange(Todo todo) {
//     setState(() {
//       todo.isDone = !todo.isDone;
//     });
//   }
//
//   void _deleteToDoItem(int id) {
//     setState(() {
//       todosList.removeWhere((item) => item.id == id);
//       _foundToDo = todosList;
//       _saveTodoItem(); // Save the updated todo list
//     });
//   }
//
//
//   // void _deleteToDoItem(Todo todo) {
//   //   setState(() {
//   //     todosList.remove(todo);
//   //     _foundToDo = todosList;
//   //     _saveTodoItem(); // Save the updated todo list
//   //   });
//   // }
//
//   void _addToDoItem(String toDo) {
//     if (toDo == null || toDo.trim().isEmpty) {
//       return;
//     }
//     setState(() {
//       todosList.add(
//         Todo(
//           id: DateTime.now().millisecondsSinceEpoch.toString(),
//           todoText: toDo,
//         ),
//       );
//     });
//     _todoController.clear();
//     _saveTodoItem(); // Save the updated todo list
//   }
//
//   void _editToDoItem(Todo todo) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Edit Todo'),
//           content: TextField(
//             controller: TextEditingController(text: todo.todoText),
//             onChanged: (value) {
//               setState(() {
//                 todo.todoText = value;
//               });
//             },
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Save the updated todo item
//                 Navigator.pop(context);
//               },
//               child: Text('Save'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _runFilter(String enteredKeyword) {
//     List<Todo> results = [];
//     if (enteredKeyword.isEmpty) {
//       results = todosList;
//     } else {
//       results = todosList
//           .where(
//             (item) => item.todoText!
//             .toLowerCase()
//             .contains(enteredKeyword.toLowerCase()),
//       )
//           .toList();
//     }
//
//     setState(() {
//       _foundToDo = results.cast<Todo>();
//     });
//   }
//
//   Widget searchBox() {
//     return Container(
//       margin: EdgeInsets.only(
//         top: 50,
//       ),
//       padding: EdgeInsets.symmetric(horizontal: 15),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: TextField(
//         onChanged: (value) => _runFilter(value),
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.all(0),
//           prefixIcon: Icon(
//             Icons.search,
//             color: tdBlack,
//             size: 20,
//           ),
//           prefixIconConstraints: BoxConstraints(
//             maxHeight: 20,
//             minWidth: 25,
//           ),
//           border: InputBorder.none,
//           hintText: 'Search',
//           hintStyle: TextStyle(color: tdGrey),
//         ),
//       ),
//     );
//   }
//
//   void _saveTodoItem() {
//     // Implement your logic to save the updated todo list to the database or file
//     // For simplicity, this method is empty in this example
//   }
// }
