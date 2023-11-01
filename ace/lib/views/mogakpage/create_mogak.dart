import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateMogak extends GetView {
  const CreateMogak({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Card(
          child: Column(children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '모각 제목',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '모각 설명',
              ),
            ),
          ]),
        ),
        Card(
          child: Column(
            children: [
              ListTile(
                title: Text('모집인원'),
                trailing: Icon(Icons.navigate_next_outlined),
              ),
              Divider()
            ],
          ),
        )
      ]),
    );
  }
}
