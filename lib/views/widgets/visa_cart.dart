import 'package:flutter/material.dart';

class VisaCart extends StatelessWidget {
  const VisaCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome To Visa Cart',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        foregroundColor: const Color.fromARGB(255, 92, 67, 191),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(157, 0, 0, 0),
        actions: [
          IconButton(
            icon: const Icon(Icons.payment),
            onPressed: () {
              // Action when button is pressed, for example, navigate to payment screen
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 16.0),
              child: Text(
                'Payment Details',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, bottom: 16.0),
              child: Text(
                'How would you like to pay ?',
                style: TextStyle(fontSize: 21, color: Colors.black45),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 0.51, 1.0],
                    colors: [
                      Color(0xFF4A22C3),
                      Color(0xFF73A99A),
                      Color(0xFFFDBB2D),
                    ],
                  ),
                ),
                height: 200,
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/images/contact_less.png",
                          height: 20,
                          width: 18,
                        ),
                        Image.asset(
                          "assets/images/mastercard.png",
                          height: 50,
                          width: 50,
                        ),
                      ],
                    ),
                    const Text(
                      '7325 1876 XXXX 9821',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Card Holder',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              'Valid Thru',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Hashim Saffarini',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Text(
                                '12/25',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200.withOpacity(0.7),
                  prefixIcon: const Icon(Icons.credit_card),
                  suffixIcon: Image.asset(
                    "assets/images/mastercard.png",
                    height: 5,
                    width: 5,
                  ),
                  labelText: 'Card Number',
                  hintText: 'Enter your card number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        BorderSide(color: Colors.grey.shade400, width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        BorderSide(color: Colors.grey.shade400, width: 0.5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200.withOpacity(0.7),
                  prefixIcon: const Icon(Icons.person),
                  labelText: 'Card Holder',
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        BorderSide(color: Colors.grey.shade400, width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        BorderSide(color: Colors.grey.shade400, width: 0.5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200.withOpacity(0.7),
                        prefixIcon: const Icon(Icons.security),
                        labelText: 'CVV',
                        hintText: '123',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                              color: Colors.grey.shade400, width: 0.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                              color: Colors.grey.shade400, width: 0.5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ), // Adds space between the two text fields
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200.withOpacity(0.7),
                        prefixIcon: const Icon(Icons.calendar_today),
                        labelText: 'Valid Thru',
                        hintText: 'MM/YY',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                              color: Colors.grey.shade400, width: 0.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                              color: Colors.grey.shade400, width: 0.5),
                        ),
                      ),
                    ),
                  ),
                  // Adds space between the two text fields
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 0.70, 1.9],
                    colors: [
                      Color(0xFF4A22C3),
                      Color(0xFF73A99A),
                      Color(0xFFFDBB2D),
                    ],
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors
                        .transparent, // Make the button's background transparent
                    shadowColor: Colors
                        .transparent, // Remove shadow since it's on a gradient background
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          14.0), // Match Container's border
                    ),
                    // Ensure the button fills the container
                    minimumSize:
                        const Size(double.infinity, 50), // Provide height
                  ),
                  child: const Text(
                    'Pay Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
