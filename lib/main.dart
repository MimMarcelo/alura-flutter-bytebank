import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransferFormScaffold(),
//      home: TransfersListScaffold(),
    );
  }
}

class TransferFormScaffold extends StatelessWidget {
  final TextEditingController _txfAccount = TextEditingController();
  final TextEditingController _txfValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add transfer"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _txfAccount,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                  icon: Icon(Icons.credit_card),
                  labelText: "Account number",
                  hintText: "0000"),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _txfValue,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: "Value",
                  hintText: "0.00"),
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            child: Text("CONFIRM"),
            onPressed: () {
              String account = _txfAccount.text;
              double value = double.tryParse(_txfValue.text);
              if (account == null || value == null) {
                return;
              }
              Transfer t = Transfer(value, account);
//              Scaffold.of(context).showSnackBar(
//                SnackBar(
//                  content: Text("Oi Snack"),
//                ),
//              );
            },
          ),
        ],
      ),
    );
  }
}

class TransfersListScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transfers"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
      body: TransfersList(),
    );
  }
}

class TransfersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransferListItem(Transfer(150.00, "1845-7")),
        TransferListItem(Transfer(250.00, "1845-7")),
        TransferListItem(Transfer(350.00, "1845-7")),
      ],
    );
  }
}

class TransferListItem extends StatelessWidget {
  final Transfer _transfer;

  const TransferListItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text("Value: " + _transfer._value.toString()),
      subtitle: Text("Account: " + _transfer._account),
    ));
  }
}

class Transfer {
  double _value;
  String _account;

  Transfer(this._value, this._account);

  @override
  String toString() {
    return 'Transfer{_value: $_value, _account: $_account}';
  }
}
