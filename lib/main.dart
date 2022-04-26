import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/add_edit/add.dart';
import 'ui/add_edit/add_edit_binding.dart';
import 'ui/add_edit/edit.dart';
import 'ui/home/home.dart';
import 'ui/home/home_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      getPages: [
        GetPage(
          name: '/',
          page: () => Home(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/add',
          page: () => Add(),
          binding: AddEditBinding(),
        ),
        GetPage(
          name: '/edit',
          page: () => Edit(),
          binding: AddEditBinding(),
        ),
      ],
      initialRoute: '/',
    );
  }
}
