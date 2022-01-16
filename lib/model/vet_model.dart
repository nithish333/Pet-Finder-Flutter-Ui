class Vet {
  final String image;
  final String name;
  final String number;

  Vet(this.image, this.name, this.number);
}

List<Vet> getVetList() {
  return <Vet>[
    Vet("assets/vets/vet_0.png", "Animal Emergency Hospital", "(369) 133-8956"),
    Vet("assets/vets/vet_1.png", "Artemis Veterinary Center", "(706) 722-9159"),
    Vet("assets/vets/vet_2.png", "Big Lake Vet Hospital", "(598) 4986-9532"),
    Vet("assets/vets/vet_3.png", "Veterinary Medical Center",
        "(33) 8974-559-555"),
  ];
}
