import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  const Services({super.key});

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
              'Non-Invasive Body Contouring, Back, Neck & Shoulders',
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Poppins",
                color: Color(0xFF0C122A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
