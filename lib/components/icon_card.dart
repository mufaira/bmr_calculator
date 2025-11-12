import 'package:flutter/material.dart';
import 'package:bmr_calculator/constants.dart';

// Widget Kartu Ikon (Reusable) khusus untuk memilih Gender
class IconCard extends StatelessWidget {
  // Constructor untuk menerima ikon dan teks keterangan
  IconCard({this.cardIcon, required this.caption});

  final IconData? cardIcon;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Ikon dari Font Awesome
        Icon(
          cardIcon,
          size: 70.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        // Teks Keterangan Ikon
        Text(
          caption,
          style: labelTextStyle,
        ),
      ],
    );
  }
}