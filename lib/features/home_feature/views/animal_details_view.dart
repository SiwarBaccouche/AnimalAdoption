import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/common_functions.dart';
import '../../../core/utils/values/colors.dart';
import '../../../core/utils/values/styles.dart';
import '../utils/models/animal_model.dart';

class AnimalDetailsView extends StatefulWidget {
  const AnimalDetailsView({
    Key? key,
    required this.animalModel,
  }) : super(key: key);
  final AnimalModel animalModel;

  @override
  State<AnimalDetailsView> createState() => _AnimalDetailsViewState();
}

class _AnimalDetailsViewState extends State<AnimalDetailsView> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;

    return Scaffold(
      backgroundColor: secondaryColor,
      body: SafeArea(
        top: true,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Container(
                height: size.height * 0.9,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  color: Colors.white.withOpacity(0.7),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: size.height * 0.15,
                              left: size.width * 0.05),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(20),
                            backgroundColor: secondaryColor,
                            alignment: Alignment.topRight,
                          ),
                        ),
                      ],
                    ),
                    FadeInImage(
                      placeholder: const AssetImage(
                        'assets/placeholder.jpg',
                      ),
                      image: NetworkImage(
                        widget.animalModel.imagePath ?? '',
                      ),
                      imageErrorBuilder: (context, _, __) {
                        return Image.asset(
                          'assets/persan.png',
                          height: size.height * 0.35,
                          width: size.width * 0.4,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.45,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.animalModel.name ?? '',
                        style: poppinsBold.copyWith(
                          fontSize: getResponsiveItemSize(
                              width: size.width, value: 20),
                        ),
                      ),
                      SizedBox(width: size.width * 0.25),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isPressed = !_isPressed;
                          });
                        },
                        icon: Icon(
                          CupertinoIcons.heart_fill,
                          color:
                              (_isPressed == true) ? Colors.red : Colors.grey,
                          size: size.width * 0.1,
                          shadows: [
                            Shadow(
                                color: Colors.redAccent,
                                blurRadius: (_isPressed == true) ? 30 : 0)
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                  ),
                  Row(
                    children: [
                      Container(
                        width: size.width * 0.3,
                        child: Column(
                          children: [
                            Text(
                              'Age',
                              style: poppinsMedium.copyWith(
                                color: Colors.black54,
                                fontSize: getResponsiveItemSize(
                                    width: size.width, value: 15),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${widget.animalModel.birthdate} years old',
                              style: poppinsMedium.copyWith(
                                color: Colors.black,
                                fontSize: getResponsiveItemSize(
                                    width: size.width, value: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width * 0.3,
                        child: Column(
                          children: [
                            Text(
                              'Gender',
                              style: poppinsMedium.copyWith(
                                color: Colors.black54,
                                fontSize: getResponsiveItemSize(
                                    width: size.width, value: 15),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.animalModel.isMale == true
                                  ? 'Male'
                                  : 'Female',
                              style: poppinsMedium.copyWith(
                                color: Colors.black,
                                fontSize: getResponsiveItemSize(
                                    width: size.width, value: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width * 0.3,
                        child: Column(
                          children: [
                            Text(
                              'Breed',
                              style: poppinsMedium.copyWith(
                                color: Colors.black54,
                                fontSize: getResponsiveItemSize(
                                    width: size.width, value: 15),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.animalModel.breed ?? 'breed',
                              style: poppinsMedium.copyWith(
                                color: Colors.black,
                                fontSize: getResponsiveItemSize(
                                    width: size.width, value: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Text(
                        'Summary',
                        style: poppinsMedium.copyWith(
                          color: Colors.black,
                          fontSize: getResponsiveItemSize(
                            width: size.width,
                            value: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  Container(
                    child: Expanded(
                      child: Scrollbar(
                        thickness: 8,
                        isAlwaysShown: true,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing Lorem ipsum dolor sit amet, consectetur adipiscing Lorem ipsum dolor sit amet, consectetur adipiscing Lorem ipsum dolor sit amet, consectetur adipiscing Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation u',
                              style: poppinsMedium.copyWith(
                                color: Colors.black54,
                                fontSize: getResponsiveItemSize(
                                    width: size.width, value: 17),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: size.height * 0.03,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
