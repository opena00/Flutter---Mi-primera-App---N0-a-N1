import 'package:flutter/material.dart';

void main() => runApp(SlidingImagesApp());

class SlidingImagesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SlidingImagesScreen(),
    );
  }
}

// ...
class SlidingImagesScreen extends StatefulWidget {
  @override
  _SlidingImagesScreenState createState() => _SlidingImagesScreenState();
}

class _SlidingImagesScreenState extends State<SlidingImagesScreen> {
  List<String> images = ["assets/images/Doge.jpeg", "assets/images/e.jpg", "assets/images/gatotapa.jpg", "assets/images/N.jpeg", "assets/images/n2.jpg",];

  int currentIndex = 0;

  void goToPreviousImage() {
    setState(() {
      currentIndex = (currentIndex - 1) % images.length;
    });
  }

  void goToNextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Que imagen te gusta mas?"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.velocity.pixelsPerSecond.dx > 0) {
                  goToPreviousImage();
                } else if (details.velocity.pixelsPerSecond.dx < 0) {
                  goToNextImage();
                }
              },
              child: Container(
                width: 500,
                height: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(images[currentIndex]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Desliza para ver la siguiente imagen"),
          ],
        ),
      ),
    );
  }
}
// ...
