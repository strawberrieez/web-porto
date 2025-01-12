import 'package:flutter/material.dart';

class Cont2 extends StatelessWidget {
  const Cont2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.93,
      width: MediaQuery.of(context).size.width,
      color: const Color(0xFF112240),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 350.0), // Padding for better spacing
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
            children: [
              const Text(
                "About Me",
                style: TextStyle(
                  color: Color(0xFF64FFDA),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30), // More space between title and text
              const Text(
                "I am a student of Informatics at the Faculty of Engineering, Universitas Siliwangi, with a deep interest in mobile development. I’ve always been fascinated by the way mobile applications shape our daily lives, and this passion has led me to pursue a career in creating intuitive and innovative mobile solutions.",
                style: TextStyle(
                  color: Color(0xFF8892B0),
                  fontSize: 18,
                  height: 1.6, // Increase line height for better readability
                ),
                textAlign: TextAlign.center, // Center text
              ),
              const SizedBox(height: 30), // Space between paragraphs
              const Text(
                "As a mobile front-end developer, I focus on crafting user-friendly and responsive interfaces. I strive to combine functionality with design to deliver applications that are both visually appealing and easy to navigate. I’m always eager to learn new technologies and techniques to improve my skills and keep up with the fast-evolving mobile development landscape.",
                style: TextStyle(
                  color: Color(0xFF8892B0),
                  fontSize: 18,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30), // Space between paragraphs
              const Text(
                "My goal is to build applications that make a real difference in users' lives. Through collaboration and continuous improvement, I aim to contribute to projects that push the boundaries of mobile technology and enhance user experiences.",
                style: TextStyle(
                  color: Color(0xFF8892B0),
                  fontSize: 18,
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
