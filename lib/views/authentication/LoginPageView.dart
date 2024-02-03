import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../controllers/login_controller.dart';

class LoginPageView extends GetView<LoginController> {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenWidth * 0.1),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Log In",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenWidth * 0.1),
                SizedBox(
                  width: screenWidth * 0.7,
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: screenWidth * 0.2,
                    ),
                    shrinkWrap: true,
                    children: [
                      buildIcon(
                          FontAwesomeIcons.google, Colors.deepOrangeAccent),
                      buildIcon(FontAwesomeIcons.apple, Colors.black),
                      buildIcon(FontAwesomeIcons.facebook, Colors.blueAccent),
                    ],
                  ),
                ),
                SizedBox(height: screenWidth * 0.1),
                const Text(
                  "Or use your email account to login",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: screenWidth * 0.1),
                buildTextField("Email", FontAwesomeIcons.envelope,
                    controller.emailController),
                SizedBox(height: screenWidth * 0.04),
                buildTextField("Password", FontAwesomeIcons.lock,
                    controller.passwordController,
                    isPassword: true),
                SizedBox(height: screenWidth * 0.01),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          // Handle forget password tap
                        },
                        child: const Text(
                          "Forget password ?",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: screenWidth * 0.1),
                buildElevatedButton("Log In", Colors.blue),
                SizedBox(height: screenWidth * 0.06),
                buildElevatedButton(
                  "Registration",
                  Colors.white,
                  textColor: Colors.black54,
                  borderColor: Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIcon(IconData iconData, Color colors) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black45,
          width: 1.5,
        ),
      ),
      width: 48.0,
      height: 48.0,
      child: Center(
        child: Icon(
          iconData,
          size: 20,
          color: colors,
        ),
      ),
    );
  }

  Widget buildTextField(
      String label, IconData prefixIcon, TextEditingController controller,
      {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: TextField(
            obscureText: isPassword,
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: Icon(
                prefixIcon,
                color: Colors.black45,
              ),
              labelText: isPassword
                  ? 'Enter your password'
                  : 'Enter your email address',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildElevatedButton(String text, Color backgroundColor,
      {Color textColor = Colors.white,
      Color borderColor = Colors.transparent}) {
    return SizedBox(
        width: double.infinity,
        child: Obx(
          () => ElevatedButton(
            onPressed: controller.isLoading.value
                ? null
                : () => controller.isAccountCredentialsCorrect(),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(backgroundColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: borderColor),
                ),
              ),
              fixedSize: MaterialStateProperty.all<Size>(
                const Size(double.infinity, 50),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
        ));
  }
}