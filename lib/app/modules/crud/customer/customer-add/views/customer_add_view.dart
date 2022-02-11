import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/customer_add_controller.dart';

class CustomerAddView extends GetView<CustomerAddController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomerAddView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CustomerAddView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
