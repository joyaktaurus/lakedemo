import 'package:flutter/material.dart';

class RememberMe extends StatelessWidget {
  RememberMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            )),

    );
  }
}
