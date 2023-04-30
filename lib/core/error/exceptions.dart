import 'package:movies/core/network/errorMessageModel.dart';

class ServerException implements Exception{
  final ErrorMessageModel errorMessageModel;
  const ServerException({required this.errorMessageModel});
}