import 'package:flutter/material.dart';
import 'package:formation_app/core/utils/values/colors.dart';
import 'package:formation_app/features/home_feature/widgets/list_widgets/list_header_widget.dart';

import '../utils/models/animal_model.dart';
import '../widgets/list_widgets/animals_list_item.dart';
import 'animal_details_view.dart';

class AnimalsListView extends StatefulWidget {
  const AnimalsListView({Key? key}) : super(key: key);

  @override
  State<AnimalsListView> createState() => _AnimalsListViewState();
}

class _AnimalsListViewState extends State<AnimalsListView> {
  final List<AnimalModel> _list = [
    AnimalModel(
      name: "Mehrez",
      isMale: true,
      birthdate: '2',
      breed: "bulldog",
      description: "Sousse",
    ),
    AnimalModel(
      name: "Jessie",
      isMale: false,
      birthdate: '10',
      breed: "Chat",
      description: "Sfax",
    ),
    AnimalModel(
      name: "Nina",
      isMale: false,
      birthdate: '1',
      breed: "chat",
      description: "Sahloul",
    ),
    AnimalModel(
      name: "Rex",
      isMale: true,
      birthdate: '2',
      breed: "Berger Allemand",
      description: "Tunis",
    ),
    AnimalModel(
      name: "Tropico",
      isMale: true,
      birthdate: '2',
      breed: "Perroquet",
      description: "somewhere",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    return Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
            top: true,
            child: Stack(children: [


      Padding(
        padding:  EdgeInsets.only(top: size.height*0.18),
        child: ListView.builder(
                    itemCount: _list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return AnimalDetailsView(
                                  animalModel: _list[index],
                                );
                              },
                            ),
                          );
                        },
                        child: AnimalsListItem(
                          animalModel: _list[index],
                        ),
                      );
                    },
                  ),
      ),

              ListHeaderWidget(
                onValueChanged: (String? value) {},
              ),
            ])));
  }
}
