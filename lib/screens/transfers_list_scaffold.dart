import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

import 'transfer_form_scaffold.dart';

class TransfersListScaffold extends StatefulWidget {
  final List<Transfer> _transfers = List();

  @override
  State<StatefulWidget> createState() {
    return TransfersListState();
  }
}

class TransfersListState extends State<TransfersListScaffold> {
  @override
  Widget build(BuildContext context) {
//    widget._transfers.add(Transfer(1000, "2212"));

    return Scaffold(
      appBar: AppBar(
        title: Text("Transfers"),
      ),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) {
          final transfer = widget._transfers[index];
          return TransferListItem(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transfer> future =
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferFormScaffold();
          }));
          future.then((newTransfer) {
            if (newTransfer != null) {
              setState(() {
                widget._transfers.add(newTransfer);
              });
            }
          });
        },
      ),
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
          title: Text("Value: " + _transfer.value.toString()),
          subtitle: Text("Account: " + _transfer.account),
        ));
  }
}
