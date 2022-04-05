import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvcexample/constants/route_names.dart';
import 'package:mvcexample/controller/device_utils/device_utils.dart';
import 'package:mvcexample/controller/navigation/navigation_service.dart';
import 'package:mvcexample/controller/provider/error_message_provider.dart';
import 'package:mvcexample/locator.dart';
import 'package:provider/provider.dart';

class StartingSceen extends StatefulWidget {
  const StartingSceen({Key? key}) : super(key: key);

  @override
  State<StartingSceen> createState() => _StartingSceenState();
}

/// mnesta3mil hal screen la n7ot chi loading
/// screen b alba w men7ot bel init state function bat3mol
/// redirect 3al root page 7assab ade badon wa2t l loading

class _StartingSceenState extends State<StartingSceen> {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  void initState() {
    super.initState();
    errorMessageProvider =
        Provider.of<ErrorMessageProvider>(context, listen: false);
    Timer(
      Duration(seconds: 1),
      () => _navigationService.navigateAndRemove(
        name: kRootPage,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Loading ..."),
      ),
    );
  }
}
