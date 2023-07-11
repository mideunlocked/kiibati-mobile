import 'package:flutter/material.dart';

import '../../widgets/general-widgets/custome_back_button.dart';

class ChatWithUsScreen extends StatelessWidget {
  const ChatWithUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
    );
  }
}
