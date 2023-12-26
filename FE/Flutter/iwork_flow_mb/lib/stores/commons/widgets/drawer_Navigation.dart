// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iwork_flow_mb/pages/home/home_page.dart';
import 'package:iwork_flow_mb/stores/commons/constants/colors.dart';
import 'package:iwork_flow_mb/stores/commons/constants/url_image_local.dart';
import 'package:iwork_flow_mb/stores/commons/widgets/spacer.dart';
import 'package:iwork_flow_mb/stores/models/widget_models/drawer_model.dart';

class DrawerNavigationWidget extends StatelessWidget {
  final Function onClicked;
  const DrawerNavigationWidget({super.key, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: Column(
        children: [
          SizedBox(
            height: 250,
            child: DrawerHeader(
              margin: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    const Color.fromARGB(255, 0, 98, 179),
                    const Color.fromARGB(255, 41, 139, 219),
                    const Color.fromARGB(255, 128, 180, 223),
                    const Color.fromARGB(255, 208, 234, 255),
                    scheme.background
                  ])),
              child: SizedBox(
                width: 250,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 56,
                      backgroundColor: scheme.background,
                      child: Padding(
                        padding: const EdgeInsets.all(2), // Border radius
                        child: ClipOval(child: SvgPicture.asset(logoImageSVG)),
                      ),
                    ),
                    const SpacerWidget(
                      height: 10,
                    ),
                    const SizedBox(
                      width: 201,
                      child: Column(
                        children: [
                          Text(
                            "LACLONGQUAN",
                            style: TextStyle(
                                fontSize: 24,
                                fontFamily: "PFBeauSansPro-Bold-otf",
                                fontWeight: FontWeight.w900,
                                color: Color.fromARGB(255, 0, 140, 255),
                                letterSpacing: 2),
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "tự tin vươn cao",
                                style: TextStyle(
                                    color: MyColors.secondaryTextColor),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  for (var item in listDrawerItemWidget)
                    AppDrawerTile(
                      index: listDrawerItemWidget.indexOf(item),
                      onTap: onClicked(listDrawerItemWidget.indexOf(item)),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AppDrawerDivider extends StatelessWidget {
  const AppDrawerDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      thickness: 1,
      color: MyColors.borderColor,
      indent: 3,
      endIndent: 3,
    );
  }
}

class AppDrawerTile extends StatelessWidget {
  const AppDrawerTile({
    super.key,
    required this.index,
    required this.onTap,
  });

  final int index;
  final dynamic onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      selected: indexDrawerClicked == index,
      selectedTileColor: MyColors.buttonForgroundActive,
      leading: SvgPicture.asset(
        listDrawerItemWidget[index].iconPath,
        height: 20,
        colorFilter: ColorFilter.mode(
            indexDrawerClicked == index
                ? MyColors.buttonActive
                : MyColors.secondaryIconColor,
            BlendMode.srcIn),
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Text(
          listDrawerItemWidget[index].title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: indexDrawerClicked == index
                ? MyColors.buttonActive
                : MyColors.secondaryIconColor,
          ),
        ),
      ),
    );
  }
}
