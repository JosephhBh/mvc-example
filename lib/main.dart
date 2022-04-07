import 'package:flutter/material.dart';
import 'package:mvcexample/constants/route_names.dart';
import 'package:mvcexample/controller/navigation/navigation_service.dart';
import 'package:mvcexample/controller/navigation/router.dart';
import 'package:mvcexample/controller/provider/error_message_provider/error_message_provider.dart';
import 'package:mvcexample/controller/provider/test_provide/test_provider.dart';
import 'package:mvcexample/controller/provider/users_details_provider/users_details_provider.dart';
import 'package:mvcexample/locator.dart';
import 'package:provider/provider.dart';

void main() {
  /// men3rif l locator awal ma t2alli3 l app
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ErrorMessageProvider()),
        ChangeNotifierProvider(create: (context) => UsersDetailsProvider()),
        ChangeNotifierProvider(create: (context) => TestProvider()),
      ],
      child: MaterialApp(
        navigatorKey: locator<NavigationService>().navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: kStartingScreenRoute,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
