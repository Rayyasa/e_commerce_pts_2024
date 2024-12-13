// ignore_for_file: unused_element, non_constant_identifier_names, sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

Widget kartu(BuildContext context, String img, String title, String desc,
    int price, int id) {
  return Container(
    margin: EdgeInsets.only(bottom: 12),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), border: Border.all()),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 200,
              // margin: EdgeInsets.only(right: 20),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(img), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20)),
            ),
            Gap(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.inter(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Gap(8),
                // Container(
                //   width: 50,
                //   child: Text(
                //     desc,
                //     textAlign: TextAlign.start,
                //     overflow: TextOverflow.ellipsis,
                //     style: GoogleFonts.inter(
                //         fontSize: 12, fontWeight: FontWeight.w400),
                //     maxLines: 1,
                //   ),
                // ),
                Gap(8),
                Text(
                  "Rp. ${price}",
                  style: GoogleFonts.inter(
                      fontSize: 16, fontWeight: FontWeight.w600),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}
