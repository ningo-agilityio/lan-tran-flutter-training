import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String description;
  Description({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          SizedBox(
            width: 24.0,
          ),
          Expanded(
            child: Text(
              '${description}',
              style: TextStyle(
                fontSize: 12,
                fontFamily: "Poppins",
                color: Color(0xFFA4A8B2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
