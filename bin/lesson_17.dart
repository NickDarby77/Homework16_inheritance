// TOPIC: LIBRARY - TRANSLATOR, pub.dev

import 'package:translator/translator.dart';

void main(List<String> args) {
  GoogleTranslator translator = GoogleTranslator();
  String text = 'Hello World, I love you';
  translator.translate(text, from: 'en', to: 'ru').then((value) => print(value));
}