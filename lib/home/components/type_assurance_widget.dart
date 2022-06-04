import 'package:fairfax_carros/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TypeAsurranceWidget extends StatelessWidget {
  final VoidCallback onTap;
  final bool isTapped;
  final int type;
  const TypeAsurranceWidget(
      {Key? key,
      required this.onTap,
      required this.type,
      required this.isTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isTapped ? AppColors().primaryColor : Colors.transparent,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      selectedColor: AppColors().primaryColor,
      selected: true,
      leading: Container(
        decoration: BoxDecoration(
          color: AppColors().terciaryColor,
          borderRadius: BorderRadius.circular(
            200,
          ),
        ),
        height: 41,
        width: 41,
        child: Icon(
          type == 1 ? Icons.person_outline : Icons.business_outlined,
          color: AppColors().primaryColor,
          size: 24,
        ),
      ),
      title: Text(
        type == 1 ? 'Sou pessoa Física' : 'sou pessoa Jurídica',
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
    );
  }
}