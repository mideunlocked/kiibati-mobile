import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../providers/auth_proivder.dart';
import '../../widgets/auth-widgets/forgot_password_text_widget.dart';
import '../../widgets/auth-widgets/have_account_widget.dart';
import '../../widgets/general-widgets/cancel_screen.dart';
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

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  bool isLoading = false;

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
                        const ForgotPasswordTextWidget(),
                        sizedBox,
                        CustomButton(
                          color: primaryColor,
                          label: "Sign in",
                          isLoading: isLoading,
                          function: () => signIn(),
                        ),
                        const HaveAccountWidget(
                          checkText: "Don't have an account",
                          actionText: "Sign up now",
                          widget: SignUpScreen(),
                        ),
                        SizedBox(
                          height: 5.h,
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

  void signIn() async {
    var authProvider = Provider.of<AuthProvider>(context, listen: false);

    final isValid = _formKey.currentState!.validate();
    if (isValid == false) {
      return;
    } else {
      setState(() {
        isLoading = true;
      });

      final response = await authProvider.signInUSer(
        emailController.text.trim(),
        passwordController.text.trim(),
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
