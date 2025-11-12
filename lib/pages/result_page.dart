import 'package:flutter/material.dart';
import 'package:bmr_calculator/components/custom_card.dart';
import 'package:bmr_calculator/constants.dart';
import 'package:bmr_calculator/components/bottom_button.dart';

// Halaman ini menampilkan hasil perhitungan BMR dan TDEE (Kebutuhan Kalori Harian)
class ResultPage extends StatelessWidget {
  // Constructor untuk menerima data hasil dari Calculator
  const ResultPage({required this.bmrResult, required this.dailyNeeds});

  final String bmrResult; // Hasil BMR (Kkal/hari)
  final Map<String, String> dailyNeeds; // Kebutuhan Kalori Harian (TDEE) berdasarkan aktivitas

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: const Text('BMR CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Judul "Your BMR Result"
          Container(
            padding: const EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Your BMR Result',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // 1. Kartu Hasil BMR
          Expanded(
            flex: 3,
            child: CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Label Hasil BMR
                  const Text(
                    'BASAL METABOLIC RATE (BMR)',
                    style: resultTextStyle,
                  ),
                  // Nilai Angka BMR
                  Text(
                    bmrResult,
                    style: bmrTextStyle,
                  ),
                  // Satuan
                  const Text(
                    'Kkal / hari',
                    style: labelTextStyle,
                  ),
                  // Interpretasi singkat BMR
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Ini adalah kalori minimum yang dibutuhkan tubuh Anda untuk berfungsi saat istirahat total.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // 2. Kartu Kebutuhan Kalori Harian (TDEE)
          Expanded(
            flex: 4,
            child: CustomCard(
              color: activeCardColor,
              cardChild: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Judul TDEE
                    const Text(
                      'Total Daily Calorie Needs (TDEE)',
                      textAlign: TextAlign.center,
                      style: resultTextStyle,
                    ),
                    // Menampilkan daftar level aktivitas dan kalori yang dibutuhkan
                    ...dailyNeeds.entries.map((entry) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Level Aktivitas (Flexible agar teks panjang tidak tumpang tindih)
                          Flexible(
                            child: Text(
                              entry.key,
                              style: dailyNeedsTextStyle,
                            ),
                          ),
                          // Nilai Kalori Harian
                          Text(
                            entry.value,
                            style: numberTextStyle.copyWith(fontSize: 28),
                          ),
                          // Satuan Kalori
                          const Text(
                            'Kkal',
                            style: labelTextStyle,
                          ),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
          ),
          // Tombol Hitung Ulang
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context); // Kembali ke halaman input
            },
          ),
        ],
      ),
    );
  }
}