import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  double cactusXAlignment = 1.0;

  double playerYAlignment = 0.5;

  double playerInitialY = 0.5;

  double cactusInitialX = 1.2;

  bool? jumpIsAscending = true;

  double jumpPeakHight = -0.5;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? playerJump;
  InstantTimer? CactusMovement;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    playerJump?.cancel();
    CactusMovement?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
