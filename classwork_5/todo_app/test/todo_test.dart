import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Task should be added and saved to SharedPreferences', () async {
    // Fake SharedPreferences storage
    SharedPreferences.setMockInitialValues({});

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Simulate adding a task
    List<Map<String, dynamic>> tasks = [
      {
        'title': 'Test Task',
        'deadline': DateTime.now().toIso8601String(),
        'isCompleted': false,
      },
    ];

    // Save tasks
    await prefs.setString('tasks', json.encode(tasks));

    // Retrieve tasks
    String? storedTasks = prefs.getString('tasks');

    // Expect tasks to be saved correctly
    expect(storedTasks, isNotNull);
    expect(json.decode(storedTasks!), isA<List>());
    expect(json.decode(storedTasks)[0]['title'], 'Test Task');
  });

  test(
    'Stored tasks should be retrieved correctly from SharedPreferences',
    () async {
      SharedPreferences.setMockInitialValues({
        'tasks': json.encode([
          {
            'title': 'Existing Task',
            'deadline': DateTime.now().toIso8601String(),
            'isCompleted': false,
          },
        ]),
      });

      final SharedPreferences prefs = await SharedPreferences.getInstance();

      // Load tasks from SharedPreferences
      String? storedTasks = prefs.getString('tasks');

      // Expect tasks to be retrieved correctly
      expect(storedTasks, isNotNull);
      List tasksList = json.decode(storedTasks!);
      expect(tasksList.length, 1);
      expect(tasksList[0]['title'], 'Existing Task');
    },
  );
}
