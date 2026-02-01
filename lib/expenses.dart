import 'package:flutter/material.dart';

import 'models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {

  final List<Expense> expenses = [
    Expense(title: "Flutter Course", amount: 19.99, date: DateTime.now(), category: Category.work),
    Expense(title: "Lunch", amount: 12.99, date: DateTime.now(), category: Category.food),
    Expense(title: "Youtube Premium", amount: 14.99, date: DateTime.now(), category: Category.leisure),
    Expense(title: "Commute", amount: 9.99, date: DateTime.now(), category: Category.travel),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [const Text("The Chart"), const Text("The expense list...")],
      ),
    );
  }
}
