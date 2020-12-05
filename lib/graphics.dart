import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

///top bar
class CurvedBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SvgPicture.string(
        '<svg viewBox="0.0 0.0 412.4 1007.2" ><defs><filter id="shadow"><feDropShadow dx="0" dy="3" stdDeviation="6"/></filter></defs><path transform="translate(0.36, 0.0)" d="M 0 0 L 412 0 L 412 892 C 412 919.6142578125 389.6142272949219 942 362 942 L 51.41412353515625 942 C 51.41412353515625 942 0.42041015625 936.888916015625 -0.13995361328125 1004.13330078125 C -0.7003173828125 1071.377685546875 0 0 0 0 Z" fill="#009393" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/></svg>',
        allowDrawingOutsideViewBox: true,
        fit: BoxFit.fill,
    ),
    );
  }
}

///icon
class MainIcon extends StatelessWidget {
  double size = 100.0;
  MainIcon({this.size});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Image.asset(
        'assets/visuals/mainIcon.png',
        scale: 1,
      ),
    );
  }
}
/// dark top bar
class DarkCurvedBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SvgPicture.string(
        '<svg viewBox="-0.4 -869.0 412.4 1007.2" ><defs><filter id="shadow"><feDropShadow dx="0" dy="3" stdDeviation="6"/></filter></defs><path transform="translate(0.0, -869.0)" d="M 0 0 L 412 0 L 412 892 C 412 919.6142578125 389.6142272949219 942 362 942 L 51.41412353515625 942 C 51.41412353515625 942 0.42041015625 936.888916015625 -0.13995361328125 1004.13330078125 C -0.7003173828125 1071.377685546875 0 0 0 0 Z" fill="#057d7d" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/></svg>',
        allowDrawingOutsideViewBox: true,
      ),
    );
  }
}
/*
///inverrted curve
class InvertedCurve extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width-5,
      height: 100,
      child: SvgPicture.string(
        '<svg viewBox="1313.1 2512.6 409.0 93.4" ><defs><filter id="shadow"><feDropShadow dx="0" dy="3" stdDeviation="6"/></filter></defs><path transform="translate(1313.11, 2550.0)" d="M 49.62284088134766 0 L 350.9501342773438 0 C 350.9501342773438 0 379.2310791015625 3.407958984375 395.0688171386719 -13.880126953125 C 410.9065856933594 -31.168212890625 408.8922119140625 -37.3740234375 408.8922119140625 -37.3740234375 L 408.8922119140625 56 L 0 56 L 0 50 C 0 22.38576126098633 22.2169017791748 0 49.62284088134766 0 Z" fill="#009393" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/></svg>',
        allowDrawingOutsideViewBox: true,
      ),
    );
  }
}
*/