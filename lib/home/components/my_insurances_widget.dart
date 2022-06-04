

import 'package:fairfax_carros/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyInsurancesWidget extends StatelessWidget {
  final VoidCallback onTap;
  const MyInsurancesWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
            width: 120,
            height: 123,
            child: GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    width: 117,
                    height: 56,
                    'assets/images/mercedes.png',
                  ),
                  Text(
                    'Benz CL250',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xff201E1E),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 207, 214, 255),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        'Acionar',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: AppColors().primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 207, 214, 255),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                width: 120,
                height: 123,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: AppColors().primaryColor,
                      size: 30,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Novo seguro',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color:  AppColors().primaryColor,
                        )),
                  ],
                )),
          )
        ],
      ),
    );
  }
}