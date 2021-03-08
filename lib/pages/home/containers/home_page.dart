/*
 * @Description: 
 * @Author: chen hui
 * @Date: 2020-12-21 14:29:56
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './home_page_detail.dart';
import 'package:flutter_dochub/view_models/home/home_page_view_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return createCounterWidget1();
  }
}

//
Widget createStatusWidget() {
  final name = 1.obs;
  return Container(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoButton(
            child: Text('跳转'),
            color: Colors.blue,
            onPressed: () async {
              var data =
                  await Get.to(HomePageDetail(), arguments: {'arguments': 11});
              print('data===$data');
              //  Navigator.of(null).push(null);
            },
          ),
          SizedBox(height: 20),
          CupertinoButton(
            child: Text('短时状态-改变值'),
            color: Colors.blue,
            onPressed: () {
              name.value += 1;
            },
          ),
          Obx(
            () => Text(
              '${name.value}',
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ),
        ],
      ),
    ),
  );
}

//
Widget createCounterWidget() {
  return GetBuilder<HomePageViewModel>(
      init: HomePageViewModel(),
      builder: (viewModel) {
        return Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  child: Text('跳转'),
                  color: Colors.blue,
                  onPressed: () {
                    Get.to(HomePageDetail());
                  },
                ),
                SizedBox(height: 20),
                CupertinoButton(
                  child: Text('短时状态-改变值'),
                  color: Colors.blue,
                  onPressed: () {
                    viewModel.increment();
                  },
                ),
                Text(viewModel.counter.toString())
              ],
            ),
          ),
        );
      });
}

// 使用简单数据
Widget createCounterWidget1() {
  var viewModel = HomePageViewModel();
  Get.put(viewModel);
  return Container(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoButton(
            child: Text('跳转'),
            color: Colors.blue,
            onPressed: () {
              Get.to(HomePageDetail());
            },
          ),
          SizedBox(height: 20),
          CupertinoButton(
            child: Text('短时状态-改变值'),
            color: Colors.blue,
            onPressed: () {
              viewModel.increment();
            },
          ),
          GetBuilder<HomePageViewModel>(
            init: viewModel,
            builder: (viewModel) {
              return Text(viewModel.counter.toString());
            },
          ),
          SizedBox(
            height: 20,
          ),
          GetBuilder<HomePageViewModel>(
              init: viewModel,
              builder: (viewModel) {
                return Text(viewModel.name);
              }),
        ],
      ),
    ),
  );
}

// 使用响应式数据
Widget createCounterWidget2() {
  var viewModel = HomePageViewModel();
  Get.put(viewModel);
  return Container(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoButton(
            child: Text('跳转'),
            color: Colors.blue,
            onPressed: () {
              Get.to(HomePageDetail());
            },
          ),
          SizedBox(height: 20),
          CupertinoButton(
            child: Text('短时状态-改变值--'),
            color: Colors.blue,
            onPressed: () {
              viewModel.counterObs += 1;
            },
          ),
          Obx(() => Text(viewModel.counterObs.toString()))
        ],
      ),
    ),
  );
}
