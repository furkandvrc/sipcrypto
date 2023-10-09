part of '../view/messages.dart';

class MessagesBox extends StatelessWidget {
  final String messages;
  final String? name;
  final String? phoneNumber;
  final String? messageTime;
  final bool? isRead;
  final int? unreadCount;
  final bool? isSent;
  const MessagesBox({super.key, required this.messages, this.name, this.phoneNumber, this.messageTime, this.isRead, this.unreadCount, this.isSent});
  String truncateText(String text, int length) {
    if (text.length <= length) {
      return text;
    } else {
      return '${text.substring(0, length)}...';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${name ?? ""} ${phoneNumber == null ? "" : "(${phoneNumber ?? ""})"}", style: s12W700Dark),
                  SizedBox(height: 8.verticalScale),
                  Text(
                    truncateText(
                      messages,
                      90,
                    ).replaceAllMapped(RegExp(r'(.{1,45})(?:\s|$)'), (match) => "${match.group(1)}\n"),
                    style: s11W500Dark.copyWith(color: AppColors.secondaryText),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  isRead == true
                      ? isSent == true
                          ? Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: AppColors.azureishWhite,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.done_all,
                                color: AppColors.primary,
                                size: 15,
                              )))
                          : Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: AppColors.azureishWhite,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.done,
                                color: AppColors.primary,
                                size: 15,
                              )))
                      : Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: AppColors.azureishWhite,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              unreadCount == 0 ? "" : "$unreadCount",
                              style: s10W500Dark.copyWith(color: AppColors.primary),
                            ),
                          ),
                        ),
                  SizedBox(height: 8.verticalScale),
                  Text(
                    messageTime ?? "",
                    style: s8W500Dark.copyWith(color: AppColors.secondaryText),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 10.verticalScale),
          Divider(
            thickness: 1,
            color: AppColors.azureishWhite,
            height: 0,
          ),
        ],
      ),
    );
  }
}
