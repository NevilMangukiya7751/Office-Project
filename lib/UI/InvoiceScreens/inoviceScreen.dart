import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:gap/gap.dart';
import 'package:macos2/constant/imageCOnstant.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart'; // Add printing package to print the invoice
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../constant/service_locator.dart';
import '../../requestData/Inovice.dart';
import '../../view_model/account_vm.dart';
import 'package:pdf/widgets.dart' as pw;

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  late AccountViewModel accountVM;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    accountVM = getIt<AccountViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Invoice'),
          actions: [
            IconButton(
              icon: const Icon(Icons.print),
              onPressed: () {
                _generatePdfAndPrint(context);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    ImageConstant.product,
                    scale: 4,
                  ),
                ),
                Center(
                  child: HeaderSection(),
                ),
                const SizedBox(height: 20),
                InvoiceDetailsSection(
                  inoviceRequest: accountVM.inoviceRequest!,
                ),
                const SizedBox(height: 20),
                InvoiceTable(),
                const SizedBox(height: 20),
                FooterSection(),
              ],
            ),
          ),
        ));
  }

  Future<pw.ImageProvider> imageFromAssetBundle(String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List imageData = bytes.buffer.asUint8List();
    return pw.MemoryImage(imageData);
  }

  Future<void> _generatePdfAndPrint(BuildContext context) async {
    final pdf = pw.Document();

    // Format the date
    String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

    final image = await imageFromAssetBundle('assets/product.png');
    // Create the PDF content
    final imageJpg =
        (await rootBundle.load('assets/product.png')).buffer.asUint8List();

    log("iummmm $image");
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Container(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Center(
                  child: pw.Image(image, width: 100, height: 100),
                ),
                pw.Center(
                  child: pw.Text(
                    'SAHAJANAND ETHENICS',
                    style: pw.TextStyle(
                        fontSize: 24, fontWeight: pw.FontWeight.bold),
                  ),
                ),
                pw.Center(
                  child: pw.Text(
                      'Kurta - Indo Western - Blazer - Jodhpulri - Koti Kurta'),
                ),
                pw.Center(
                  child: pw.Text(
                      '85, First Floor, Dharmanandan Soc., Mahadev Chowk, Mota Varachha, Surat.'),
                ),
                pw.Center(
                  child: pw.Text(
                      'Mo.9313356756 | Follow us: @sahajanand_ethenics'),
                ),
                pw.SizedBox(height: 20),
                pw.Row(
                  children: [
                    pw.Text('Shree: ${accountVM.inoviceRequest!.customerName}',
                        style: const pw.TextStyle()),
                    pw.Spacer(),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Bill No.: 1', style: const pw.TextStyle()),
                        pw.Text('Date: $formattedDate',
                            style: const pw.TextStyle()),
                      ],
                    ),
                  ],
                ),
                pw.SizedBox(height: 20),
                pw.Table(
                  border: pw.TableBorder.all(),
                  columnWidths: const {
                    0: pw.FixedColumnWidth(50), // No.
                    1: pw.FlexColumnWidth(), // Description
                    2: pw.FixedColumnWidth(50), // Qty
                    3: pw.FixedColumnWidth(70), // Rate
                    4: pw.FixedColumnWidth(70), // Amount
                  },
                  children: [
                    pw.TableRow(
                      decoration: const pw.BoxDecoration(),
                      children: [
                        buildTableCellPDF('No.', isHeader: true),
                        buildTableCellPDF('Description', isHeader: true),
                        buildTableCellPDF('Qty.', isHeader: true),
                        buildTableCellPDF('Rate', isHeader: true),
                        buildTableCellPDF('Amount', isHeader: true),
                      ],
                    ),
                    for (int i = 1; i <= 10; i++)
                      pw.TableRow(
                        children: [
                          buildTableCellPDF(i.toString()),
                          buildTableCellPDF('Item $i'),
                          buildTableCellPDF('1'),
                          buildTableCellPDF('\$100.00'),
                          buildTableCellPDF('\$100.00'),
                        ],
                      ),
                  ],
                ),
                pw.SizedBox(height: 20),
                pw.Align(
                    alignment: pw.Alignment.topRight,
                    child: pw.Text("Total: ")),
                pw.SizedBox(height: 50),
                pw.Align(
                  alignment: pw.Alignment.topRight,
                  child: pw.Text('For, SAHAJANAND ETHENICS',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                )
              ],
            ),
          );
        },
      ),
    );

    // Display the PDF and allow printing
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}

pw.TableRow buildTableRow(
    String invoice, String customer, String date, String amount) {
  return pw.TableRow(
    children: [
      buildTableCellPDF(invoice),
      buildTableCellPDF(customer),
      buildTableCellPDF(date),
      buildTableCellPDF(amount),
    ],
  );
}

buildTableCellPDF(String text, {bool isHeader = false, Color? color}) {
  return pw.Container(
    // color: color ?? Colors.transparent,
    padding: const pw.EdgeInsets.all(8.0),
    child: pw.Text(
      text,
      style: pw.TextStyle(
        fontWeight: isHeader ? pw.FontWeight.bold : pw.FontWeight.normal,
        fontSize: 14,
      ),
    ),
  );
}

pdfHeaderSection() {
  pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.center,
    children: [
      pw.Text(
        'SAHAJANAND ETHENICS',
        style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
      ),
      pw.Text('Kurta • Indo Western • Blazer • Jodhpulri • Koti Kurta'),
      pw.Text(
          '85, First Floor, Dharmanandan Soc., Mahadev Chowk, Mota Varachha, Surat.'),
      pw.Text('Mo.9313356756 | Follow us: @sahajanand_ethenics'),
    ],
  );
}

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'SAHAJANAND ETHENICS',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text('Kurta • Indo Western • Blazer • Jodhpulri • Koti Kurta'),
        Text(
            '85, First Floor, Dharmanandan Soc., Mahadev Chowk, Mota Varachha, Surat.'),
        Text('Mo.9313356756 | Follow us: @sahajanand_ethenics'),
      ],
    );
  }
}

class InvoiceDetailsSection extends StatelessWidget {
  final InoviceRequest inoviceRequest;

  // Constructor to accept the data
  const InvoiceDetailsSection({
    super.key,
    required this.inoviceRequest,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shree: ${inoviceRequest.customerName}'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Bill No.:___________'),
                const Gap(5),
                Text('Date: ${inoviceRequest.date}'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class InvoiceTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: const {
        0: FixedColumnWidth(50), // No.
        1: FlexColumnWidth(), // Description
        2: FixedColumnWidth(50), // Qty
        3: FixedColumnWidth(70), // Rate
        4: FixedColumnWidth(70), // Amount
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[300]),
          children: [
            buildTableCell('No.', isHeader: true),
            buildTableCell('Description', isHeader: true),
            buildTableCell('Qty.', isHeader: true),
            buildTableCell('Rate', isHeader: true),
            buildTableCell('Amount', isHeader: true),
          ],
        ),
        for (int i = 1; i <= 10; i++)
          TableRow(
            children: [
              buildTableCell(i.toString()),
              buildTableCell('Item $i'),
              buildTableCell('1'),
              buildTableCell('\$100.00'),
              buildTableCell('\$100.00'),
            ],
          ),
      ],
    );
  }

  Widget buildTableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('Total: \$1000.00', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 50),
        Align(
          alignment: Alignment.topRight,
          child: Text('For, SAHAJANAND ETHENICS',
              style: TextStyle(fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
