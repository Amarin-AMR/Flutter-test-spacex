import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  // static const String id = 'team_screen';
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: const [
              Text('Details'),
              Text(''),
            ],
          ),
        ),
      ),
    );
  }
}
