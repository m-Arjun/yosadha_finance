import 'package:flutter/material.dart';
import 'package:yosadha_finance/bloc/navigation_bloc.dart';
import 'package:yosadha_finance/models/user.dart';
import 'package:yosadha_finance/screens/home/pages/menu_drawer.dart';

class Custadd extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return FormScreen();
  }
}


//---------

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _name;
  String _address;
  String _aadhar;
  String _phoneNumber;
  String _id;

  DatabaseUser dbuser ;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildaddress() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Address'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Address is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _address = value;
      },
    );
  }

  Widget _buildaadhar() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Aadhar'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Aadhar is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _aadhar = value;
      },
    );
  }


  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _phoneNumber = value;
      },
    );
  }

  Widget _buildid() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Id'),
      keyboardType: TextInputType.number,
      validator: (String value) {
         if (value.isEmpty) {
          return 'Id is Required';
        }


        return null;
      },
      onSaved: (String value) {
        _id = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Demo")),
      drawer: Menudrawer(),
      body: Container(
        
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
                      child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildaddress(),
                _buildaadhar(),
                _buildid(),
                _buildPhoneNumber(),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();
                    //dbuser.name=_name;
                    print(_name);
                    print(_address);
                    print(_phoneNumber);
                    print(_aadhar);
                    print(_id);

                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}