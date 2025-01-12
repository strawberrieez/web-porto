import 'package:flutter/material.dart';

class Cont1 extends StatelessWidget {
  const Cont1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0A192F),
      height: MediaQuery.of(context).size.height * 0.95,
      width: MediaQuery.of(context).size.width,
      child: Center(
        // Menyusun seluruh konten di tengah
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Menyusun secara horizontal di tengah
            crossAxisAlignment: CrossAxisAlignment.center, // Menyusun secara vertikal di tengah
            children: [
              // Kolom Kiri: Teks
              Column(
                mainAxisAlignment: MainAxisAlignment.center, // Menyusun secara vertikal di tengah
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
                  const Text(
                    "Hello, I'm",
                    style: TextStyle(
                      color: Color(0xFF64FFDA),
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Nama
                  const Text(
                    "Sekar Ayu Fatmasari.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Profesi
                  const Text(
                    "Front End Engineer.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Deskripsi
                  const Text(
                    "I'm a passionate Mobile Front-End Engineer, dedicated to creating seamless and engaging user experiences. \n"
                    "Explore my work and let's bring your ideas to life through intuitive mobile applications.",
                    style: TextStyle(
                      color: Color(0xFF8892B0),
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 40), // Spasi antara teks dan gambar
              // Kolom Kanan: Foto
              Container(
                height: 250, // Pastikan height dan width sama
                width: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Bentuk lingkaran
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
