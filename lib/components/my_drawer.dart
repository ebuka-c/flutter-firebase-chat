import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    //get auth service
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(children: [
        //logo
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: 200,
                padding: const EdgeInsets.only(top: 25),
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Center(
                          child: Icon(Icons.message,
                              color: Theme.of(context).colorScheme.primary,
                              size: 40))
                    ]))),

            //home list tile
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                  title: const Text('H O M E'),
                  onTap: () => Navigator.pop(context),
                  leading: Icon(Icons.home,
                      color: Theme.of(context).colorScheme.primary)),
            ),
            //settings list tile
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                  title: const Text('S E T T I N G S'),
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/settings');
                  },
                  leading: Icon(Icons.settings,
                      color: Theme.of(context).colorScheme.primary)),
            ),
          ],
        ),
        const Spacer(),

        //logout list tile
        Padding(
          padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
          child: ListTile(
              title: const Text('L O G O U T'),
              onTap: logout,
              leading: Icon(Icons.logout,
                  color: Theme.of(context).colorScheme.primary)),
        ),
      ]),
    );
  }
}
