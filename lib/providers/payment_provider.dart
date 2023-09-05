import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:uuid/uuid.dart';

class PaymentProvider with ChangeNotifier {
  FirebaseAuth authInstance = FirebaseAuth.instance;

  Future<dynamic> giveToChurch(
      BuildContext context, String amount, PaystackPlugin plugin) async {
    try {
      User? user = authInstance.currentUser;

      var uuid = const Uuid();
      String txRef = uuid.v4();

      Charge charge = Charge()
        ..amount = int.parse("${amount}00")
        ..reference = txRef
        ..email = user?.email ?? "";
      CheckoutResponse response = await plugin.checkout(
        context,
        method: CheckoutMethod.card, // Defaults to CheckoutMethod.selectable
        charge: charge,
      );

      print(response);

      return response;
    } catch (e) {
      print("Payment offering error: ${e.toString()}");
      return e.toString();
    }
  }
}
