import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Helper {
  static textCapitalization({required String? text}) {
    if (text == null) return 'NA';
    var a = text
        .split(' ')
        .map((e) =>
            e[0].toUpperCase() +
            e
                .substring(
                  1,
                )
                .toLowerCase())
        .toList()
        .join(' ');
    return a;
  }

  static String formatDate({
    required DateTime? date,
    String pattern = 'yyyy-MM-dd',
  }) {
    if (date == null) return 'NA';
    return DateFormat(pattern).format(date);
  }

  static void launchURL(String url) async {
    await launchUrl(Uri.parse(url));
    if (await canLaunchUrl(Uri.parse(url))) {
      print('Launching $url');
      await launchUrl(Uri.parse(url));
    } else {
      print('Could not launch $url');
    }
  }

  static void launchCall({required String phone}) {
    var url = 'tel:${phone.replaceAll(' ', '').replaceAll('-', '')}';
    launchURL(url);
  }

  static smsLauncher({String phone = '', required String body}) async {
    var url = 'sms:${phone.replaceAll(' ', '').replaceAll('-', '')}?body=$body';
    launchURL(url);
  }

  static double toDouble(String? value) {
    if (value == 'null') return 0.0;

    return double.parse(value!);
  }

  static formatAmount(double? amount) {
    if (amount == null) return 'NA';

    NumberFormat noFormatter = NumberFormat.currency(
      name: 'INR',
      symbol: '₹ ',
      locale: 'en_IN',
      decimalDigits: 0,
    );

    return noFormatter.format(amount);
  }
}
