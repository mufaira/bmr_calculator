import 'package:flutter/material.dart';

// Tombol Bulat Kustom (Reusable) untuk increment/decrement data (Berat & Usia)
class RoundIconButton extends StatelessWidget {
  // Constructor untuk menerima ikon dan fungsi yang dijalankan
  RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0, // Tanpa bayangan
      constraints: const BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      shape: const CircleBorder(), // Bentuk Lingkaran
      fillColor: const Color(0xFF4C4F5E), // Warna latar belakang tombol
      onPressed: onPressed, // Fungsi yang dijalankan saat tombol ditekan
      child: Icon(icon),
    );
  }
}