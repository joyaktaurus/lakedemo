import 'package:get/get.dart';
import 'package:lakeshore/screens/dashboard/dashboard_binding.dart';
import 'package:lakeshore/screens/dashboard/dashboard_view.dart';
import 'package:lakeshore/screens/edit_details/edit_binding.dart';
import 'package:lakeshore/screens/edit_details/edit_view.dart';
import 'package:lakeshore/screens/edit_form/edit_form_binding.dart';
import 'package:lakeshore/screens/edit_form/edit_form_view.dart';
import 'package:lakeshore/screens/invoice_download/invoice_binding.dart';
import 'package:lakeshore/screens/invoice_download/my_invoice_view.dart';
import 'package:lakeshore/screens/leave_request/leave_request_binding.dart';
import 'package:lakeshore/screens/leave_request/leave_request_view.dart';
import 'package:lakeshore/screens/login/login_binding.dart';
import 'package:lakeshore/screens/login/login_screen.dart';
import 'package:lakeshore/screens/my_attendence/myattendence_bindings.dart';
import 'package:lakeshore/screens/my_attendence/myattendence_view.dart';
import 'package:lakeshore/screens/my_leaves/myleaves_bindings.dart';
import 'package:lakeshore/screens/my_leaves/myleaves_view.dart';
import 'package:lakeshore/screens/my_shift/myshift_bindings.dart';
import 'package:lakeshore/screens/my_shift/myshift_view.dart';
import 'package:lakeshore/screens/noticeboard/noticeboard_bindings.dart';
import 'package:lakeshore/screens/noticeboard/noticeboard_view.dart';
import 'package:lakeshore/screens/profile_image_show/profile_image_binding.dart';
import 'package:lakeshore/screens/profile_image_show/profile_image_view.dart';
import 'package:lakeshore/screens/reset_password/reset_binding.dart';
import 'package:lakeshore/screens/reset_password/reset_password_view.dart';
import 'package:lakeshore/screens/splash_screen/splash_screen.dart';

class Routes {
  static const splash = '/';
  static const login = '/login';
  static const resetPassPage = '/resetpasspage';
  static const dashBoardPage = '/dashboardpage';
  static const myLeavesPage = '/myleavespage';
  static const leaveRequestPage = '/leaverequestpage';
  static const myShiftPage = '/myshiftpage';
  static const noticeBoardPage = '/noticeboardpage';
  static const editViewPage = '/editviewpage';
  static const editFormViewPage = '/editformviewpage';
  static const profileImageViewPage = '/profileimageviewpage';
  static const myAttendViewPage = '/myattendviewpage';
  static const myInvoiceViewPage = '/myinvoiceviewpage';

  static final routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      binding: LoginViewBindings(),
      name: login,
      page: () => const LoginView(),
    ),
    GetPage(
      binding: ResetViewBindings(),
      name: resetPassPage,
      page: () => const ResetPassView(),
    ),
    GetPage(
      binding: DashboardViewBindings(),
      name: dashBoardPage,
      page: () => const DashBoardView(),
    ),
    GetPage(
      binding: MyleavesViewBindings(),
      name: myLeavesPage,
      page: () => const MyLeavesdView(),
    ),
    GetPage(
      binding: LeaveRequestViewBindings(),
      name: leaveRequestPage,
      page: () =>  LeaveRequestView(),
    ),
    GetPage(
      binding: MyShiftViewBindings(),
      name: myShiftPage,
      page: () => const MyShiftView(),
    ),
    GetPage(
      binding: NoticeBoardViewBindings(),
      name: noticeBoardPage,
      page: () => const NoticeBoardView(),
    ),
    GetPage(
      binding: EditViewBindings(),
      name: editViewPage,
      page: () => const EditView(),
    ),
    // GetPage(
    //   binding: EditFormViewBindings(),
    //   name: editFormViewPage,
    //   page: () => const EditFormView(),
    // ),
    GetPage(
      binding: ProfileImageViewBindings(),
      name: profileImageViewPage,
      page: () => const ProfileImageView(),
    ),
    GetPage(
      binding: MyAttendViewBindings(),
      name: myAttendViewPage,
      page: () => MyAttendView(),
    ),
    GetPage(
      binding: MyInvoiceViewBindings(),
      name: myInvoiceViewPage,
      page: () => MyInvoiceView(),
    ),
  ];
}
