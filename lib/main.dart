import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lakeshore/routes.dart';
import 'package:lakeshore/screens/splash_screen/splash_screen.dart';

import 'app.dart';
import 'my_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_)
  {
  });
 await GetStorage.init();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: App.appTitle,
      theme: ThemeData(
        primarySwatch: MyTheme.primaryColor1,
        unselectedWidgetColor: Colors.blue,
      ),
      initialRoute: Routes.splash,
      getPages: Routes.routes,
    ),
  );
}