import 'package:expense_tracker_app/model/expense.dart';
import 'package:expense_tracker_app/widget/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {Key? key, required this.expenses, required this.removeExpense})
      : super(key: key);

  final List<Expense> expenses;
  final void Function(Expense expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) {
        return Dismissible(
          key: ValueKey(expenses[index]),
          onDismissed: (direction) {
            removeExpense(expenses[index]);
          },
          child: ExpenseItem(expenses[index]),
        );
      },
    );
  }
}
