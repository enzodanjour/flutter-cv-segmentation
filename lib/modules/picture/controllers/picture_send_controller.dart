import 'package:fairfax_carros/services/dio_upload_service.dart';
import 'package:flutter/material.dart';

class PictureSendController extends ChangeNotifier {
  final DioUploadService service;

  PictureSendController({required this.service});
  bool isLoading = true;
  bool onError = false;
  bool valido = false;
  double probability= 0.0;

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> uploadPhoto(String path) async {
    try {
      isLoading = true;
      probability = 0;
      valido = false;
      notifyListeners();
      var result = await service.uploadPhotos(path);
      if(result.predictions.first.tagName == 'ok' && result.predictions.first.probability > 0.8) {
        valido = true;
        probability = result.predictions.first.probability * 100;
      }
      isLoading = false;
      onError = false;
      notifyListeners();
    } catch (e) {
      onError = true;
      isLoading = false;
      notifyListeners();
      print(e);
    }
  }
}
