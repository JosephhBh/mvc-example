import 'package:flutter/material.dart';
import 'package:mvcexample/constants/route_names.dart';
import 'package:mvcexample/controller/navigation/navigation_service.dart';
import 'package:mvcexample/locator.dart';

class HomePage extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Get list of users'),
            SizedBox(
              height: 10,
            ),
            //// Hay l button ra7 tekhedna 3al users details page
            /// w fiya ra7 n3ayti la method bel init state la tjib l users
            /// details
            ElevatedButton(
              child: Text('Check users'),
              onPressed: () {
                _navigationService.navigateTo(name: kUsersDetailsPage);
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text('Get user by id : deaful id 2'),
            SizedBox(
              height: 10,
            ),
            //// Hay l button ra7 tekhedna 3al users details page
            /// w fiya ra7 n3ayti la method bel init state la tjib l users
            /// details
            ElevatedButton(
              child: Text('Check user detail'),
              onPressed: () {
                _navigationService.navigateTo(name: kSingleUserDetailPage);
              },
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
