import 'package:ace/widgets/space_appbar.dart';
import 'package:flutter/material.dart';

class FollowUpTalks extends StatelessWidget {
  const FollowUpTalks({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: SpaceAppBar(),
      body: Center(
        child: Text('follow_up_talk'),
      ),
    ));
  }
}
