import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Cont3 extends StatelessWidget {
  const Cont3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(200, 50, 200, 100),
      child: Container(
        color: const Color(0xFF0A192F),
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: [
              const Text(
                "Projects",
                style: TextStyle(
                  color: Color(0xFF64FFDA),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Here are some of the projects I've worked on:",
                style: TextStyle(
                  color: Color(0xFF8892B0),
                  fontSize: 18,
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
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Gambar dengan pinggiran
        Container(
          height: 200,
          width: 400,
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
                style: const TextStyle(
                  color: Color(0xFF64FFDA),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: const TextStyle(
                  color: Color(0xFF8892B0),
                  fontSize: 16,
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
