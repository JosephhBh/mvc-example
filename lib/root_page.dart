import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvcexample/view/home_page.dart';

/// Haw l enum men3ouzon la n7addid l status tba3 l user
/// w 3a asesa nfargi l screen
/// bel case taba3na 7a ykoun [ loggedIn ]

enum AuthStatus {
  unknown,
  loggedIn,
  notLoggedIn,
}

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

/// hay l page men3ouza la na3rif l user shou badna nfarji aya screen
/// in case iza ken loged in menfawto 3al home w iza la2 menfawto 3al sign
/// up page . Kmane fina nshayif iza fi user msayav 3ena localy se3eta
/// men3ayit la api yjib l information taba3p based 3al id
/// Bel case taba3na ma fi hal functionlaity bas lezem na3mela hal screen
/// fa deghre ha nfawto 3al home page

class _RootPageState extends State<RootPage> {
  AuthStatus _authStatus = AuthStatus.unknown;

  @override
  void initState() {
    super.initState();
    checkUserStatus();
  }

  /// Men3ayit la hayde l method la na3rif shou badna na3mol bel user
  /// iza mawjoud menjeblo l data iza la2 bi kafe 3ade
  /// Bel case taba3na rah n7ot eno mawjoud fa ha na3ti [ AuthStatus logged in]
  checkUserStatus() async {
    await Future.delayed(Duration.zero, () {
      setState(() {
        _authStatus = AuthStatus.loggedIn;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget returnedScreen = Container();
    switch (_authStatus) {
      case AuthStatus.unknown:
        returnedScreen = Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: CupertinoActivityIndicator(
              radius: 15,
            ),
          ),
        );

        break;
      case AuthStatus.loggedIn:
        returnedScreen = HomePage();
        break;

      default:
    }
    return returnedScreen;
  }
}
