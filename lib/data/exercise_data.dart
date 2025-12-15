import '../models/exercise.dart';
import '../exercises/Bai1_Classroom.dart';
import '../exercises/Bai2_Locations1.dart';
import '../exercises/Bai3_Locations2.dart';
import '../exercises/Bai4_Count.dart';
import '../exercises/Bai5_Color.dart';
import '../exercises/Bai6_Time.dart';
import '../exercises/Bai7_Login.dart';
import '../exercises/Bai8_Register.dart';
import '../exercises/Bai9/screen.dart';
import '../exercises/Bai10/bai10_screen.dart';
import '../exercises/Bai11/Login_page.dart';





final List<Exercise> exercises = [
  Exercise(
    title: 'Bài 1 - classroom',
    screen: Classroom(),
  ),
  Exercise(
    title: 'Bài 2 - Locations1',
    screen: Locations1(),
  ),
  Exercise(
    title: 'Bài 3 - Locations2',
    screen: Locations2(),
  ),
  Exercise(
    title: 'Bài 4 - Count',
    screen: Count(),
  ),
  Exercise(
    title: 'Bài 5 - Color',
    screen: Changercolor(),
  ),
  Exercise(
    title: 'Bài 6 - Time',
    screen: Time(),
  ),
  Exercise(
    title: 'Bài 7 - Login',
    screen: Login(),
  ),
  Exercise(
    title: 'Bài 8 - Register',
    screen: Register(),
  ),
  Exercise(
    title: 'Bài 9 - API ',
    screen: Ex09Screen(),
  ),
   Exercise(
    title: 'Bài 10 - API2 ',
    screen: Ex10Screen(),
  ),
   Exercise(
    title: 'Bài 11 - KQlogin ',
    screen: LoginProfile(),
  ),
];
