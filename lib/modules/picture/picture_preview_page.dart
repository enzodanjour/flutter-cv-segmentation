import 'dart:io';

import 'package:fairfax_carros/core/app_colors.dart';
import 'package:fairfax_carros/modules/insurance/big_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PicturePreviewPage extends StatefulWidget {
  final String path;
  const PicturePreviewPage({Key? key, required this.path}) : super(key: key);

  @override
  State<PicturePreviewPage> createState() => _PicturePreviewPageState();
}

class _PicturePreviewPageState extends State<PicturePreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              
              Image.file(
                File(
                  widget.path,
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.black.withOpacity(0.8),
                child: Text(
                  'A foto ficou boa?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 33,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BigButton(
                      width: MediaQuery.of(context).size.width * 0.4,
                      text: 'Retentar',
                      color: AppColors().grey,
                      condition: true,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    BigButton(
                      width: MediaQuery.of(context).size.width * 0.4,
                      condition: true,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/picture_send_page',
                          arguments: widget.path,
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
