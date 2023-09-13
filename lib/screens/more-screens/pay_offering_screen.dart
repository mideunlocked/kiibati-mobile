import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../helpers/payment.dart';
import '../../providers/payment_provider.dart';
import '../../widgets/more-widgets/custom_profile_appbar.dart';
import '../auth-screens/login_screen.dart';

class PayOfferingScreen extends StatefulWidget {
  const PayOfferingScreen({super.key});

  @override
  State<PayOfferingScreen> createState() => _PayOfferingScreenState();
}

class _PayOfferingScreenState extends State<PayOfferingScreen> {
  TextEditingController amountController = TextEditingController();

  final amountNode = FocusNode();

  bool isLoading = false;

  final plugin = PaystackPlugin();

  @override
  void initState() {
    super.initState();

    plugin.initialize(publicKey: Payment.publicKey);
  }

  @override
  void dispose() {
    super.dispose();

    amountController.dispose();
  }

  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  String bankAccount = "1770897501";

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var textTheme = of.textTheme;
    var titleLarge = textTheme.titleLarge;
    // var primaryColor = of.primaryColor;

    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
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
                      // Padding(
                      //   padding: EdgeInsets.symmetric(
                      //     horizontal: 12.w,
                      //     vertical: 8.h,
                      //   ),
                      //   child: ProfileTextfield(
                      //     editable: false,
                      //     controller: amountController,
                      //     node: amountNode,
                      //     labelText: "Church account number",
                      //     hintText: "Enter amount",
                      //     textInputAction: TextInputAction.done,
                      //     textInputType: TextInputType.number,
                      //   ),
                      // ),
                      SizedBox(
                        height: 15.h,
                      ),
                      InkWell(
                        onTap: () => copyToClipboard(bankAccount),
                        child: Text(
                          bankAccount,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Text("Polaris bank"),
                      const Text("Christ Message Ministry"),
                    ],
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(
              //     horizontal: 8.w,
              //   ),
              //   child: CustomButton(
              //     color: primaryColor,
              //     label: "Next",
              //     isLoading: isLoading,
              //     function: () => payOffering(),
              //   ),
              // ),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> copyToClipboard(String textToCopy) async {
    await Clipboard.setData(ClipboardData(text: textToCopy));
    defaultScaffoldMessenger(Colors.grey, "Copied to clipboard");
  }

  void payOffering() async {
    var payProvider = Provider.of<PaymentProvider>(context, listen: false);
    FirebaseAuth authInstance = FirebaseAuth.instance;

    if (authInstance.currentUser == null) {
      authCheckWidget();
    } else {
      setState(() {
        isLoading = true;
      });

      CheckoutResponse result = await payProvider.giveToChurch(
        context,
        amountController.text.trim(),
        plugin,
      );

      if (result.message == "Success") {
        defaultScaffoldMessenger(Colors.green, "Payemnt successful.");

        amountController.clear();
      } else if (result.message == "Transaction terminated") {
        defaultScaffoldMessenger(Colors.red, "Payemnt terminated.");
      } else if (result.message == "Declined") {
        defaultScaffoldMessenger(
            Colors.red, "Payment declined, kindly try again.");
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>?
      defaultScaffoldMessenger(Color color, String content) {
    setState(() {
      isLoading = false;
    });

    return _scaffoldKey.currentState?.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(content),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(20)),
        margin: EdgeInsets.symmetric(
          horizontal: 2.w,
          vertical: 1.h,
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? authCheckWidget() {
    return _scaffoldKey.currentState?.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: const Text("You need to sign in/ sign up to pay offering"),
        action: SnackBarAction(
          label: "Sign in/ Sign up",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const SignInScreen(),
              ),
            );
          },
          textColor: Colors.white,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(20)),
        margin: EdgeInsets.symmetric(
          horizontal: 2.w,
          vertical: 1.h,
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}
