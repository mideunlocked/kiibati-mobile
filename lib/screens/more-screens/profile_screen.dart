import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../helpers/encrypt_data.dart';
import '../../models/member.dart';
import '../../providers/auth_proivder.dart';
import '../../widgets/auth-widgets/sign_out_dialog.dart';
import '../../widgets/general-widgets/custom_progress_indicator.dart';
import '../../widgets/more-widgets/custom_profile_appbar.dart';
import '../../widgets/more-widgets/profile_textfield.dart';
import '../../widgets/profile-widgets/date_of_birth_picker.dart';
import '../../widgets/profile-widgets/martial_status_widget.dart';
import '../auth-screens/change_password_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.member});

  final Member member;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var editable = false;

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var numberController = TextEditingController();
  var emailController = TextEditingController();
  var professionController = TextEditingController();

  final firstNameNode = FocusNode();
  final lastNameNode = FocusNode();
  final numberNode = FocusNode();
  final emailNode = FocusNode();
  final professionNode = FocusNode();
  final dateOfBirthNode = FocusNode();

  @override
  void initState() {
    super.initState();

    var user = widget.member;

    firstNameController = TextEditingController(text: user.firstName);
    lastNameController = TextEditingController(text: user.lastName);
    numberController = TextEditingController(text: user.mobileNumber);
    emailController = TextEditingController(text: user.emailAddress);
    professionController = TextEditingController(text: user.profession);
    status = user.maritalStatus;
    dateOfBirth = user.dateOfBirth;
  }

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
    var textTheme = of.textTheme;
    var bodyMedium = textTheme.bodyMedium;

    var primaryColor = of.primaryColor;
    return Scaffold(
      appBar: CustomProfileAppBar(
        title: "Profile",
        actions: [
          TextButton(
            style: ButtonStyle(
              textStyle: MaterialStatePropertyAll(bodyMedium),
            ),
            onPressed: () {
              if (editable == false) {
                setState(() {
                  editable = true;
                });
              } else {
                updateUserDetails();
                setState(() {
                  editable = false;
                });
              }
            },
            child: isLoading == true
                ? const CustomProgressIndicator()
                : Text(
                    editable == true ? "SAVE" : "EDIT",
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
              Text(
                "PRIVATE INFO",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaritalStatusWidget(
                    editable: editable,
                    status: status,
                    callback: getStatus,
                  ),
                  DateOfBirthPicker(
                    editable: editable,
                    dateOfBirth: dateOfBirth,
                    callback: getDateOfBirth,
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              ProfileTextfield(
                editable: editable,
                controller: professionController,
                node: professionNode,
                labelText: "Profession",
                hintText: "Enter profession",
              ),
              SizedBox(
                height: 2.h,
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
                  EncryptData.decryptAES(widget.member.password);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => ChangePasswordScreen(
                        password: EncryptData.decrypted,
                      ),
                    ),
                  );
                },
                child: Text(
                  "EDIT PASSWORD",
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  textStyle: MaterialStatePropertyAll(bodyMedium),
                ),
                onPressed: () {
                  showAlertDialog();
                },
                child: const Text(
                  "SIGN OUT",
                  style: TextStyle(
                    color: Colors.red,
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

  void showAlertDialog() {
    showDialog(
      context: context,
      builder: (ctx) => const SignOutDialog(),
    );
  }

  void updateUserDetails() async {
    var authProvider = Provider.of<AuthProvider>(context, listen: false);

    final isValid = _formKey.currentState?.validate();
    if (isValid == false) {
      return;
    } else {
      setState(() {
        isLoading = true;
      });

      final response = await authProvider.updateUserDetails(
        Member(
          widget.member.password,
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
