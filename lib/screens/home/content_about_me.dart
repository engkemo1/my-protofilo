import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_protofile/responsive.dart';
import 'package:my_protofile/screens/main/main_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/bordered_flat_button.dart';
import '../home_screen2.dart';

class ContentAboutMe extends StatelessWidget {
  Widget _iconContact(IconData iconData, VoidCallback onTap) {
    return IconButton(
      icon: Icon(
        iconData,
        color: Colors.black,
      ),
      onPressed: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Hello, I am',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          'Kamal Magdy',
          style: TextStyle(
            fontSize:Responsive.isDesktop(context)? MediaQuery.of(context).size.width*0.06:40,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
        SizedBox(height: 4,),

        Row(
          children: [

            Text(
              'Flutter Developer',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: Responsive.isDesktop(context)?MediaQuery.of(context).size.width*0.03:15,
              ),
            ),
            Text(
              '  for mobile & web ',
              style: TextStyle(
                fontSize:Responsive.isDesktop(context)? MediaQuery.of(context).size.width*0.02:12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Text(
          'Find Me on',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children: [
            _iconContact(FontAwesomeIcons.facebookF, () {
_launchUrl('https://www.facebook.com/kamal.magdy.790/');

            }),
            _iconContact(FontAwesomeIcons.twitter, () {
              _launchUrl('https://twitter.com/EngKemo16');
            }),
            _iconContact(FontAwesomeIcons.instagram, () {
              _launchUrl('https://www.instagram.com/eng.kamal_magdy/');

            }),

          ],
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            SizedBox(
              height: 40,
              width:Responsive.isDesktop(context)? MediaQuery.of(context).size.width*0.2:100  ,
              child: FlatButton(
                child: Text(
                  'Hire Me',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
                color: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            const SizedBox(width: 16),
            BorderedFlatButton(
              title: 'Portfolio',
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (_)=>Home()));
              },
              width:Responsive.isDesktop(context)? MediaQuery.of(context).size.width*0.2:100,
              height: 40,
            ),
          ],
        ),
      ],
    );
  }
}
void _launchUrl(String urls) async {
  final url = urls;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}