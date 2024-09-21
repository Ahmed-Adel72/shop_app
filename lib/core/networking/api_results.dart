import 'package:shop_app/core/networking/api_error_model.dart';

abstract class ApiResults<T> {
  const ApiResults();
  factory ApiResults.success(T data) = Success<T>;
  factory ApiResults.failure(ApiErrorModel apiErrorModel) = Failure<T>;
}

class Success<T> extends ApiResults<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends ApiResults<T> {
  final ApiErrorModel apiErrorModel;
  const Failure(this.apiErrorModel);
}
