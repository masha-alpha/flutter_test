import 'package:flutter/material.dart';

import '../constants/font.dart';

class BlocklistPage extends StatelessWidget {
  const BlocklistPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Blocklist',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontFamily:AppFonts.primaryFont,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
          leadingWidth: screenWidth*0.055
      ),
      body: ListView(
        children: [
          _buildBlocklistItem(
            avatarImage: 'assets/images/avatar_image.jpeg',
            name: 'Tabish Bin Tahir',
            username: 'tabish_m2m',
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            onUnblock: () {
              // Unblock action
            },
          ),
          const Divider(thickness: 1, color: Color(0xFFF3F3F3)),
          _buildBlocklistItem(
            avatarImage: 'assets/images/avatar_image.jpeg',
            name: 'Tabish Bin Tahir',
            username: 'tabish_m2m',
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            onUnblock: () {
              // Unblock action
            },
          ),
          const Divider(thickness: 1, color: Color(0xFFF3F3F3)),
          _buildBlocklistItem(
            avatarImage: 'assets/images/avatar_image.jpeg',
            name: 'Tabish Bin Tahir',
            username: 'tabish_m2m',
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            onUnblock: () {
              // Unblock action
            },
          ),
          const Divider(thickness: 1, color: Color(0xFFF3F3F3)),
          _buildBlocklistItem(
            avatarImage: 'assets/images/avatar_image.jpeg',
            name: 'Tabish Bin Tahir',
            username: 'tabish_m2m',
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            onUnblock: () {
              // Unblock action
            },
          ),
          const Divider(thickness: 1, color: Color(0xFFF3F3F3)),
        ],
      ),
    );
  }

  Widget _buildBlocklistItem({
    required String avatarImage,
    required String name,
    required String username,
    required VoidCallback onUnblock,
    required double screenWidth,
    required double screenHeight,
  }) {
    double avatarRadius = ((46 / 390) * screenWidth) / 2; // Dynamic radius based on Figma design
    final widthFactor = screenWidth / 390;
    final heightFactor = screenHeight / 852;

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 16, top: 8, bottom: 8), // Less padding on start, more on end
      child: Row(
        children: [
          CircleAvatar(
            radius: avatarRadius,
            backgroundImage: AssetImage(avatarImage),
          ),
          SizedBox(width: 12), // Reduce spacing between avatar and text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFonts.primaryFont,
                    color: Color(0xFF0E0D1E),
                    fontSize: 15,
                  ),
                ),
                Text(
                  username,
                  style: const TextStyle(
                    fontFamily: AppFonts.primaryFont,
                    color: Color(0xFF707680),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
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
              'Unblock',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF004AAD),
                fontFamily: AppFonts.chipFont,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
