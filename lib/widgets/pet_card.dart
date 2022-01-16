import 'package:flutter/material.dart';
import 'package:pet_finder/model/pet.dart';

class PetCard extends StatelessWidget {
  final Pet pet;
  final bool large;
  const PetCard({Key? key, required this.pet, required this.large})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Align(
      child: Container(
          margin: const EdgeInsets.only(right: 20),
          width: large ? width * 0.55 : width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  child: Image.asset(
                    pet.imageUrl,
                    height: large ? 150 : 160,
                    width: large ? width * 0.55 : width,
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                      fontSize: large ? 12 : 10,
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
                    Icon(Icons.location_on,
                        size: large ? 20 : 15, color: Colors.black54),
                    Text(
                      pet.location,
                      style: TextStyle(fontSize: large ? 15 : 12),
                    ),
                    Text(
                      ' (' '${pet.distance}' ' km' ')',
                      style: TextStyle(fontSize: large ? 15 : 12),
                    )
                  ],
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.shade300,
              ),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)))),
    );
  }
}
