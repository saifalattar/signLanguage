import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('new screen 2')),
      body: const Center(
        child: Text(
          'msa2 el 5er',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );}}