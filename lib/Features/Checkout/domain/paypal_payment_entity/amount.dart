import 'package:dartz/dartz.dart';

import '../../../../Shared/get_currency.dart';
import '../order_entity.dart';
import 'details.dart';

class Amount {
  final String? total;
  final String? currency;
  final Details? details;
  Amount({this.total, this.currency, this.details});

  // factory Amount.fromJson(Map<String, dynamic> json) {
  //   return Amount(
  //     total: json["total"] as String?,
  //     currency: json["currency"],
  //     details:
  //         json["details"] == null
  //             ? null
  //             : Details.fromJson(json["details"] as Map<String, dynamic>),
  //   );
  // }
  toJson() => {
    "total": total,
    "currency": currency,
    "details": details!.toJson(),
  };

  factory Amount.fromEntity(OrderEntity entity) {
    return Amount(total: entity.calculateTotalPriceAfterdicountAndShipping().toString() ,
    currency: getCurrency(),
      details: Details.fromEntity(entity),
    );
  }
}
