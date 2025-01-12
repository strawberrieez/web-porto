import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Cont3 extends StatelessWidget {
  const Cont3({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 1200;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        isSmallScreen
            ? 16.0
            : isMediumScreen
                ? 40.0
                : 200.0,
        50,
        isSmallScreen
            ? 16.0
            : isMediumScreen
                ? 40.0
                : 200.0,
        100,
      ),
      child: Container(
        color: const Color(0xFF0A192F),
        width: screenWidth,
        child: Center(
          child: Column(
            children: [
              Text(
                "Projects",
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
              const SizedBox(height: 10),
              Text(
                "Here are some of the projects I've worked on:",
                style: TextStyle(
                  color: const Color(0xFF8892B0),
                  fontSize: isSmallScreen
                      ? 14.0
                      : isMediumScreen
                          ? 16.0
                          : 18.0,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 50),
              // Proyek 1: Mantani
              _buildProject(
                context,
                "assets/images/mantani2.png",
                "Mantani Mobile App",
                "Mantani is an application designed to help farmers monitor their crops effectively. It provides real-time data and insights to optimize irrigation and ensure better yields.",
                "https://github.com/strawberrieez/Mantani.git",
                ["Dart", "Flutter", "Firebase"],
                isSmallScreen,
                isMediumScreen,
              ),
              const SizedBox(height: 50),
              // Proyek 2: Kost Hany
              _buildProject(
                context,
                "assets/images/kosthany2.png",
                "Kost Hany Pista Mobile App",
                "Kost Hany Pista is an application aimed at helping students find affordable and convenient housing near their campus. It offers a user-friendly interface to search, compare, and book rental properties.",
                null,
                ["Dart", "Flutter", "Firebase"],
                isSmallScreen,
                isMediumScreen,
              ),
              const SizedBox(height: 50),
              // Proyek 3: FunMath
              _buildProject(
                context,
                "assets/images/funmath2.png",
                "FunMath Mobile App",
                "FunMath is a gamified learning platform designed to make math more engaging for students. It offers interactive exercises, quizzes, and challenges to improve mathematical skills.",
                null,
                ["Dart", "Flutter"],
                isSmallScreen,
                isMediumScreen,
              ),
              const SizedBox(height: 50),
              // Proyek 4: MenuInsight
              _buildProject(
                context,
                "assets/images/menin.png",
                "MenuInsight Web App",
                "MenuInsight is a web-based platform designed to help restaurant owners analyze menu performance. It provides data-driven insights to optimize pricing and menu design.",
                "https://github.com/strawberrieez/aljabar-project.git",
                ["Dart", "Flutter", "Firebase"],
                isSmallScreen,
                isMediumScreen,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProject(
    BuildContext context,
    String imagePath,
    String title,
    String description,
    String? repositoryLink,
    List<String> components,
    bool isSmallScreen,
    bool isMediumScreen,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Gambar dengan pinggiran
        Container(
          height: isSmallScreen ? 150 : 200,
          width: isSmallScreen ? 250 : 400,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 5,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 50),
        // Penjelasan, link, dan kotak komponen
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: const Color(0xFF64FFDA),
                  fontSize: isSmallScreen
                      ? 18.0
                      : isMediumScreen
                          ? 22.0
                          : 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(
                  color: const Color(0xFF8892B0),
                  fontSize: isSmallScreen
                      ? 12.0
                      : isMediumScreen
                          ? 14.0
                          : 16.0,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 10),
              if (repositoryLink != null)
                GestureDetector(
                  onTap: () async {
                    final url = Uri.parse(repositoryLink);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    } else {
                      throw 'Could not launch $repositoryLink';
                    }
                  },
                  child: const Text(
                    "GitHub Repository",
                    style: TextStyle(
                      color: Color(0xFF64FFDA),
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              else
                const Text(
                  "No Repository",
                  style: TextStyle(
                    color: Color(0xFF64FFDA),
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              const SizedBox(height: 20),
              // Kotak-kotak komponen
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: components.map((component) => _buildComponentBox(component)).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildComponentBox(String componentName) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF112240),
        border: Border.all(color: const Color(0xFF64FFDA)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        componentName,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
}
