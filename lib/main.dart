import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: IntrinsicWidth(
            child: CustomPaint(
              painter: CustomStyleArrow(),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 20,
                  top: 20,
                ),
                child: const TextField(
                  minLines: 1,
                  maxLines: 20,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: "Text",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomStyleArrow extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;
    const double triangleH = 10;
    const double triangleW = 25.0;
    final double width = size.width;
    final double height = size.height;

    final Paint paint1 = Paint()
      ..color = Colors.red
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;
    const double triangleH1 = 7;
    const double triangleW1 = 20.0;
    final double width1 = size.width;
    final double height1 = size.height;

    final Path trianglePath = Path()
      ..moveTo(width / 2 - triangleW / 2, height)
      ..lineTo(width / 2, triangleH + height)
      ..lineTo(width / 2 + triangleW / 2, height)
      ..lineTo(width / 2 - triangleW / 2, height);

    final Path trianglePath1 = Path()
      ..moveTo(width1 / 2 - triangleW1 / 2, height1)
      ..lineTo(width1 / 2, triangleH1 + height1)
      ..lineTo(width1 / 2 + triangleW1 / 2, height1)
      ..lineTo(width1 / 2 - triangleW1 / 2, height1);

    //
    canvas.drawPath(trianglePath, paint);
    final BorderRadius borderRadius = BorderRadius.circular(15);
    final Rect rect = Rect.fromLTRB(0, 0, width, height);
    final RRect outer = borderRadius.toRRect(rect);
    canvas.drawRRect(outer, paint);

    canvas.drawPath(trianglePath1, paint1);
    final BorderRadius borderRadius1 = BorderRadius.circular(15);
    final Rect rect1 = Rect.fromLTRB(4, 4, width1 - 4, height1);
    final RRect outer1 = borderRadius1.toRRect(rect1);
    canvas.drawRRect(outer1, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
