import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return this.transactions.isEmpty
        ? Column(
            children: [
              Text(
                'No transaction added yet!',
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: FittedBox(
                          child: Text('\$${transactions[index].amount}')),
                    ),
                  ),
                  title: Text(
                    '${transactions[index].title}',
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle:
                      Text(DateFormat.yMMMd().format(transactions[index].date)),
                  trailing: IconButton(
                    color: Theme.of(context).errorColor,
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deleteTx(transactions[index].id);
                    },
                  ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
