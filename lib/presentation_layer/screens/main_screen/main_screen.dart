import 'package:apiapp/presentation_layer/screens/main_screen/components/api_call_button.dart';
import 'package:apiapp/presentation_layer/screens/main_screen/components/data_list_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: DataListWidget(),
      bottomNavigationBar: BottomAppBar(
        child: ApiCallButtonWidget(),
      ),
    );
  }
}
