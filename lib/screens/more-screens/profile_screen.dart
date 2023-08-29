// ignore_for_file: must_be_immutable

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
  var ageController = TextEditingController();
  var professionController = TextEditingController();
  var dateOfBirthController = TextEditingController();

  final firstNameNode = FocusNode();
  final lastNameNode = FocusNode();
  final numberNode = FocusNode();
  final emailNode = FocusNode();
  final ageNode = FocusNode();
  final professionNode = FocusNode();
  final dateOfBirthNode = FocusNode();

  @override
  void initState() {
    super.initState();

    firstNameController = TextEditingController(text: "Ariyo");
    lastNameController = TextEditingController(text: "Osuolale");
    numberController = TextEditingController(text: "07040225758");
    emailController = TextEditingController(text: "osuolaleariyo@gmail.com");
    ageController = TextEditingController(text: "18");
    professionController = TextEditingController(text: "Student");
    dateOfBirthController = TextEditingController(text: "24/10/2004");

    status = "Single";
  }

  @override
  void dispose() {
    super.dispose();

    firstNameController.dispose();
    lastNameController.dispose();
    numberController.dispose();
    emailController.dispose();
    ageController.dispose();
    professionController.dispose();
    dateOfBirthController.dispose();
  }

  var status = "Single";

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
              ProfileTextfield(
                editable: editable,
                controller: ageController,
                node: ageNode,
                labelText: "Age",
                hintText: "Enter age",
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaritalStatusWidget(
                    editable: editable,
                    status: status,
                  ),
                  DateOfBirthPicker(
                    editable: editable,
                    dateOfBirthController: dateOfBirthController,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => const ChangePasswordScreen(),
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
            ],
          ),
        ),
      ),
    );
  }
}

class DateOfBirthPicker extends StatefulWidget {
  const DateOfBirthPicker({
    super.key,
    required this.dateOfBirthController,
    required this.editable,
  });

  final TextEditingController dateOfBirthController;
  final bool editable;

  @override
  State<DateOfBirthPicker> createState() => _DateOfBirthPickerState();
}

class _DateOfBirthPickerState extends State<DateOfBirthPicker> {
  @override
  void initState() {
    super.initState();

    dateOfBirth = widget.dateOfBirthController.text.trim();
  }

  DateTime selectedDate = DateTime.now();
  String dateOfBirth = "";

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        builder: (BuildContext context, child) {
          var of = Theme.of(context);
          var primaryColor = of.primaryColor;
          return Theme(
            data: ThemeData(
                colorScheme: ColorScheme.light(
              primary: primaryColor,
            )),
            child: child!,
          );
        });

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateOfBirth =
            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      child: InkWell(
        onTap: () {
          if (widget.editable) {
            selectDate(context);
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Date of birth",
              style: TextStyle(
                fontSize: 8.sp,
                color: Colors.black38,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              dateOfBirth,
            ),
            const Divider(
              color: Colors.black,
              thickness: 0.1,
            ),
          ],
        ),
      ),
    );
  }
}

class MaritalStatusWidget extends StatefulWidget {
  MaritalStatusWidget(
      {super.key, required this.editable, required this.status});

  final bool editable;
  String status;

  @override
  State<MaritalStatusWidget> createState() => _MaritalStatusWdigetState();
}

class _MaritalStatusWdigetState extends State<MaritalStatusWidget> {
  var maritalStatus = [
    "Single",
    "Married",
    "Divorced",
    "Widowed",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Marital Status",
            style: TextStyle(
              fontSize: 8.sp,
              color: Colors.black38,
            ),
          ),
          DropdownButton(
            value: widget.status,
            borderRadius: BorderRadius.circular(30),
            isExpanded: true,
            items: maritalStatus
                .map(
                  (status) => DropdownMenuItem(
                    value: status,
                    enabled: widget.editable,
                    child: Text(status),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                widget.status = value.toString();
              });
            },
          ),
        ],
      ),
    );
  }
}
