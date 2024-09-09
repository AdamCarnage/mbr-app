import 'package:apps/pages/deposit.dart';
import 'package:apps/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  bool _isBalanceVisible = true;
  final List<String> _categories = ['All', 'Deposits', 'Withdrawals', 'Loans'];
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/victor.png'),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Welcome Back\nVictor Jackson',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.qr_code_scanner_outlined,
                      color: CustomColor.trustColor,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                height: 190,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: CustomColor.trustColor,
                  elevation: 2,
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Available balance',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.normal,
                                color: Colors.white70,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                _isBalanceVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white70,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isBalanceVisible = !_isBalanceVisible;
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _isBalanceVisible ? 'TZS 50,000' : '******',
                          style: const TextStyle(
                            fontSize: 26,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          '= 18.4 USD',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Deposit Container
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(_createRoute());
                    },
                    child: Container(
                      width: 115,
                      height: 50,
                      decoration: BoxDecoration(
                        color: CustomColor.trustColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: CustomColor.trustColor),
                      ),
                      child: const Center(
                        child: Text(
                          'Deposit',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),
                  Container(
                    width: 115,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white, // Default color
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: CustomColor.trustColor),
                    ),
                    child: const Center(
                      child: Text(
                        'Withdrawal',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          color: CustomColor.trustColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 115,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: CustomColor.trustColor),
                    ),
                    child: const Center(
                      child: Text(
                        'Loan',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          color: CustomColor.trustColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Transactions',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_categories.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategoryIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: _selectedCategoryIndex == index
                              ? CustomColor.trustColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: _selectedCategoryIndex == index
                                ? CustomColor.trustColor
                                : Colors.grey.withOpacity(0.5),
                            width: 2,
                          ),
                        ),
                        child: Text(
                          _categories[index],
                          style: TextStyle(
                            fontSize: 14,
                            color: _selectedCategoryIndex == index
                                ? Colors.white
                                : Colors.grey,
                            fontWeight: _selectedCategoryIndex == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 2),
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(children: [
                Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: CustomColor.trustColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.trending_up_outlined,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '+TZS 50,000',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: CustomColor.trustColor,
                                    ),
                                  ),
                                  Text(
                                    'Deposit',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '10:45 am',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '09 Sept 2024',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: CustomColor.trustColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.trending_down_outlined,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '-TZS 100,000',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: CustomColor.trustColor,
                                    ),
                                  ),
                                  Text(
                                    'Withdrawal',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '11:45 pm',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '01 July 2024',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: CustomColor.trustColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.trending_up_outlined,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '+TZS 420,000',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: CustomColor.trustColor,
                                    ),
                                  ),
                                  Text(
                                    'Deposit',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // Moved time and date to the right end
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '12:02 am',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '14 June 2024',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: CustomColor.trustColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.trending_up_outlined,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '+TZS 50,000',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: CustomColor.trustColor,
                                    ),
                                  ),
                                  Text(
                                    'Deposit',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // Moved time and date to the right end
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '10:45 am',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '09 Sept 2024',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]))),
            ],
          ),
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Deposit(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Slide from the right
        const end = Offset.zero; // To the center
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
