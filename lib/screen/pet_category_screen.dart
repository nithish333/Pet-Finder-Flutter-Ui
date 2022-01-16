import 'package:flutter/material.dart';
import 'package:pet_finder/model/pet.dart';
import 'package:pet_finder/widgets/pet_card.dart';
import 'package:pet_finder/widgets/pet_category_card.dart';

class PetCategoryScreen extends StatefulWidget {
  const PetCategoryScreen({Key? key}) : super(key: key);

  @override
  _PetCategoryScreenState createState() => _PetCategoryScreenState();
}

class _PetCategoryScreenState extends State<PetCategoryScreen> {
  final List<String> _filters = [];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final String? name = args['category'];

    final List<Pet> pets = getPetList();

    final List<Pet> categoryPets =
        pets.where((pet) => pet.category.toString() == name).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(name == 'BUNNY'
            ? 'Bunny Category'
            : name == 'DOG'
                ? 'Dogs Category'
                : name == 'HAMSTER'
                    ? 'Hamsters Category'
                    : 'Cats Category'),
        actions: const [Icon(Icons.more_horiz_rounded)],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Wrap(
            spacing: 10,
            children: [
              FilterChip(
                backgroundColor: Colors.white,
                checkmarkColor: Colors.white,
                side: BorderSide(color: Colors.grey.shade300),
                label: Text(
                  'Mating',
                  style: TextStyle(
                      color: _filters.contains('Mating')
                          ? Colors.white
                          : Colors.black),
                ),
                selectedColor: Colors.blue,
                selected: _filters.contains('Mating'),
                onSelected: (value) {
                  setState(() {
                    if (value) {
                      _filters.add('Mating');
                    } else {
                      _filters.removeWhere((element) => element == 'Mating');
                    }
                  });
                },
              ),
              FilterChip(
                backgroundColor: Colors.white,
                checkmarkColor: Colors.white,
                side: BorderSide(color: Colors.grey.shade300),
                label: Text(
                  'Adoption',
                  style: TextStyle(
                      color: _filters.contains('Adoption')
                          ? Colors.white
                          : Colors.black),
                ),
                selectedColor: Colors.blue,
                selected: _filters.contains('Adoption'),
                onSelected: (value) {
                  setState(() {
                    if (value) {
                      _filters.add('Adoption');
                    } else {
                      _filters.removeWhere((element) => element == 'Adoption');
                    }
                  });
                },
              ),
              FilterChip(
                backgroundColor: Colors.white,
                checkmarkColor: Colors.white,
                side: BorderSide(color: Colors.grey.shade300),
                label: Text(
                  'Disappear',
                  style: TextStyle(
                      color: _filters.contains('Disappear')
                          ? Colors.white
                          : Colors.black),
                ),
                selectedColor: Colors.blue,
                selected: _filters.contains('Disappear'),
                onSelected: (value) {
                  setState(() {
                    if (value) {
                      _filters.add('Disappear');
                    } else {
                      _filters.removeWhere((element) => element == 'Disappear');
                    }
                  });
                },
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (var i = 0; i < categoryPets.length; ++i)
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/petdetailscreen',
                            arguments: {'name': categoryPets[i].name});
                      },
                      child: PetCategoryCard(pet: categoryPets[i]))
              ],
            ),
          )
        ],
      ),
    );
  }
}
