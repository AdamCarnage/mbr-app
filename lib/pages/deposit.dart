import 'package:apps/theme/colors.dart';
import 'package:flutter/material.dart';

class Deposit extends StatefulWidget {
  const Deposit({super.key});

  @override
  State<Deposit> createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final TextEditingController _expController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  List<String> banks = [
    'CRDB Bank',
    'NMB Bank',
    'Standard Chartered',
    'Exim Bank'
  ];
  // Variable to hold the selected bank
  String selectedBank = 'CRDB Bank'; // Default selected value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Deposit',
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('From',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins')),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'CRDB Bank',
                              style: TextStyle(
                                  fontSize: 16, fontFamily: 'Poppins'),
                            ),
                            CircleAvatar(
                                radius: 20, // Adjust the radius as needed
                                backgroundImage:
                                    AssetImage('assets/images/tz.png')),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text('To',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins')),
                        DropdownButtonFormField<String>(
                          value: selectedBank,
                          decoration: InputDecoration(
                            hintText: 'Select Bank',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: CustomColor.trustColor),
                            ),
                          ),
                          items: banks.map((String bank) {
                            return DropdownMenuItem<String>(
                              value: bank,
                              child: Text(bank),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedBank = newValue!;
                            });
                          },
                        )
                      ],
                    ),
                  ),

                  // Card details
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Card Details',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _cardNumberController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'Card Number eg: 1234 5678 9101 1213',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: CustomColor.trustColor),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _cardHolderNameController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'Holder Name eg: John Doe',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: CustomColor.trustColor),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _expController,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: 'Exp eg: 01/25',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: CustomColor.trustColor),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                controller: _cvvController,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: 'CVV eg: 678',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: CustomColor.trustColor),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                            child: const Text('Submit',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins')),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Cancel button in its own row with blue border
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12.0,
                              ),
                              side: const BorderSide(
                                  color: CustomColor.trustColor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                  color: CustomColor.trustColor,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
