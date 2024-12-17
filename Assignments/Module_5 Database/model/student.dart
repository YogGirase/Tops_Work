class Student {
  int? id;
  String fName;
  String lName;
  String email;
  String contact;
  String gender;
  String course;
  String password;
  String? createdAt;

  Student(
      {this.id,
      required this.fName,
      required this.lName,
      required this.email,
      required this.contact,
      required this.gender,
      required this.course,
      required this.password,
      this.createdAt});

  // convert object into map
  Map<String, dynamic> toMap() {
    return {
      'firstName': this.fName,
      'lastName': this.lName,
      'email': this.email,
      'contact': this.contact,
      'gender': this.gender,
      'course': this.course,
      'password': this.password,
    };
  }

  // convert map into Object
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as int,
      fName: map['firstName'] as String,
      lName: map['lastName'] as String,
      email: map['email'] as String,
      contact: map['contact'] as String,
      gender: map['gender'] as String,
      course: map['course'] as String,
      password: map['password'] as String,
      createdAt: map['createdAt'] as String,
    );
  }
}
