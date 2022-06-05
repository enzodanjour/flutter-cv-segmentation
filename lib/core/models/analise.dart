// To parse this JSON data, do
//
//     final analise = analiseFromJson(jsonString);

import 'dart:convert';

Analise analiseFromJson(String str) => Analise.fromJson(json.decode(str));

String analiseToJson(Analise data) => json.encode(data.toJson());

class Analise {
    Analise({
        required this.id,
        required this.project,
        required this.iteration,
        required this.created,
        required this.predictions,
    });

    String id;
    String project;
    String iteration;
    DateTime created;
    List<Prediction> predictions;

    factory Analise.fromJson(Map<String, dynamic> json) => Analise(
        id: json["id"],
        project: json["project"],
        iteration: json["iteration"],
        created: DateTime.parse(json["created"]),
        predictions: List<Prediction>.from(json["predictions"].map((x) => Prediction.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "project": project,
        "iteration": iteration,
        "created": created.toIso8601String(),
        "predictions": List<dynamic>.from(predictions.map((x) => x.toJson())),
    };

    @override
  String toString() {
    return 'Analise{id: $id, project: $project, iteration: $iteration, created: $created, predictions: $predictions}';
  }
}

class Prediction {
    Prediction({
        required this.probability,
        required this.tagId,
        required this.tagName,
    });

    double probability;
    String tagId;
    String tagName;

    factory Prediction.fromJson(Map<String, dynamic> json) => Prediction(
        probability: json["probability"].toDouble(),
        tagId: json["tagId"],
        tagName: json["tagName"],
    );

    Map<String, dynamic> toJson() => {
        "probability": probability,
        "tagId": tagId,
        "tagName": tagName,
    };

    @override
  String toString() {
    return 'Prediction{probability: $probability, tagId: $tagId, tagName: $tagName}';
  }
}
