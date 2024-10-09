import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatares'),
      ),
      body: const Center(
        child: CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/images/avatarAngel.jpg'),
        ),
      ),
    );
  }
}
