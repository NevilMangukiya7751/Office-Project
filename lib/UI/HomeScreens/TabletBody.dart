import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../Widget/CommonList.dart';
import '../../constant/ColorConstant.dart';
import '../../constant/imageCOnstant.dart';
import '../HomePage.dart';

class TabletBody extends StatefulWidget {
  const TabletBody({super.key});

  @override
  State<TabletBody> createState() => _TabletBodyState();
}

class _TabletBodyState extends State<TabletBody> {
  var dropValue = "Today";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 20, left: 20),
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
        backgroundColor: Color(0xff93A5CF),
        elevation: 0,
        title: const Text(
          "Dashboard",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: width,
        height: height,
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
                        child: Container(
                          width: width,
                          child: Text(current[index].toString()),
                        ));
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
                    childAspectRatio: 20 / 9,
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Color(0xff93A5CF),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2,
                            spreadRadius: 1,
                            color: Colors.white.withOpacity(0.3),
                            blurStyle: BlurStyle.normal,
                            offset: Offset(1, 2)),
                      ],
                    ),
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
                    buildTableCell('Invoice Number', isHeader: true),
                    buildTableCell('Customer Name', isHeader: true),
                    buildTableCell('Order Date', isHeader: true),
                    buildTableCell('Total Amount', isHeader: true),
                  ],
                ),
                buildTableRow('INV001', 'John Doe', '2023-08-19', '\$150.00'),
                buildTableRow('INV002', 'Jane Smith', '2023-08-20', '\$200.00'),
                buildTableRow(
                    'INV003', 'Mike Johnson', '2023-08-21', '\$250.00'),
                // Add more rows as needed
              ],
            ),
          ],
        ),
      ),
    );
  }
}
