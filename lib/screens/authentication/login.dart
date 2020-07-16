import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:resturant_rider_app/routes/route_constants.dart';
import 'package:resturant_rider_app/shared/variable.dart';

class Login extends StatelessWidget {
  Map<String, dynamic> _formData = {'email': null, 'password': null};
  final _formKey = GlobalKey<FormState>();

  Widget _buildScreenUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildCustomUIContainer(context),
          Transform.translate(
            offset: Offset(0, -120),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 0.08 * MediaQuery.of(context).size.width),
              child: Column(
                children: <Widget>[
                  _buildCard(context),
                  SizedBox(
                    height: 20,
                  ),
                  _buildDivider(),
                  SizedBox(
                    height: 20,
                  ),
                  _buildButtonRow(),
                  SizedBox(
                    height: 20,
                  ),
                  _buildLoginRow(context),
                  SizedBox(
                    height: 20,
                  ),
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
      child: Column(children: <Widget>[
        SizedBox(
          height: 30,
        ),
        _buildTitle(context),
        _buildSubHeading(context),
        SizedBox(
          height: 20,
        ),
        _buildHeading(context),
      ]),
      height: 300,
      decoration: BoxDecoration(
          color: bg_card_colors,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text('Home Made',
        style: Theme.of(context)
            .textTheme
            .headline3
            .merge(TextStyle(color: Colors.white, letterSpacing: -0.5)));
  }

  Widget _buildSubHeading(BuildContext context) {
    return Text('Easy to sale home made dishes',
        style: Theme.of(context).textTheme.headline6.merge(
              TextStyle(color: Colors.white, letterSpacing: -1),
            ));
  }

  Widget _buildCard(BuildContext context) {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: _buildForm(context),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(children: <Widget>[
          SizedBox(
            height: 40,
          ),
          _buildEmailField(),
          SizedBox(height: 10),
          _buildPasswordField(),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              InkWell(
                  onTap: () => Navigator.pushNamed(context, ForgotPasswordView),
                  child: Text('Forgot Password?')),
            ],
          ),
          SizedBox(height: 10),
          _buildButton(context),
          SizedBox(
            height: 40,
          ),
        ]),
      ),
    );
  }

  Widget _buildHeading(BuildContext context) {
    return Text(
      'Let\'s Start with Login!',
      style: Theme.of(context)
          .textTheme
          .headline5
          .merge(TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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

  Widget _buildPasswordField() {
    return TextFormField(
      onSaved: (val) {
        _formData['password'] = val;
      },
      validator: (val) =>
          val.length < 6 ? 'Password should be more than 6 char.' : null,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: label_style,
        hintText: 'Should container characters and numbers.',
        enabledBorder: enabled_outline_input_border,
        border: outline_input_border,
        focusedBorder: outline_input_focused_border,
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return FlatButton(
      shape: button_border_radius,
      onPressed: () {
        print('pressed');
        if (!_formKey.currentState.validate()) {
          return;
        }
        _formKey.currentState.save();
        Navigator.pushReplacementNamed(context, OrdersView);
      },
      color: Theme.of(context).buttonColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 30),
        child: Text('Login', style: button_text_style),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Divider(
            color: Color(0xffc79035),
            thickness: 1,
          )),
          Text(
            '  OR  ',
          ),
          Expanded(
              child: Divider(
            color: Color(0xffc79035),
            thickness: 1,
          ))
        ],
      ),
    );
  }

  Widget _buildButtonRow() {
    return Row(
      children: <Widget>[
        Expanded(child: _buildGoogleRow()),
        SizedBox(width: 10),
        Expanded(child: _buildFbSignUpButton()),
      ],
    );
  }

  Widget _buildGoogleRow() {
    return FlatButton.icon(
      shape: outline_input_border,
      onPressed: () {},
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Colors.transparent,
      label: Text('Google'),
      icon: Icon(MdiIcons.google),
    );
  }

  Widget _buildFbSignUpButton() {
    return FlatButton.icon(
      shape: button_border_radius,
      onPressed: () {},
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Color(0xff4267b2),
      label: Text('Facebook'),
      textColor: Colors.white,
      icon: Icon(MdiIcons.facebook),
    );
  }

  Widget _buildLoginRow(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[_buildRowText(context), _buildLoginLink(context)]);
  }

  Widget _buildRowText(BuildContext context) {
    return Text(
      'Don\'t have an account?',
      style: Theme.of(context).textTheme.subhead,
    );
  }

  Widget _buildLoginLink(BuildContext context) {
    return InkWell(
        onTap: () => Navigator.pushReplacementNamed(context, SignUpView),
        child: Text(
          ' SignUp',
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
