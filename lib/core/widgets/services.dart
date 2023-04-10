import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  final String services;
  Services({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          SizedBox(
            width: 34.0,
          ),
          Expanded(
            child: Text(
              '${services}',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Poppins",
                  color: Color(0xFF0C122A),
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
