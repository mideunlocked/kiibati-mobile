import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../providers/auth_proivder.dart';
import '../../widgets/general-widgets/custom_button.dart';
import '../../widgets/more-widgets/custom_profile_appbar.dart';
import '../../widgets/more-widgets/profile_textfield.dart';
import 'forgot_password_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key, required this.password});

  final String password;

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

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;
    var textTheme = of.textTheme;
    var bodyMedium = textTheme.bodyMedium;
    var sizedBox = SizedBox(
      height: 5.h,
    );

    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        appBar: const CustomProfileAppBar(
          title: "Change password",
          actions: [],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          child: Form(
            key: _formKey,
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
                    isLoading: isLoading,
                    color:
                        textEquality == true ? primaryColor : Colors.grey[200]!,
                    label: "Change",
                    function: () => changePassword(),
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
        ),
      ),
    );
  }

  void changePassword() async {
    var authProvider = Provider.of<AuthProvider>(context, listen: false);

    final isValid = _formKey.currentState!.validate();
    if (isValid == false) {
      return;
    } else if (widget.password != currentPasswordController.text.trim()) {
      _scaffoldKey.currentState?.showSnackBar(
        const SnackBar(
          content: Text("Incorrect password. Please try again."),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      setState(() {
        isLoading = true;
      });

      final response = await authProvider.changePassword(
        widget.password,
        newPasswordController.text.trim(),
      );

      if (response != true) {
        setState(() {
          isLoading = false;
        });
        // print(response);

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
          _scaffoldKey.currentState?.showSnackBar(
            const SnackBar(
              content: Text("Password changed successfully"),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
          Navigator.pop(context);
        }
      }
    }
  }
}
