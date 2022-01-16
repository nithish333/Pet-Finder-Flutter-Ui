import 'package:flutter/material.dart';
import 'package:pet_finder/model/pet.dart';

class PetDetailScreen extends StatelessWidget {
  const PetDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String? name = args['name'];

    final Pet pet = getPetByName(name);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  child: Image.asset(
                    pet.imageUrl,
                    height: height * 0.65,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_rounded)),
                    const Icon(Icons.more_horiz_rounded)
                  ],
                ))
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        pet.name,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 20,
                          ),
                          Text(
                            pet.location,
                            style: const TextStyle(fontSize: 15),
                          ),
                          Text(
                            ' (' '${pet.distance}' ' km' ')',
                            style: const TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: pet.favorite
                        ? Colors.red.shade400
                        : Colors.grey.shade300,
                    child: const Icon(
                      Icons.favorite_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DecriptionBox(
                    t1: '4 months',
                    t2: 'Age',
                    width: width,
                  ),
                  DecriptionBox(
                    t1: 'Grey',
                    t2: 'Color',
                    width: width,
                  ),
                  DecriptionBox(
                    t1: '11 Kg',
                    t2: 'Weight',
                    width: width,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Pet Story',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution',
                style: TextStyle(color: Colors.black54),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration:
                            BoxDecoration(shape: BoxShape.circle, boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 0),
                          )
                        ]),
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          child: CircleAvatar(
                            radius: 21,
                            foregroundImage:
                                AssetImage('assets/user_avatar.jpg'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Posted By'),
                          Text('Nannie Baker')
                        ],
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Contact Me',
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue.shade300,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        shadowColor: Colors.blue[300]!.withOpacity(0.5)),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}

class DecriptionBox extends StatelessWidget {
  final String t1, t2;
  final double width;
  const DecriptionBox({
    Key? key,
    required this.t1,
    required this.t2,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        width: width / 4,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey.shade300, width: 2)),
        child: Column(
          children: [
            Text(
              t1,
              style: const TextStyle(fontWeight: FontWeight.w900),
            ),
            Text(t2)
          ],
        ),
      ),
    );
  }
}
