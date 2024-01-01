import 'package:flutter/material.dart';
import 'package:taxi_app_user/presentation/widget/common/custom_dialog.dart';
import 'package:taxi_app_user/utils/app_text_styles.dart';

class CustomTile extends StatelessWidget {
  final Function()? pageRoute;
  final Icon leadingIcon;
  final String title;
  final bool? isDailogue;

  const CustomTile(
      {super.key,
      this.pageRoute,
      required this.leadingIcon,
      required this.title,
      this.isDailogue = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: isDailogue == false
          ? pageRoute
          : () => ShowDialogue.dialogue(
              context, Colors.red, title, "Are You Sure ?", () => null),
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: leadingIcon,
      ),
      title: Text(
        title,
        style: title == "LogOut"
            ? const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                fontFamily: "Urbanist",
                color: Colors.red)
            : CustomTextStyle.buttonTextStyle,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_sharp,
        size: 18,
        color: title == "LogOut" ? Colors.red : Colors.black,
      ),
    );
  }
}
