import 'package:flutter/material.dart';

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
    super.dispose();
    focusNode?.removeListener(_onFocusChange);
    focusNode?.dispose();
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
