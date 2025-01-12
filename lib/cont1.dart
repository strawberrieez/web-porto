import 'package:flutter/material.dart';

class Cont1 extends StatelessWidget {
  const Cont1({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    final screenWidth = MediaQuery.of(context).size.width;

    // Menentukan apakah layar kecil, medium, atau besar
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
              // Kolom Kanan: Gambar
              Flexible(
                flex: 1,
                child: _buildImageContainer(isSmallScreen, isMediumScreen),
              ),
              if (!isSmallScreen) const SizedBox(width: 40), // Spasi antar elemen
              // Kolom Kiri: Teks
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

  // Fungsi untuk membangun kolom teks
  Widget _buildTextColumn(bool isSmallScreen, bool isMediumScreen) {
    final textSize = isSmallScreen
        ? 16.0
        : isMediumScreen
            ? 18.0
            : 20.0; // Ukuran teks dinamis
    final nameSize = isSmallScreen
        ? 30.0
        : isMediumScreen
            ? 40.0
            : 50.0; // Ukuran nama dinamis
    final professionSize = isSmallScreen
        ? 18.0
        : isMediumScreen
            ? 22.0
            : 25.0; // Ukuran profesi dinamis

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Garis Horizontal
        Container(
          width: 100,
          height: 5,
          color: const Color(0xFF64FFDA),
        ),
        const SizedBox(height: 20),
        // Teks "Hello, I'm"
        Text(
          "Hello, I'm",
          style: TextStyle(
            color: const Color(0xFF64FFDA),
            fontSize: textSize,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        // Nama
        Text(
          "Sekar Ayu Fatmasari.",
          style: TextStyle(
            color: Colors.white,
            fontSize: nameSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        // Profesi
        Text(
          "Front End Engineer.",
          style: TextStyle(
            color: Colors.white,
            fontSize: professionSize,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 20),
        // Deskripsi
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

  // Fungsi untuk membangun kontainer gambar
  Widget _buildImageContainer(bool isSmallScreen, bool isMediumScreen) {
    final imageSize = isSmallScreen
        ? 150.0
        : isMediumScreen
            ? 200.0
            : 250.0; // Ukuran gambar dinamis

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
          'assets/images/kucing.jpg', // Ganti dengan path foto Anda
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
