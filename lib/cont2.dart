import 'package:flutter/material.dart';

class Cont2 extends StatelessWidget {
  const Cont2({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 1200;

    return Container(
      height: screenHeight * 0.93,
      width: screenWidth,
      color: const Color(0xFF112240),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isSmallScreen
                ? 16.0
                : isMediumScreen
                    ? 40.0
                    : 100.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "About Me",
                style: TextStyle(
                  color: const Color(0xFF64FFDA),
                  fontSize: isSmallScreen
                      ? 24.0
                      : isMediumScreen
                          ? 30.0
                          : 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "I am a student of Informatics at the Faculty of Engineering, Universitas Siliwangi, with a deep interest in mobile development. I’ve always been fascinated by the way mobile applications shape our daily lives, and this passion has led me to pursue a career in creating intuitive and innovative mobile solutions.",
                style: TextStyle(
                  color: const Color(0xFF8892B0),
                  fontSize: isSmallScreen
                      ? 14.0
                      : isMediumScreen
                          ? 16.0
                          : 18.0,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Text(
                "As a mobile front-end developer, I focus on crafting user-friendly and responsive interfaces. I strive to combine functionality with design to deliver applications that are both visually appealing and easy to navigate. I’m always eager to learn new technologies and techniques to improve my skills and keep up with the fast-evolving mobile development landscape.",
                style: TextStyle(
                  color: const Color(0xFF8892B0),
                  fontSize: isSmallScreen
                      ? 14.0
                      : isMediumScreen
                          ? 16.0
                          : 18.0,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Text(
                "My goal is to build applications that make a real difference in users' lives. Through collaboration and continuous improvement, I aim to contribute to projects that push the boundaries of mobile technology and enhance user experiences.",
                style: TextStyle(
                  color: const Color(0xFF8892B0),
                  fontSize: isSmallScreen
                      ? 14.0
                      : isMediumScreen
                          ? 16.0
                          : 18.0,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
