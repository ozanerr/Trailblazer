import 'package:flutter/material.dart';

class NotifScreen extends StatefulWidget {
  const NotifScreen({super.key});

  @override
  State<NotifScreen> createState() => _NotifScreenState();
}

class _NotifScreenState extends State<NotifScreen> {

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Notif"),
    );
  }
}