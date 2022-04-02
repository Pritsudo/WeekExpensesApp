import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';


class TransactionList extends StatelessWidget {
  // TransactionList({Key? key}) : super(key: key);
  final List<Transaction> userTransaction;
  final Function deleteTX;

  TransactionList(this.userTransaction, this.deleteTX);

  @override
  Widget build(BuildContext context) {
    return userTransaction.isEmpty
        ? 
        LayoutBuilder(builder: (context, constraintes) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.center,
                    height: constraintes.maxHeight * 0.6,
                    child: Image.network(
                      'https://media.istockphoto.com/photos/question-mark-symbol-isolated-on-white-background-stock-photo-picture-id1309842875?b=1&k=20&m=1309842875&s=170667a&w=0&h=Im4-_0-BG7ZFcHd4pc8mGaTGZQ86_etfCYqer3lbGIM=',
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Oops! Data is empty',
                ),
              ],
            );
          })
        :
        //We use this when we have a huge data and this will render only visible widget not all widget this may conjupt less space
        // ListView.builder(
        //     itemBuilder: (context, index) {
        //       return TransactionItem(
        //           userTransaction: userTransaction[index], deleteTX: deleteTX );
        //     },
        //     itemCount: userTransaction.length,
        //   );

        ListView(
          children: 
          
          userTransaction.map((tx) {
            
            return TransactionItem(
              key: ValueKey(tx.id),
                  userTransaction: tx, deleteTX: deleteTX );
           },        
        ).toList(),
        );
  }
}
