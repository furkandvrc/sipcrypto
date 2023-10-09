String formatTimestamp(DateTime timestamp) {
  final now = DateTime.now();
  final difference = now.difference(timestamp);

  if (difference.inDays == 0) {
    // Aynı gün
    return '${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}';
  } else if (difference.inDays == 1) {
    // Dün
    return 'Dün ${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}';
  } else if (difference.inDays >= 7 && difference.inDays < 30) {
    // 1 haftadan fazla, 30 günden az
    final weeks = (difference.inDays / 7).floor();
    return '$weeks';
  } else if (difference.inDays >= 30) {
    // 1 aydan fazla
    final months = (difference.inDays / 30).floor();
    return '$months';
  } else {
    // Diğer durumlar
    return '${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}';
  }
}
