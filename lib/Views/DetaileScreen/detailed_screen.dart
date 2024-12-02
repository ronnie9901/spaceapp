import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_knowledge/Model/model_class.dart';

class DetailScreen extends StatefulWidget {
  final Planet planet;

  const DetailScreen({Key? key, required this.planet}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple.shade900, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          // Planet Image Background
          Positioned.fill(
            child: Image.asset(
              'assets/images/263056074d37b08981f43d6db28f79c1.gif',
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.5),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          // Main Content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  // Rotating Planet Image
                  Center(
                    child: RotationTransition(
                      turns: _controller,
                      child: Hero(
                        tag: 'planet-image-${widget.planet.name}',
                        child: ClipOval(
                          child: Image.asset(
                            widget.planet.image,
                            width: 220,
                            height: 220,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Planet Name and Subtitle
                  Center(
                    child: Column(
                      children: [
                        Text(
                          widget.planet.name,
                          style: GoogleFonts.roboto(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          widget.planet.subtitle,
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  // About Section
                  Card(
                    color: Colors.black.withOpacity(0.6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About ${widget.planet.name}',
                            style: GoogleFonts.roboto(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            widget.planet.description,
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: Colors.grey.shade300,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Facts Section
                  Card(
                    color: Colors.black.withOpacity(0.6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Quick Facts',
                            style: GoogleFonts.roboto(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          _buildFactRow('Distance from Sun:', '${widget.planet.distance} million km'),
                          _buildFactRow('Velocity:', widget.planet.position),
                          _buildFactRow('Length of Day:', widget.planet.length_of_day),
                          _buildFactRow('Orbital Period:', widget.planet.orbital_period),
                          _buildFactRow('Gravity:', widget.planet.gravity),
                          _buildFactRow('Surface Area:', widget.planet.surface_area),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Take a Trip Button

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFactRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            label,
            style: GoogleFonts.roboto(
              fontSize: 16,
              color: Colors.grey.shade300,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.roboto(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
