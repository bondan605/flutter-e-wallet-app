import 'package:bank_sha/models/transaction_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeLatestTransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const HomeLatestTransactionItem({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String setImageThumbnail(String code) {
      String imgAssets = '';
      if (code == 'top_up') {
        imgAssets = 'assets/ic_transaction_cat1.png';
      }

      if (code == 'transfer') {
        imgAssets = 'assets/ic_transaction_cat4.png';
      }

      if (code == 'internet') {
        imgAssets = 'assets/ic_transaction_cat5.png';
      }

      if (code == 'receive') {
        imgAssets = 'assets/ic_transaction_cat2.png';
      }

      return imgAssets;
    }

    return Container(
      margin: EdgeInsets.only(
        bottom: 18,
      ),
      child: Row(
        children: [
          Image.asset(
            setImageThumbnail(transaction.transactionType!.code.toString()),
            width: 48,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.transactionType!.name.toString(),
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  DateFormat('MMM dd')
                      .format(transaction.createdAt ?? DateTime.now()),
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            formatCurrency(
              transaction.amount ?? 0,
              symbol: transaction.transactionType?.action == 'cr' ? '+ ' : '- ',
            ),
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );
  }
}
