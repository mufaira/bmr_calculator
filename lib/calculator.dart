import 'dart:math';
import 'constants.dart';

class Calculator {
  // Tambahkan 'age' ke constructor
  Calculator({
    required this.height,
    required this.weight,
    required this.gender,
    required this.age,
  });

  final int height; // cm
  final int weight; // kg
  final int age; // tahun
  final Gender gender;

  late double _bmr;

  // Rumus Mifflin-St Jeor:
  // Pria: (10 * W) + (6.25 * H) - (5 * A) + 5
  // Wanita: (10 * W) + (6.25 * H) - (5 * A) - 161
  String calculateBMR() {
    if (gender == Gender.male) {
      _bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5;
    } else {
      _bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161;
    }
    return _bmr.toStringAsFixed(0); // BMR biasanya dibulatkan ke bilangan bulat
  }

  // Menghitung Total Daily Energy Expenditure (TDEE) berdasarkan tingkat aktivitas
  // Ini adalah fitur yang sering dilihat di kalkulator BMR online
  Map<String, String> getDailyCalorieNeeds() {
    // Pastikan BMR sudah dihitung
    if (_bmr == 0.0) {
      calculateBMR();
    }

    return {
      'Sedentary\n(Sangat sedikit/tanpa olahraga)': (_bmr * 1.2).toStringAsFixed(0),
      'Lightly Active\n(Olahraga ringan 1-3 hari/minggu)': (_bmr * 1.375).toStringAsFixed(0),
      'Moderately Active\n(Olahraga sedang 3-5 hari/minggu)': (_bmr * 1.55).toStringAsFixed(0),
      'Very Active\n(Olahraga berat 6-7 hari/minggu)': (_bmr * 1.725).toStringAsFixed(0),
      'Extra Active\n(Latihan intensif setiap hari)': (_bmr * 1.9).toStringAsFixed(0),
    };
  }
}