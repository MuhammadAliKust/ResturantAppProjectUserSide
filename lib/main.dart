import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:resturant_rider_app/routes/route_constants.dart';
import 'package:resturant_rider_app/screens/authentication/forgot_password.dart';
import 'package:resturant_rider_app/screens/authentication/login.dart';
import 'package:resturant_rider_app/screens/authentication/signup.dart';
import 'package:resturant_rider_app/screens/home.dart';
import 'package:resturant_rider_app/screens/order/order_history.dart';
import 'package:resturant_rider_app/screens/order/orders_list.dart';
import 'package:resturant_rider_app/screens/payment.dart';
import 'package:resturant_rider_app/screens/profile/detailed_profile.dart';
import 'package:resturant_rider_app/screens/profile/profile.dart';
import 'package:resturant_rider_app/screens/profile/profile_edit.dart';
import 'package:resturant_rider_app/screens/splash_screen.dart';
import 'package:resturant_rider_app/screens/notifications.dart';
import 'package:resturant_rider_app/screens/order/order_details.dart';
import 'package:resturant_rider_app/routes/routes.dart' as Router;
import 'package:resturant_rider_app/shared/variable.dart';

void main() {
  // debugPaintSizeEnabled=true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      home: PaymentMode(),
        // onGenerateRoute: Router.generateRoute,
        // initialRoute: LoginView,
        theme: theme_data);
  }
}
