import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondary,
        body: SafeArea(
          top: true,
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              setState(() {
                _model.jumpIsAscending = true;
              });
              _model.playerJump = InstantTimer.periodic(
                duration: const Duration(milliseconds: 20),
                callback: (timer) async {
                  if (_model.jumpIsAscending!) {
                    setState(() {
                      _model.playerYAlignment = _model.playerYAlignment + -0.05;
                    });
                    if (_model.playerYAlignment <= _model.jumpPeakHight) {
                      setState(() {
                        _model.jumpIsAscending = false;
                      });
                    }
                  } else {
                    setState(() {
                      _model.playerYAlignment = _model.playerYAlignment + 0.03;
                    });
                    if (_model.playerYAlignment >= _model.playerInitialY) {
                      setState(() {
                        _model.jumpIsAscending = true;
                        _model.playerYAlignment = _model.playerInitialY;
                      });
                      _model.playerJump?.cancel();
                    }
                  }
                },
                startImmediately: true,
              );
            },
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/49svh_2.png',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.contain,
                      alignment: const Alignment(0.0, 1.0),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(
                      -1.0,
                      valueOrDefault<double>(
                        _model.playerYAlignment,
                        0.0,
                      )),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/doggy_skateboard.png',
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(
                      valueOrDefault<double>(
                        _model.cactusXAlignment,
                        0.0,
                      ),
                      0.92),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/cactus.png',
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                      alignment: const Alignment(0.0, 0.0),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Cactus X Alignment: ${valueOrDefault<String>(
                            _model.cactusXAlignment.toString(),
                            '1',
                          )}',
                          style: FlutterFlowTheme.of(context).headlineSmall,
                        ),
                        Text(
                          'Player Y Alignment: ${valueOrDefault<String>(
                            _model.playerYAlignment.toString(),
                            '1',
                          )}',
                          style: FlutterFlowTheme.of(context).headlineSmall,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      _model.CactusMovement = InstantTimer.periodic(
                        duration: const Duration(milliseconds: 10),
                        callback: (timer) async {
                          setState(() {
                            _model.cactusXAlignment =
                                _model.cactusXAlignment + -0.01;
                          });
                          if (_model.cactusXAlignment <= -1.5) {
                            setState(() {
                              _model.cactusXAlignment = _model.cactusInitialX;
                            });
                          }
                        },
                        startImmediately: true,
                      );
                    },
                    text: 'Start Game',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).tertiary,
                      textStyle: FlutterFlowTheme.of(context).titleMedium,
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
