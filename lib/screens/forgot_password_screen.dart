import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/general-widgets/custom_button.dart';
import '../widgets/more-widgets/profile_textfield.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isValid = false;

  var emailUsernameConroller = TextEditingController();

  @override
  void initState() {
    super.initState();

    emailUsernameConroller =
        TextEditingController(text: "osuolaleariyo@gmail.com");

    emailUsernameConroller.addListener(textListener);
  }

  @override
  void dispose() {
    super.dispose();

    emailUsernameConroller.dispose();
  }

  void textListener() {
    if (emailUsernameConroller.text.contains(".com")) {
      setState(() {
        isValid = true;
      });
    } else {
      setState(() {
        isValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 3.w,
            vertical: 2.h,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/icons/close.png",
                      height: 10.sp,
                      width: 10.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  children: [
                    const Text(
                      "Reset Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    const Text(
                      "Enter your email address or username, and we'll send a link to rest your password.",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    ProfileTextfield(
                      editable: true,
                      controller: emailUsernameConroller,
                      node: FocusNode(),
                      labelText: "Email or Username",
                      hintText: "",
                      textInputAction: TextInputAction.done,
                    ),
                    SizedBox(height: 5.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: CustomButton(
                        color:
                            isValid == true ? primaryColor : Colors.grey[200]!,
                        label: "Send",
                        function: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
