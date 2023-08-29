import 'package:flutter/material.dart';
import 'package:kiibati_mobile/widgets/general-widgets/custom_button.dart';
import 'package:kiibati_mobile/widgets/more-widgets/custom_profile_appbar.dart';
import 'package:kiibati_mobile/widgets/more-widgets/profile_textfield.dart';
import 'package:sizer/sizer.dart';

class PayOfferingScreen extends StatefulWidget {
  const PayOfferingScreen({super.key});

  @override
  State<PayOfferingScreen> createState() => _PayOfferingScreenState();
}

class _PayOfferingScreenState extends State<PayOfferingScreen> {
  final amountController = TextEditingController();

  final amountNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var textTheme = of.textTheme;
    var titleLarge = textTheme.titleLarge;

    var primaryColor = of.primaryColor;
    return Scaffold(
      appBar: const CustomProfileAppBar(
        title: "Pay offering",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 4.h,
                    ),
                    const Text(
                      "Each of you should give what you have decided in your heart to give, not reluctantly or under compulsion, for God loves a cheerful giver.",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "2 Corinthians 9:7",
                      style: titleLarge?.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      child: ProfileTextfield(
                        editable: true,
                        controller: amountController,
                        node: amountNode,
                        labelText: "Amount",
                        hintText: "Enter amount",
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
              ),
              child: CustomButton(
                color: primaryColor,
                label: "Next",
                function: () {},
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}
