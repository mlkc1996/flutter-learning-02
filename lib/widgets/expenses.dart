import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/expense.dart';
import 'new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> expenses = [
    Expense(
      title: "Flutter Course",
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: "Lunch",
      amount: 12.99,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "Youtube Premium",
      amount: 14.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: "Commute",
      amount: 9.99,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  void _openAddExpenseOverlay() {
    var orientation = MediaQuery.of(context).orientation;

    bool isLandscapeMode = orientation == Orientation.landscape;

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return NewExpense(addExpense: addExpense);
      },
      useSafeArea: !isLandscapeMode,
    );
  }

  void removeExpense(Expense expense) {
    final index = expenses.indexOf(expense);
    setState(() {
      expenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              expenses.insert(index, expense);
            });
          },
        ),
        duration: const Duration(seconds: 5),
        content: const Text('Expense deleted'),
        persist: false,
      ),
    );
  }

  void addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    var children = [
      Expanded(child: Chart(expenses: expenses)),
      Expanded(
        child: expenses.isNotEmpty
            ? ExpenseList(expenses: expenses, onRemoveExpense: removeExpense)
            : Center(child: Text("No expense found. Try adding one!")),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600 ? Column(children: children) : Row(children: children),
    );
  }
}
