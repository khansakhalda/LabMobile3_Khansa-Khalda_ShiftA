import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:praktikum_3/sidemenu.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  List<Map<String, dynamic>> todoList = [];
  final TextEditingController _todoController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  String? selectedPriority;
  List<String> priorityLevels = ['Low', 'Medium', 'High'];
  String? namauser;

  void _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      namauser = prefs.getString('username') ?? 'User';
    });
  }

  void _addTodo() {
    if (_todoController.text.isNotEmpty &&
        selectedPriority != null &&
        _dateController.text.isNotEmpty) {
      setState(() {
        todoList.add({
          'task': _todoController.text,
          'priority': selectedPriority,
          'dueDate': _dateController.text,
          'completed': false,
        });
        _todoController.clear();
        selectedPriority = null;
        _dateController.clear();
      });
    }
  }

  void _toggleCompletion(int index) {
    setState(() {
      todoList[index]['completed'] = !todoList[index]['completed'];
    });
  }

  void _removeTodoAtIndex(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page - $namauser'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _todoController,
              decoration: InputDecoration(
                labelText: 'New To-Do',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addTodo,
                ),
              ),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedPriority,
              hint: const Text('Select Priority'),
              onChanged: (value) {
                setState(() {
                  selectedPriority = value;
                });
              },
              items: priorityLevels.map((priority) {
                return DropdownMenuItem(
                  value: priority,
                  child: Text(priority),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Due Date (yyyy-mm-dd)',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      _dateController.text =
                          pickedDate.toString().split(' ')[0];
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(
                        todoList[index]['task'],
                        style: TextStyle(
                          decoration: todoList[index]['completed']
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      subtitle: Text(
                        'Priority: ${todoList[index]['priority']}\nDue Date: ${todoList[index]['dueDate']}',
                        style: TextStyle(
                          color: todoList[index]['completed']
                              ? Colors.green
                              : Colors.black,
                        ),
                      ),
                      trailing: Wrap(
                        spacing: 12,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              todoList[index]['completed']
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color: todoList[index]['completed']
                                  ? Colors.green
                                  : null,
                            ),
                            onPressed: () => _toggleCompletion(index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _removeTodoAtIndex(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      drawer: const SideMenu(),
    );
  }
}
