import 'package:url_launcher/url_launcher.dart';

launchEMAIL() async {
  final Uri _emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'nad@gov.sg',
    queryParameters: {
      'subject': 'Testing URL_LAUNCHER | DEMO',
      'body': 'MESSAGE'
    },
  );
  _launch(_emailLaunchUri.toString());
}

launchCALL() async {
  const phonenumber = "tel:6680 3846";
  _launch(phonenumber);
}

_launch(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
