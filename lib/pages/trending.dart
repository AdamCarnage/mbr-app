import 'dart:async';
import 'package:apps/theme/colors.dart';
import 'package:flutter/material.dart';

class Trends extends StatefulWidget {
  const Trends({super.key});

  @override
  State<Trends> createState() => _TrendsState();
}

class _TrendsState extends State<Trends> {
  final TextEditingController _searchController = TextEditingController();
  final PageController _pageController = PageController(viewportFraction: 0.8);
  bool _isSearchActive = false;
  int _activeIndex = 0;
  Timer? _timer;
  final List<String> _categories = [
    'Investments',
    'Savings',
    'Expenses',
    'Loans'
  ];
  int _selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.hasClients) {
        int nextPage = (_activeIndex + 1) % 3;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  fillColor: Colors.grey[300],
                  filled: true,
                  contentPadding: const EdgeInsets.all(16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _isSearchActive = value.isNotEmpty;
                  });
                },
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 180,
                width: double.infinity,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _activeIndex = index;
                    });
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return _buildCard(
                      index: index,
                      width: 350,
                      title: 'My Investments',
                      amount: 'TZS 1,000,000',
                      balance: 'Available balance TZS 50,000',
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              // Bottom indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _activeIndex == index ? 12 : 8,
                    height: _activeIndex == index ? 12 : 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _activeIndex == index
                          ? CustomColor.trustColor
                          : Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
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
              const SizedBox(height: 10),
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(children: [
                Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage('assets/images/victor.png'),
                              ),
                              SizedBox(width: 12),
                              Text(
                                'Phary Tambi',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: CustomColor.trustColor,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Offline',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Current Balance',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'TZS 500,000',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: CustomColor.trustColor,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Interest 10%',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    'Per Loan',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
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
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage('assets/images/victor.png'),
                              ),
                              SizedBox(width: 12),
                              Text(
                                'Mosses Jackson',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: CustomColor.trustColor,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Active',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Current Balance',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'TZS 240,000',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: CustomColor.trustColor,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Interest 3%',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    'Per Loan',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
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
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage('assets/images/victor.png'),
                              ),
                              SizedBox(width: 12),
                              Text(
                                'Jessica Bernad',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: CustomColor.trustColor,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Active',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Current Balance',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'TZS 1,200,000',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: CustomColor.trustColor,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Interest 7%',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    'Per Loan',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ])))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required int index,
    required String title,
    required String amount,
    required String balance,
    required double width,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: CustomColor.trustColor,
        elevation: 2,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'My Investments',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'TZS 1,000,000',
                style: TextStyle(
                  fontSize: 26,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Available balance TZS 50,000',
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
    );
  }
}
