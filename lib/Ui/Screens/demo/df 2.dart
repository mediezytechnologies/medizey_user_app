import 'dart:convert'; 
import 'package:flutter/material.dart'; 
import 'package:http/http.dart' as http; 
  

class Lo extends StatefulWidget { 
  @override 
  _LoState createState() => _LoState(); 
} 
  
class _LoState extends State<Lo> { 
  TextEditingController pinCodeController = TextEditingController(); 
  String pinCodeDetails = ""; 
  
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: Text('Pin Code Details'), 
      ), 
      body: Padding( 
        padding: const EdgeInsets.all(16.0), 
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [ 
            // Text field for entering the PIN code 
            TextField( 
              controller: pinCodeController, 
              keyboardType: TextInputType.number, 
              decoration: InputDecoration(labelText: 'Enter Pin Code'), 
            ), 
            SizedBox(height: 16), 
            // Button to trigger fetching data based on the entered PIN code 
            ElevatedButton( 
              onPressed: () { 
                getDataFromPinCode(pinCodeController.text); 
              }, 
              child: Text('Get Data'), 
            ), 
            SizedBox(height: 16), 
            // Display area for the fetched PIN code details 
            Text(pinCodeDetails), 
          ], 
        ), 
      ), 
    ); 
  } 
  
  // Function to fetch data from API based on the entered PIN code 
  Future<void> getDataFromPinCode(String pinCode) async { 
    final url = "http://www.postalpincode.in/api/pincode/$pinCode"; 
  
    try { 
      final response = await http.get(Uri.parse(url)); 
  
      if (response.statusCode == 200) { 
        final jsonResponse = json.decode(response.body); 
  
        if (jsonResponse['Status'] == 'Error') { 
          // Show a snackbar if the PIN code is not valid 
          showSnackbar(context, "Pin Code is not valid. "); 
          setState(() { 
            pinCodeDetails = 'Pin code is not valid.'; 
          }); 
        } else { 
          // Parse and display details if the PIN code is valid 
          final postOfficeArray = jsonResponse['PostOffice'] as List; 
          final obj = postOfficeArray[0]; 
  
          final district = obj['District']; 
          final state = obj['State']; 
          final country = obj['Country']; 
  
          setState(() { 
            pinCodeDetails = 
                'Details of pin code are:\nDistrict: $district\nState: $state\nCountry: $country'; 
          }); 
        } 
      } else { 
        // Show a snackbar if there is an issue fetching data 
        showSnackbar(context, "Failed to fetch data. Please try again"); 
        setState(() { 
          pinCodeDetails = 'Failed to fetch data. Please try again.'; 
        }); 
      } 
    } catch (e) { 
      // Show a snackbar if an error occurs during the API call 
      showSnackbar(context, "Error Occurred. Please try again"); 
      setState(() { 
        pinCodeDetails = 'Error occurred. Please try again.'; 
      }); 
    } 
  } 
  
  // Function to display a snackbar with a specified message 
  void showSnackbar(BuildContext context, String message) { 
    ScaffoldMessenger.of(context).showSnackBar( 
      SnackBar( 
        content: Text(message), 
        duration: Duration(seconds: 2), // Adjust the duration as needed 
      ), 
    ); 
  } 
} 