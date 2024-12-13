import 'package:figma_design_replication_assessment/constants/font.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'blocklist_page.dart';

class ContactInfoPage extends StatefulWidget {
  const ContactInfoPage({super.key});

  @override
  State<ContactInfoPage> createState() => _ContactInfoPageState();
}

class _ContactInfoPageState extends State<ContactInfoPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Define the total top container height based on Figma specs
    final figmaTopContainerHeight = 170.0 / 852.0 * screenHeight;
    // Adjust the container height by subtracting the AppBar height
    final topContainerHeight = figmaTopContainerHeight - kToolbarHeight;
    final circleAvatarRadius=((127 / 852 * screenHeight) / 2);

    //Scaling Factors
    final widthFactor = screenWidth / 390;
    final heightFactor = screenHeight / 852;

    return Scaffold(
      appBar:AppBar(
        title: const Text(
          'Contact info',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: AppFonts.primaryFont,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
            weight: 600,
          ),
          onPressed: () {},
        ),
        leadingWidth: screenWidth*0.055, // Adjust this value to reduce spacing
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Top Container
          Container(
            height: topContainerHeight,
            width: screenWidth,
            color: Colors.black,
          ),

          // Bottom Container
          Padding(
            padding:  EdgeInsets.only(top: topContainerHeight),
            child: Container(
              height: screenHeight - topContainerHeight - kToolbarHeight,
              width: screenWidth,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Horizontal padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight*0.089), // Space for avatar overlap
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Center everything in the column
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Center the row horizontally
                        children: [
                          const Text(
                            'Tabish Bin Tahir',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppFonts.primaryFont,
                              color: Color(0xFF0E0D1E),
                            ),
                          ),
                          const SizedBox(width: 3),
                          SizedBox(
                            width: screenWidth * 0.0610,
                            child: Image.asset(
                              'assets/images/verified.png', // Path to the asset
                            ),
                          ),
                        ],
                      ),
                       SizedBox(height: screenHeight*0.001), // Add spacing between rows
                      const Text(
                        'tabish_m2m',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF707680),
                          fontWeight: FontWeight.w400,
                          fontFamily: AppFonts.primaryFont,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.only(
                          top: 5 * heightFactor,
                          right: 11 * widthFactor,
                          bottom: 5 * heightFactor,
                          left: 11 * widthFactor,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(0, 74, 173, 0.08),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          'Speciality',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF004AAD),
                            fontFamily: AppFonts.chipFont,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight*0.0532),
                  // Fields Section
                  _buildField('Business Name', 'Mind2Matter'),
                  _buildDivider(),
                  _buildField('Job Title', 'UI UX Designer'),
                  _buildDivider(),
                  _buildField('Type of provider', 'Provider type'),
                  _buildDivider(),
                  _buildField('Zip Code', '10001'),
                  _buildDivider(),
                  SizedBox(height: screenHeight*0.0285),
                  // Send a message button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Send a message',
                      style: TextStyle(
                        fontFamily:AppFonts.primaryFont,
                        fontSize: 14,
                      ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight*0.0428),
                  // Block Contact
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const BlocklistPage()));
                    },
                    child: const Text(
                      'Block Contact',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF0E0D1E),
                        fontWeight: FontWeight.w400,
                        fontFamily:AppFonts.primaryFont,
                      ),
                    ),
                  ),
                  _buildDivider()
                ],
              ),
            ),
          ),
          // Circular Avatar
          Positioned(
            top: topContainerHeight - circleAvatarRadius, // Adjust dynamically based on screen height
            left: (screenWidth / 2) - circleAvatarRadius,
            // Center horizontally and make size dynamic
            child: CircleAvatar(
              radius: circleAvatarRadius, // Dynamic radius
              backgroundColor: Colors.white,
              backgroundImage:const AssetImage('assets/images/avatar_image.jpeg')
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to create a field
  Widget _buildField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF0E0D1E),
              fontWeight: FontWeight.w400,
              fontFamily:AppFonts.primaryFont,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(14, 13, 30, 0.61),
              fontWeight: FontWeight.w400,
              fontFamily:AppFonts.primaryFont,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildDivider(){
    return const Divider(
      color: Color.fromRGBO(235, 237, 251, 1),
    );
  }
}
