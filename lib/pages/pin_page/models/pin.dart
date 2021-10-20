import 'dart:convert';

class Pin {
  final String pin;
  final String salt;
  Pin({
    required this.pin,
    required this.salt,
  });

  Pin copyWith({
    String? pin,
    String? salt,
  }) {
    return Pin(
      pin: pin ?? this.pin,
      salt: salt ?? this.salt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pin': pin,
      'salt': salt,
    };
  }

  factory Pin.fromMap(Map<String, dynamic> map) {
    return Pin(
      pin: map['pin'],
      salt: map['salt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Pin.fromJson(String source) => Pin.fromMap(json.decode(source));

  @override
  String toString() => 'Pin(pin: $pin, salt: $salt)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pin && other.pin == pin && other.salt == salt;
  }

  @override
  int get hashCode => pin.hashCode ^ salt.hashCode;
}
