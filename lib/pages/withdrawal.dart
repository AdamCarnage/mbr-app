import 'package:apps/theme/colors.dart';
import 'package:flutter/material.dart';

class Withdrawal extends StatefulWidget {
  const Withdrawal({super.key});

  @override
  State<Withdrawal> createState() => _WithdrawalState();
}

class _WithdrawalState extends State<Withdrawal> {
  String selectedMethod = 'Bank'; // Default selected method
  String selectedMobileOption = 'Mobile Money Option 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Withdraw',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Withdraw Methods',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Payment Details',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 12.0),

              // Horizontal options for payment methods
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ChoiceChip(
                    label: Text(
                      'Bank',
                      style: TextStyle(
                        color: selectedMethod == 'Bank'
                            ? CustomColor.trustColor
                            : Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    selectedColor: Colors.blue.withOpacity(0.2),
                    selected: selectedMethod == 'Bank',
                    onSelected: (bool selected) {
                      setState(() {
                        selectedMethod = 'Bank';
                      });
                    },
                  ),
                  const SizedBox(width: 10),
                  ChoiceChip(
                    label: Text(
                      'Mobile Money',
                      style: TextStyle(
                        color: selectedMethod == 'Mobile Money'
                            ? CustomColor.trustColor
                            : Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    selected: selectedMethod == 'Mobile Money',
                    selectedColor: Colors.blue.withOpacity(0.2),
                    onSelected: (bool selected) {
                      setState(() {
                        selectedMethod = 'Mobile Money';
                      });
                    },
                  ),
                  const SizedBox(width: 10),
                  ChoiceChip(
                    label: Text(
                      'Azampay',
                      style: TextStyle(
                        color: selectedMethod == 'Azampay'
                            ? CustomColor.trustColor
                            : Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    selectedColor: Colors.blue.withOpacity(0.2),
                    selected: selectedMethod == 'Azampay',
                    onSelected: (bool selected) {
                      setState(() {
                        selectedMethod = 'Azampay';
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20.0),

              // Bank card UI
              Visibility(
                visible: selectedMethod == 'Bank',
                // child: _buildBankCard(),
                child: Column(
                  children: [
                    _buildBankCard(),
                    _buildAddAnotherMethod(),
                  ],
                ),
              ),

              // Mobile Money UI
              Visibility(
                visible: selectedMethod == 'Mobile Money',
                // child: _buildMobileMoney(),
                child: Column(
                  children: [
                    _buildMobileMoney(),
                    _buildAddAnotherMethod(),
                  ],
                ),
              ),

              // Azampay UI
              Visibility(
                visible: selectedMethod == 'Azampay',
                // child: _buildAzampay(),
                child: Column(
                  children: [
                    _buildAzampesa(),
                    _buildAddAnotherMethod(),
                  ],
                ),
              ),

              // Set Amount section
              const SizedBox(height: 20.0),
              const Text(
                'Set Amount',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              const Text(
                'How much would you like to withdraw?',
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
              const SizedBox(height: 20.0),

              // Submit and Cancel buttons
              Row(
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
                      child: const Text(
                        'Send',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                              color: CustomColor.trustColor, width: 1),
                        ),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: CustomColor.trustColor,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Bank card widget
  Widget _buildBankCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            CustomColor.trustColor.withOpacity(0.8),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/chip.png',
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
          ),
        ],
      ),
    );
  }

  // Mobile Money widget
  Widget _buildMobileMoney() {
    final List<Map<String, String>> mobileOptions = [
      {'title': 'TigoPesa', 'image': 'assets/images/tigo.png'},
      {'title': 'MPesa', 'image': 'assets/images/voda.png'},
      {'title': 'AirtelMoney', 'image': 'assets/images/airtel.jpg'},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: mobileOptions.map((option) {
          final isSelected = selectedMobileOption == option['title'];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedMobileOption = option['title']!;
              });
            },
            child: Container(
              width: 120, // Set a fixed width for each box
              height: 120, // Set a fixed height for each box
              margin: const EdgeInsets.symmetric(
                  horizontal: 8.0), // Add horizontal margin
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
                border: isSelected
                    ? Border.all(color: CustomColor.trustColor, width: 2.0)
                    : null,
              ),
              child: Center(
                // Center the content within the container
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      option['image']!,
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      option['title']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildAzampesa() {
    return Container(
      width: 120, // Set a fixed width for the box
      height: 120, // Set a fixed height for the box
      margin:
          const EdgeInsets.symmetric(horizontal: 8.0), // Add horizontal margin
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        // Center the content within the container
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/azampesa.png', // Replace with your Azampay image
              height: 50,
              width: 50,
            ),
            const SizedBox(height: 10),
            const Text(
              'Azampesa',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddAnotherMethod() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
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
    );
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
