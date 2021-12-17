import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';

import '../new_transaction.dart';

class UserTransaction extends StatelessWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddTransaction(),
        TransactionList(),
      ],
    );
  }
}
