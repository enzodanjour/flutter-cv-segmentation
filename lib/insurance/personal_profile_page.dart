import 'package:camera/camera.dart';
import 'package:fairfax_carros/core/app_colors.dart';
import 'package:fairfax_carros/insurance/big_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalProfilePage extends StatefulWidget {
  const PersonalProfilePage({Key? key}) : super(key: key);

  @override
  State<PersonalProfilePage> createState() => _PersonalProfilePageState();
}

class _PersonalProfilePageState extends State<PersonalProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(
          0xffF5F5F5,
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          Expanded(
            child: ListView(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Novo seguro',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Preencha suas informações e seu veículo estará protegido em breve.',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: AppColors().grey,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Primeiro Nome',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: AppColors().grey,
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          4.0,
                        ),
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'digite seu nome',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Sobrenome',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: AppColors().grey,
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          4.0,
                        ),
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'digite seu sobrenome',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Carteira de motorista',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: AppColors().grey,
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          4.0,
                        ),
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'digite seu numero de carteira de motorista',
                  ),
                )
              ],
            ),
          ),
          BigButton(
            condition: true,
            onTap: () {
              Navigator.pushNamed(
                context,
                '/picture_page',
              );
            },
          )
        ]),
      ),
    );
  }
}
