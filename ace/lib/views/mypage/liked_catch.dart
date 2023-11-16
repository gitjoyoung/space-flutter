import 'package:ace/widgets/common/space_appbar.dart';
import 'package:flutter/material.dart';

class LikedCatch extends StatelessWidget {
  const LikedCatch({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: SpaceAppBar(),
      body: Center(
        child: Text('liked catch'),
      ),
    ));
  }
}
