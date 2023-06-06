// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:app_test/core/common_widgets/app_appbar.dart';
import '../widgets/credits_list.dart';

class CreditsDataScreen extends StatefulWidget {
  const CreditsDataScreen({super.key});

  @override
  State<CreditsDataScreen> createState() => _CreditsDataScreenState();
}

class _CreditsDataScreenState extends State<CreditsDataScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: AppAppbar(title: 'Your credits'),
        body: CreditsList(),
      ),
    );
  }
}
