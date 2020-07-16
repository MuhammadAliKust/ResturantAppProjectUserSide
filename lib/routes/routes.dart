import 'package:flutter/material.dart';
import 'package:resturant_rider_app/routes/route_constants.dart';
import 'package:resturant_rider_app/screens/authentication/forgot_password.dart';
import 'package:resturant_rider_app/screens/authentication/login.dart';
import 'package:resturant_rider_app/screens/authentication/signup.dart';
import 'package:resturant_rider_app/screens/notifications.dart';
import 'package:resturant_rider_app/screens/order/order_details.dart';
import 'package:resturant_rider_app/screens/order/order_history.dart';
import 'package:resturant_rider_app/screens/order/orders_list.dart';
import 'package:resturant_rider_app/screens/profile/detailed_profile.dart';
import 'package:resturant_rider_app/screens/profile/profile.dart';
import 'package:resturant_rider_app/screens/splash_screen.dart';
import 'package:resturant_rider_app/screens/undefined_view.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Splash:
      return MaterialPageRoute(builder: (context) => SplashScreen());
    case SignUpView:
      return MaterialPageRoute(builder: (context)=>SignUp());
    case LoginView:
      return MaterialPageRoute(builder: (context)=>Login());
    case ForgotPasswordView:
      return MaterialPageRoute(builder: (context)=>ForgotPassword()); 
    case ProfileView:
      return MaterialPageRoute(builder: (context)=>Profile());   
    case NotificationView:
      return MaterialPageRoute(builder: (context)=>Notifi());
    case DetailedProfileView:
      return MaterialPageRoute(builder: (context)=>DetailedProfile());       
    case OrderHistoryView:
      return MaterialPageRoute(builder: (context)=>OrderHistory());      
    case OrderDetailsView:
      return MaterialPageRoute(builder: (context)=>OrderDetails());
    case OrdersView:
      return MaterialPageRoute(builder: (context)=>OrdersList());      
    default: 
      return MaterialPageRoute(
          builder: (context) => UnDefinedView(name: routeSettings.name));
  }
}
