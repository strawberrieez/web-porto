import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:porto/cont1.dart';
import 'package:porto/cont2.dart';
import 'package:porto/cont3.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  int _activeSection = 0;

  void _scrollTo(double position, int section) {
    setState(() {
      _activeSection = section;
    });
    _scrollController.animateTo(
      position,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void _onScroll() {
    final double offset = _scrollController.offset;
    final double height = MediaQuery.of(context).size.height;

    setState(() {
      if (offset < height * 0.8) {
        _activeSection = 0;
      } else if (offset < height * 1.8) {
        _activeSection = 1;
      } else {
        _activeSection = 2;
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
                return IconButton(
                  icon: const Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () {},
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                Cont1(),
                Cont2(),
                Cont3(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth >= 600) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: const Color(0xFF8892B0),
                          ),
                        ),
                        const SizedBox(width: 10),

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
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: constraints.maxWidth * 0.8, 
                          height: 1,
                          color: const Color(0xFF8892B0),
                        ),
                        const SizedBox(height: 10),

                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 20,
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
