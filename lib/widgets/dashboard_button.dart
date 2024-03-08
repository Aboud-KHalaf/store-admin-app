import 'package:flutter/material.dart';
import 'package:shopsmart_admin_ar/widgets/subtitle_text.dart';

class DashboardButtonWidget extends StatelessWidget {
  const DashboardButtonWidget({
    super.key,
    required this.text,
    required this.image,
    required this.onTap,
  });

  final String text;
  final String image;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.orangeAccent,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: size.width * 0.30,
                width: size.width * 0.30,
              ),
              const SizedBox(
                height: 5,
              ),
              SubtitleTextWidget(label: text)
            ],
          ),
        ),
      ),
    );
  }
}
