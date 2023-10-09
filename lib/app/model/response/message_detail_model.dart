class MessageDetailModel {
  final String text;
  final String senderPhone;
  final String receiverPhone;
  final String timestamp;
  final bool isSent;

  MessageDetailModel({
    required this.text,
    required this.senderPhone,
    required this.receiverPhone,
    required this.timestamp,
    required this.isSent,
  });
}
