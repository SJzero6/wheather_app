import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:provider/provider.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class Mqttprovider with ChangeNotifier {
  static const url = "a3ic1k7itt4ynl-ats.iot.ap-northeast-1.amazonaws.com";

  static const port = 8883;

  static const clientid = 'ESP_8266_dht11';

  final client = MqttServerClient.withPort(url, clientid, port);

  Map<String, dynamic> _logData = {};

  set logData(data) {
    logData = data;
    notifyListeners();
  }

  Map<String, dynamic> get logData => _logData;

  String _rawLogData = "{}";

  set rawLogData(data) {
    _rawLogData = data;
    notifyListeners();
  }

  String get rawLogData => _rawLogData;

  Future<int> newAWSConnect() async {
    client.secure = true;

    client.keepAlivePeriod = 20;

    client.setProtocolV311();

    client.logging(on: true);

    final context = SecurityContext.defaultContext;

    /// add certificate from AWS///

    ByteData crctdata =
        await rootBundle.load('assets/certificates/Device_certificate.pem.crt');
    context.useCertificateChainBytes(crctdata.buffer.asUint8List());

    ByteData authorities =
        await rootBundle.load('assets/certificates/_AmazonRootCA1 .pem');
    context.setClientAuthoritiesBytes(authorities.buffer.asUint8List());

    ByteData keybyte =
        await rootBundle.load('assets/certificates/private.pem.key');
    context.usePrivateKeyBytes(keybyte.buffer.asUint8List());
    client.securityContext = context;

    ///add certificate///

    final mess = MqttConnectMessage()
        .withClientIdentifier('ESP_8266_dht11')
        .startClean();
    client.connectionMessage = mess;

    try {
      print('MQTT client is connecting to AWS');
      await client.connect();
    } on Exception catch (e) {
      print('MQTT client exception - $e');
      client.disconnect();
    }
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print('AWS iot connection succesfully done');

      ///Topic///

      const topic = 'esp8266/pub';
      final maker = MqttClientPayloadBuilder();
      maker.addString('hELLO');

      //client.publishMessage(topic, MqttQos.atLeastOnce, maker.payload!);

      client.subscribe(topic, MqttQos.atLeastOnce);

      client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
        final rcvmsg = c[0].payload as MqttPublishMessage;
        final pt =
            MqttPublishPayload.bytesToStringAsString(rcvmsg.payload.message);
        print(
            'Example::Change notification:: topic is<${c[0].topic}>, payload is <--$pt-->');

        //logData = json.decode(pt);
        rawLogData = pt;

        // heartRate = "${payloadJson["Pulse"]}";
        // bp = "${payloadJson["BP"]}";
        // Btemp = "${payloadJson["Temp"]}";
        // o2 = "${payloadJson["SPO2"]}";
        // _ecg = "${payloadJson["ECG"]}";
      });
    } else {
      print(
          'ERROR MQTT client connection failed - disconnecting, state is ${client.connectionStatus!.state}');
      client.disconnect();
    }
    return 0;
  }
}
