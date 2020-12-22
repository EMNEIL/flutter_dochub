/*
 * @Description: 
 * @Author: chen hui
 * @Date: 2020-12-22 09:27:12
 */
import 'package:get/get.dart';
import 'package:english_words/english_words.dart';

class HomePageViewModel extends GetxController {
  int _counter = 0;
  int get counter => _counter;

  String _name = 'lili';
  String get name => _name;

  var counterObs = 0.obs;

  void increment() {
    _counter++;
    _name = WordPair.random().asPascalCase;
    update();
  }

  @override
  void onInit() {
    super.onInit();

    //每次值改变回调
    ever(counterObs, (response) => {print('sss$response')});
  }
}
