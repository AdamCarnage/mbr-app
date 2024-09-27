import 'package:apps/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  // Dummy data for the user
  final String username = 'Victor Jackson';
  final String userId = 'ID: REU7893';
  final String phoneNumber = '+255 712 345 678';
  final String email = 'victor@admin.com';
  final String dob = '25 May 1995';
  final String accountType = 'Premium';
  final String linkedCards = '3 Linked Cards';
  final String twoFA = 'Enabled';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.trustColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              'User Profile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Avatar, Username, and ID
                  Row(
                    children: [
                      // Avatar
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                            'assets/images/victor.png'), // Replace with user profile image
                      ),
                      const SizedBox(width: 16),
                      // Username and ID
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Text(
                      //       username,
                      //       style: const TextStyle(
                      //         fontSize: 18,
                      //         fontWeight: FontWeight.bold,
                      //         fontFamily: 'Poppins',
                      //       ),
                      //     ),
                      //     const SizedBox(height: 4),
                      //     Text(
                      //       userId,
                      //       style: const TextStyle(
                      //         fontSize: 14,
                      //         fontFamily: 'Poppins',
                      //         color: Colors.grey,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            username,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                userId,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 8),
                              IconButton(
                                icon: const Icon(Icons.copy,
                                    size: 16, color: Colors.grey),
                                onPressed: () {
                                  // Implement copy functionality here
                                  Clipboard.setData(
                                      ClipboardData(text: userId));
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //   const SnackBar(
                                  //       content: Text(
                                  //           'User ID copied to clipboard!')),
                                  // );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors
                                          .transparent, // Make the background transparent to avoid overlap
                                      elevation:
                                          0, // Remove default elevation for cleaner look
                                      content: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: const Color(
                                              0xFFB3B3B3), // Grey background
                                          borderRadius: BorderRadius.circular(
                                              10), // Border radius of 10
                                        ),
                                        child: const Text(
                                          'User ID copied to clipboard!',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors
                                                .white, // White text to stand out on grey background
                                          ),
                                        ),
                                      ),
                                      behavior: SnackBarBehavior
                                          .floating, // Make it floating
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Section: Personal Details
                  const Text(
                    'Personal Details',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow(
                      'assets/images/phone.png', 'Phone Number', phoneNumber),
                  _buildInfoRow('assets/images/email.png', 'Email', email),
                  _buildInfoRow(
                      'assets/images/calendar.png', 'Date of Birth', dob),

                  const SizedBox(height: 24),

                  // Section: Account
                  const Text(
                    'Account',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow('assets/images/bank-building.png',
                      'Account Type', accountType),
                  _buildInfoRow('assets/images/credit-card.png', 'Linked Cards',
                      linkedCards),
                  _buildInfoRow('assets/images/secure.png',
                      '2-Factor Authentication', twoFA),

                  const SizedBox(height: 24),

                  // Section: Settings
                  const Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow('assets/images/setting.png', 'Settings',
                      'Configure your app'),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle button press action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.trustColor, // Use custom color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the content
                children: [
                  Image.asset(
                    'assets/images/logout.png', // Replace with the correct path to your image
                    width: 24, // Adjust the size as needed
                    height: 24,
                    color: Colors
                        .white, // Optional: change the color of the image to match text color
                  ),
                  const SizedBox(width: 8), // Space between the image and text
                  const Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build each info row with an image, title, value, and forward arrow
  Widget _buildInfoRow(String iconPath, String title, String value) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image.asset(
            iconPath,
            width: 24,
            height: 24,
            color: CustomColor.trustColor, // Adjust icon color
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins',
              color: Colors.grey,
            ),
          ),
          subtitle: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios, // Default forward arrow icon
            size: 16,
            color: Colors.grey,
          ),
        ),
        // const Divider(),
      ],
    );
  }
}
