import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // String titleInput;
  // String amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addTx;

  NewTransaction(this.addTx);

  void submitData() {
    String titleEntered = this.titleController.text;
    double amountEntered = double.parse(this.amountController.text);

    if (titleEntered.isEmpty || amountEntered < 0) {
      return;
    }

    addTx(titleEntered, amountEntered);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Title",
            ),
            // onChanged: (value) => titleInput = value,
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Amount",
            ),
            // onChanged: (value) => amountInput = value,
            controller: amountController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => submitData(),
          ),
          FlatButton(
              onPressed: submitData,
              child: Text("Add transaction"),
              textColor: Colors.purpleAccent)
        ],
      ),
    );
  }
}

// (_) => { }   -- underscore in parenthesis is convention
// it tells us that anonymous function is getting a value and we dont care about that value

// also in anonymous function we pass the function not the function pointer
// eg- () { function(); }
