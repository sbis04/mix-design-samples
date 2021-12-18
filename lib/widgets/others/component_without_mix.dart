import 'package:flutter/material.dart';

class ComponentWithoutMix extends StatelessWidget {
  const ComponentWithoutMix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.deepPurple,
            width: 5,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Welcome to MIX',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
