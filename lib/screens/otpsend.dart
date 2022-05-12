import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class Sendotp extends StatefulWidget {
  const Sendotp({Key? key}) : super(key: key);

  @override
  State<Sendotp> createState() => _SendotpState();
}

class _SendotpState extends State<Sendotp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 26.0, top: 50),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: 30,
                // ),
                Text("Verify Phone",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.w700)),
                SizedBox(height: 15),
                Text("Number",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700)),
                SizedBox(height: 5),
                Container(
                  width: 60,
                  child: Divider(
                    thickness: 4,
                    color: Colors.amber,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Enter Your Phone",
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "number to get started",
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 20),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 20),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(16)),
                        child: CountryCodePicker(
                          showDropDownButton: true,
                          // dialogBackgroundColor: Colors.amber.shade200,
                          initialSelection: 'IN',
                          alignLeft: true,
                        ),
                      ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //       hintText: 'India (+91)',
                      //       prefixIcon: Padding(
                      //         padding: const EdgeInsets.only(right: 10.0),
                      //         child: Container(
                      //           height: 50,
                      //           width: 60,
                      //           child: Row(
                      //             children: [
                      //               SizedBox(
                      //                 width: 10,
                      //               ),
                      //               Image(
                      //                 height: 20,
                      //                 image:
                      //                     AssetImage('assets/images/flag.jpeg'),
                      //               ),
                      //               SizedBox(
                      //                 width: 15,
                      //               ),
                      //               Container(
                      //                 width: 1.5,
                      //                 height: 30,
                      //                 color: Colors.grey,
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //       suffixIcon: IconButton(
                      //           onPressed: () {
                      //             CountryCodePicker(
                      //               initialSelection: 'IN',
                      //             ); // CountryCodePicker();
                      //           },
                      //           icon: Icon(Icons.keyboard_arrow_down_rounded)),
                      //       enabledBorder: OutlineInputBorder(
                      //         borderSide: const BorderSide(color: Colors.grey),
                      //         borderRadius: BorderRadius.circular(15),
                      //       ),
                      //       focusedBorder: OutlineInputBorder(
                      //         borderSide: const BorderSide(color: Colors.grey),
                      //         borderRadius: BorderRadius.circular(15),
                      //       )),
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(

                            // isDense: true,
                            hintText: '1234567890',
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),
                            )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 13,
                            shadowColor: Colors.amber,
                            primary: Colors.amber,
                            onPrimary: Colors.black,
                            padding: EdgeInsets.symmetric(
                                horizontal: 45, vertical: 25),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {},
                        child: Text(
                          'Send Code',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
