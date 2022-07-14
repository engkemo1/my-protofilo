import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_protofile/constants.dart';
import '../../responsive.dart';
import '../../widgets/bordered_flat_button.dart';
import '../about/about_screen.dart';
import 'content_about_me.dart';
import 'custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 70),
        child: CustomAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Responsive.isMobile(context)
            ? Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                            MediaQuery.of(context).size.width * 0.2),
                        topRight: Radius.circular(
                            MediaQuery.of(context).size.width * 0.2)),
                    child: Image.asset(
                      'assets/images/person.jpg',
                      fit: BoxFit.contain,
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ContentAboutMe(),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContentAboutMe(),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(
                                MediaQuery.of(context).size.width * 0.2),
                            topRight: Radius.circular(
                                MediaQuery.of(context).size.width * 0.2)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 30
                              ,color:Colors.white
                            ,offset: Offset(5,20)
                        )
                      ]
                    ),

                    child:                   ClipRRect(

                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                            MediaQuery.of(context).size.width * 0.2),
                        topRight: Radius.circular(
                            MediaQuery.of(context).size.width * 0.2)),
                    child: Image.asset(
                      'assets/images/person.jpg',

                      fit: BoxFit.contain,
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                  )
                    ,)
                ],
              ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Image.asset(
              'assets/images/logo.png',
              width: 100,
            ),
            SizedBox(
              height: 50,
            ),
            _appBarButton(
              'About',
              () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => AboutScreen(),
                ),
              ),
            ),
            _appBarButton('Portfolio', () {}),
            _appBarButton('Contact', () {}),
            BorderedFlatButton(
                title: 'Get Started', onTap: () {}, width: 150, height: 40),
          ],
        ),
      ),
    );
  }
}

Widget _appBarButton(String title, VoidCallback onTap) {
  return FlatButton(
    child: Text(
      title,
      style: TextStyle(
        color: Colors.black,
      ),
    ),
    onPressed: onTap,
  );
}
