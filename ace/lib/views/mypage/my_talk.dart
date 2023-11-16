import 'package:ace/widgets/space_appbar.dart';
import 'package:flutter/material.dart';

class MyTalk extends StatelessWidget {
  const MyTalk({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: SpaceAppBar(),
      body: Center(
        child: Text('Mytalk'),
      ),
    ));
  }
}
