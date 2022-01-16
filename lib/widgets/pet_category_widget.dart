import 'package:flutter/material.dart';

class PetCategoryWidget extends StatelessWidget {
  final String name;
  final String image;
  final Color color;
  final int no;
  const PetCategoryWidget(
      {Key? key,
      required this.name,
      required this.image,
      required this.color,
      required this.no})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade200,
            width: 1,
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: color,
            child: Image.asset(
              image,
              width: 20,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
              ),
              Text(
                'Total of $no',
                style: const TextStyle(fontSize: 13),
              )
            ],
          )
        ],
      ),
    );
  }
}
