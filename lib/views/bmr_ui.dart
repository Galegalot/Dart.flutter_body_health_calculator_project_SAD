import 'package:flutter/material.dart';

class BmrUI extends StatefulWidget {
  const BmrUI({super.key});

  @override
  State<BmrUI> createState() => _BmrUIState();
}

class _BmrUIState extends State<BmrUI> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  String _gender = 'male';
  double? _bmrResult;

  void _calculateBMR() {
    double? weight = double.tryParse(_weightController.text.trim());
    double? height = double.tryParse(_heightController.text.trim());
    int? age = int.tryParse(_ageController.text.trim());

    if (weight == null ||
        height == null ||
        age == null ||
        weight <= 0 ||
        height <= 0 ||
        age <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('กรุณากรอกข้อมูลน้ำหนัก ส่วนสูง และอายุให้ถูกต้อง'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    double bmr = 0;
    if (_gender == 'male') {
      bmr = 66 + (13.7 * weight) + (5 * height) - (6.8 * age);
    } else {
      bmr = 665 + (9.6 * weight) + (1.8 * height) - (4.7 * age);
    }

    setState(() {
      _bmrResult = bmr;
    });
  }

  void _resetFields() {
    setState(() {
      _weightController.clear();
      _heightController.clear();
      _ageController.clear();
      _gender = 'male';
      _bmrResult = null;
    });
  }

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'คำนวณหาค่า BMR',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF2C5E8A),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'resource/bmr.png',
                width: 120,
                height: 120,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Radio<String>(
                      value: 'male',
                      groupValue: _gender,
                      activeColor: const Color(0xFF2C5E8A),
                      onChanged: (val) {
                        setState(() {
                          _gender = val!;
                        });
                      },
                    ),
                    const Text('ชาย', style: TextStyle(fontSize: 16)),
                  ],
                ),
                const SizedBox(width: 30),
                Row(
                  children: [
                    Radio<String>(
                      value: 'female',
                      groupValue: _gender,
                      activeColor: const Color(0xFF2C5E8A),
                      onChanged: (val) {
                        setState(() {
                          _gender = val!;
                        });
                      },
                    ),
                    const Text('หญิง', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _weightController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'น้ำหนัก (kg)',
                hintText: 'เช่น 65.5',
                prefixIcon: const Icon(Icons.fitness_center),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _heightController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'ส่วนสูง (cm)',
                hintText: 'เช่น 170',
                prefixIcon: const Icon(Icons.height),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'อายุ (ปี)',
                hintText: 'เช่น 20',
                prefixIcon: const Icon(Icons.cake),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _calculateBMR,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2C5E8A),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'คำนวณ BMR',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: _resetFields,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'รีเซ็ต',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            if (_bmrResult != null) ...[
              const SizedBox(height: 30),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.grey[50],
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        'พลังงานที่ร่างกายต้องการพื้นฐาน (BMR)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${_bmrResult!.toStringAsFixed(2)} kcal',
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C5E8A),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'เป็นพลังงานขั้นต่ำที่ร่างกายใช้ในการดำรงชีวิตในแต่ละวัน',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
