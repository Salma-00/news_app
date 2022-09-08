import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_apppp/view/Home_view.dart';


main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "News App",
      home: HomeView(),
    );
  }
}
