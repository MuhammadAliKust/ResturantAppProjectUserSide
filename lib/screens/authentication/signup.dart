import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:resturant_rider_app/routes/route_constants.dart';
import 'package:resturant_rider_app/shared/variable.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Map<String, dynamic> _formData = {
    'username': null,
    'email': null,
    'password': null
  };

  


  final _formKey = GlobalKey<FormState>();

  int value = 0;

  Widget _buildScreenUI(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 0.08 * MediaQuery.of(context).size.width),
        child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
          SizedBox(height: 30),
          _buildHeading(context),
          SizedBox(height: 30),
          Form(
            key: _formKey,
            child: Column(children: <Widget>[
              _buildNameField(),
              SizedBox(height: 10),
              _buildEmailField(),
              SizedBox(height: 10),
              _buildPhoneField(),
              SizedBox(height: 10),
              _buildAddressField(),
              SizedBox(height: 10),
              _buildPasswordField(),
              SizedBox(height: 10),
              _buildConfirmPasswordField(),
              SizedBox(height: 10),
              _buildTermConditionRow(),
              SizedBox(
                height: 20,
              ),
              _buildButton(),
            ]),
          ),
          SizedBox(
            height: 5,
          ),
          _buildLoginRow(context),
          SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }

  Widget _buildHeading(BuildContext context) {
    return Text(
      'SignUp',
      style: Theme.of(context)
          .textTheme
          .headline5
          .merge(TextStyle(color: my_base_color)),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      onSaved: (val) {
        _formData['username'] = val;
      },
      validator: (val) => val.isEmpty ? 'Username cannot be empty' : null,
      decoration: InputDecoration(
          labelText: 'Username',
          labelStyle: label_style,
          hintText: 'John',
          enabledBorder: enabled_outline_input_border,
          focusedBorder: outline_input_focused_border,
          border: outline_input_border),
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

  Widget _buildPhoneField() {
    return TextFormField(
      onSaved: (val) {
        _formData['email'] = val;
      },
      validator: (value) {
        if (value.isEmpty ||
            !RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
          return 'Please enter a valid phone number';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          labelText: 'Phone #',
          labelStyle: label_style,
          enabledBorder: enabled_outline_input_border,
          focusedBorder: outline_input_focused_border,
          border: outline_input_border),
    );
  }

  Widget _buildAddressField() {
    return TextFormField(
      onSaved: (val) {
        _formData['email'] = val;
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Address cannot be empty.';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          labelText: 'Address',
          labelStyle: label_style,
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
          focusedBorder: outline_input_focused_border,
          border: outline_input_border),
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      onSaved: (val) {
        _formData['password'] = val;
      },
      validator: (val) =>
          val.length < 6 ? 'Password should be more than 6 char.' : null,
      obscureText: true,
      decoration: InputDecoration(
          labelText: 'Confirm Password',
          labelStyle: label_style,
          hintText: 'Should container characters and numbers.',
          enabledBorder: enabled_outline_input_border,
          focusedBorder: outline_input_focused_border,
          border: outline_input_border),
    );
  }

  Widget _buildTermConditionRow() {
    return RadioListTile(
      activeColor: my_base_color,
      value: 1,
      groupValue: value,
      onChanged: (val) {
        setState(() {
          value = val;
        });
      },
      title: Text('I agree to the terms and conditions.'),
    );
  }

  Widget _buildButton() {
    return FlatButton(
      color: Theme.of(context).buttonColor,
      shape: button_border_radius,
      onPressed: () {
        if (!_formKey.currentState.validate()) {
          return;
        }
        _formKey.currentState.save();
        Navigator.pushNamed(context, LoginView);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 30),
        child: Text('Sign Up', style: button_text_style),
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
      'Have an account?',
      style: Theme.of(context).textTheme.subhead,
    );
  }

  Widget _buildLoginLink(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, LoginView);
        },
        child: Text(
          ' SignIn',
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
