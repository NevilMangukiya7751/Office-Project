import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:macos2/constant/ColorConstant.dart';
import 'package:macos2/constant/imageCOnstant.dart';
import 'package:macos2/helper/responsive_layout.dart';

import '../Widget/CommonList.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var dropValue = "Today";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ResponsiveLayout(
      mobileBody: Scaffold(
        backgroundColor: Colors.amber,
        drawer: Drawer(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Column(
                children: [
                  const FlutterLogo(
                    size: 100,
                  ),
                  const Gap(20),
                  GestureDetector(
                    child: const Row(
                      children: [
                        Icon(Icons.dashboard),
                        Gap(10),
                        Text(
                          "Dashboard",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  GestureDetector(
                    child: const Row(
                      children: [
                        ImageIcon(AssetImage(ImageConstant.product)),
                        Gap(10),
                        Text(
                          "Products",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(),
        body: Container(
          width: width,
          height: height,
          color: Colors.blue,
        ),
      ),
      tabletBody: Scaffold(
        drawer: Drawer(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Column(
                children: [
                  const FlutterLogo(
                    size: 100,
                  ),
                  const Gap(20),
                  GestureDetector(
                    child: const Row(
                      children: [
                        Icon(Icons.dashboard),
                        Gap(10),
                        Text(
                          "Dashboard",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  GestureDetector(
                    child: const Row(
                      children: [
                        ImageIcon(AssetImage(ImageConstant.product)),
                        Gap(10),
                        Text(
                          "Products",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  GestureDetector(
                    child: const Row(
                      children: [
                        ImageIcon(AssetImage(ImageConstant.category)),
                        Gap(10),
                        Text(
                          "Categories",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  GestureDetector(
                    child: const Row(
                      children: [
                        ImageIcon(AssetImage(ImageConstant.order)),
                        Gap(10),
                        Text(
                          "Order",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  GestureDetector(
                    child: const Row(
                      children: [
                        ImageIcon(AssetImage(ImageConstant.orderProduct)),
                        Gap(10),
                        Text(
                          "Order Products",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          title: const Text(
            "Dashboard",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          width: width,
          height: height,
          child: Column(
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
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    width: width,
                    height: 45,
                    decoration: BoxDecoration(
                      // color: Colors.red,
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
                    )),
              ),
              Gap(20),
              SizedBox(
                height: 220,
                child: GridView.builder(
                  itemCount: dashboardList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 25 / 9,
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(left: 10),
                      color: ColorConstant.primaryColor,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dashboardList[index].title,
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            dashboardList[index].amt,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  },
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
                      _buildTableCell('Invoice Number', isHeader: true),
                      _buildTableCell('Customer Name', isHeader: true),
                      _buildTableCell('Order Date', isHeader: true),
                      _buildTableCell('Total Amount', isHeader: true),
                    ],
                  ),
                  _buildTableRow(
                      'INV001', 'John Doe', '2023-08-19', '\$150.00'),
                  _buildTableRow(
                      'INV002', 'Jane Smith', '2023-08-20', '\$200.00'),
                  _buildTableRow(
                      'INV003', 'Mike Johnson', '2023-08-21', '\$250.00'),
                  // Add more rows as needed
                ],
              ),
            ],
          ),
        ),
      ),
      desktopBody: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: const Text(
            "Dashboard",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
            // padding: const EdgeInsets.all(20),
            width: width,
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*Expanded(
                  child:*/
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffFFDDE1),
                        Color(0xffEE9CA7),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 0, right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FlutterLogo(
                          size: 100,
                        ),
                        const Gap(20),
                        GestureDetector(
                          child: const Row(
                            children: [
                              Icon(Icons.dashboard),
                              Gap(10),
                              Text(
                                "Dashboard",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const Gap(20),
                        GestureDetector(
                          child: const Row(
                            children: [
                              ImageIcon(AssetImage(ImageConstant.product)),
                              Gap(10),
                              Text(
                                "Products",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const Gap(20),
                        GestureDetector(
                          child: const Row(
                            children: [
                              ImageIcon(AssetImage(ImageConstant.category)),
                              Gap(10),
                              Text(
                                "Categories",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const Gap(20),
                        GestureDetector(
                          child: const Row(
                            children: [
                              ImageIcon(AssetImage(ImageConstant.order)),
                              Gap(10),
                              Text(
                                "Order",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const Gap(20),
                        GestureDetector(
                          child: const Row(
                            children: [
                              ImageIcon(AssetImage(ImageConstant.orderProduct)),
                              Gap(10),
                              Text(
                                "Order Products",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // ),
                Gap(50),
                Expanded(
                  child: Column(
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
                              // color: Colors.red,
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  dropValue.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.arrow_drop_down_outlined,
                                  size: 30,
                                )
                              ],
                            )),
                      ),
                      const Gap(20),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: dashboardList.map((e) {
                          return Container(
                            width: 175,
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
                        }).toList()),
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
                          0: FixedColumnWidth(
                              100.0), // Invoice Number column width
                          1: FlexColumnWidth(), // Customer Name column width
                          2: FixedColumnWidth(120.0), // Order Date column width
                          3: FixedColumnWidth(
                              100.0), // Total Amount column width
                        },
                        children: [
                          TableRow(
                            decoration: const BoxDecoration(
                                color: ColorConstant.primaryColor),
                            children: [
                              _buildTableCell('Invoice Number', isHeader: true),
                              _buildTableCell('Customer Name', isHeader: true),
                              _buildTableCell('Order Date', isHeader: true),
                              _buildTableCell('Total Amount', isHeader: true),
                            ],
                          ),
                          _buildTableRow(
                              'INV001', 'John Doe', '2023-08-19', '\$150.00'),
                          _buildTableRow(
                              'INV002', 'Jane Smith', '2023-08-20', '\$200.00'),
                          _buildTableRow('INV003', 'Mike Johnson', '2023-08-21',
                              '\$250.00'),
                          // Add more rows as needed
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  TableRow _buildTableRow(
      String invoice, String customer, String date, String amount) {
    return TableRow(
      children: [
        _buildTableCell(invoice),
        _buildTableCell(customer),
        _buildTableCell(date),
        _buildTableCell(amount),
      ],
    );
  }

  Widget _buildTableCell(String text, {bool isHeader = false, Color? color}) {
    return Container(
      color: color ?? Colors.transparent,
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: 14,
        ),
      ),
    );
  }
}
