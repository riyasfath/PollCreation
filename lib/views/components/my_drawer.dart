import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../Login/SettingsPage.dart';

class MyDrawer extends StatelessWidget {

  void logout(){
    final _auth =  AuthService();
    _auth.signOut();

  }
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const DrawerHeader(
                  child: Center(
                      child: Icon(
                Icons.poll,
                color: Colors.green,
                size: 50,
              ))),
              Padding(
                padding:  const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title:  const Text('H O M E ',style: TextStyle(
                    color: Colors.lightGreen
                  )),
                  leading: const Icon(Icons.home,color: Colors.lightGreen,),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: const Text('S E T T I N G S',style: TextStyle(color: Colors.lightGreen),),
                  leading: const Icon(Icons.settings,color: Colors.lightGreen,),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingsPage()));
                  },
                ),
              ),
                Padding(
                padding: const EdgeInsets.only(left: 25.0, bottom: 50),
                child: ListTile(
                  title: const Text('L O G O U T ',style: TextStyle(color: Colors.lightGreen),),
                  leading: const Icon(Icons.logout,color: Colors.lightGreen,),
                  onTap: logout,
                  // IconButton(onPressed: logout, icon: const Icon(Icons.logout,color: Colors.white)),

                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
