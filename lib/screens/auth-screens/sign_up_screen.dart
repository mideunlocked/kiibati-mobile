import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../models/member.dart';
import '../../providers/auth_proivder.dart';
import '../../widgets/auth-widgets/have_account_widget.dart';
import '../../widgets/general-widgets/cancel_screen.dart';
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

  final firstNameNode = FocusNode();
  final lastNameNode = FocusNode();
  final numberNode = FocusNode();
  final emailNode = FocusNode();
  final passwordNode = FocusNode();
  final professionNode = FocusNode();

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();

    firstNameController.dispose();
    lastNameController.dispose();
    numberController.dispose();
    emailController.dispose();
    professionController.dispose();
  }

  var status = "Single";
  var dateOfBirth = "";

  void getDateOfBirth(String str) {
    setState(() {
      dateOfBirth = str;
    });
  }

  void getStatus(String str) {
    setState(() {
      status = str;
    });
  }

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;
    var sizedBox = SizedBox(
      height: 3.h,
    );

    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SafeArea(
            child: Stack(
              children: [
                Padding(
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
                              callback: getStatus,
                            ),
                            DateOfBirthPicker(
                              editable: true,
                              dateOfBirth: dateOfBirth,
                              callback: getDateOfBirth,
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
                          isLoading: isLoading,
                          function: () => signUp(),
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
                const CancelScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp() async {
    var authProvider = Provider.of<AuthProvider>(context, listen: false);

    final isValid = _formKey.currentState!.validate();
    if (isValid == false) {
      return;
    } else {
      setState(() {
        isLoading = true;
      });

      final response = await authProvider.createUserEmailAndPassword(
        Member(
          passwordController.text.trim(),
          id: "",
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          mobileNumber: numberController.text.trim(),
          emailAddress: emailController.text.trim(),
          age: 0,
          maritalStatus: status,
          profession: professionController.text.trim(),
          dateOfBirth: dateOfBirth,
        ),
      );
      if (response != true) {
        setState(() {
          isLoading = false;
        });

        _scaffoldKey.currentState?.showSnackBar(
          SnackBar(
            content: Text(response),
            backgroundColor: Colors.red,
          ),
        );
        setState(() {
          isLoading = false;
        });
      } else {
        if (mounted) {
          Navigator.pop(context);
        }
      }
    }
  }
}
