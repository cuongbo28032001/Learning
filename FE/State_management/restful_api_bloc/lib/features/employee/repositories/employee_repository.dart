import 'package:restful_api_bloc/models/employee/employee_model.dart';
import 'package:restful_api_bloc/networks/network_helper.dart';
import 'package:restful_api_bloc/networks/network_service.dart';

class EmployeeRepository {
  final String _baseUrl = "http://10.1.0.187:8081/flutter/employee";

  Future<List<EmployeeModel>> getListEmployee() async {
    final response = await NetworkService.sendRequest(
        requestType: RequestType.get, url: '$_baseUrl/list');

    return NetworkHelper.filterResponse(
        paging: true,
        callBack: (baseResponse) =>
            baseResponse.data.content.map<EmployeeModel>((item) {
              return EmployeeModel.fromJson(item);
            }).toList(),
        response: response,
        onFailureCallBackWithMessage: (errorType, msg) =>
            throw Exception('An Error has happened. $errorType - $msg'));
  }

  Future<EmployeeModel> getEmployeeDetail(int id) async {
    final response = await NetworkService.sendRequest(
        requestType: RequestType.get, url: '$_baseUrl/detail?id=$id');

    return NetworkHelper.filterResponse(
        paging: false,
        callBack: (baseResponse) => EmployeeModel.fromJson(baseResponse.data),
        response: response,
        onFailureCallBackWithMessage: (errorType, msg) =>
            throw Exception('An Error has happened. $errorType - $msg'));
  }

  Future<EmployeeModel> updateEmployeeDetail(
      EmployeeModel employeeModel) async {
    final response = await NetworkService.sendRequest(
        requestType: RequestType.put,
        url: '$_baseUrl/updated',
        body: employeeModel.toJson());

    return NetworkHelper.filterResponse(
        paging: false,
        callBack: (baseResponse) => EmployeeModel.fromJson(baseResponse.data),
        response: response,
        onFailureCallBackWithMessage: (errorType, msg) =>
            throw Exception('An Error has happened. $errorType - $msg'));
  }

  Future<EmployeeModel> deleteEmployeeDetail(int id) async {
    final response = await NetworkService.sendRequest(
        requestType: RequestType.get, url: '$_baseUrl/delete?id=$id');

    return NetworkHelper.filterResponse(
        paging: false,
        callBack: (baseResponse) => EmployeeModel.fromJson(baseResponse.data),
        response: response,
        onFailureCallBackWithMessage: (errorType, msg) =>
            throw Exception('An Error has happened. $errorType - $msg'));
  }

  Future<EmployeeModel> createEmployeeDetail(
      EmployeeModel employeeModel) async {
    final response = await NetworkService.sendRequest(
        requestType: RequestType.get,
        url: '$_baseUrl/created',
        body: employeeModel.toJson());

    return NetworkHelper.filterResponse(
        paging: false,
        callBack: (baseResponse) => EmployeeModel.fromJson(baseResponse.data),
        response: response,
        onFailureCallBackWithMessage: (errorType, msg) =>
            throw Exception('An Error has happened. $errorType - $msg'));
  }
}
