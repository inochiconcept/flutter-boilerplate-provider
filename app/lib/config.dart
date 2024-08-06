// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const bool PROD = true;

final GlobalKey<NavigatorState> globalNav = GlobalKey<NavigatorState>();

const String appName = "GetFit Mining";
const String apiTkn = "VVEqNmXB2iZaQBA";

const rootUrl = "https://swapi.dev/";
const baseUri = "swapi.dev";
const apiEndpoint = "api/";
const onesignalKey = "";

const logoRed = 0xFFba0909;
const logoBlack = 0xFF454545;
const colRed = 0xFFEB2828;
const colGreen = 0xFF1ba39c;
const colBlue = 0xFF1e8bc3;
const colYellow = 0xFFfad859;
const colOrange = 0xFFeb9532;
const colPurple = 0xFFA649D7;
const colPink = 0xFFFF0062;
const colGreyDark = 0xFF232728;

const colDark = 0xFF001A32;
const mainColor = colBlue;
const secColor = colOrange;

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
