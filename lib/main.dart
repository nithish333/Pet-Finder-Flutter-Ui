import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_finder/model/pet.dart';
import 'package:pet_finder/model/pet_category.dart';
import 'package:pet_finder/screen/pet_category_screen.dart';
import 'package:pet_finder/screen/pet_detail_screen.dart';
import 'package:pet_finder/widgets/vet_card.dart';
import './model/vet_model.dart';
import 'package:pet_finder/widgets/pet_card.dart';
import 'package:pet_finder/widgets/pet_category_widget.dart';
import 'package:pet_finder/widgets/row_heading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
      home: const MyHomePage(),
      routes: {
        '/petcategoryscreen': (_) => const PetCategoryScreen(),
        '/petdetailscreen': (_) => const PetDetailScreen()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PetCategory> petCategories = [
      PetCategory('Hamsters', 'assets/hamster.png', Colors.orange.shade100,
          'HAMSTER', 56),
      PetCategory('Cats', 'assets/cat.png', Colors.blue.shade100, 'CAT', 210),
      PetCategory(
          'Bunnies', 'assets/bunny.png', Colors.green.shade100, 'BUNNY', 90),
      PetCategory('Dogs', 'assets/dog.png', Colors.red.shade100, 'DOG', 340)
    ];
    List<Pet> pets = getPetList();
    List<Vet> vets = getVetList();

    List<Pet> newestPets = pets.where((e) => e.newest == true).toList();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.sort,
            color: Colors.black,
          ),
          actions: const [
            Icon(
              Icons.notifications_none,
              color: Colors.black,
            )
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          children: [
            const Text(
              'Find Your',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Lovely pet in anywhere',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    isDense: true,
                    fillColor: Colors.grey[200],
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 25,
                      color: Colors.black,
                    ),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const RowHeading(heading: 'Pet Category'),
            const SizedBox(
              height: 25,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2.5),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/petcategoryscreen',
                      arguments: {'category': petCategories[index].category});
                },
                child: PetCategoryWidget(
                    name: petCategories[index].name,
                    image: petCategories[index].image,
                    color: petCategories[index].color,
                    no: petCategories[index].num),
              ),
              itemCount: petCategories.length,
            ),
            const SizedBox(
              height: 25,
            ),
            const RowHeading(heading: 'Newest Pet'),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 290,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/petdetailscreen',
                        arguments: {'name': newestPets[index].name});
                  },
                  child: PetCard(
                    pet: newestPets[index],
                    large: true,
                  ),
                ),
                itemCount: newestPets.length,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const RowHeading(heading: 'Vets Near You'),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 120,
              width: double.infinity,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => VetCard(
                  vet: vets[index],
                ),
                itemCount: vets.length,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
