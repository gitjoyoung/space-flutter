import 'package:ace/widgets/space_appbar.dart';
import 'package:flutter/material.dart';

class LikeTalk extends StatelessWidget {
  const LikeTalk({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: SpaceAppBar(),
      body: Center(
        child: Text('LikeTalk'),
      ),
    ));
  }
}
