import 'package:flutter/material.dart';
import 'package:flutter_practical/sqlite/database/db_helper.dart';
import 'package:flutter_practical/sqlite/model/student.dart';

import '../utils/app_util.dart';

class RegistrationForm extends StatefulWidget {
  Student? student;

  RegistrationForm({this.student});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  String _gender = 'Male';
  String? _education;
  String _password = '';

  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final emailController = TextEditingController();
  final contactController = TextEditingController();
  final passwordController = TextEditingController();

  DbHelper helper = DbHelper();

  final List<String> _educations = [
    '10th',
    '12th',
    'Graduation',
    'Post Graduation',
    'Others'
  ];

  final formKey = GlobalKey<FormState>();

  void _updateGender(String? value) {
    setState(() {
      _gender = value!;
    });
  }

  String fName = '', lName = '', email = '', contact = '', password = '';

  Future<void> _insertRecord(Student student) async {
    await helper.insertRecord(
      student: student,
      onSuccess: (rows) {
        if (rows != -1) {
          formKey.currentState!.reset();
          print('Record inserted successfully');
          Navigator.pop(context, student);
        }
      },
      onError: (error) {
        print(error);
      },
    );
  }

  Future<void> _updateStudent(Student student) async {
    if (await helper.updateRecord(student)) {
      print('Record updated successfully');
      Navigator.pop(context, student);
    }
  }

  @override
  void initState() {
    if (widget.student != null) {
      // update
      fNameController.text = widget.student!.fName;
      lNameController.text = widget.student!.lName;
      emailController.text = widget.student!.email;
      contactController.text = widget.student!.contact;
      passwordController.text = widget.student!.password;
      _gender = widget.student!.gender;
      _education = widget.student!.course;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.student == null ? 'Add Student' : 'Update Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: fNameController,
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.name,
                        validator: (value) => AppUtil.validateName(value!),
                        onSaved: (newValue) => fName = newValue!,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: lNameController,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.name,
                        validator: (value) => AppUtil.validateName(value!),
                        onSaved: (newValue) => lName = newValue!,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email address',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => AppUtil.validateEmail(value!),
                  onSaved: (newValue) => email = newValue!,
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: contactController,
                  decoration: InputDecoration(
                    labelText: 'Contact',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) => AppUtil.validateContact(value!),
                  onSaved: (newValue) => contact = newValue!,
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Text(
                      'Gender',
                      style: TextStyle(fontSize: 16),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                            value: 'Male',
                            groupValue: _gender,
                            onChanged: (value) {
                              _updateGender(value);
                            },
                          ),
                          Text(
                            'Male',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                            value: 'Female',
                            groupValue: _gender,
                            onChanged: (value) {
                              // this block will execute when user select this radio
                              _updateGender(value);
                            },
                          ),
                          Text(
                            'Female',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                DropdownButtonFormField(
                  value: _education,
                  items: _educations
                      .map(
                        (e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    _education = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Education',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => AppUtil.validateEducation(value),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  onChanged: (value) {
                    _password = value;
                  },
                  validator: (value) => AppUtil.validatePassword(value),
                  onSaved: (newValue) => password = newValue!,
                ),
                SizedBox(
                  height: 16,
                ),
                Visibility(
                  visible: widget.student == null,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm password',
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: true, //
                    validator: (value) => AppUtil.validateCpassword(
                        _password, value!), // hide password
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        Student student = Student(
                            id: widget.student?.id,
                            createdAt: widget.student?.createdAt,
                            fName: fName,
                            lName: lName,
                            email: email,
                            contact: contact,
                            gender: _gender,
                            course: _education!,
                            password: password);

                        if (widget.student != null) {
                          _updateStudent(student);
                        } else {
                          _insertRecord(student);
                        }

                        /*     print('''
                    fName : $fName
                    lName : $lName
                    email : $email
                    contact : $contact
                    password : $password
                    gender : $_gender
                    education : $_education
                    ''');*/
                      }

                      // reset form fields all clear (blank)
                      //  formKey.currentState!.reset();
                    },
                    child: Text(widget.student == null ? 'REGISTER' : 'UPDATE'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
