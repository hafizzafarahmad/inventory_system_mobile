import 'package:flutter/material.dart';
import 'package:inventory_system/core/helper/format_currency.dart';
import 'package:inventory_system/core/helper/format_date.dart';
import 'package:inventory_system/features/transaksi/data/model/transaksi_model.dart';
import 'package:inventory_system/features/transaksi/presentation/controller/transaksi_controller.dart';

import '../../../../core/style/app_color.dart';

class ItemTransaksiWidget extends StatelessWidget{
  final int index;
  final TransaksiData data;
  final TransaksiController controller;
  final String type;

  const ItemTransaksiWidget({Key? key, required this.type, required this.index, required this.data, required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '# ${data.transType}',
              style: TextStyle(
                  fontSize: 14,
                  color: type == 'in' ? Colors.green : Colors.redAccent,
                  fontStyle: FontStyle.italic
              ),
            ),
            Text(
              '${FormatDate.setPlainDate(data.updatedAt!, from: 'yyyy-MM-dd HH:mm:ss', format: 'dd MMMM yyyy HH:mm:ss')}',
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey
              ),
            ),
          ],
        ),
        const SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${data.itemName}',
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              'Sisa Stok: ${formattedCurrency(data.quantity?.toString())}',
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange
              ),
            ),
          ],
        ),

        const SizedBox(height: 5,),
        const Divider(thickness: 2,)
      ],
    );
  }

}