import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/cupertino.dart';

class ExpenseList  extends StatelessWidget {
  final List<Expense> expenses;

  const ExpenseList({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: expenses.length, itemBuilder: (context, index) {
      return Text("Item ${index + 1}");
    });
  }
}