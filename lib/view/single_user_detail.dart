import 'package:flutter/material.dart';
import 'package:mvcexample/controller/provider/users_details_provider.dart';
import 'package:mvcexample/widgets/loading_widget/global_loading_widget.dart';
import 'package:provider/provider.dart';

class SingleUserDetailPage extends StatefulWidget {
  const SingleUserDetailPage({Key? key}) : super(key: key);

  @override
  State<SingleUserDetailPage> createState() => _SingleUserDetailPageState();
}

class _SingleUserDetailPageState extends State<SingleUserDetailPage> {
  @override
  void initState() {
    getAllUsersMethod();
    super.initState();
  }

  getAllUsersMethod() async {
    var usersDetailsProvider =
        Provider.of<UsersDetailsProvider>(context, listen: false);
    await Future.delayed(Duration.zero, () {
      usersDetailsProvider.getSingleUserDetailFunction("2");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          fit: StackFit.loose,
          children: [
            Consumer<UsersDetailsProvider>(
                builder: (context, usersDetailsProvider, _) {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: usersDetailsProvider.userDetailByid.id != null
                    ? ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Text(usersDetailsProvider.userDetailByid.id!
                              .toString()),
                        ),
                        title: Text(
                            usersDetailsProvider.userDetailByid.firstName!),
                      )
                    : SizedBox.shrink(),
              );
            }),
            Consumer<UsersDetailsProvider>(
                builder: (context, usersDetailsProvider, _) {
              return usersDetailsProvider.isLoading
                  ? Align(
                      alignment: Alignment.center,
                      child: GlobalLoadingWidget(),
                    )
                  : SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}
