import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '( ͡° ͜ʖ ͡°)',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
