import 'package:flutter/material.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Product'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 192, 131, 253),
      ),
      body: Center(
        child: Text(data),
      ),
    );
  }
}