class Recommendation {
  final String? name, source, text;

  Recommendation({this.name, this.source, this.text});
}

final List<Recommendation> demo_recommendations = [
  Recommendation(
    name: "Flutter Developer",
    source: "R Star for programming",
    text:
        "• Development of Mobile applications using Flutter Framework(Dart).\n"
'• Translate designs to front-end code, estimate time and determine requirements and specifications.\n'
'• Collaborate with teams on the execution of ideas and projects.\n'
'• Excellent debugging, problem solving, optimization and testing skills.\n'
'• Worked with 3rd party plugins: provider, getX, bLoc, dio, Google Maps  ,Firebase(FCM).\n',
  ),
  Recommendation(
    name: "Flutter Developer",
    source: "Internship  Orange Digital Center",
    text:
    "• Development of Mobile applications using Flutter Framework, Dart,  etc.\n"
        '• Excellent debugging, problem solving, optimization and testing skills.\n'
         ),

];
