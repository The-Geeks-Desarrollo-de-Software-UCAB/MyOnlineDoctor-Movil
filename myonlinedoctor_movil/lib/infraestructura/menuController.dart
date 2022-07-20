import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:myonlinedoctor_movil/infraestructura/routes.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/helpers/appcolors.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = dashBoardPageRoute.obs;
  var hoverItem = "".obs;

  changeActiveitemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value == itemName;
  isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case dashBoardPageRoute:
        return _customIcon(Icons.home, itemName);

      case "Citas Pendientes":
        return _customIcon(Icons.schedule, itemName);

      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName))
      return Icon(icon, size: 22, color: AppColors.MAINCOLOR3);

    return Icon(icon,
        color: isHovering(itemName) ? AppColors.MAINCOLOR3 : AppColors.GREY);
  }
}
