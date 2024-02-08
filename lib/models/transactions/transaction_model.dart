import 'dart:convert';

import 'package:intl/intl.dart';

abstract class ITransactionModel {
  final String hash;
  final DateTime time;

  ITransactionModel({
    required this.hash,
    required this.time,
  });

  Map<String, dynamic> toMap();

  String get parsedTime => DateFormat('yyyy-MM-dd • HH:mm').format(time);
}

class BTCModel extends ITransactionModel {
  final int size;
  final int blockIndex;
  final int blockHeight;
  final DateTime receivedTime;

  BTCModel({
    required super.hash,
    required super.time,
    required this.size,
    required this.blockIndex,
    required this.blockHeight,
    required this.receivedTime,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'hash': hash,
      'time': time,
      'size': size,
      'block_index': blockIndex,
      'block_height': blockHeight,
      'received_time': receivedTime,
    };
  }

  factory BTCModel.fromMap(Map<String, dynamic> map) {
    return BTCModel(
      hash: map['hash'] ?? '',
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] ?? 0),
      size: map['size'] ?? 0,
      blockIndex: map['block_index'] ?? 0,
      blockHeight: map['block_height'] ?? 0,
      receivedTime: DateTime.fromMillisecondsSinceEpoch(map['time'] ?? 0),
    );
  }
}

/// TEZOS
class XTZModel extends ITransactionModel {
  final String level;
  final String reward;
  final String bonus;
  final String fees;

  XTZModel({
    required super.hash,
    required super.time,
    required this.level,
    required this.reward,
    required this.bonus,
    required this.fees,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'hash': hash,
      'time': time,
      'level': level,
      'reward': reward,
      'bonus': bonus,
      'fees': fees,
    };
  }

  factory XTZModel.fromMap(Map<String, dynamic> map) {
    return XTZModel(
      hash: map['hash'] ?? '',
      time: DateTime.parse(map['time'] ?? ''),
      level: map['level'] ?? '',
      reward: map['reward'] ?? '',
      bonus: map['bonus'] ?? '',
      fees: map['fees'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory XTZModel.fromJson(String source) =>
      XTZModel.fromMap(json.decode(source));
}
