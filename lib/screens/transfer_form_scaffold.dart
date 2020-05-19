import 'package:bytebank/components/transfer_text_field.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

class TransferFormScaffold extends StatelessWidget {
  final TextEditingController _txfAccount = TextEditingController();
  final TextEditingController _txfValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add transfer"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TransferTextField(
              controller: _txfAccount,
              label: "Account number",
              hint: "0000",
              icon: Icons.credit_card,
            ),
            TransferTextField(
              controller: _txfValue,
              label: "Transfer value",
              hint: "0.00",
              icon: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text("CONFIRM"),
              onPressed: () {
                _createTransfer(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    String account = _txfAccount.text;
    double value = double.tryParse(_txfValue.text);
    if (account == null || value == null) {
      return;
    }
    Transfer t = Transfer(value, account);
    Navigator.pop(context, t);
  }
}
