import 'package:flutter/material.dart';

import '../../widgets/general-widgets/custome_back_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final editable = false;

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

    firstNameNode.dispose();
    lastNameNode.dispose();
    numberNode.dispose();
    emailNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              enabled: editable,
              controller: firstNameController,
              focusNode: firstNameNode,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: "First name",
                enabled: editable,
                border: InputBorder.none,
                // enabledBorder: ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
