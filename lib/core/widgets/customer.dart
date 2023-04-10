import 'package:flutter/material.dart';

import '../../features/auth/model/user.dart';

class Customer extends StatelessWidget {
  Customer({
    required this.user,
    super.key,
  });
  User user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(user.avatar),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            user.name,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF553BA3),
            ),
          )
        ],
      ),
    );
  }
}
