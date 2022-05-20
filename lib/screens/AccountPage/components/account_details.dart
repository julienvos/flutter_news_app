import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountDetails extends StatelessWidget {
  final String subject;
  final String info;

  const AccountDetails({
    Key? key,
    required this.subject,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        subject,
        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
      ),
      trailing: Text(info,
          style: TextStyle(color: Color.fromARGB(255, 142, 141, 141))),
    );
  }
}
