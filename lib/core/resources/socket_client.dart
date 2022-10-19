import 'dart:developer';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../constants/strings.dart';

class SocketClient {
  late IO.Socket socket;
  static SocketClient? _socketInstance;
  SocketClient._internal() {
    log("OBJECT SOCKET CLIENT CLASS");
    socket = IO.io(baseSocketUri, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
  }
  static SocketClient get instance {
    _socketInstance ??= SocketClient._internal();
    return _socketInstance!;
  }
}
