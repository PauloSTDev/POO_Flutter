import 'package:flutter/cupertino.dart';
import 'package:poo_flutter/themes/theme_colors.dart';

class ContentDivision extends StatelessWidget {
  const ContentDivision({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeColors.division,
        )
      ),
    );
  }
}
