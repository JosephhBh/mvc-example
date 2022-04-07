import 'dart:convert';

import 'package:mvcexample/constants/route_names.dart';
import 'package:mvcexample/controller/services/users_details_services/constants.dart';
import 'package:mvcexample/model/single_user_model.dart';
import 'package:mvcexample/model/user_details_model.dart';
import 'package:http/http.dart' as http;

class UsersDetailsService {
  Future<List<UsersModel>> getAllUsersService() async {
    try {
      var response = await http.get(Uri.parse(kUsersDetailsApi));
      if (response.statusCode != 200) {
        return [];
      } else {
        var decodedResponse = jsonDecode(response.body);
        var list = decodedResponse['data'] as List;
        var returnedResult =
            list.map((map) => UsersModel.fromJson(map)).toList();
        print(decodedResponse['data']);
        return returnedResult;
      }
    } catch (e) {
      print("try catch $e");
      return [];
    }
  }

  Future<SingleUserModel?> getUserDetailById(String id) async {
    try {
      var response = await http.get(Uri.parse(kUserDetailByIdApi + "$id"));
      // print(response.body);
      if (response.statusCode != 200) {
        return null;
      } else {
        var decodedResponse = jsonDecode(response.body);
        print(decodedResponse);
        var data = SingleUserModel.fromJson(decodedResponse['data']);
        return data;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
