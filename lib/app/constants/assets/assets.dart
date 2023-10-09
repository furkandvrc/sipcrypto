/// Tüm Assets path leri buradan çekilecek
/// Proje içinde Herhangi bir path yazılmayacak

const String fontFamily = 'Montserrat';
String generalAssetPath = 'assets/visual/';
String generalGifPath = '${generalAssetPath}gifs';
String generalImagePath = '${generalAssetPath}images';
String generalIconPath = '${generalAssetPath}icons';

String getFlagPath(String countryCode) => 'assets/visual/flags/${countryCode.toLowerCase()}.png';

String menuMessagesUnselected = '$generalIconPath/menu-messages-unselected.png';
String menuMessagesSelected = '$generalIconPath/menu-messages-selected.png';
String menuRecentsUnselected = '$generalIconPath/menu-recents-unselected.png';
String menuRecentsSelected = '$generalIconPath/menu-recents-selected.png';
String menuPremiumUnselected = '$generalIconPath/menu-premium-unselected.png';
String menuPremiumSelected = '$generalIconPath/menu-premium-selected.png';
String createMessages = '$generalIconPath/mesaj-icon.png';
String crpytAloneLogo = '$generalIconPath/crypt-alone-logo.png';
