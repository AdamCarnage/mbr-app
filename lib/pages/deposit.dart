import 'package:apps/theme/colors.dart';
import 'package:flutter/material.dart';

class Deposit extends StatefulWidget {
  const Deposit({super.key});

  @override
  State<Deposit> createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  String selectedBank = 'CRDB Bank';
  String selectedMethod = 'Credit Card'; // Default method

  @override
  Widget build(BuildContext context) {
    return Container(
        color: CustomColor.trustColor,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Deposit',
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
                    // Row for "Deposit Methods" text
                    const Row(
                      children: [
                        Text(
                          'Deposit Methods',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),

                    // Row for "Card Details" text
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Text(
                            'Payment Details',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Horizontal options for payment methods
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ChoiceChip(
                            label: Text(
                              'Credit Card',
                              style: TextStyle(
                                color: selectedMethod == 'Credit Card'
                                    ? CustomColor.trustColor
                                    : Colors.black,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            selectedColor: Colors.blue.withOpacity(0.2),
                            backgroundColor: Colors.white,
                            selected: selectedMethod == 'Credit Card',
                            onSelected: (bool selected) {
                              setState(() {
                                selectedMethod = 'Credit Card';
                              });
                            },
                          ),
                          const SizedBox(width: 10),
                          ChoiceChip(
                            label: Text(
                              'Paypal',
                              style: TextStyle(
                                color: selectedMethod == 'Paypal'
                                    ? CustomColor.trustColor
                                    : Colors.black,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            selected: selectedMethod == 'Paypal',
                            selectedColor: Colors.blue.withOpacity(0.2),
                            backgroundColor: Colors.white,
                            onSelected: (bool selected) {
                              setState(() {
                                selectedMethod = 'Paypal';
                              });
                            },
                          ),
                          const SizedBox(width: 10),
                          ChoiceChip(
                            label: Text(
                              'Cash',
                              style: TextStyle(
                                color: selectedMethod == 'Cash'
                                    ? CustomColor.trustColor
                                    : Colors.black,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            selectedColor: Colors.blue.withOpacity(0.2),
                            backgroundColor: Colors.white,
                            selected: selectedMethod == 'Cash',
                            onSelected: (bool selected) {
                              setState(() {
                                selectedMethod = 'Cash';
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                    // Card display as shown in the provided image
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          // color: CustomColor.trustColor,
                          gradient: LinearGradient(
                            colors: [
                              CustomColor.trustColor.withOpacity(
                                  0.8), // Adjust the colors as needed
                              CustomColor.nominationColor.withOpacity(0.8),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // New row with chip image and "Bank card" text
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/images/chip.png', // Ensure this path is correct or adjust it as needed
                                  height: 34,
                                  width: 34,
                                ),
                                const Text(
                                  'Bank card',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 60),
                            // Existing rows for cardholder name and expiration date
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Victor Jackson',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                Text(
                                  '12/14',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            // Card number
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                '3417  ****  ****  2115',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  letterSpacing: 7,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        height: 70, // Added height
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(15), // Added border radius
                        ),
                        child: CustomPaint(
                          painter: DashedBorderPainter(),
                          child: const Center(
                            child: Text(
                              '+ Add Another Method',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Set Amount section
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Set Amount',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    const Text(
                      'How much would you like to deposit?',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.attach_money,
                                color: CustomColor.trustColor,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Total amount',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '\$200',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Submit button in its own row
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: CustomColor.trustColor,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12.0,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text('Send',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Cancel button in its own row
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(
                                      color: CustomColor.trustColor, width: 1),
                                ),
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                              ),
                              child: const Text('Cancel',
                                  style: TextStyle(
                                      color: CustomColor.trustColor,
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
            ),
          ),
        )));
  }
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
