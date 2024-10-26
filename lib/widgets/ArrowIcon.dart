import 'package:flutter/cupertino.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ion.dart';

const _LEFT = Ion.ios_arrow_left;
const _UP = Ion.ios_arrow_up;
const _DOWN = Ion.ios_arrow_down;
const _RIGHT = Ion.ios_arrow_right;

class ArrowIcon extends Iconify {
  // ignore: unused_element
  ArrowIcon._() : super('');

  const ArrowIcon.Left({super.color, super.key, super.size}) : super(_LEFT);
  const ArrowIcon.Right({super.color, super.key, super.size}) : super(_UP);
  const ArrowIcon.Up({super.color, super.key, super.size}) : super(_DOWN);
  const ArrowIcon.Down({super.color, super.key, super.size}) : super(_RIGHT);
}
