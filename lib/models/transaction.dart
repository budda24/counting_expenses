class Transaction{
  final String id;
  final String title;
  final String amount;
  final DateTime date;
  const Transaction({ required this.amount, required this.date, required this.id, required this.title});
}