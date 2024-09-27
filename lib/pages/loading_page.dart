import 'package:apps/pages/login.dart';
import 'package:apps/theme/colors.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // Animation from full screen (1) to small circle with padding (specific value)
    _animation = Tween<double>(begin: 1, end: 0.1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation
    _controller.forward();

    // Listener to navigate when the animation completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _navigateToLoginPage();
      }
    });
  }

  void _navigateToLoginPage() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LoginPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const logoSize = 100.0;
    const targetRadius = logoSize / 2 + 20;

    return Scaffold(
      // Start with a trust color background
      backgroundColor: CustomColor.trustColor,
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            double radius = _animation.value * (size.width * 1.5);

            if (radius <= targetRadius) {
              _controller.stop();
              Future.delayed(
                const Duration(milliseconds: 300),
                _navigateToLoginPage,
              );
            }

            return Stack(
              alignment: Alignment.center,
              children: [
                // Circular reveal effect, shrinking towards the logo
                ClipPath(
                  clipper: CircularRevealClipper(
                    radius: radius,
                    center: Offset(size.width / 2, size.height / 2),
                  ),
                  child: Container(
                    width: size.width,
                    height: size.height,
                    // White circle encloses the logo
                    color: Colors.white,
                  ),
                ),
                // Logo displayed at the center of the screen
                child!,
              ],
            );
          },
          child: Image.asset(
            'assets/images/mbrwhite.png', // Path to your logo
            width: logoSize,
            height: logoSize,
          ),
        ),
      ),
    );
  }
}

class CircularRevealClipper extends CustomClipper<Path> {
  final double radius;
  final Offset center;

  CircularRevealClipper({required this.radius, required this.center});

  @override
  Path getClip(Size size) {
    // Path to create a circular reveal effect, using the radius
    return Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius))
      ..addRect(Rect.fromLTRB(0, 0, size.width, size.height)) // Fills the rest
      ..fillType = PathFillType.evenOdd; // Ensures only the circle is visible
  }

  @override
  bool shouldReclip(CircularRevealClipper oldClipper) {
    // Reclip if the radius or center changes
    return oldClipper.radius != radius || oldClipper.center != center;
  }
}
