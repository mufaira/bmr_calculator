import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmr_calculator/components/custom_card.dart';
import 'package:bmr_calculator/components/icon_card.dart';
import 'package:bmr_calculator/constants.dart';
import 'result_page.dart';
import 'package:bmr_calculator/components/bottom_button.dart';
import 'package:bmr_calculator/components/round_icon_button.dart';
import 'package:bmr_calculator/calculator.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // --- STATE MANAGEMENT ---
  Gender selectedGender = Gender.male; // State untuk Jenis Kelamin yang dipilih
  int height = 160; // State untuk Tinggi (cm)
  int weight = 60; // State untuk Berat (kg)
  int age = defaultAge; // State untuk Usia (tahun)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan judul aplikasi
      appBar: AppBar(
        title: const Text('BMR CALCULATOR'),
      ),
      // Konten utama halaman
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Baris untuk Gender (Laki-laki & Perempuan)
          Expanded(
            child: Row(
              children: [
                // Kartu Laki-laki
                Expanded(
                  child: CustomCard(
                    // Mengubah warna kartu berdasarkan state 'selectedGender'
                    color: selectedGender == Gender.male ? activeCardColor : inactiveCardColor,
                    cardChild: IconCard(
                      cardIcon: FontAwesomeIcons.mars,
                      caption: 'MALE',
                    ),
                    // Mengupdate state saat kartu diklik
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                // Kartu Perempuan
                Expanded(
                  child: CustomCard(
                    color: selectedGender == Gender.female ? activeCardColor : inactiveCardColor,
                    cardChild: IconCard(
                      cardIcon: FontAwesomeIcons.venus,
                      caption: 'FEMALE',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          // 2. Kartu untuk Tinggi (Height)
          Expanded(
            child: CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT', style: labelTextStyle),
                  // Menampilkan nilai tinggi saat ini
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: numberTextStyle),
                      const Text('cm', style: labelTextStyle),
                    ],
                  ),
                  // Slider untuk memilih tinggi
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      // Logika saat slider digeser
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // 3. Baris untuk Berat (Weight) dan Usia (Age)
          Expanded(
            child: Row(
              children: [
                // Kartu Berat (Weight)
                Expanded(
                  child: CustomCard(
                    color: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('WEIGHT', style: labelTextStyle),
                        Text(weight.toString(), style: numberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Tombol Minus
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (weight >= 30) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            // Tombol Plus
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                // Kartu Usia (Age)
                Expanded(
                  child: CustomCard(
                    color: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('AGE', style: labelTextStyle),
                        Text(age.toString(), style: numberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Tombol Minus
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (age > 1) {
                                    age--;
                                  }
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            // Tombol Plus
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 4. Tombol Hitung BMR
          BottomButton(
            buttonTitle: 'CALCULATE BMR',
            onTap: () {
              // Membuat instance Calculator dengan semua data input
              Calculator cal = Calculator(
                  height: height,
                  weight: weight,
                  gender: selectedGender,
                  age: age);

              // Menghitung BMR dan Kebutuhan Kalori Harian
              String bmr = cal.calculateBMR();
              Map<String, String> dailyNeeds = cal.getDailyCalorieNeeds();

              // Navigasi ke Halaman Hasil (ResultPage) dan mengirimkan data
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmrResult: bmr,
                    dailyNeeds: dailyNeeds,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}