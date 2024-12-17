import 'package:flutter/material.dart';
import 'package:flutter_practical/sqlite/database/db_helper.dart';
import 'package:flutter_practical/sqlite/screens/registration_form.dart';

import '../model/student.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  List<Student> studentList = [];
  DbHelper helper = DbHelper();

  @override
  void initState() {
    loadRecords();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
      ),
      body: ListView.builder(
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          Student student = studentList[index];

          return ListTile(
            onTap: () async {
              Student? s = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegistrationForm(
                    student: student,
                  ),
                ),
              );

              if (s != null) {
                var index =
                    studentList.indexWhere((element) => element.id == s.id);
                if (index != -1) {
                  setState(() {
                    studentList[index] = s;
                  });
                }
              }
            },
            title: Text('${student.fName} ${student.lName}'),
            subtitle: Text('${student.email}'),
            trailing: IconButton(
              onPressed: () {
                _showDialog(context, student);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red.shade400,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          /* var helper = DbHelper();
          helper.createDatabase();*/

          Student? student = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegistrationForm(),
            ),
          );

          if (student != null) {
            setState(() {
              studentList.add(student);
            });
          }
        },
        label: Text('Add Student'),
        icon: Icon(Icons.add),
      ),
    );
  }

  Future<void> loadRecords() async {
    var list = await helper.getStudentList();

    setState(() {
      studentList = list;
    });
  }

  void _showDialog(BuildContext context, Student student) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Alert'),
        content: Text(
            'Are you sure you want to delete this student (${student.fName}) ?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('CANCEL'),
          ),
          TextButton(
            onPressed: () async {
              if (await helper.deleteStudent(student.id!) > 0) {
                setState(() {
                  studentList
                      .removeWhere((element) => element.id == student.id);
                });
                Navigator.pop(context);
              }
            },
            child: Text('DELETE'),
          ),
        ],
      ),
    );
  }
}
