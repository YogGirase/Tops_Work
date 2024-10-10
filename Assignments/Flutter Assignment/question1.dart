import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.red,
                    height: 100,
                    width: double.infinity,
                  ),
                  SizedBox(height: 14,),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        color: Colors.blue,
                      ),
                      Container(
                        height: 150,
                        width: 150,
                        color: Colors.blue,
                      ),
                      Container(
                        height: 150,
                        width: 150,
                        color: Colors.blue,
                      ),
                      Container(
                        height: 150,
                        width: 150,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  SizedBox(height: 14,),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        color: Colors.yellow,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Colors.yellow,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Colors.yellow,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Colors.yellow,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Colors.yellow,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ],
              
              ),
            )
        ),
      ),
    );
  }
}
