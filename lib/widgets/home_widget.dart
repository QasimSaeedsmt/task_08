import 'package:flutter/material.dart';
import 'package:task_08/constants/constant_resources.dart';
import 'package:task_08/constants/dimension_resource.dart';
import 'package:task_08/constants/string_resources.dart';

class HomeScreenWidget extends StatelessWidget {
  final String? nameValue;
  final String? avatarValue;

  const HomeScreenWidget(
      {super.key, required this.avatarValue, required this.nameValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringResources.HOME_SCREEN_WIDGET_TITLE),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(DimensResource.D_16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(DimensResource.D_16),
              boxShadow: [
                BoxShadow(
                  color:
                      Colors.grey.withOpacity(ConstantsResources.OPACITY_LEVEL),
                  spreadRadius: DimensResource.D_3,
                  blurRadius: DimensResource.D_7,
                  offset: const Offset(DimensResource.D_0, DimensResource.D_3),
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  maxRadius: DimensResource.D_45,
                  backgroundImage:
                      NetworkImage(avatarValue ?? StringResources.EMPTY_STRING),
                ),
                const SizedBox(width: DimensResource.D_16),
                Text(
                  nameValue ?? StringResources.EMPTY_STRING,
                  style: const TextStyle(fontSize: DimensResource.D_45),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
