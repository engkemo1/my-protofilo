import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_svg/svg.dart';
import 'package:my_protofile/responsive.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../components/animated_progress_indicator.dart';
import '../../constants.dart';
import '../../modals/download pdf.dart';
import '../../modals/prov.dart';
import '../Pdf.dart';

class SideMenu extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final thmode = Provider.of<ThemeModeProv>(context);
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            MyInfo(context,thmode),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    AreaInfoText(
                      title: "Residence",
                      text: "Egypt",
                    ),
                    AreaInfoText(
                      title: "City",
                      text: "Banha",
                    ),
                    AreaInfoText(
                      title: "Age",
                      text: "22",
                    ),
                    Skills(context),
                    SizedBox(height: defaultPadding),
                    Coding(context),
                    Knowledges(context),
                    Divider(),
                    SizedBox(height: defaultPadding / 2),
                    TextButton(
                      onPressed: () async{
                        Responsive.isMobile(context)?
                        showDialog(
                            context: context,
                            builder: (context) => const DownloadingDialog()):_launchUrl('https://drive.google.com/file/d/1sji0yyXBqZSDx4bf-KE4gBO5TqJEF_d5/view?usp=sharing');
                      },
                      child: FittedBox(
                        child: Row(
                          children: [
                            Text(
                              "DOWNLOAD CV",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
                            ),
                            SizedBox(width: defaultPadding / 2),
                            SvgPicture.asset("assets/icons/download.svg")
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: defaultPadding),
                      color: darkColor,
                      child: Row(
                        children: [
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              _launchUrl(
                                 'https://www.linkedin.com/in/kamal-magdy-22593b213');
                            },
                            icon: SvgPicture.asset("assets/icons/link.svg"),
                          ),
                          IconButton(
                            onPressed: () {
                              _launchUrl(
                                  "https://github.com/engkemo1");
                            },
                            icon: SvgPicture.asset("assets/icons/git.svg"),
                          ),
                          IconButton(
                            onPressed: () {
                              _launchUrl(
                                  "https://www.youtube.com/channel/UCjAIJ7rt_WPNr8ZqfcUDyAQ");
                            },
                            icon: SvgPicture.asset("assets/icons/yt.svg"),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchUrl(String urls) async {
    final url = urls;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

 Widget MyInfo(BuildContext context,ThemeModeProv thmode) {
    return AspectRatio(
      aspectRatio: 1.25,
      child: Container(
        color: darkColor,
        child: Column(
          children: [
            Spacer(flex: 2),
          /*  Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Switch(
                  value: thmode.lightMode,
                  onChanged: (bool val) {
                    thmode.changeMode();
                  },
                ),
              ],
            ),*/
            CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage("assets/images/person.jpg"),
            ),
            Spacer(),
            Text(
              "kamal Magdy",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Spacer(),

        Text(
              "FLUTTER DEVELOPER",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w200,
                height: 1.5,
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

 Widget AreaInfoText({String? title, String? text}) {
   return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: TextStyle(color: Colors.white),
          ),
          Text(text!),
        ],
      ),
    );
  }

 Widget Skills(BuildContext context) {
   return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            "Skills",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: AnimatedCircularProgressIndicator(
                percentage: 0.9,
                label: "Flutter",
              ),
            ),
            SizedBox(width: defaultPadding),


          ],
        ),
      ],
    );
  }

 Widget Coding(BuildContext context) {
   return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            "Coding",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.95,
          label: "Dart",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.80,
          label: "JAVA",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.70,
          label: "PHP",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.80,
          label: "C#",
        ),

      ],
    );
  }

 Widget Knowledges(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: defaultPadding),
          child: Text(
            "Knowledges",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        KnowledgeText(text: "Flutter, Dart"),
        KnowledgeText(text: "Firebase, RESTful APis"),
        KnowledgeText(text: "GIT Knowledge"),
      ],
    );
  }

 Widget KnowledgeText({String? text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Row(
        children: [
          SvgPicture.asset("assets/icons/check.svg"),
          SizedBox(width: defaultPadding / 2),
          Text(text!),
        ],
      ),
    );
  }
}
Future<File?> pickFile() async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf'],
  );
  if (result == null) return null;
  return File(result.paths.first ?? '');
}



Future<File> loadPdfFromNetwork(String url) async {
  final response = await http.get(Uri.parse(url));
  final bytes = response.bodyBytes;
  return _storeFile(url, bytes);
}

Future<File> _storeFile(String url, List<int> bytes) async {
  final filename = basename(url);
  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/$filename');
  await file.writeAsBytes(bytes, flush: true);
  if (kDebugMode) {
    print('$file');
  }
  return file;
}

//final file = File('example.pdf');
//await file.writeAsBytes(await pdf.save());

void openPdf(BuildContext context, File file, String url) =>
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PdfViewerPage(
          file: file,
          url: url,
        ),
      ),
    );
