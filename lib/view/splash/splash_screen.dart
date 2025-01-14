import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:student_records/database/db_functions/db_functions.dart';
import 'package:student_records/view/widget/layout_templates/layout_templates.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initDatabase();
    super.initState();
  }

  Future<void> initDatabase() async {
    await Future.delayed(Duration(seconds: 2));
    await getStudents();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => LayoutTemplates(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildLoading(),
    );
  }

  Center _buildLoading() =>
      Center(child: Lottie.asset("assets/animation/loading.json"));
}
