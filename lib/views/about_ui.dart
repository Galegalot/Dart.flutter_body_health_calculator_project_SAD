import 'package:flutter/material.dart';

class AboutUI extends StatelessWidget {
  final VoidCallback? onNavigateToBmi;
  final VoidCallback? onNavigateToBmr;

  const AboutUI({
    super.key,
    this.onNavigateToBmi,
    this.onNavigateToBmr,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Body Health Calculator',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD32F2F),
              ),
            ),
            const SizedBox(height: 25),
            Image.asset(
              'resource/calculate.png',
              width: 140,
              height: 140,
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: onNavigateToBmi,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.person, color: Color(0xFFD32F2F), size: 24),
                    SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        'คำนวณหาค่าดัชนีมวลกาย (BMI)',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD32F2F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: onNavigateToBmr,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.accessibility_new, color: Color(0xFFD32F2F), size: 24),
                    SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        'คำนวณหาแคลอรี่ที่ร่างกายต้องการ (BMR)',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD32F2F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            Image.asset(
              'resource/saulogo.png',
              width: 70,
              height: 70,
            ),
            const SizedBox(height: 15),
            const Text(
              'Â© 2026 SAU. All rights reserved.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Created by SAU Software Development Team',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}