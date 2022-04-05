import 'package:flutter/material.dart';
import 'package:mvcexample/controller/provider/users_details_provider.dart';
import 'package:mvcexample/widgets/loading_widget/global_loading_widget.dart';
import 'package:provider/provider.dart';

class UsersDetailsPage extends StatefulWidget {
  const UsersDetailsPage({Key? key}) : super(key: key);

  @override
  State<UsersDetailsPage> createState() => _UsersDetailsPageState();
}

class _UsersDetailsPageState extends State<UsersDetailsPage> {
  @override
  void initState() {
    getAllUsersMethod();
    super.initState();
  }

  getAllUsersMethod() async {
    var usersDetailsProvider =
        Provider.of<UsersDetailsProvider>(context, listen: false);
    await Future.delayed(Duration.zero, () {
      usersDetailsProvider.getListOfusersFunction();
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
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: usersDetailsProvider.listOfUsers.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Text(usersDetailsProvider.listOfUsers[index].id!
                            .toString()),
                      ),
                      title: Text(
                          usersDetailsProvider.listOfUsers[index].firstName!),
                    );
                  },
                ),
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
