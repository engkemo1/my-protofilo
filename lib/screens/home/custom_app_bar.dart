import 'package:flutter/material.dart';

import '../../responsive.dart';
import '../../widgets/bordered_flat_button.dart';
import '../about/about_screen.dart';

class CustomAppBar extends StatelessWidget {
  Widget _appBarButton(String title, VoidCallback onTap) {
    return FlatButton(
      child: Text(
        title,

      ),
      onPressed: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Responsive.isDesktop(context)?50:10),
          child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/logo.png',
              width: Responsive.isDesktop(context)?150:90,),

              Responsive.isDesktop(context)?
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
              ):IconButton(onPressed: (){
                Scaffold.of(context).openDrawer();
              }, icon: Icon(Icons.menu_outlined))
            ],
          ),
      ),
    );
  }
}
