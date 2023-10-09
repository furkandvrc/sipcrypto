part of '../view/messages.dart';

class MessageHeader extends StatelessWidget {
  const MessageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.horizontalScale),
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Messages", style: s26W700Dark.copyWith(color: AppColors.secondary)),
            SizedBox(height: 10.verticalScale),
            Row(
              children: [
                Container(
                  height: 35.verticalScale,
                  width: 280.horizontalScale,
                  decoration: BoxDecoration(
                    color: AppColors.azureishWhite,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        hintStyle: s10W300Dark.copyWith(color: AppColors.secondaryText),
                        hintText: "Search in Messages",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: AppColors.secondaryText)),
                  ),
                ),
                SizedBox(
                  width: 15.horizontalScale,
                ),
                Image.asset(
                  createMessages,
                  scale: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
