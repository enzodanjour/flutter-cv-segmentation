
import 'package:fairfax_carros/home/components/type_assurance_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/app_colors.dart';

class BottonSheet {
  ValueNotifier<int> indexSelected = ValueNotifier<int>(0);
  ValueNotifier<bool> isOk = ValueNotifier<bool>(false);
  
  Future<void> show(BuildContext context, {required VoidCallback onTap}) async {
    return showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ValueListenableBuilder<int>(
                          valueListenable: indexSelected,
                          builder: (context, controller, child) {
                            return ValueListenableBuilder<bool>(
                                valueListenable: isOk,
                                builder: (context, isValid, child) {
                                  return Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Novo Seguro',
                                        style: GoogleFonts.poppins(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Preencha suas informações e seu veículo estará protegido em breve.',
                                        style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                          color: AppColors().grey,
                                        ),
                                      ),
                                      TypeAsurranceWidget(
                                        isTapped: controller == 2,
                                        type: 1,
                                        onTap: () {
                                          indexSelected.value = 2;
                                        },
                                      ),
                                      TypeAsurranceWidget(
                                        isTapped: controller == 3,
                                        type: 2,
                                        onTap: () {
                                          indexSelected.value = 3;
                                        },
                                      ),
                                      ListTile(
                                        leading: Checkbox(
                                          value: isValid,
                                          onChanged: (result) {
                                            isOk.value = result!;
                                          },
                                        ),
                                        
                                        title: Text(
                                          'Concordo com os termos de uso.',
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors().grey,
                                          ),
                                        ),
                                      ),
                                      
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor: (isValid && controller !=0)
                                                  ? MaterialStateProperty.all<
                                                      Color>(
                                                      AppColors().primaryColor,
                                                    )
                                                  : MaterialStateProperty.all<
                                                      Color>(
                                                      AppColors().grey,
                                                    ),
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    6.0,
                                                  ),
                                                ),
                                              )),
                                          onPressed: onTap,
                                          child: Text(
                                            'Continuar',
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          }),
                    ),
                  );
                },
              );
  }
}