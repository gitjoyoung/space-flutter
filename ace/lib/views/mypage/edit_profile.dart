import 'package:ace/widgets/space_appbar.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: SpaceAppBar(),
      body: Center(
        child: Text('edit_profile'),
      ),
    ));
  }
}
