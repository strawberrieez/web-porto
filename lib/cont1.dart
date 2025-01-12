import 'package:flutter/material.dart';

class Cont1 extends StatelessWidget {
  const Cont1({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 1200;

    return Container(
      color: const Color(0xFF0A192F),
      height: MediaQuery.of(context).size.height * 0.95,
      width: screenWidth,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isSmallScreen ? 16.0 : 40.0,
          ),
          child: Flex(
            direction: isSmallScreen ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: _buildImageContainer(isSmallScreen, isMediumScreen),
              ),
              if (!isSmallScreen) const SizedBox(width: 40),
              Flexible(
                flex: 2,
                child: _buildTextColumn(isSmallScreen, isMediumScreen),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextColumn(bool isSmallScreen, bool isMediumScreen) {
    final textSize = isSmallScreen
        ? 16.0
        : isMediumScreen
            ? 18.0
            : 20.0;
    final nameSize = isSmallScreen
        ? 30.0
        : isMediumScreen
            ? 40.0
            : 50.0;
    final professionSize = isSmallScreen
        ? 18.0
        : isMediumScreen
            ? 22.0
            : 25.0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: 5,
          color: const Color(0xFF64FFDA),
        ),
        const SizedBox(height: 20),
        Text(
          "Hello, I'm",
          style: TextStyle(
            color: const Color(0xFF64FFDA),
            fontSize: textSize,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Sekar Ayu Fatmasari.",
          style: TextStyle(
            color: Colors.white,
            fontSize: nameSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Front End Engineer.",
          style: TextStyle(
            color: Colors.white,
            fontSize: professionSize,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "I'm a passionate Mobile Front-End Engineer, dedicated to creating seamless and engaging user experiences. \n"
          "Explore my work and let's bring your ideas to life through intuitive mobile applications.",
          style: TextStyle(
            color: const Color(0xFF8892B0),
            fontSize: textSize,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildImageContainer(bool isSmallScreen, bool isMediumScreen) {
    final imageSize = isSmallScreen
        ? 150.0
        : isMediumScreen
            ? 200.0
            : 250.0;

    return Container(
      height: imageSize,
      width: imageSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFF64FFDA),
          width: 4,
        ),
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/images/kucing.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
