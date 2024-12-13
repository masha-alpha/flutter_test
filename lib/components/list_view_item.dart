import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final VoidCallback onRemove;

  const ListViewItem({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          // Circular avatar
          CircleAvatar(
            radius: 24.0,
            backgroundImage: AssetImage(imageUrl),
            backgroundColor: Colors.grey[200],
          ),

          const SizedBox(width: 16.0),

          // Name
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // Remove chip
          ActionChip(
            label: const Text(
              'Remove',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
            onPressed: onRemove,
          ),
        ],
      ),
    );
  }
}