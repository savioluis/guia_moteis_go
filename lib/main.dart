import 'package:flutter/material.dart';
import 'package:guia_moteis_go/app/app.dart';
import 'package:guia_moteis_go/app/injections.dart';

void main() async {
  await initInjections();
  runApp(const App());
}
