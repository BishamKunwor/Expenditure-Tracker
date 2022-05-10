class Transaction {
  final String id;
  final int amount;
  final String title;
  final DateTime date;

  Transaction(
      {required this.amount,
      required this.date,
      required this.title,
      required this.id});
}
