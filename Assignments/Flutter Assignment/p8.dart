import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image show App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Text View'),
          backgroundColor: Colors.amber.shade100,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: NetworkImage(
                        'https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_Computer_Vision.jpg',),
                      height: 100,
                      width: 100,
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: NetworkImage(
                          'https://www.techopedia.com/wp-content/uploads/2023/02/istock-958259766-1.jpeg'),
                      height: 100,
                      width: 100,
                    ),
                    SizedBox(width: 10,),
                    Text(
                      'AI Time',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(width: 10,),
                    Image(
                      image: NetworkImage(
                          'https://www.techopedia.com/wp-content/uploads/2024/09/Council-of-Europes-AI-Treaty-Prospects-Pitfalls.jpg.webp'),
                      height: 100,
                      width: 100,
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: NetworkImage('https://www.techopedia.com/wp-content/uploads/2024/09/iPhone-16-AI-Features.jpg.webp'),
                      height: 100,
                      width: 100,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
