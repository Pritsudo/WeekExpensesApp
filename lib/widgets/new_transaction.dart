import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime?  selectedDate;
           
  void submitData() {
    if (amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || selectedDate == null) {
      return;
    }

    widget.addNewTransaction(enteredTitle, enteredAmount, selectedDate);

    Navigator.of(context).pop();
  }

  void _prsentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  // final Function addTransaction;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        // padding: EdgeInsets.only(left:10, top: 10 , right: 10 ,bottom: MediaQuery.of(context).viewInsets.bottom+ 10),
        child: Column(children: [
          TextField(
            autofocus: true,
            decoration:
                InputDecoration(hintText: 'Enter Title', labelText: 'Title'),
            controller: titleController,
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            decoration:
                InputDecoration(hintText: 'Enter Amount', labelText: 'Amount'),
            controller: amountController,
            keyboardType: TextInputType.number,

            // Int this Syntax _ means we don't care that what will return here
            
            onSubmitted: (_) => submitData(),
          ),
          Container(
            height: 70,
            child: Row(
              children: [
                Expanded(
                    child: Text(selectedDate == null
                        ? 'No Date chosen'
                        : ' Picked Date: ${DateFormat.yMd().format(selectedDate!)}')),
                RaisedButton(
                  onPressed: _prsentDatePicker,
                  child: Text(
                    'Chose Date',
                    style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Theme.of(context).primaryColor),
                  ),
                )
              ],
            ),
          ),
          FlatButton(
              onPressed: submitData,
              child: Text('Add Transaction'))
        ]),
      ),
    );
  }
}
