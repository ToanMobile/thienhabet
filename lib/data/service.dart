import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:thienhabet.ltd/data/post_voucher_entity.dart';

class LService {

  static Future<bool> sendVoucher(String name, String sdt, String tk) async {
    var client = new http.Client();
    var isPush = false;
    try {
      var time = DateFormat("dd-MM-yyyy hh:mm a").format(DateTime.now());
      var voucher = PostVoucherEntity(fields: PostVoucherFields(time: time.trim(), name: name.trim(), phone: sdt.trim(), ku: tk.trim())).toJson();
      var response = await client.post('https://api.airtable.com/v0/appXjuVsEcX2l4BvQ/Thienha',
          headers: {HttpHeaders.contentTypeHeader: 'application/json', HttpHeaders.authorizationHeader: 'Bearer keyApYWfKig0i7Qy3'},
          body: json.encode(voucher));
      print(response.statusCode);
      if (response.statusCode == 200)
        isPush = true;
      else
        isPush = false;
    } finally {
      client.close();
    }
    return isPush;
  }
}
