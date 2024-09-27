import 'package:apps/pages/paymentconfirmation.dart';
import 'package:apps/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Loans extends StatefulWidget {
  const Loans({super.key});

  @override
  State<Loans> createState() => _LoansState();
}

class _LoansState extends State<Loans> {
  String selectedBank = 'CRDB Bank';
  String selectedMethod = 'Credit Card';
  bool isReceiver = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Loan',
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Scrollbar(
          thumbVisibility: false,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      'Ask for Loans',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Text(
                        'You can send or receive loans from your peers \n by scanning QR or use generated code below',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),

                // Radio button choice for receiver and sender
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Receiver option
                      Row(
                        children: [
                          Radio<bool>(
                            value: true,
                            groupValue:
                                isReceiver, // Bind radio buttons to the same state
                            onChanged: (value) {
                              setState(() {
                                isReceiver = value!;
                              });
                            },
                            activeColor: CustomColor.trustColor,
                          ),
                          const Text(
                            'Receiver',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      // Sender option
                      Row(
                        children: [
                          Radio<bool>(
                            value: false,
                            groupValue:
                                isReceiver, // Bind radio buttons to the same state
                            onChanged: (value) {
                              setState(() {
                                isReceiver = value!;
                              });
                            },
                            activeColor: CustomColor.trustColor,
                          ),
                          const Text(
                            'Sender',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // QR code section for receiver or scanner for sender
                if (isReceiver) ...[
                  Center(
                    child: Column(
                      children: [
                        // Placeholder for the QR code
                        SizedBox(
                          height: 180,
                          width: 180,
                          child: Center(
                            child: Image.asset(
                              'assets/images/qr-code.png', // Replace with your image path
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        // Centering the generated code below the QR code
                        const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '45YRF558', // This is the generated code
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                            height: 18), // Space between code and circles
                        // Row for centered circles with icons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Circle for copy icon
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: CustomColor
                                      .secondarygreyColor // Grey color for the circle
                                  ),
                              child: IconButton(
                                icon: const Icon(Icons.copy,
                                    color: Colors.white), // Copy icon
                                onPressed: () {
                                  // Handle copy action
                                  Clipboard.setData(
                                      const ClipboardData(text: '45YRF558'));
                                },
                              ),
                            ),
                            const SizedBox(width: 50), // Space between circles
                            // Circle for share icon
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: CustomColor
                                      .secondarygreyColor // Grey color for the circle
                                  ),
                              child: IconButton(
                                icon: const Icon(Icons.share,
                                    color: Colors.white), // Share icon
                                onPressed: () {
                                  // Handle share action here
                                  // Add your share functionality
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ] else ...[
                  Center(
                    child: Column(
                      children: [
                        // Placeholder for scanner
                        SizedBox(
                          height: 180,
                          width: 180,
                          child: Center(
                            child: Image.asset(
                              'assets/images/scanner.png', // Replace with your image path
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Scan or Enter Receiver\'s Code',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Input field for receiver code
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade300, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: CustomColor.trustColor, width: 2),
                            ),
                            labelText: 'Receiver Code',
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Input field for amount
                        TextField(
                          keyboardType: TextInputType.number, // Numeric input
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade300, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: CustomColor.trustColor, width: 2),
                            ),
                            labelText:
                                'Enter Amount to Lend', // Label for the amount field
                          ),
                        ),
                        // Submit button
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(_createRoute());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: CustomColor.trustColor,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12.0,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Text('Deposit Loan',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) =>
        const Confirmation(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    const double dashWidth = 8.0;
    const double dashSpace = 4.0;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }

    startX = 0;
    while (startX < size.height) {
      canvas.drawLine(
        Offset(0, startX),
        Offset(0, startX + dashWidth),
        paint,
      );
      startX += dashWidth + dashSpace;
    }

    startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height),
        Offset(startX + dashWidth, size.height),
        paint,
      );
      startX += dashWidth + dashSpace;
    }

    startX = 0;
    while (startX < size.height) {
      canvas.drawLine(
        Offset(size.width, startX),
        Offset(size.width, startX + dashWidth),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
