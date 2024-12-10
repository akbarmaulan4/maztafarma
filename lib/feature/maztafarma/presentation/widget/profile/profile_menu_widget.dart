import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileMenuWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onClick;
  const ProfileMenuWidget({super.key, required this.title, required this.onClick, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onClick(),
      child: Row(
        children: [
          Icon(icon ?? Icons.password),
          SizedBox(width: 25),
          Text(title ?? '',  style: GoogleFonts.rubik().copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
