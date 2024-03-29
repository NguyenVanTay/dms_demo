import 'package:dms/Views/screens/login.dart';

import 'package:dms/network/network_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'controllers/providers/event_provider.dart';

//DateTime get _now => DateTime.now();

void main(List<String> args) {
  intialData();
  runApp(const MyApp());
}

Future<void> intialData() async {
  await Networking.getInstance().getAllStatus();
  await Networking.getInstance().getAllType();
  await Networking.getInstance().getAllUser();
  await Networking.getInstance().getAllProject();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => EventProvider())],
      child: const GetMaterialApp(
        // initialRoute: '/',
        // getPages: [
        //   //GetPage(name: '/', page: () => HomePage()),
        //   GetPage(name: '/alltask', page: () => AllTasks()),
        //   GetPage(name: '/project', page: () => const Project()),
        // ],
        debugShowCheckedModeBanner: false,
        home: Login(),
      ),
    );
  }
}
