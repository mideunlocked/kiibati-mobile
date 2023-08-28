import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/more-widgets/custom_profile_appbar.dart';
import '../../widgets/more-widgets/profile_textfield.dart';
import 'change_password_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var editable = false;

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var numberController = TextEditingController();
  var emailController = TextEditingController();

  final firstNameNode = FocusNode();
  final lastNameNode = FocusNode();
  final numberNode = FocusNode();
  final emailNode = FocusNode();

  @override
  void initState() {
    super.initState();

    firstNameController = TextEditingController(text: "Ariyo");
    lastNameController = TextEditingController(text: "Osuolale");
    numberController = TextEditingController(text: "07040225758");
    emailController = TextEditingController(text: "osuolaleariyo@gmail.com");
  }

  @override
  void dispose() {
    super.dispose();

    firstNameController.dispose();
    lastNameController.dispose();
    numberController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var textTheme = of.textTheme;
    var bodyMedium = textTheme.bodyMedium;

    return Scaffold(
      appBar: CustomProfileAppBar(
        title: "Profile",
        actions: [
          TextButton(
            style: ButtonStyle(
              textStyle: MaterialStatePropertyAll(bodyMedium),
            ),
            onPressed: () {
              setState(() {
                editable = !editable;
              });
            },
            child: Text(
              editable ? "SAVE" : "EDIT",
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 1.h,
          horizontal: 5.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 42.w,
                    child: ProfileTextfield(
                      editable: editable,
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
                      editable: editable,
                      controller: lastNameController,
                      node: lastNameNode,
                      labelText: "Last Name",
                      hintText: "Enter last name",
                      textInputType: TextInputType.name,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              const Text(
                "PRIVATE INFO",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              ProfileTextfield(
                editable: editable,
                controller: emailController,
                node: emailNode,
                labelText: "Email",
                hintText: "Enter email address",
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 2.h,
              ),
              ProfileTextfield(
                editable: editable,
                controller: numberController,
                node: numberNode,
                labelText: "Whatsapp number",
                hintText: "Enter whatsapp number",
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: 8.h,
              ),
              TextButton(
                style: ButtonStyle(
                  textStyle: MaterialStatePropertyAll(bodyMedium),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => const ChangePasswordScreen(),
                    ),
                  );
                },
                child: const Text(
                  "EDIT PASSWORD",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
