import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/app_colors.dart';

class BigButton extends StatefulWidget {
  final bool condition;
  final double? width;
  final String? text;
  final Color? color;
  final VoidCallback onTap;
  const BigButton({Key? key, required this.condition, required this.onTap, this.width, this.color, this.text}) : super(key: key);

  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ??double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: (widget.condition)
                ? MaterialStateProperty.all<Color>(
                    widget.color?? AppColors().primaryColor,
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
          widget.text??'Continuar',
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
