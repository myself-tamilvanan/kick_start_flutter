import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
          child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: constraints.maxHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:
              List.generate(4, (index) => ItemWidget(text: 'Item $index')),
        ),
      ));
    }));
  }
}

class ItemWidget extends StatelessWidget {
  final String text;

  const ItemWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
