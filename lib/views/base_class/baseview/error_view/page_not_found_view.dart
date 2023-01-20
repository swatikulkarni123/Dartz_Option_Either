import 'package:dartz_option_either/data/model/api_response.dart';
import 'package:flutter/material.dart';

class PageNotFoundView extends StatelessWidget {
  ApiFailure apiFailure;
  PageNotFoundView({required this.apiFailure});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 10,
        child: Container(
          decoration: const BoxDecoration(color: Colors.grey),
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.width / 2,
          child: Column(
            children: const [
              Text("Status code"),
              Text("404"),
              Text("Page Not Found")
            ],
          ),
        ),
      ),
    );
  }
}
