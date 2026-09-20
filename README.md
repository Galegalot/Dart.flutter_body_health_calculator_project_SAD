# flutter_body_health_calculator_project

โปรเจกต์ **flutter_body_health_calculator_project (Body ว้าว)** เป็นส่วนหนึ่งของรายวิชา **Mobile Development** จัดทำขึ้นเพื่อฝึกการพัฒนา Mobile Application ด้วย **Flutter และ Dart**

แอปพลิเคชันสำหรับคำนวณค่าดัชนีมวลกาย (BMI) และอัตราการเผาผลาญพลังงานพื้นฐาน (BMR) พร้อมแสดงผลและให้คำแนะนำเบื้องต้นเกี่ยวกับสุขภาพ

## 📱 หน้าจอของแอปพลิเคชัน

| หน้าจอ | ไฟล์ | รายละเอียด |
|---|---|---|
| Splash Screen | `splash_screen_ui.dart` | หน้าแรกของแอป แสดงชื่อแอป "Body ว้าว" และโลโก้พร้อมโหลด 3 วินาที |
| Home | `home_ui.dart` | เมนูหลักควบคุมด้วย BottomNavigationBar สำหรับสลับหน้า |
| BMI Calculator | `bmi_ui.dart` | คำนวณค่าดัชนีมวลกายตามน้ำหนักและส่วนสูง พร้อมระดับความเสี่ยง |
| BMR Calculator | `bmr_ui.dart` | คำนวณค่าการเผาผลาญพลังงานขั้นต่ำตามเพศ น้ำหนัก ส่วนสูง และอายุ |
| About | `about_ui.dart` | ข้อมูลเกี่ยวกับแอปพลิเคชัน ผู้พัฒนา และสถาบัน |

## 🛠️ เครื่องมือที่ใช้พัฒนา

- **Flutter**
- **Dart**
- **Google Fonts (Kanit)**
- ออกแบบ UI และทดสอบบนหน้าจอ iPhone 15 Pro Max
- สถาบัน: มหาวิทยาลัยเอเชียอาคเนย์ (SAU)

## 📂 โครงสร้างไฟล์ใน lib/

```text
lib/
├── main.dart
└── views/
    ├── splash_screen_ui.dart
    ├── home_ui.dart
    ├── bmi_ui.dart
    ├── bmr_ui.dart
    └── about_ui.dart
```