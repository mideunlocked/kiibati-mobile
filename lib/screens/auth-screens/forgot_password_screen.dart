import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../providers/auth_proivder.dart';
import '../../widgets/general-widgets/custom_button.dart';
import '../../widgets/more-widgets/profile_textfield.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isValid = false;
  bool isLoading = false;

  var emailController = TextEditingController();
  var emailNode = FocusNode();

  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController(text: "osuolaleariyo@gmail.com");

    emailController.addListener(textListener);
  }

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
  }

  void textListener() {
    if (emailController.text.contains(".com")) {
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
    FocusScope.of(context).autofocus(emailNode);

    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
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
                      child: Container(
                        height: 4.h,
                        width: 4.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "assets/icons/close.png",
                          height: 10.sp,
                          width: 10.sp,
                        ),
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
                        controller: emailController,
                        node: emailNode,
                        labelText: "Email or Username",
                        hintText: "",
                        textInputAction: TextInputAction.done,
                      ),
                      SizedBox(height: 5.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: CustomButton(
                          color: isValid == true
                              ? primaryColor
                              : Colors.grey[200]!,
                          label: "Send",
                          isLoading: isLoading,
                          function: () => sendResetLink(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendResetLink() async {
    setState(() {
      isLoading = true;
    });
    var authProvider = Provider.of<AuthProvider>(context, listen: false);

    var result = await authProvider.resetPassword(
      emailController.text.trim(),
    );

    if (result = true) {
      _scaffoldKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(
              "Password reset link sent to ${emailController.text.trim()}"),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      print(result);
      _scaffoldKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(result.toString()),
          backgroundColor: Colors.red,
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }
}
