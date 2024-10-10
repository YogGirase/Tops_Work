import 'package:first_pr/Assignments/form_create_p11/registration_screen.dart';
import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {

  String? _emailerr,
  _passworderr;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login(){
   setState(() {
     if(_emailController.text.isEmpty){
       _emailerr='Email cannot be empty';
     }
     else{
       _emailerr =null;
     }

     if(_passwordController.text.isEmpty){
       _passworderr ='Password cant be empty';
     }
     else{
       _passworderr = null;
     }
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person,size: 80,)
                            ],
                          ),
                          Row(
                            children: [
                              Text('Login Page',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                SizedBox(height: 10,),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    errorText: _emailerr,
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    errorText: _passworderr,
                  ),
                ),
                SizedBox(height: 10,),
                FilledButton(onPressed: () {
                      _login();
                }, child: Text('Login')),
                SizedBox(height: 10.0,),
                Text('Dont have account!'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyRegistrationScreen()),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ],
            ),
          ),
      ),
      );
  }
}
