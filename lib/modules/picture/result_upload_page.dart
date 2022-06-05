import 'package:fairfax_carros/core/app_colors.dart';
import 'package:fairfax_carros/modules/picture/controllers/picture_send_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResultUploadPage extends StatefulWidget {
  final PictureSendController controller;
  final String path;
  const ResultUploadPage(
      {Key? key, required this.controller, required this.path})
      : super(key: key);

  @override
  State<ResultUploadPage> createState() => _ResultUploadPageState();
}

class _ResultUploadPageState extends State<ResultUploadPage> {
  @override
  void initState() {
    Future.microtask(
      () => widget.controller.uploadPhoto(widget.path),
    );
    super.initState();
  }

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
      body: Consumer<PictureSendController>(builder: (context, value, child) {
        if (value.isLoading) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors().primaryColor,
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Verificando suas fotos... \n Detectando avarias...\n Detectando integridade do veículo...',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            )
          );
        } else if (value.onError) {
          return const Center(
            child: Text('Erro ao enviar a imagem'),
          );
        } else if (value.valido) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.green,
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Successo! Veículo aprovado com ${(value.probability.toStringAsFixed(2)) * 100 }% de acurácia.',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.red,
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Infelizmente seu veiculo nao foi aceito',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
