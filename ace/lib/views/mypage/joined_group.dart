import 'package:ace/widgets/space_appbar.dart';
import 'package:flutter/material.dart';

class JoindeGroups extends StatelessWidget {
  const JoindeGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: SpaceAppBar(),
      body: Center(
        child: Text('joined_group'),
      ),
    ));
  }
}
