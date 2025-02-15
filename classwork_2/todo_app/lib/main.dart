import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(TodoApp());
}

// Global Colors
class AppColors {
  static const Color darkBlue = Color(0xFF0D47A1);
  static const Color lightBlue = Color(0xFFBBDEFB);
  static const Color grey = Colors.white;
  static const Color white = Colors.white;
  static const Color textWhite = Colors.white;
  static const Color textBlack = Colors.black;
  static const Color completedTask = Color(0xFFA5D6A7);
  static const Color lightGreen = Color.fromARGB(255, 52, 117, 171);
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.lightBlue,
      ),
      home: TodoHome(),
    );
  }
}

class TodoHome extends StatefulWidget {
  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  final List<Map<String, dynamic>> _tasks = [];
  final TextEditingController _taskController = TextEditingController();
  DateTime? _selectedDate;

  void _addTask() {
    if (_taskController.text.isEmpty || _selectedDate == null) return;
    setState(() {
      _tasks.add({
        'title': _taskController.text,
        'deadline': _selectedDate!,
        'isCompleted': false
      });
      _taskController.clear();
      _selectedDate = null;
    });
  }

  void _selectDate(
      BuildContext context, Function(DateTime) onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      onDateSelected(picked);
    }
  }

  void _toggleCompletion(int index) {
    setState(() {
      _tasks[index]['isCompleted'] = !_tasks[index]['isCompleted'];
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _editTask(int index) {
    _taskController.text = _tasks[index]['title'];
    _selectedDate = _tasks[index]['deadline'];
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _taskController,
                decoration: InputDecoration(labelText: 'Task Title'),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(_selectedDate == null
                      ? 'No deadline chosen!'
                      : 'Deadline: ${DateFormat.yMMMd().format(_selectedDate!)}'),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () => _selectDate(context,
                        (date) => setState(() => _selectedDate = date)),
                    child: Text('Pick Date'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _tasks[index]['title'] = _taskController.text;
                    _tasks[index]['deadline'] = _selectedDate!;
                  });
                  Navigator.pop(context);
                },
                child: Text('Update Task'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            color: AppColors.darkBlue,
            child: Center(
              child: Text(
                'Todo App',
                style: TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _editTask(index),
                  child: Card(
                    color: AppColors.lightBlue,
                    child: ListTile(
                      title: Text(
                        _tasks[index]['title'],
                        style: TextStyle(
                          color: AppColors.textBlack,
                          decoration: _tasks[index]['isCompleted']
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      subtitle: Text(
                        'Deadline: ' +
                            DateFormat.yMMMd()
                                .format(_tasks[index]['deadline']),
                        style: TextStyle(color: AppColors.textBlack),
                      ),
                      leading: Checkbox(
                        value: _tasks[index]['isCompleted'],
                        onChanged: (value) => _toggleCompletion(index),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteTask(index),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColors.lightGreen,
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _taskController,
                  decoration: InputDecoration(
                    labelText: 'Task',
                    filled: true,
                    fillColor: AppColors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      _selectedDate == null
                          ? '*Select Deadline'
                          : 'Deadline: ${DateFormat.yMMMd().format(_selectedDate!)}',
                      style: TextStyle(color: AppColors.textWhite),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () => _selectDate(context,
                          (date) => setState(() => _selectedDate = date)),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.darkBlue),
                      child: Text('Pick Date',
                          style: TextStyle(color: AppColors.textWhite)),
                    )
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _addTask,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkBlue),
                  child: Text('Add Task',
                      style: TextStyle(color: AppColors.textWhite)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
