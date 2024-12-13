import 'package:flutter/material.dart';

class BackArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(size.width, 0); // Arrow tip (right)
    path.lineTo(0, size.height / 2); // Bottom-left corner
    path.lineTo(size.width, size.height); // Top-left corner

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class CustomBackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomBackButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: screenWidth*0.00286, // Set width of the back arrow
        height: screenHeight*0.00074, // Set height of the back arrow
        child: CustomPaint(
          painter: BackArrowPainter(),
        ),
      ),
    );
  }
}
