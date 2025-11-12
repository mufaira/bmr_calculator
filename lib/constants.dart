import 'package:flutter/material.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFEB1555);

// BMR membutuhkan Usia
const defaultAge = 25;

enum Gender {
  male,
  female,
}

const labelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

const numberTextStyle = TextStyle(
  fontSize: 45.0,
  fontWeight: FontWeight.w900,
);

const buttonTextStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

// Ganti resultTextStyle (sekarang untuk label di atas hasil)
const resultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

// Ganti bmiTextStyle menjadi bmrTextStyle untuk angka BMR besar
const bmrTextStyle = TextStyle(
  fontSize: 70, // Dikecilkan sedikit agar muat di layar mobile
  fontWeight: FontWeight.bold,
);

// TextStyle baru untuk label kebutuhan kalori harian
const dailyNeedsTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);