import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(Expense) onRemoveExpense;

  const ExpenseList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        Expense expense = expenses[index];
        return Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error.withAlpha(150),
            margin: Theme.of(context).cardTheme.margin,
          ),
          key: ValueKey(expense.id),
          child: ExpenseItem(expense: expense),
          onDismissed: (direction) {
            onRemoveExpense(expense);
          },
        );
      },
    );
  }
}
