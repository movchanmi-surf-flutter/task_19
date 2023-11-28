import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          primary: Colors.black,
          background: Colors.white12,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flip the card!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = FlipCardController();

  get width => MediaQuery.of(context).size.width;

  get height => MediaQuery.of(context).size.height;

  get theme => Theme.of(context).textTheme;

  static final BorderRadius _radius = BorderRadius.circular(24);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: FlipCard(
              onTapFlipping: true,
              animationDuration: const Duration(milliseconds: 300),
              frontWidget: Container(
                decoration: BoxDecoration(
                  borderRadius: _radius,
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/images/side.png',
                    ),
                  ),
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                  vertical: height * 0.1,
                ),
              ),
              backWidget: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                  vertical: height * 0.1,
                ),
                decoration: BoxDecoration(
                  borderRadius: _radius,
                  color: Colors.white,
                ),
                child: Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: _radius,
                      border: Border.all(color: Colors.red, width: 3)),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          clipBehavior: Clip.hardEdge,
                          borderRadius: _radius,
                          child: Image.asset(
                            'assets/images/me.jpeg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: RichText(
                              text: const TextSpan(
                                  text: "Maksim Movchan,23",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black))),
                        ),
                        RichText(
                            text: const TextSpan(
                                text: "About me",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black))),
                        const SizedBox(height: 10),
                        RichText(
                            text: const TextSpan(
                                text:
                                    "Have experience in app-development.\nHobbies: fencing, PlayStation. Prefer travelling much more than sitting at home. I think, that i would be more efficient after Surf course.May be I would be a good developer in Surf😋",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                      ],
                    ),
                  ),
                ),
              ),
              axis: FlipAxis.horizontal,
              controller: controller,
              rotateSide: RotateSide.bottom,
            )),
          ],
        ),
      ),
    );
  }
}
