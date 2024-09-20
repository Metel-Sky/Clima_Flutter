void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2Result = await task2(); // чекаємо завершення task2
  task3(task2Result);
}

void task1() {
  print('Task 1 complete');
}

Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  String result = 'task 2 data';

  // Використовуємо await для очікування завершення затримки
await Future.delayed(threeSeconds, () {
    print('Task 2 complete');
     // повертаємо результат після затримки
  });
  return result;
}

void task3(String task2Data) {
  print('Task 3 complete with $task2Data');
}
