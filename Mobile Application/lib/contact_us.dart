
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            title: Text(
              "Contact Us",
              style: TextStyle(
                color: Colors.white,
              ),
            ),

          ),

          body: ListView(children: <Widget>[

            Center(
                child: Text(
                  ' GHANA NATIONAL FIRE SERVICE CONTACT NUMBERS ',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    color: Colors.orange,
                    height: 3
                  ),

                )),

            SizedBox(height: 20,),
            DataTable(
              columns: [
                DataColumn(label: Text(
                    'Region',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                )),
                DataColumn(label: Text(
                    'Fire Service Number',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                )),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Western Region ')),
                  DataCell(Text('0299346040 / 0312193521')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Brong Ahafo')),
                  DataCell(Text('0299340249 / 0352027129')),

                ]),
                DataRow(cells: [
                  DataCell(Text('Volta Region')),
                  DataCell(Text('0299346042 / 0362026679')),

                ]),
                DataRow(cells: [
                  DataCell(Text('Central Region')),
                  DataCell(Text('0299340499 / 0332132902')),

                ]),

                DataRow(cells: [
                  DataCell(Text('Northern Region')),
                  DataCell(Text('0299346046 / 0322022864 ')),

                ]),

                DataRow(cells: [
                  DataCell(Text('Upper East')),
                  DataCell(Text('0382022277')),

                ]),

                DataRow(cells: [
                  DataCell(Text('Upper West')),
                  DataCell(Text('0392022389')),

                ]),

                DataRow(cells: [
                  DataCell(Text('Greater Accra')),
                  DataCell(Text('0299340499 /0302666576')),

                ]),

                DataRow(cells: [
                  DataCell(Text('Tema')),
                  DataCell(Text('0299340083 / 030320255')),

                ]),

                DataRow(cells: [
                  DataCell(Text('Ashanti Region')),
                  DataCell(Text('0299346044 / 0322022221')),

                ]),

                DataRow(cells: [
                  DataCell(Text('Eastern Region')),
                  DataCell(Text('0299346041 / 0302982062')),

                ]),
              ],
            ),
          ])
      );

  }
}
