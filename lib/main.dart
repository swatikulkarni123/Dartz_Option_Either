import 'package:dartz_option_either/binding/HomeBinding.dart';
import 'package:dartz_option_either/binding/ListViewBinding.dart';
import 'package:dartz_option_either/views/home_view/view/home_view.dart';
import 'package:dartz_option_either/views/list_view/view/list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: true,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(const Duration(seconds: 5),
  //           () => Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder:
  //               (context) => getRoute()
  //           )
  //       )
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return getRoute();
  }

  Widget getRoute() {
    return GetMaterialApp(
        //for navigation don't forget to use GetMaterialApp
        title: 'test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(
            name: "/",
            page: () => HomeView(),
            binding: HomeViewBinding(),
          ),
          GetPage(
            name: "/list",
            page: () => ListViewWidget(),
            binding: ListViewBinding(),
          )
        ]);
  }
}
