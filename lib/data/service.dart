import 'package:googleapis/sheets/v4.dart' as sheets;
import 'package:googleapis_auth/auth_io.dart';
import 'package:intl/intl.dart';

import 'state.dart';

class LService {
  static final _CREDENTIALS = new ServiceAccountCredentials.fromJson(r'''
  {
  "access_type": "offline",
  "type": "service_account",
  "project_id": "thienhabet",
  "private_key_id": "9ac837043819333cd0d178f51867d9271560c22c",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCpGV1QaLCJCs7H\n29IgFzZDKBrC0P7XrTbK4Z2BeDwsW/GCVi59GdOVZX7KkGKqe5cTs3fzHnHyyZDG\nb70oRJWRvVDW5MP5tZCfVlzBPyU9yqv1fYs12krAc8iTFFRHsjMG40GxjEhVVEso\nwlcC1vW0hHADnhQBai86anISPy/wiyFMqwLHPVNKwF0AR9N2xQ8/JxMZ4ABced9T\nQtpWm6iWm4HJjJRJCVWtUxnilcBV2QxxmF8dY9RMYWLlCpC9yjl7eNoMrl7cUgka\n2aPqZRZD/97cuMh5ZaAA0X4Th34VOnDgjLCTsTVVFDa1loOxdjXil2ftn5d5w0W6\nBTTHIe9zAgMBAAECggEAGm27RAgmCzfUC1rZE6iSaQWZb821VCUfgARUwc72bKJu\nyRr0x3BOvYtFjp2UENF3J8jwHDXWblvq04Ypmg5kvV30MVnuIpbU2dUSyHs43q2l\n7vI7seOCX7jY5i/ntOWY4bXevG6l7CbcBldKvR1hUouJFu+mcHWAQyYu2kOOQmRi\n31H9nsPLfI81VNtJW6wp6KRijABQEEL7GBd2gsGmio3wIy83MPHKHeVOR37Ojuzm\nqOm9axBHUZwy/ekpA2Fcrp85Zg6KfgTgUmRyrVJY6SJi8pG6FuAL8hvR5HfCkTd2\nUlYyXhQR62yOzxPDUpjYGLUqeiLR+YtHE5hdk4/EWQKBgQDpwP6/2V2i+4YOlvEs\ns+aLlLHTXYb8cPysYBNO3gKDzzKW4rXsR02UB6+6yyIxCheCcailJAjUkNwbseMM\nkys/cX4i+hAYLLXu9JQprAriFlt07qIHBUhKWnKx+QrbaiNnZgQcuVwCnuZom+fD\nWTqvUXDOdt+MzlEvqxdTB1aeOwKBgQC5MSsD7pE//XMeSSHG/8ftR2tzfJxLijTf\nZXCvzSd0htlbTyi9p7V05rBTdDcas5hPkyGs2WjNX8y6BPvyZ+Lm9hmF0z3ReJhO\nove31zJr6L7bzLTNxtretDOVjqR/nsnabych+03t5+QHKy0NX2fRH84D463jx5o1\npPj1MyZIKQKBgQCfBufJSW4Eta2sO1B0oyeTimO4coalM5ETDIHWQ//eAJZgRHiT\n+KZ0sQ4CvLPUPRNlcUHUp8FCLBMy3ECli3H+xY2U6h8M804K9WXfO+ZjjeZGlRqy\nQAvAWexx3AZg48KWU7c0e353YfdK79Yq9oeQQo3GSOUpfCuLjJBfsjxhhQKBgFYc\nwM3BPxUsOz1X8DbidQqmbRZ0WRDfIRrHxpBYqwIKOkO1GVKnCz9ijZcgsQbff/Fw\njvYa2hq1czMEYksjd2TCBrgts88Vbm0SZnG7xRxcS3NVSrVsxBVOYbYnb+JP6biC\newXYHzKC44tZzkcrl9CsI1W3pwIFrHVJUuJheGmRAoGAMpZbPJBTlcyCwZpbBr7D\nM5CJb7ktrPwGK78lVn12hyn112WQ9HA2Xo8wBesEEliLrHyyOIaK1jnsilJ69XYI\nz7E55+ygiucoL6ylMMShBipSU14lKAdIQJ/HuepGArSXey27Z6f8INfisGVO3gNV\nRSEpeuOF/mbqll/PSGwqQJY=\n-----END PRIVATE KEY-----\n",
  "client_email": "thienhabet@thienhabet.iam.gserviceaccount.com",
  "client_id": "112957253470414951753",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/thienhabet%40thienhabet.iam.gserviceaccount.com"
}
''');

  static final google_api_key = "705447754849-44rctjrj3bn7k0pqf1emlah1vdmg4j5c.apps.googleusercontent.com";
  static final SPREADSHEET_ID = "16bp18HC383ss4Zc1iW6tjfpCi-p-AoWLdbixVlRRZB4";
  static final _SCOPES = const ['https://www.googleapis.com/auth/spreadsheets'];
  static final RANGE_SIGN_UP = 'ThienhaBet!A2:D2';
  static final RANGE_ORDER = 'orders!A1:Q30';
  static final RANGE_MENU = 'menu!A1:Q30';

