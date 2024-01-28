import '../../domain/entities/recommendations.dart';

class RecommendationsModel extends Recommendations {
  const RecommendationsModel({super.backdropPath, required super.id});

  factory RecommendationsModel.fromJson(Map<String, dynamic> json) =>
      RecommendationsModel(
          id: json['id'],
          backdropPath: json['backdrop_path'] ?? "/t5zCBSB5xMDKcDqe91qahCOUYVV.jpg");
}
