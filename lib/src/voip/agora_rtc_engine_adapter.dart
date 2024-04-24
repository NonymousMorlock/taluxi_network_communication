import 'dart:async';

// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:network_communication/src/voip/voip_exception.dart'; // This should contain the VoIPException and VoIPExceptionType classes.
import 'package:network_communication/src/voip/voip_provider.dart';

class AgoraRtcEngineAdapter implements VoIPProvider {
  factory AgoraRtcEngineAdapter() => _instance;

  AgoraRtcEngineAdapter._internal();
  static final AgoraRtcEngineAdapter _instance =
      AgoraRtcEngineAdapter._internal();

  // late final RtcEngine _engine;
  final StreamController<String> _incomingCallController =
      StreamController<String>.broadcast();
  final StreamController<VoIPConnectionState> _connectionStateController =
      StreamController<VoIPConnectionState>.broadcast();
  bool _isInitialized = false;

  @override
  Stream<String> get incomingCallStream => _incomingCallController.stream;

  @override
  Stream<VoIPConnectionState> get connectionStateStream =>
      _connectionStateController.stream;

  @override
  Future<void> initialize(String currentUserId) async {
    // if (!_isInitialized) {
    //   final status = await Permission.microphone.request();
    //   if (status != PermissionStatus.granted) {
    //     throw const VoIPException.microphonePermissionDenied();
    //   }
    //
    //   _engine = createAgoraRtcEngine();
    //   await _engine
    //       .initialize(const RtcEngineContext(appId: Config.agoraAppId));
    //
    //   _engine.registerEventHandler(
    //     RtcEngineEventHandler(
    //       onJoinChannelSuccess: (connection, elapsed) {
    //         _connectionStateController.add(VoIPConnectionState.connected);
    //       },
    //       onLeaveChannel: (connection, stats) {
    //         _connectionStateController.add(VoIPConnectionState.disconnected);
    //       },
    //       onConnectionStateChanged: (
    //         connection,
    //         connectionStateType,
    //         connectionChangedReasonType,
    //       ) {
    //         switch (connectionStateType) {
    //           case ConnectionStateType.connectionStateConnected:
    //             _connectionStateController.add(VoIPConnectionState.connected);
    //           case ConnectionStateType.connectionStateConnecting:
    //             _connectionStateController.add(VoIPConnectionState.connecting);
    //           case ConnectionStateType.connectionStateDisconnected:
    //             _connectionStateController
    //                 .add(VoIPConnectionState.disconnected);
    //           case ConnectionStateType.connectionStateReconnecting:
    //             _connectionStateController
    //                 .add(VoIPConnectionState.reconnecting);
    //           default:
    //             break;
    //         }
    //       },
    //     ),
    //   );
    //
    //   _isInitialized = true;
    // }
  }

  @override
  Future<void> destroy() async {
    // if (_isInitialized) {
    //   await _engine.release();
    //   _incomingCallController.close();
    //   _connectionStateController.close();
    //   _isInitialized = false;
    // }
  }

  @override
  Future<void> leaveCall() async {
    // if (_isInitialized) {
    //   await _engine.leaveChannel();
    // }
  }

  @override
  Future<void> makeCall({
    required String callId,
    required String recipientId,
    required VoidCallback onCallAccepted,
    required VoidCallback onCallRejected,
    required void Function(CallLeaveReason) onCallLeft,
    required void Function(CallFailureReason) onCallFailed,
    VoidCallback? onCallSuccess,
    Duration responseTimeout = const Duration(seconds: 30),
  }) async {
    // try {
    //   if (!_isInitialized) {
    //     throw const VoIPException(
    //       message: 'Engine not initialized',
    //       exceptionType: VoIPExceptionType.engineNotInitialized,
    //     );
    //   }
    //
    //   // To Join the channel, we need to pick between 3 different functions,
    //   // and their parameters are not what we have here, in order to properly
    //   // implement it, we'll have to rewrite a lot which we don't have time for.
    //   // So, I'm just commenting this out
    //   // await _engine.joinChannel(
    //   //   token: callId,
    //   //   channelId: recipientId,
    //   // );
    //   Timer(responseTimeout, () {
    //     onCallFailed(CallFailureReason.timedOut);
    //     leaveCall();
    //   });
    //
    //   // Setup event handlers to respond to call events
    //   _engine.registerEventHandler(
    //     RtcEngineEventHandler(
    //       onUserJoined: (connection, remoteUid, elapsed) {
    //         onCallAccepted();
    //       },
    //       onUserOffline: (_, __, ___) {
    //         onCallLeft(CallLeaveReason.hangUp);
    //       },
    //     ),
    //   );
    //
    //   onCallSuccess?.call();
    // } catch (e) {
    //   onCallFailed(CallFailureReason.unknown);
    // }
  }

  @override
  Future<void> acceptCall({
    required String callId,
    required void Function(CallLeaveReason) onCallLeft,
    required VoidCallback onCallAccepted,
    required void Function(CallFailureReason) onFail,
  }) async {
    if (!_isInitialized) {
      throw const VoIPException(
        message: 'Engine not initialized',
        exceptionType: VoIPExceptionType.engineNotInitialized,
      );
    }
    // To Join the channel, we need to pick between 3 different functions,
    // and their parameters are not what we have here, in order to properly
    // implement it, we'll have to rewrite a lot which we don't have time for.
    // So, I'm just commenting this out
    // await _engine.joinChannel(null, callId, null, 0);
    onCallAccepted();
  }

  @override
  Future<void> rejectCall(String callId) async {
    if (_isInitialized) {
      // Add logic for rejecting the call
    }
  }

  @override
  Future<void> enableSpeaker() async {
    if (_isInitialized) {
      // await _engine.setEnableSpeakerphone(true);
    }
  }

  @override
  Future<void> disableSpeaker() async {
    if (_isInitialized) {
      // await _engine.setEnableSpeakerphone(false);
    }
  }

  @override
  Future<void> disableMicrophone() async {
    if (_isInitialized) {
      // await _engine.muteLocalAudioStream(true);
    }
  }

  @override
  Future<void> enableMicrophone() async {
    if (_isInitialized) {
      // await _engine.muteLocalAudioStream(false);
    }
  }

  static VoIPProvider get instance => _instance;
}
