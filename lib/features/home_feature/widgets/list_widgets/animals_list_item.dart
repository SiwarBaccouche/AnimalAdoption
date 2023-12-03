import 'package:flutter/material.dart';
import 'package:formation_app/features/home_feature/utils/models/animal_model.dart';

import '../../../../core/utils/common_functions.dart';
import '../../../../core/utils/values/colors.dart';
import '../../../../core/utils/values/styles.dart';

class AnimalsListItem extends StatelessWidget {
  const AnimalsListItem({Key? key, required this.animalModel})
      : super(key: key);
  final AnimalModel animalModel;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.02,
        horizontal: size.width * 0.05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: size.width * 0.3,
            height: size.height * 0.25,
            padding: EdgeInsets.all(
              getResponsiveItemSize(
                width: size.width,
                value: 15,
              ),
            ),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  getResponsiveItemSize(
                    width: size.width,
                    value: 20,
                  ),
                ),
              ),
            ),
            child: FadeInImage(
              placeholder: const AssetImage(
                'assets/placeholder.jpg',
              ),
              image: NetworkImage(
                animalModel.imagePath ?? '',
              ),
              imageErrorBuilder: (context, _, __) {
                return Image.asset(
                  'assets/persan.png',
                  width: size.width * 0.3,
                  height: size.height * 0.25,
                );
              },
            ),
          ),
          Container(
            width: size.width * 0.6,
            padding: EdgeInsets.only(
              right: getResponsiveItemSize(width: size.width, value: 15),
              top: getResponsiveItemSize(width: size.width, value: 15),
              left: getResponsiveItemSize(width: size.width, value: 25),
              bottom: getResponsiveItemSize(width: size.width, value: 15),
            ),
            decoration: BoxDecoration(
              color: Color(0xFFFFF8F8),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(
                  getResponsiveItemSize(
                    width: size.width,
                    value: 20,
                  ),
                ),
                topRight: Radius.circular(
                  getResponsiveItemSize(
                    width: size.width,
                    value: 20,
                  ),
                ),
              ),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(animalModel.name ?? '',
                          style: poppinsBold.copyWith(
                              fontSize: getResponsiveItemSize(
                                  width: size.width, value: 20))),
                      Icon(
                        animalModel.isMale == true ? Icons.male : Icons.female,
                        color: secondaryColor,
                        size:
                            getResponsiveItemSize(width: size.width, value: 32),
                      )
                    ],
                  ),
                  SizedBox(
                      height:
                          getResponsiveItemSize(width: size.width, value: 20)),
                  Text(animalModel.breed ?? 'breed',
                      style: poppinsMedium.copyWith(
                          color: Colors.black,
                          fontSize: getResponsiveItemSize(
                              width: size.width, value: 20))),
                  if (animalModel.birthdate != null)
                    Text('${animalModel.birthdate} years old',
                        style: poppinsMedium.copyWith(
                            color: Colors.black,
                            fontSize: getResponsiveItemSize(
                                width: size.width, value: 17))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: secondaryColor,
                        size:
                            getResponsiveItemSize(width: size.width, value: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        animalModel.description ?? 'location',
                        style: poppinsMedium.copyWith(
                            color: Colors.black,
                            fontSize: getResponsiveItemSize(
                                width: size.width, value: 17)),
                      ),
                    ],
                  )
                ]),
          )
        ],
      ),
    );
  }
}
