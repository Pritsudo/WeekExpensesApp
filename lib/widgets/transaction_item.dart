import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'dart:math';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.userTransaction,
    required this.deleteTX,
  }) : super(key: key);

  final Transaction userTransaction;
  final Function deleteTX;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  late Color _bgColor;
  @override
  void initState() {
    const _availbleColors = [
      Colors.red,
      Colors.blue,
      Colors.amber,
      Colors.purple
    ];
    super.initState();

    _bgColor = _availbleColors[Random().nextInt(4)];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 20,
              child:
                  FittedBox(child: Text('\$${widget.userTransaction.amount}')),
            ),
          ),
        ),
        title: Text(
          widget.userTransaction.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(DateFormat.yMMMMd().format(widget.userTransaction.date)),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                onPressed: () => widget.deleteTX(widget.userTransaction.id),
                icon: Icon(Icons.delete),
                label: Text('Delete'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.deleteTX(widget.userTransaction.id)),
      ),
    );
  }
}