  static Future<bool> saveSignUp(String name, String sdt, String tk) async {
    var client = await clientViaServiceAccount(_CREDENTIALS, _SCOPES);
    var api = sheets.SheetsApi(client);
    sheets.ValueRange range = sheets.ValueRange();
    List<String> listData = new List();
    var time = DateFormat("dd-MM-yyyy hh:mm a").format(DateTime.now());
    print(time.toString());
    listData.add(time.toString());
    listData.add(name);
    listData.add(sdt);
    listData.add(tk);
    List<List<String>> valueRange = new List();
    valueRange.add(listData);
    range.values = valueRange;
    range.range = RANGE_SIGN_UP;
    print('valueRange=' + valueRange.toString());
    print('range=' + range.range);
    var isPush = false;
    await api.spreadsheets.values.append(range, SPREADSHEET_ID, range.range, valueInputOption: 'USER_ENTERED').then((data) {
      print('data=' + data.toString());
      if (data != null)
        isPush = true;
      else
        isPush = false;
    }).catchError((onError) {
      print(onError);
      isPush = false;
    });
    LState.reset();
    return isPush;
  }

  static Future<List<String>> getData() async {
    sheets.ValueRange result;
    List<String> listData = List();
    var client = await clientViaServiceAccount(_CREDENTIALS, _SCOPES);
    var api = sheets.SheetsApi(client);
    await api.spreadsheets.values.get(SPREADSHEET_ID, RANGE_SIGN_UP).then((_) {
      result = _;
    }).whenComplete(() {
      for (int i = 0; i < result.values.length; i++) {
        //print('values='+ result.values[i].toString());
        for (String data in result.values[i]) {
          listData.add(data);
        }
      }
    });
    //print('orders='+ listData.toString());
    return listData;
  }

  static Future<List<String>> getUsers() async {
    List<String> userList = new List();

    sheets.ValueRange result;
    var api;
    await clientViaServiceAccount(_CREDENTIALS, _SCOPES).then((http_client) {
      api = new sheets.SheetsApi(http_client);
    });

    await api.spreadsheets.values.get(SPREADSHEET_ID, RANGE_SIGN_UP).then((_) {
      result = _;
    }).whenComplete(() {
      for (List<Object> o in result.values) {
        userList.add(o[0]);
      }
    });
    print(userList);
    return userList;
  }

  static Future<List<String>> getOrdersOfCurrentUser() async {
    List<String> orders = new List();
    String currentUser = LState.currentUser;

    sheets.ValueRange result;
    var api;
    await clientViaServiceAccount(_CREDENTIALS, _SCOPES).then((http_client) {
      api = new sheets.SheetsApi(http_client);
    });

    await api.spreadsheets.values.get(SPREADSHEET_ID, RANGE_ORDER).then((_) {
      result = _;
    }).whenComplete(() {
      for (int j = 0; j < result.values.length; j++) {
        List<Object> row = result.values[j];
        if (row[0] == currentUser) {
          LState.setUserRow(j + 1);
          for (int i = 1; i < row.length; i++) {
            orders.add(""); //new Order(result.values[0][i], row[i]));
            LState.setDateToColumn(result.values[0][i], i);
          }
        }
      }
    });

    return orders;
  }

  static Future<Map<String, List<String>>> getMenu() async {
    sheets.ValueRange result;
    Map<String, List<String>> orders = new Map();
    var api;
    await clientViaServiceAccount(_CREDENTIALS, _SCOPES).then((http_client) {
      api = new sheets.SheetsApi(http_client);
    });

    await api.spreadsheets.values.get(SPREADSHEET_ID, RANGE_MENU).then((_) {
      result = _;
    }).whenComplete(() {
      for (String date in result.values[0]) {
        orders.putIfAbsent(date, () => new List());
      }

      for (int i = 2; i < result.values.length; i++) {
        for (int j = 0; j < result.values[i].length; j++) {
          if (result.values[i][j] != '') {
            orders[result.values[0][j]].add(result.values[i][j]);
          }
        }
      }

      for (String key in orders.keys) {
        orders[key].add('');
      }
    });
    //print(orders);
    return orders;
  }

  static saveOrder() async {
    var api;
    await clientViaServiceAccount(_CREDENTIALS, _SCOPES).then((http_client) {
      api = new sheets.SheetsApi(http_client);
    });

    sheets.ValueRange range = new sheets.ValueRange();
    range.range = 'orders!B' +
        LState.userRow.toString() +
        ':' +
        String.fromCharCode(LState.orders.keys.length + 65) +
        LState.userRow.toString();
    print(range.range);
    List<String> order = new List();
    for (int i = 1; i <= LState.orders.keys.length; i++) {
      for (String key in LState.dateToColumn.keys) {
        if (LState.dateToColumn[key] == i) {
          order.add(LState.orders[key]);
        }
      }
    }
    List<List<String>> valueRange = new List();
    valueRange.add(order);
    range.values = valueRange;
    //print(valueRange);
    //print(range);
    api.spreadsheets.values.update(range, SPREADSHEET_ID, range.range, valueInputOption: 'USER_ENTERED');

    LState.reset();
  }
}
