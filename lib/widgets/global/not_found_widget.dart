import 'package:flutter/material.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/NotFound_image.png'),
          const Text(
            'No data Found',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const Text("Please add a city to track it's weather"),
        ],
      ),
    );
  }
}
