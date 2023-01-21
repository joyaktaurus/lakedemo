import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lakeshore/routes.dart';

final rememberMeController = Get.put(RememberMeController());

class RememberMeController extends GetxController {
  final _rememberMe = false.obs;
  final _getStorage = GetStorage();

  get rememberMe => this._rememberMe.value;
  set rememberMe(value) => this._rememberMe.value = value;

  @override
  void onInit() {
    // Check if remember me is true in storage
    if (_getStorage.hasData("remember_me")) {
      _rememberMe.value = _getStorage.read("remember_me");
    }
  }

  void toggleRememberMe(bool newValue) {
    _rememberMe.value = newValue;
    _getStorage.write("remember_me", _rememberMe.value);
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            Checkbox(
              activeColor: Colors.red,
              checkColor: Colors.green,
              value: rememberMeController.rememberMe,
              onChanged: (value) {
                if (value != null)
                  rememberMeController.toggleRememberMe(value);

                // Checkbox(
                //   value: rememberMeController.rememberMe,
                //   onChanged: (value) => rememberMeController.toggleRememberMe(value!),
              }),
            Text("Remember me"),
            ElevatedButton(
              child: Text("Log In"),
              onPressed: () {
                Get.toNamed(Routes.dashBoardPage);
                // Handle login
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}