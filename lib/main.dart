import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mine.dart';
import 'account.dart';
import 'explore.dart';
import 'create.dart';

void main() {
  runApp(MyApp());
}

Color bgColor = Color.fromRGBO(48,90,123,0.6);
Color btnColor = Color.fromRGBO(48,90,123,1);


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'remind me [dot] wallpaper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/paper.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Stack(
          children:[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: bgColor,
            ),
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'remind me \n     [dot] \nwallpaper',
                  style: GoogleFonts.quicksand(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ),
            Positioned(
              bottom: 280,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: button('my creations', 'assets/images/camera.png'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyCreation()),
                      );
                    },
                  ),
                  InkWell(
                    child: button('new wallpaper', 'assets/images/add.png'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Create()),
                      );
                    },
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 120,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: button('explore wallpapers', 'assets/images/explore.png'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Explore()),
                      );
                    },
                  ),
                  // button('explore wallpapers', 'assets/images/explore.png')
                ],
              ),
            ),
          ]
        ),
      ),
      bottomNavigationBar: Container(
        height: 40,
        color: Colors.black,
        child: Center(
          child: RichText(
            text: TextSpan(
                text: 'Already a member? Sign in',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.blue
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Account()
                    )
                    );
                  }
            ),
          ),
        ),
      ),
    );
  }

  Widget button (String text, String icon) {
    return Center(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: btnColor,
            ),
            width: 100,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image(
                image: AssetImage(icon),
                width: 30,
                height: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: Text(
              text,
              style: GoogleFonts.workSans(
                fontSize: 20,
                color: Colors.white60
              ),
            ),
          )
        ],
      ),
    );
  }
}