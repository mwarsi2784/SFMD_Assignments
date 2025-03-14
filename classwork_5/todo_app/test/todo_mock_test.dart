import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mockito/mockito.dart';
import 'dart:convert';

// 🔹 Create a Mock Class
class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late MockSharedPreferences mockPrefs;

  setUp(() {
    mockPrefs = MockSharedPreferences();
  });

  test('Mock SharedPreferences returns expected task list', () async {
    // Fake JSON Task List
    List<Map<String, dynamic>> fakeTasks = [
      {
        'title': 'Mock Task',
        'deadline': DateTime.now().toIso8601String(),
        'isCompleted': false,
      },
    ];

    // Mock `getString` method to return fake tasks
    when(mockPrefs.getString('tasks')).thenReturn(json.encode(fakeTasks));

    // Retrieve stored tasks
    String? storedTasks = mockPrefs.getString('tasks');

    // Expect the mock to return the correct data
    expect(storedTasks, isNotNull);
    List tasksList = json.decode(storedTasks!);
    expect(tasksList.length, 1);
    expect(tasksList[0]['title'], 'Mock Task');
  });
}
