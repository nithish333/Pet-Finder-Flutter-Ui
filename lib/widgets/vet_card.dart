import 'package:flutter/material.dart';
import 'package:pet_finder/model/vet_model.dart';

class VetCard extends StatelessWidget {
  final Vet vet;
  const VetCard({Key? key, required this.vet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            vet.image,
            height: 70,
            width: 70,
            fit: BoxFit.contain,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vet.name,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Phone : ' '${vet.number}')
              ],
            ),
          )
        ],
      ),
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 1),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
