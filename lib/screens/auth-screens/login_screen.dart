import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/auth-widgets/forgot_password_text_widget.dart';
import '../../widgets/auth-widgets/have_account_widget.dart';
import '../../widgets/general-widgets/custom_button.dart';
import '../../widgets/more-widgets/profile_textfield.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailNode = FocusNode();
  final passwordNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;
    var sizedBox = SizedBox(
      height: 3.h,
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Center(
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 30.h,
                    width: 50.w,
                  ),
                ),
                ProfileTextfield(
                  editable: true,
                  controller: emailController,
                  node: emailNode,
                  labelText: "Email",
                  hintText: "Enter email address",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress,
                ),
                sizedBox,
                ProfileTextfield(
                  editable: true,
                  controller: passwordController,
                  node: passwordNode,
                  labelText: "Password",
                  hintText: "Enter password",
                  isObscure: true,
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                ),
                ForgotPasswordTextWidget(),
                sizedBox,
                CustomButton(
                  color: primaryColor,
                  label: "Sign in",
                  function: () {},
                ),
                const HaveAccountWidget(
                  checkText: "Don't have an account",
                  actionText: "Sign up now",
                  widget: SignUpScreen(),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "We Value your Privacy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 8.sp,
                  ),
                ),
                Text(
                  "By signing up, you agree to our Terms and Privacy Policy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 8.sp,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
