import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final base =
      'https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?w=1480&t=st=1665757793~exp=1665758393~hmac=444177a0181d27d80ee8c3a6f4599a294a8217dacd13f64a6c992e9de5ecf783';

  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(backgroundImage: NetworkImage(base));
  }
}
