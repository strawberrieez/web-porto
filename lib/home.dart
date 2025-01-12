import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:porto/cont1.dart';
import 'package:porto/cont2.dart';
import 'package:porto/cont3.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  int _activeSection = 0; // Menyimpan bagian aktif (0: Home, 1: About, 2: Project)

  // Fungsi untuk melakukan scroll ke posisi tertentu
  void _scrollTo(double position, int section) {
    setState(() {
      _activeSection = section; // Mengatur bagian aktif
    });
    _scrollController.animateTo(
      position,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  // Fungsi untuk mendeteksi posisi scroll dan mengatur bagian aktif
  void _onScroll() {
    final double offset = _scrollController.offset;
    final double height = MediaQuery.of(context).size.height;

    setState(() {
      if (offset < height * 0.8) {
        _activeSection = 0; // Home
      } else if (offset < height * 1.8) {
        _activeSection = 1; // About
      } else {
        _activeSection = 2; // Project
      }
    });
  }

  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A192F),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF0A192F),
        actions: [
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                // Mobile view - Hamburger Menu or other compact layout
                return IconButton(
                  icon: const Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () {},
                );
              } else {
                // Desktop or tablet view - Horizontal navigation
                return Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Tombol Home
                      TextButton(
                        onPressed: () => _scrollTo(0, 0),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text("Home", style: TextStyle(fontSize: 15)),
                            if (_activeSection == 0)
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                height: 2,
                                width: 30,
                                color: const Color(0xFF64FFDA),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),

                      // Tombol About
                      TextButton(
                        onPressed: () => _scrollTo(MediaQuery.of(context).size.height * 0.95, 1),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text("About", style: TextStyle(fontSize: 15)),
                            if (_activeSection == 1)
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                height: 2,
                                width: 30,
                                color: const Color(0xFF64FFDA),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),

                      // Tombol Project
                      TextButton(
                        onPressed: () => _scrollTo(MediaQuery.of(context).size.height * 1.9, 2),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text("Project", style: TextStyle(fontSize: 15)),
                            if (_activeSection == 2)
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                height: 2,
                                width: 30,
                                color: const Color(0xFF64FFDA),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Container pertama (Home)
                Cont1(),
                // Container kedua (About)
                Cont2(),
                // Container ketiga (Project)
                Cont3(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter, // Menyelaraskan di bawah tengah layar
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // If screen width is large, retain original desktop layout
                  if (constraints.maxWidth >= 600) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Garis horizontal
                        Expanded(
                          child: Container(
                            height: 1,
                            color: const Color(0xFF8892B0),
                          ),
                        ),
                        const SizedBox(width: 10), // Space between line and icons

                        // Social media icons (desktop view - horizontal layout)
                        Row(
                          children: [
                            IconButton(
                              icon: const FaIcon(FontAwesomeIcons.github),
                              color: Colors.white,
                              onPressed: () {
                                _launchUrl('https://github.com/strawberrieez');
                              },
                            ),
                            IconButton(
                              icon: const FaIcon(FontAwesomeIcons.whatsapp),
                              color: Colors.white,
                              onPressed: () {
                                _launchUrl('https://wa.me/6285959705944');
                              },
                            ),
                            IconButton(
                              icon: const FaIcon(FontAwesomeIcons.envelope),
                              color: Colors.white,
                              onPressed: () {
                                _launchUrl('mailto:237006054@student.unsil.ac.id');
                              },
                            ),
                            IconButton(
                              icon: const FaIcon(FontAwesomeIcons.instagram),
                              color: Colors.white,
                              onPressed: () {
                                _launchUrl('https://instagram.com/xyjnee_');
                              },
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    // Mobile and tablet view - Wrap the social media icons and reduce the line width
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Garis horizontal (responsively adjusted width)
                        Container(
                          width: constraints.maxWidth * 0.8, // Responsively adjust line width
                          height: 1,
                          color: const Color(0xFF8892B0),
                        ),
                        const SizedBox(height: 10), // Space between line and icons

                        // Social media icons (wrap for small screens)
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 20, // Adjust the spacing between icons
                          children: [
                            IconButton(
                              icon: const FaIcon(FontAwesomeIcons.github),
                              color: Colors.white,
                              onPressed: () {
                                _launchUrl('https://github.com/strawberrieez');
                              },
                            ),
                            IconButton(
                              icon: const FaIcon(FontAwesomeIcons.whatsapp),
                              color: Colors.white,
                              onPressed: () {
                                _launchUrl('https://wa.me/6285959705944');
                              },
                            ),
                            IconButton(
                              icon: const FaIcon(FontAwesomeIcons.envelope),
                              color: Colors.white,
                              onPressed: () {
                                _launchUrl('mailto:237006054@student.unsil.ac.id');
                              },
                            ),
                            IconButton(
                              icon: const FaIcon(FontAwesomeIcons.instagram),
                              color: Colors.white,
                              onPressed: () {
                                _launchUrl('https://instagram.com/xyjnee_');
                              },
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
