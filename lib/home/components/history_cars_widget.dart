import 'package:fairfax_carros/core/app_colors.dart';
import 'package:flutter/material.dart';

class HistoryCarsWidget extends StatelessWidget {
  final String car;
  final String data;
  const HistoryCarsWidget({
    Key? key, required this.car, required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            decoration: BoxDecoration(
              color: AppColors().terciaryColor,
              borderRadius: BorderRadius.circular(
                200,
              ),
            ),
            height: 41,
            width: 41,
            child: Icon(
              Icons.chat_outlined,
              color: AppColors().primaryColor,
              size: 24,
            ),
          ),
          title: Text(car),
          subtitle: Text(data),
          trailing: Icon(Icons.chevron_right),
        )
      ],
    );
  }
}
