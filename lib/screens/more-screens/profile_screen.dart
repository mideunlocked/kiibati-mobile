import 'package:flutter/material.dart';
import 'package:kiibati_mobile/screens/more-screens/change_password_screen.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/general-widgets/custome_back_button.dart';

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
                labelText: "Mobile number",
                hintText: "Enter mobile number",
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

class CustomProfileAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomProfileAppBar(
      {super.key, required this.actions, required this.title});

  final List<Widget> actions;
  final String title;

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var textTheme = of.textTheme;
    var bodyMedium = textTheme.bodyMedium;

    return AppBar(
      centerTitle: true,
      leading: const CustomBackButton(),
      title: Text(
        title,
        style: bodyMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// ignore: must_be_immutable
class ProfileTextfield extends StatefulWidget {
  ProfileTextfield({
    super.key,
    required this.editable,
    required this.controller,
    required this.node,
    required this.labelText,
    required this.hintText,
    this.textInputType = TextInputType.name,
    this.textInputAction = TextInputAction.next,
    this.isObscure = false,
    this.isPassword = false,
  });

  final bool editable;
  bool isObscure;
  bool isPassword;
  final TextEditingController controller;
  final FocusNode node;
  final String labelText;
  final String hintText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;

  @override
  State<ProfileTextfield> createState() => _ProfileTextfieldState();
}

class _ProfileTextfieldState extends State<ProfileTextfield> {
  FocusNode? focusNode;

  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    focusNode = widget.node;
    focusNode?.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    focusNode?.removeListener(_onFocusChange);
    focusNode?.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      isFocused = !isFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var textTheme = of.textTheme;
    var bodyMedium = textTheme.bodyMedium;
    var inputDecorationTheme = of.inputDecorationTheme;
    var labelStyle =
        inputDecorationTheme.labelStyle?.copyWith(color: Colors.black);

    return TextFormField(
      enabled: widget.editable,
      controller: widget.controller,
      focusNode: focusNode,
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      style: bodyMedium,
      obscureText: widget.isObscure,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        labelStyle: isFocused == false ? null : labelStyle,
        suffixIcon: widget.isPassword == false
            ? const Text("")
            : IconButton(
                onPressed: () {
                  setState(() {
                    widget.isObscure = !widget.isObscure;
                  });
                },
                icon: Icon(
                  widget.isObscure == true
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                  color: Colors.black,
                ),
              ),
      ),
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus();
      },
    );
  }
}
