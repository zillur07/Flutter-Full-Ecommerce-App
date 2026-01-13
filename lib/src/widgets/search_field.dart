import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar_app/src/utils/colors.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback? onTapSearch;

  const SearchField({
    super.key,
    required this.controller,
    this.hintText = 'Search',
    this.onTapSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.textFieldBg, // light background color
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 19, 19, 19),
            fontSize: 14,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 16,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              'assets/svg/srch.svg',
              height: 20,
              width: 20,
              color: const Color.fromARGB(255, 12, 12, 12),
            ),
          ),
          // suffixIcon: onTapSearch != null
          //     ? IconButton(
          //         icon: const Icon(Icons.send, color: Colors.green),
          //         onPressed: onTapSearch,
          //       )
          //     : null,
        ),
      ),
    );
  }
}
