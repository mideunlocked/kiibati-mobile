import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/general-widgets/custom_button.dart';
import '../../widgets/more-widgets/custom_profile_appbar.dart';
import '../../widgets/more-widgets/profile_textfield.dart';
import '../auth-screens/forgot_password_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool isObscure = true;
  bool textEquality = false;

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();

  final currentPasswordNode = FocusNode();
  final newPasswordNode = FocusNode();

  @override
  void initState() {
    super.initState();

    currentPasswordController.addListener(textListener);
    newPasswordController.addListener(textListener);
  }

  @override
  void dispose() {
    super.dispose();

    currentPasswordController.dispose();
    newPasswordController.dispose();
  }

  void textListener() {
    if (currentPasswordController.text.length > 7 &&
        newPasswordController.text.length > 7) {
      setState(() {
        textEquality = true;
      });
    } else {
      setState(() {
        textEquality = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;
    var textTheme = of.textTheme;
    var bodyMedium = textTheme.bodyMedium;

    var sizedBox = SizedBox(
      height: 5.h,
    );
    return Scaffold(
      appBar: const CustomProfileAppBar(
        title: "Change password",
        actions: [],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        child: Column(
          children: [
            ProfileTextfield(
              editable: true,
              controller: currentPasswordController,
              node: currentPasswordNode,
              labelText: "Current Password",
              hintText: "",
              isObscure: isObscure,
              isPassword: true,
            ),
            ProfileTextfield(
              editable: true,
              controller: newPasswordController,
              node: newPasswordNode,
              labelText: "New Password",
              hintText: "",
              isObscure: isObscure,
              isPassword: true,
            ),
            sizedBox,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: CustomButton(
                color: textEquality == true ? primaryColor : Colors.grey[200]!,
                label: "Change",
                function: () {},
              ),
            ),
            sizedBox,
            TextButton(
              style: ButtonStyle(
                textStyle: MaterialStatePropertyAll(bodyMedium),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => const ForgotPassword(),
                  ),
                );
              },
              child: const Text(
                "Forgot password?",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
