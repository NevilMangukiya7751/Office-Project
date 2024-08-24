import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../constant/ColorConstant.dart';
import '../../constant/imageCOnstant.dart';

class CreateInvoiceScreen extends StatefulWidget {
  const CreateInvoiceScreen({super.key});

  @override
  State<CreateInvoiceScreen> createState() => _CreateInvoiceScreenState();
}

class _CreateInvoiceScreenState extends State<CreateInvoiceScreen> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController customerNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController customerNoteController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController invoiceNumberController = TextEditingController();

  TextEditingController dateController = TextEditingController();
  String? _selectedPaymentType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "Invoice",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              controller: mobileController,
                              decoration: const InputDecoration(
                                hintText: "Mobile No.",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Gap(10),
                          Flexible(
                            child: TextFormField(
                              controller: customerNameController,
                              decoration: const InputDecoration(
                                hintText: "Customer Name",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Gap(10),
                          Flexible(
                            child: TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                hintText: "Email(Optional)",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Gap(10),
                          Flexible(
                            child: TextFormField(
                              controller: customerNoteController,
                              decoration: const InputDecoration(
                                hintText: "Customer Note (Optional)",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      TextFormField(
                        controller: addressController,
                        decoration: const InputDecoration(
                          hintText: "Address No.",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(50),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: addressController,
                          decoration: const InputDecoration(
                            hintText: "Address No.",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const Gap(20),
                        TextFormField(
                          controller: addressController,
                          decoration: const InputDecoration(
                            hintText: "Address No.",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
            const Gap(20),
            Table(
              border: TableBorder.all(color: Colors.black),
              columnWidths: const {
                0: FixedColumnWidth(100), // Inovice Name
                1: FlexColumnWidth(), // Mobile
                2: FlexColumnWidth(), // Customer
                3: FixedColumnWidth(100.0), // Order
                4: FixedColumnWidth(100.0), // Customer
                5: FixedColumnWidth(150.0), //PAy type
                6: FixedColumnWidth(150.0), // Total Amount
              },
              children: [
                TableRow(
                  decoration:
                      const BoxDecoration(color: ColorConstant.primaryColor),
                  children: [
                    buildTableCells(const Text('#',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold))),
                    buildTableCells(const Text('Product Scan or Barcode Id',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold))),
                    buildTableCells(const Text('Product Name',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold))),
                    buildTableCells(const Text('QTY',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold))),
                    buildTableCells(const Text('Unit',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold))),
                    buildTableCells(const Text('Price',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold))),
                    buildTableCells(const Text('Amount',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold))),
                  ],
                ),
                buildInvoice(
                  'Product 2',
                  'P002',
                  '\$60.00',
                  '\$55.00',
                  '\$50.00',
                  '200',
                  '180',
                )
                // Add more rows as needed
              ],
            ),
            const Gap(10),
            Container(
              alignment: Alignment.topRight,
              width: 250,
              child: Align(
                alignment: Alignment.topRight,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Discount Type"),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            const Gap(10),
            Container(
              alignment: Alignment.topRight,
              width: 250,
              child: Align(
                alignment: Alignment.topRight,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Discount"),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            const Gap(10),
            Container(
              alignment: Alignment.topRight,
              width: 250,
              child: Align(
                alignment: Alignment.topRight,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Total"),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            const Gap(10),
            Container(
              alignment: Alignment.topRight,
              width: 250,
              child: Align(
                alignment: Alignment.topRight,
                child: DropdownButtonFormField<String>(
                  value: _selectedPaymentType,
                  decoration: const InputDecoration(
                    label: Text("Payment Type"),
                    enabled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConstant.primaryColor)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConstant.primaryColor)),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConstant.primaryColor)),
                  ),
                  items: <String>['Cash', 'Online'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedPaymentType = newValue;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTableCells(Widget child, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: child,
    );
  }

  TableRow buildInvoice(
    String number,
    String productScan,
    String productName,
    String QTY,
    String unit,
    String price,
    String amount,
  ) {
    return TableRow(
      children: [
        buildTableCells(Text(number)),
        buildTableCells(Text(productScan)),
        buildTableCells(Text(productName)),
        buildTableCells(Text(QTY)),
        buildTableCells(Text(unit)),
        buildTableCells(Text(price)),
        buildTableCells(Text(amount)),
      ],
    );
  }
}
