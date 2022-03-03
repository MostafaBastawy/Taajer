import 'package:flutter/material.dart';

const Color figmaPrimaryBlue = Color(0xFF0761FD);
const Color figmaPrimaryRed = Color(0xFFED1C24);
const Color figmaPrimaryYellow = Color(0xFFF1C400);
const Color figmaOurBlack = Color(0xFF1B1D28);

const Color figmaSecondaryGreen = Color(0xFF0BD3C4);
const Color figmaSecondaryRed = Color(0xFFF15A24);

const Color figmaActiveColor = Color(0xFF0761FD);
const Color figmaSuccessColor = Color(0xFF0BD3C4);
const Color figmaErrorColor = Color(0xFFFF3236);

const Color figmaShade1 = Color(0xFF494A53);
const Color figmaShade2 = Color(0xFF49536E);
const Color figmaShade3 = Color(0xFFA4A5A9);

const Color figmaGrey1 = Color(0xFFCDD5E1);
const Color figmaGrey2 = Color(0xFFDEE6EE);
const Color figmaGrey3 = Color(0xFFF4F7FA);

const List<BoxShadow> borderActiveBoxShadow = [
  BoxShadow(
    offset: Offset(0, 0),
    color: Color(0xFFD4E4FF),
    blurRadius: 0,
    spreadRadius: 3,
  ),
  BoxShadow(
    offset: Offset(0, 2),
    color: Color.fromRGBO(0, 0, 0, 0.12),
    blurRadius: 2,
    spreadRadius: -1,
  ),
];

const List<BoxShadow> borderSuccessBoxShadow = [
  BoxShadow(
    offset: Offset(0, 0),
    color: Color(0xFFBDF0E0),
    blurRadius: 0,
    spreadRadius: 3,
  ),
  BoxShadow(
    offset: Offset(0, 2),
    color: Color.fromRGBO(0, 0, 0, 0.12),
    blurRadius: 2,
    spreadRadius: -1,
  ),
];

const List<BoxShadow> borderErrorBoxShadow = [
  BoxShadow(
    offset: Offset(0, 0),
    color: Color(0xFFFFDFDF),
    blurRadius: 0,
    spreadRadius: 3,
  ),
  BoxShadow(
    offset: Offset(0, 2),
    color: Color.fromRGBO(0, 0, 0, 0.12),
    blurRadius: 2,
    spreadRadius: -1,
  ),
];
