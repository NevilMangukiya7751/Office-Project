import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:macos2/requestData/Inovice.dart';

import '../../Widget/CommonList.dart';
import '../../constant/ColorConstant.dart';
import '../../constant/imageCOnstant.dart';
import '../../constant/service_locator.dart';
import '../../view_model/account_vm.dart';
import '../HomePage.dart';
import '../InvoiceScreens/CreateInvoiceScreen.dart';
import '../InvoiceScreens/inoviceScreen.dart';

class DesktopBody extends StatefulWidget {
  const DesktopBody({super.key});

  @override
  State<DesktopBody> createState() => _DesktopBodyState();
}

class _DesktopBodyState extends State<DesktopBody> {
  var dropValue = "Today";
  String selectedMenu = "Dashboard"; // State variable for selected menu

  late AccountViewModel accountVM;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    accountVM = getIt<AccountViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: const Color(0xff93A5CF),
        title: Text(
          selectedMenu,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          // padding: const EdgeInsets.all(20),
          width: width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff93A5CF),
                Color(0xffE4EfE9),
              ],
            ),
          ),
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*Expanded(
                  child:*/
              Container(
                padding: const EdgeInsets.all(20),
                // decoration: const BoxDecoration(
                //   gradient: LinearGradient(
                //     begin: Alignment.topLeft,
                //     end: Alignment.bottomRight,
                //     colors: [
                //       Color(0xff93A5CF),
                //       Color(0xffE4EfE9),
                //     ],
                //   ),
                // ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 0, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FlutterLogo(
                        size: 100,
                      ),
                      const Gap(20),
                      _buildDrawerItem("Dashboard", Icons.dashboard),
                      const Gap(20),
                      _buildDrawerItem(
                          "Products", const AssetImage(ImageConstant.product)),
                      const Gap(20),
                      _buildDrawerItem("Categories",
                          const AssetImage(ImageConstant.category)),
                      const Gap(20),
                      _buildDrawerItem(
                          "Order", const AssetImage(ImageConstant.order)),
                      const Gap(20),
                      _buildDrawerItem("Order Products",
                          const AssetImage(ImageConstant.orderProduct)),
                    ],
                  ),
                ),
              ),
              const VerticalDivider(),
              // ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(
                    right: 20, top: 20, bottom: 20, left: 20),
                child: _getBodyContent(width,
                    height), // Update body content based on selected menu
              )),
            ],
          )),
    );
  }

  Widget _buildDrawerItem(String title, dynamic icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMenu = title;
        });
      },
      child: Row(
        children: [
          icon is IconData ? Icon(icon) : ImageIcon(icon as AssetImage),
          const Gap(10),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _getBodyContent(double width, double height) {
    switch (selectedMenu) {
      case "Products":
        return _buildProductsScreen(width, height);
      case "Categories":
        return _buildCategoriesScreen(width, height);
      case "Order":
        return _buildOrderScreen(width, height);
      // Add other cases as needed
      default:
        return _buildDashboardScreen(width, height);
    }
  }

  Widget _buildDashboardScreen(double width, double height) {
    return Column(
      children: [
        PopupMenuButton<int>(
          position: PopupMenuPosition.under,
          color: Colors.white,
          itemBuilder: (context) {
            return List.generate(
              current.length,
              (index) {
                return PopupMenuItem<int>(
                  value: index,
                  child: Text(current[index].toString()),
                );
              },
            );
          },
          onSelected: (value) {
            dropValue = current[value].toString();
            setState(() {});
          },
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 10, right: 10),
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Text(
                  dropValue.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_drop_down_outlined,
                  size: 30,
                )
              ],
            ),
          ),
        ),
        const Gap(20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: dashboardList.map((e) {
              return Container(
                width: 170,
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: ColorConstant.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      e.title,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      e.amt,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        const Gap(20),
        Row(
          children: [
            const Text(
              "New Orders",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: ColorConstant.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text("View All Orders"),
            )
          ],
        ),
        const Gap(20),
        Table(
          border: TableBorder.all(),
          columnWidths: const {
            0: FixedColumnWidth(100.0), // Invoice Number column width
            1: FlexColumnWidth(), // Customer Name column width
            2: FixedColumnWidth(120.0), // Order Date column width
            3: FixedColumnWidth(100.0), // Total Amount column width
          },
          children: [
            TableRow(
              decoration:
                  const BoxDecoration(color: ColorConstant.primaryColor),
              children: [
                buildTableCell('Invoice Number', isHeader: true),
                buildTableCell('Customer Name', isHeader: true),
                buildTableCell('Order Date', isHeader: true),
                buildTableCell('Total Amount', isHeader: true),
              ],
            ),
            buildTableRow('INV001', 'John Doe', '2023-08-19', '\$150.00'),
            buildTableRow('INV002', 'Jane Smith', '2023-08-20', '\$200.00'),
            buildTableRow('INV003', 'Mike Johnson', '2023-08-21', '\$250.00'),
            // Add more rows as needed
          ],
        ),
      ],
    );
  }

  TableRow buildTableRow(
      String invoice, String customer, String date, String amount) {
    return TableRow(
      children: [
        buildTableCell(invoice),
        buildTableCell(customer),
        buildTableCell(date),
        buildTableCell(amount),
      ],
    );
  }

  showDeletePopup() async {
    return await showDialog(
          barrierDismissible: false,
          context: context,
          barrierColor: Colors.black87.withOpacity(0.4),
          builder: (context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: Colors.white,
            content: const Text(
              'Are you want to sure delete product?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 40),
                  foregroundColor: Colors.white,
                  backgroundColor: ColorConstant.primaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  'No',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  minimumSize: const Size(100, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  // if (currentIndex == 0) {
                  //   if (Platform.isAndroid) {
                  //     SystemNavigator.pop();
                  //   } else if (Platform.isIOS) {
                  //     exit(0);
                  //   }
                  // } else {
                  Navigator.of(context).pop();
                  // }
                },
                child: const Text('Yes',
                    style: TextStyle(
                      fontSize: 14,
                    )),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  TableRow buildTableRows(
    String productName,
    String code,
    String mrp,
    String sellingPrice,
    String purchasePrice,
    String totalStock,
    String currentStock,
    String soldProduct,
    Widget qrImage,
    String qrNumber,
    Widget action,
  ) {
    return TableRow(
      children: [
        buildTableCells(Text(productName)),
        buildTableCells(Text(code)),
        buildTableCells(Text(mrp)),
        buildTableCells(Text(sellingPrice)),
        buildTableCells(Text(purchasePrice)),
        buildTableCells(Text(totalStock)),
        buildTableCells(Text(currentStock)),
        buildTableCells(Text(soldProduct)),
        buildTableCells(qrImage), // Display the image widget
        buildTableCells(Text(qrNumber)),
        buildTableCells(action),
      ],
    );
  }

  TableRow buildOrderTableRow(
    String productName,
    String code,
    String mrp,
    String sellingPrice,
    String purchasePrice,
    String totalStock,
    String currentStock,
    String soldProduct,
    Widget qrImage,
    Widget action,
  ) {
    return TableRow(
      children: [
        buildTableCells(Text(productName)),
        buildTableCells(Text(code)),
        buildTableCells(Text(mrp)),
        buildTableCells(Text(sellingPrice)),
        buildTableCells(Text(purchasePrice)),
        buildTableCells(Text(totalStock)),
        buildTableCells(Text(currentStock)),
        buildTableCells(Text(soldProduct)),
        buildTableCells(qrImage), // Display the image widget
        buildTableCells(action),
      ],
    );
  }

  Widget buildTableCells(Widget child, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: child,
    );
  }

  Widget _buildProductsScreen(double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorConstant.primaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            minimumSize: const Size(200, 50),
          ),
          child: const Text("Add New Product"),
        ),
        const Gap(20),
        Table(
          border: TableBorder.all(color: Colors.black),
          columnWidths: const {
            0: FixedColumnWidth(200.0), // Product Name
            1: FixedColumnWidth(100.0), // Code
            2: FixedColumnWidth(100.0), // MRP
            3: FixedColumnWidth(100.0), // Selling Price
            4: FixedColumnWidth(120.0), // Purchase Price
            5: FixedColumnWidth(100.0), // Total Stock
            6: FixedColumnWidth(100.0), // Current Stock
            7: FixedColumnWidth(100.0), // Sold Product
            8: FixedColumnWidth(200.0), // QR Code Image
            9: FixedColumnWidth(200.0), // QR Number
            10: FlexColumnWidth(), // Action
          },
          children: [
            TableRow(
              decoration:
                  const BoxDecoration(color: ColorConstant.primaryColor),
              children: [
                buildTableCells(const Text('Product Name',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                buildTableCells(const Text('Code',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                buildTableCells(const Text('MRP',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                buildTableCells(const Text('Selling Price',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                buildTableCells(const Text('Purchase Price',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                buildTableCells(const Text('Total Stock',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                buildTableCells(const Text('Current Stock',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                buildTableCells(const Text('Sold Product',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                buildTableCells(const Text('QR Code Image',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                buildTableCells(const Text('QR Number',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                buildTableCells(const Text('Action',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
              ],
            ),
            buildTableRows(
              'Product 2',
              'P002',
              '\$60.00',
              '\$55.00',
              '\$50.00',
              '200',
              '180',
              '20',
              Image.asset(ImageConstant.category,
                  width: 20, height: 20), // QR Code Image
              'QR002',
              Row(
                children: [
                  const Gap(20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        accountVM.setInoviceRequest = InoviceRequest(
                            customerName: "Nevil",
                            date:
                                DateFormat('dd/MM/yyyy').format(DateTime.now()),
                            item: []);
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InvoiceScreen()));
                    },
                    child: const Icon(Icons.print),
                  ),
                  const Gap(20),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.edit),
                  ),
                  const Gap(20),
                  GestureDetector(
                    onTap: () {
                      showDeletePopup();
                    },
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            )
            // Add more rows as needed
          ],
        ),
      ],
    );
  }

  Widget _buildCategoriesScreen(double width, double height) {
    return Container(
      child: const Center(
        child: Text(
          "Categories Screen",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildOrderScreen(double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreateInvoiceScreen()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorConstant.primaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            minimumSize: const Size(200, 50),
          ),
          child: const Text("Create New Product"),
        ),
        const Gap(20),
        Table(
          border: TableBorder.all(color: Colors.black),
          columnWidths: const {
            0: FixedColumnWidth(200.0), // Inovice Name
            1: FixedColumnWidth(100.0), // Mobile
            2: FlexColumnWidth(), // Customer
            3: FixedColumnWidth(100.0), // Order
            4: FixedColumnWidth(120.0), // Customer
            5: FixedColumnWidth(100.0), //PAy type
            6: FixedColumnWidth(100.0), // Total Amount
            7: FixedColumnWidth(100.0), //Total Discount
            8: FixedColumnWidth(200.0), //Final Amount
            9: FlexColumnWidth(), // Action
          },
          children: [
            TableRow(
              decoration:
                  const BoxDecoration(color: ColorConstant.primaryColor),
              children: [
                buildTableCells(const Text('Inovice No.',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                buildTableCells(const Text('Mobile No.',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                buildTableCells(const Text('Customer Name',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                buildTableCells(const Text('Order Date',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                buildTableCells(const Text('Customer Note',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                buildTableCells(const Text('Payment Type',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                buildTableCells(const Text('Total Amount',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                buildTableCells(const Text('Total Discount',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                buildTableCells(const Text('Final Amount ',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                buildTableCells(const Text('Action',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
              ],
            ),
            buildOrderTableRow(
              'Product 2',
              'P002',
              '\$60.00',
              '\$55.00',
              '\$50.00',
              '200',
              '180',
              '20',
              Image.asset(ImageConstant.category,
                  width: 20, height: 20), // QR Code Image
              Row(
                children: [
                  const Gap(20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        accountVM.setInoviceRequest = InoviceRequest(
                            customerName: "Nevil",
                            date:
                                DateFormat('dd/MM/yyyy').format(DateTime.now()),
                            item: []);
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InvoiceScreen()));
                    },
                    child: const Icon(Icons.print),
                  ),
                  const Gap(20),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.edit),
                  ),
                  const Gap(20),
                  GestureDetector(
                    onTap: () {
                      showDeletePopup();
                    },
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            )
            // Add more rows as needed
          ],
        ),
      ],
    );
  }
}
