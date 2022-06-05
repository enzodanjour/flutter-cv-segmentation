import 'package:dio/dio.dart';
import 'package:fairfax_carros/core/models/analise.dart';
import 'package:fairfax_carros/auth/secrets.dart' as secrets;

class DioUploadService {
  Future<Analise> uploadPhotos(String path ) async {
    MultipartFile files=   await MultipartFile.fromFile(path);
      

    var formData = FormData.fromMap({'image': files});

    var response = await Dio().post(
       secrets.endPoint,
      data: formData,
      options: Options(
        headers: {
          'Prediction-Key':secrets.predictionKey,
          'Content-Type': 'application/octet-stream',
        },
        
      )
    );
    

    var result = Analise.fromJson(response.data);
     return result;
  }
}
