// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, unused_import, duplicate_import
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget kategori(BuildContext context, String name, String img, lebar, int id) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20)),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: lebar * 0.01),
          child: CircleAvatar(
            backgroundImage: NetworkImage(img),
          ),
        ),
        Text(name,
            style: GoogleFonts.poppins(
                textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
      ],
    ),
  );
}
