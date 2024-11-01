import 'package:flutter/material.dart';

class ListInvitationPage extends StatelessWidget {
  const ListInvitationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Container(),
            Expanded(child: ListView())
          ],
        ),
      ),
    );
  }
}
