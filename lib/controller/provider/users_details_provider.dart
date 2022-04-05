import 'package:flutter/material.dart';
import 'package:mvcexample/controller/services/users_details_services/user_details_services.dart';
import 'package:mvcexample/locator.dart';
import 'package:mvcexample/model/single_user_model.dart';
import 'package:mvcexample/model/user_details_model.dart';

class UsersDetailsProvider extends ChangeNotifier {
  final UsersDetailsService _usersDetailsService =
      locator<UsersDetailsService>();

  bool _isLoading = false;
  List<UsersModel> _listOfUsers = [];
  SingleUserModel _userDetailByid = SingleUserModel();
  bool get isLoading => _isLoading;
  List<UsersModel> get listOfUsers => _listOfUsers;
  SingleUserModel get userDetailByid => _userDetailByid;

  getListOfusersFunction() async {
    _isLoading = true;
    _listOfUsers = [];
    notifyListeners();

    /// zedna hayda l delay la nshouf l loading indicator w hayde l case
    /// men3ouza bas nkoun 3m njib data men l datbase ta nfajre shi loading
    /// lal user
    await Future.delayed(Duration(seconds: 2), () {});
    var result = await _usersDetailsService.getAllUsersService();
    if (result.length != 0) {
      _listOfUsers = result;
    }
    _isLoading = false;
    notifyListeners();
  }

  getSingleUserDetailFunction(String id) async {
    _isLoading = true;
    _userDetailByid = SingleUserModel();
    notifyListeners();

    /// zedna hayda l delay la nshouf l loading indicator w hayde l case
    /// men3ouza bas nkoun 3m njib data men l datbase ta nfajre shi loading
    /// lal user
    await Future.delayed(Duration(seconds: 2), () {});
    var result = await _usersDetailsService.getUserDetailById(id);
    if (result != null) {
      _userDetailByid = result;
    }
    _isLoading = false;
    notifyListeners();
  }
}
