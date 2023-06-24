import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable{
  final String statusMessage;
  final int statusCode;
  final bool success;

  const ErrorMessageModel({ required this.statusMessage,required this.statusCode,required this.success});

  factory ErrorMessageModel.fromJson(Map <String, dynamic> json){
    return ErrorMessageModel(statusMessage: json['status_message'], statusCode: json['status_code'], success: json['']);
  }
  @override
  // TODO: implement props
  List<Object?> get props => [statusMessage, statusCode, success];

}