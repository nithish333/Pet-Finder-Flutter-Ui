import 'package:flutter/material.dart';
import 'package:pet_finder/model/pet.dart';

class PetCategoryCard extends StatelessWidget {
  final Pet pet;
  const PetCategoryCard({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15)),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: Image.asset(
              pet.imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: pet.condition == "Adoption"
                    ? Colors.orange[100]
                    : pet.condition == "Disappear"
                        ? Colors.red[100]
                        : Colors.blue[100],
              ),
              child: Text(
                pet.condition,
                style: TextStyle(
                  color: pet.condition == "Adoption"
                      ? Colors.orange
                      : pet.condition == "Disappear"
                          ? Colors.red
                          : Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              pet.name,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(Icons.location_on, size: 20, color: Colors.black54),
                Text(
                  pet.location,
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  ' (' '${pet.distance}' ' km' ')',
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
