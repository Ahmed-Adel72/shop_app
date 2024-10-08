class CategoriesResponseBody {
  final bool? status;
  final CategorieDataBody? data;

  CategoriesResponseBody({this.status, this.data});

  factory CategoriesResponseBody.fromJson(Map<String, dynamic> json) =>
      CategoriesResponseBody(
        status: json['status'] ?? false,
        data: json['data'] != null
            ? CategorieDataBody.fromJson(json['data'])
            : null,
      );
}

class CategorieDataBody {
  final int? currentPage;
  final List<DataBody>? dataBody;

  CategorieDataBody({this.currentPage, this.dataBody});

  factory CategorieDataBody.fromJson(Map<String, dynamic> json) =>
      CategorieDataBody(
        currentPage:
            json['current_page'] ?? 0, // Default to 0 if 'current_page' is null
        dataBody: (json['data'] as List<dynamic>?)
                ?.map((e) => DataBody.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [], // Default to empty list if 'data' is null
      );
}

class DataBody {
  final int? id;
  final String? name;
  final String? image;

  DataBody({this.id, this.name, this.image});

  factory DataBody.fromJson(Map<String, dynamic> json) => DataBody(
        id: json['id'] ?? 0,
        name: json['name'] ?? "",
        image: json['image'] ?? "",
      );
}
