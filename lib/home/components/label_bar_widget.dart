import 'package:fairfax_carros/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelBarWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const LabelBarWidget({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(
                  0xff201E1E,
                ),
              ),
            ),
            Text(
              'Ver todos',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: AppColors().primaryColor,
                decoration: TextDecoration.underline,
              ),
            )
          ],
        ),
      ),
    );
  }
}