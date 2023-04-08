import 'package:app_architecturer/ui/view_model/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text(
            'Sign out',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            ref.read(loginControllerProvider.notifier).signOut();
          },
        ),
      ),
    );
  }
}
