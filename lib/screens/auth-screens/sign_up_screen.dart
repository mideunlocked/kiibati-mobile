import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/auth-widgets/have_account_widget.dart';
import '../../widgets/general-widgets/custom_button.dart';
import '../../widgets/more-widgets/profile_textfield.dart';
import '../../widgets/profile-widgets/date_of_birth_picker.dart';
import '../../widgets/profile-widgets/martial_status_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var numberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var professionController = TextEditingController();
  var dateOfBirthController = TextEditingController();

  final firstNameNode = FocusNode();
  final lastNameNode = FocusNode();
  final numberNode = FocusNode();
  final emailNode = FocusNode();
  final passwordNode = FocusNode();
  final professionNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    firstNameController.dispose();
    lastNameController.dispose();
    numberController.dispose();
    emailController.dispose();
    professionController.dispose();
    dateOfBirthController.dispose();
  }

  var status = "Single";

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 42.w,
                      child: ProfileTextfield(
                        editable: true,
                        controller: firstNameController,
                        node: firstNameNode,
                        labelText: "First Name",
                        hintText: "Enter first name",
                        textInputType: TextInputType.name,
                      ),
                    ),
                    SizedBox(
                      width: 42.w,
                      child: ProfileTextfield(
                        editable: true,
                        controller: lastNameController,
                        node: lastNameNode,
                        labelText: "Last Name",
                        hintText: "Enter last name",
                        textInputType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
                sizedBox,
                sizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaritalStatusWidget(
                      editable: true,
                      status: status,
                    ),
                    DateOfBirthPicker(
                      editable: true,
                      dateOfBirthController: TextEditingController(),
                    ),
                  ],
                ),
                sizedBox,
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
                  controller: numberController,
                  node: numberNode,
                  labelText: "Whatsapp number",
                  hintText: "Enter whatsapp number",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.number,
                ),
                sizedBox,
                ProfileTextfield(
                  editable: true,
                  controller: professionController,
                  node: professionNode,
                  labelText: "Profession",
                  hintText: "Enter profession",
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
                sizedBox,
                CustomButton(
                  color: primaryColor,
                  label: "Sign up",
                  function: () {},
                ),
                const HaveAccountWidget(
                  checkText: "Already have an account",
                  actionText: "Sign in now",
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
