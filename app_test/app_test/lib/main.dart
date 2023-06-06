// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:app_test/core/theme/colors/app_colors.dart';
import 'core/services/service_locator.dart' as di;
import 'credits_data_module/ui/screen/credits_data_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
        useMaterial3: true,
      ),
      home: const CreditsDataScreen(),
    );
  }
}
