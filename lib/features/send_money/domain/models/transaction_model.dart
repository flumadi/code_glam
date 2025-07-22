class TransactionModel {
  final String id;
  final String senderId;
  final String recipientName;
  final double amount;
  final String paymentMethod;
  final DateTime timestamp;
  final bool isFavorite;

  TransactionModel({
    required this.id,
    required this.senderId,
    required this.recipientName,
    required this.amount,
    required this.paymentMethod,
    required this.timestamp,
    this.isFavorite = false,
  });

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'] ?? '',
      senderId: map['senderId'] ?? '',
      recipientName: map['recipientName'] ?? '',
      amount: (map['amount'] as num).toDouble(),
      paymentMethod: map['paymentMethod'] ?? '',
      timestamp: DateTime.parse(map['timestamp']),
      isFavorite: map['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'senderId': senderId,
      'recipientName': recipientName,
      'amount': amount,
      'paymentMethod': paymentMethod,
      'timestamp': timestamp.toIso8601String(),
      'isFavorite': isFavorite,
    };
  }
}