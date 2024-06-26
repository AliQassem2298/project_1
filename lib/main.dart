import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/controller/change_password_page_controller.dart';
import 'package:warehouse_manegment_system/controller/forget_password_page_controller.dart';
import 'package:warehouse_manegment_system/controller/home_page_controller_customer.dart';
import 'package:warehouse_manegment_system/controller/home_page_controller_staff.dart';
import 'package:warehouse_manegment_system/controller/profile_page_controller.dart';
import 'package:warehouse_manegment_system/controller/sign_in_page_controller.dart';
import 'package:warehouse_manegment_system/controller/sign_up_page_controller.dart';
import 'package:warehouse_manegment_system/controller/update_user_details_controller.dart';
import 'package:warehouse_manegment_system/controller/welcome_page_controller.dart';
import 'package:warehouse_manegment_system/middlewares/auth_middleware.dart';
import 'package:warehouse_manegment_system/view/pages/change_password_page.dart';
import 'package:warehouse_manegment_system/view/pages/dialog_page.dart';
import 'package:warehouse_manegment_system/view/pages/forget_password_page.dart';
import 'package:warehouse_manegment_system/view/pages/home_page_customer.dart';
import 'package:warehouse_manegment_system/view/pages/home_page_staff.dart';
import 'package:warehouse_manegment_system/view/pages/profile_page.dart';
import 'package:warehouse_manegment_system/view/pages/sign_in_page.dart';
import 'package:warehouse_manegment_system/view/pages/sign_up_page.dart';
import 'package:warehouse_manegment_system/view/pages/update_user_details_page.dart';
import 'package:warehouse_manegment_system/view/pages/welcom_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const WeareHouseManegmentSystem());
}

class WeareHouseManegmentSystem extends StatelessWidget {
  const WeareHouseManegmentSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: WelcomePageController.id,
          page: () => const WelcomePage(),
          middlewares: [
            AuthMiddleare(),
            // RoleMiddleare(),
          ],
        ),
        GetPage(
          name: SignInPageController.id,
          page: () => const SignInPage(),
        ),
        GetPage(
          name: SignUpPageController.id,
          page: () => const SignUpPage(),
        ),
        GetPage(
          name: HomePageControllerStaff.id,
          page: () => const HomePageStaff(),
        ),
        GetPage(
          name: HomePageControllerCustomer.id,
          page: () => const HomePageCustomer(),
        ),
        GetPage(
          name: DialogPage.id,
          page: () => DialogPage(routeName: WelcomePageController.id),
        ),
        GetPage(
          name: ProfilePageController.id,
          page: () => const ProfilePage(),
        ),
        GetPage(
          name: ForgetPasswordPageController.id,
          page: () => const ForgetPasswordPage(),
        ),
        GetPage(
          name: ChangePasswordPageController.id,
          page: () => const ChangePasswordPage(),
        ),
        GetPage(
          name: UpdateUserDetailsController.id,
          page: () => UpdateUserDetailsPage(),
        ),
      ],
      initialRoute: WelcomePageController.id,
    );
  }
}
