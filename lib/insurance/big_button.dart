import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/app_colors.dart';

class BigButton extends StatefulWidget {
  final bool condition;
  final VoidCallback onTap;
  const BigButton({Key? key, required this.condition, required this.onTap}) : super(key: key);

  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: (widget.condition)
                ? MaterialStateProperty.all<Color>(
                    AppColors().primaryColor,
                  )
                : MaterialStateProperty.all<Color>(
                    AppColors().grey,
                  ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  6.0,
                ),
              ),
            )),
        onPressed: widget.onTap,
        child: Text(
          'Continuar',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
