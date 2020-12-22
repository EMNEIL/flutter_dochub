/*
 * @Description: 
 * @Author: chen hui
 * @Date: 2020-12-21 15:51:23
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dochub/view_models/home/home_page_view_model.dart';

class HomePageDetail extends StatelessWidget {
  const HomePageDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print('接收到数据${Get.arguments}');

    return Scaffold(
      appBar: AppBar(
        title: Text('detail'),
      ),
      body: createWidget1(),
    );
  }
}

Widget createWidget1() {
  HomePageViewModel viewModel = Get.find<HomePageViewModel>();
  return Container(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoButton(
            child: Text('goback'),
            color: Colors.blue,
            onPressed: () => {
              Get.back(result: {'response': 'success'})
            },
          ),
          SizedBox(
            height: 20,
          ),
          CupertinoButton(
            child: Text('changValue'),
            color: Colors.blue,
            onPressed: () => {viewModel.increment()},
          ),
          SizedBox(
            height: 20,
          ),
          GetBuilder<HomePageViewModel>(
            init: Get.find<HomePageViewModel>(),
            builder: (viewModel) {
              return Text(viewModel.counter.toString());
            },
          ),
        ],
      ),
    ),
  );
}

Widget createWidget2() {
  HomePageViewModel viewModel = Get.find<HomePageViewModel>();
  return Container(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoButton(
            child: Text('goback'),
            color: Colors.blue,
            onPressed: () => {
              Get.back(result: {'response': 'success'})
            },
          ),
          SizedBox(
            height: 20,
          ),
          CupertinoButton(
            child: Text('changValue'),
            color: Colors.blue,
            onPressed: () => {viewModel.counterObs += 1},
          ),
          SizedBox(
            height: 20,
          ),
          Obx(() => Text(viewModel.counterObs.toString()))
        ],
      ),
    ),
  );
}
