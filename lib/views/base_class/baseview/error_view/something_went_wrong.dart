import 'package:dartz_option_either/data/model/api_response.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommonErrorLayout extends StatelessWidget {
  ApiFailure apiFailure;
  CommonErrorLayout({Key? key, required this.apiFailure}) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Status code",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "${apiFailure.statusCode}",
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                apiFailure.message,
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
