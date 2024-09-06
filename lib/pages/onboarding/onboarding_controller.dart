import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;

  var pageController = PageController(initialPage: 0);


    @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    GetStorage().write('isFirstTime', false);
    print('isFirstTime: ${GetStorage().read('isFirstTime')}');
  }



  void onPageChanged() {
    _currentIndex.value = pageController.page!.round();
    print(_currentIndex.value);
    update();
  }



  void previousPage() {
    _currentIndex.value = _currentIndex.value - 1;
    pageController.animateToPage(
      _currentIndex.value,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }


  void nextPage() {
    _currentIndex.value = _currentIndex.value + 1;

    if(_currentIndex.value == 3){
      Get.offAllNamed('/');
    }else{
      pageController.animateToPage(
        _currentIndex.value,
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }


  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
