import 'package:apps/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For Clipboard

class Confirmation extends StatefulWidget {
  const Confirmation({super.key});

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  // Dummy transaction details
  final String transactionId = 'TX123456789';
  final String transactionType = 'Loan'; // Change as needed
  final double amount = 100.00;
  final String date = '2024-09-27';
  final String time = '10:30 AM';
  final String receiver = 'ER4435990WS';

  @override
  Widget build(BuildContext context) {
    return Container(
        color: CustomColor.trustColor,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Payment Confirmation',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold)),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, // Space between content and button
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center all content
              children: [
                // Add tick icon
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Image(
                    image: AssetImage('assets/images/correct.png'),
                    width: 180,
                    height: 180,
                  ),
                ),

                // Combined payment messages
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    mainAxisSize:
                        MainAxisSize.min, // Allow column to take minimum space
                    children: [
                      const Text(
                        'Payment complete',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 4), // Space between texts
                      const Text(
                        'Thank you for your order, you will receive email confirmation shortly',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 4), // Space between texts
                      Text(
                        'Transaction Type: $transactionType',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align to the start
                    children: [
                      const Text(
                        'Details',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      _buildLabelValueRow('Recepient ID:', receiver),
                      _buildLabelValueRow(
                          'Amount:', '\$${amount.toStringAsFixed(2)}'),
                      _buildLabelValueRow('Date:', date),
                      _buildLabelValueRow('Time:', time),
                      _buildLabelValueRow('Transaction ID:', transactionId),
                    ],
                  ),
                ),

                const SizedBox(height: 18), // Space between code and circles

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

                // Proceed button at the bottom
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SizedBox(
                    width: double.infinity, // Make button take full width
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColor.trustColor,
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Proceed',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}

Widget _buildLabelValueRow(String label, String value) {
  return Row(
    mainAxisAlignment:
        MainAxisAlignment.spaceBetween, // Space between label and value
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: 'Poppins',
        ),
      ),
      Expanded(
        child: Text(
          value,
          textAlign: TextAlign.right, // Align value to the right
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    ],
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
