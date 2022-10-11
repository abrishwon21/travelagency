import 'package:flutter/material.dart';
import 'package:travel_app/services/Provider/userProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (context,user,_){
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text("HomePage"),),
          body: Center(child: Text(user.email,style: const TextStyle(color: Colors.blueAccent,fontSize: 30.0),)),
        ),
      );
    }
    );
  }
}