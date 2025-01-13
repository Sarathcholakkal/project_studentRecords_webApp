import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SearchRecord extends StatelessWidget {
  const SearchRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        var textAlignment =
            sizingInformation.deviceScreenType == DeviceScreenType.desktop
                ? TextAlign.left
                : TextAlign.center;
        late double titleSize;
        late double descriptionSize;
        late SizedBox spaceBox;

        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          titleSize = 50.0;
          descriptionSize = 16.0;
          spaceBox = SizedBox(
            height: 40,
          );
        } else if (sizingInformation.deviceScreenType ==
            DeviceScreenType.tablet) {
          titleSize = 65.0;
          descriptionSize = 18.0;
          spaceBox = SizedBox(
            height: 30,
          );
        } else {
          // For desktop
          titleSize = 80.0;
          descriptionSize = 18.0;
          spaceBox = SizedBox(
            height: 10,
          );
        }

        return Container(
          width: 600,
          height: 80,
          color: Colors.green,
          padding:
              const EdgeInsets.all(16.0), // Added padding for better layout
        );
      },
    );
  }
}
