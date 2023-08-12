// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final void Function(String) onRemove;

  const TransactionList(this.transaction, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 430,
      child: transaction.isEmpty
          ? Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text('Nenhuma transação cadastrada',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemCount: transaction.length,
              itemBuilder: (ctx, index) {
                final e = transaction[index];
                return Card(
                  child: Card(
                    elevation: 5,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.purple,
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(
                              'R\$${e.value}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        e.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      subtitle: Text(
                        DateFormat('d MMM y').format(e.date),
                      ),
                      trailing: IconButton(
                        onPressed:() => onRemove(e.id),
                        icon: const Icon(Icons.delete),
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                );
              },
            ),
    ); // Converter o Iterable para List<Widget>
  }
}
