import 'dart:io';
import 'dart:convert';

int num = 1;

void fun(String l) {
  List<String> words = [];
  String temp = '';
  for (int i = 0; i < l.length; i++) {
    if (l[i] != ' ') {
      temp = temp + l[i];
    } else {
      words.add(temp);
      temp = '';
    }
  }
  Map<String, int> freq = {};
  int mx = 0;
  for (int i = 0; i < words.length; i++) {
    freq[words[i]] = (freq[words[i]] ?? 0) + 1;
    if ((freq[words[i]] ?? 0) > mx) {
      mx = freq[words[i]] ?? 0;
    }
  }
  Set<String> answers = {};
  for (int i = 0; i < words.length; i++) {
    if ((freq[words[i]] ?? 0) == mx) {
      answers.add(words[i]);
    }
  }
  print('$answers appears in line $num');
  num++;
}

void main() {
  new File("file.txt")
      .openRead()
      .map(utf8.decode)
      .transform(new LineSplitter())
      .forEach((l) => fun(l));
}
