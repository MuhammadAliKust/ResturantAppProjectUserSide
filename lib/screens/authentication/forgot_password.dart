import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:resturant_rider_app/routes/route_constants.dart';
import 'package:resturant_rider_app/shared/variable.dart';

class ForgotPassword extends StatelessWidget {
  Map<String, dynamic> _formData = {'email': null};
  final _formKey = GlobalKey<FormState>();
  Widget _buildScreenUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildCustomUIContainer(context),
          Transform.translate(
            offset: Offset(0, -90),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 0.08 * MediaQuery.of(context).size.width),
              child: Column(
                children: <Widget>[
                  Card(
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: _buildForm(context),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  _buildLoginRow(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomUIContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Center(child: _buildHeading(context)),
      height: 250,
      decoration: BoxDecoration(
          color: bg_card_colors,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(children: <Widget>[
          SizedBox(
            height: 30,
          ),
          _buildEmailField(),
          SizedBox(height: 10),
          SizedBox(height: 10),
          _buildButton(context),
          SizedBox(
            height: 30,
          )
        ]),
      ),
    );
  }

  Widget _buildHeading(BuildContext context) {
    return Text(
      'Forgot Password',
      style: Theme.of(context)
          .textTheme
          .headline5
          .merge(TextStyle(color: Colors.white)),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      onSaved: (val) {
        _formData['email'] = val;
      },
      validator: (value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Please enter a valid email';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          labelText: 'Email',
          labelStyle: label_style,
          hintText: 'abc@demo.com',
          enabledBorder: enabled_outline_input_border,
          focusedBorder: outline_input_focused_border,
          border: outline_input_border),
    );
  }

  Widget _buildButton(BuildContext context) {
    return FlatButton(
      shape: button_border_radius,
      onPressed: () {
        if (!_formKey.currentState.validate()) {
          return;
        }
        _formKey.currentState.save();
        Navigator.pushNamed(context, LoginView);
      },
      color: Theme.of(context).buttonColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 30),
        child: Text('Send email link', style: button_text_style),
      ),
    );
  }

  Widget _buildLoginRow(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[_buildRowText(context), _buildLoginLink(context)]);
  }

  Widget _buildRowText(BuildContext context) {
    return Text(
      'Remember Password?',
      style: Theme.of(context).textTheme.subhead,
    );
  }

  Widget _buildLoginLink(BuildContext context) {
    return InkWell(
        onTap: () => Navigator.pushReplacementNamed(context, LoginView),
        child: Text(
          ' Login',
          style: Theme.of(context).textTheme.subtitle1,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: _buildScreenUI(context)));
  }
}
