import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/customer_list_controller.dart';

class CustomerListView extends GetView<CustomerListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomerListView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CustomerListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
