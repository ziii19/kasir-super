part of 'printer_bloc.dart';

class PrinterState extends Equatable {
  const PrinterState({
    this.error,
    this.printers = const [],
    this.status = Status.initial,
  });

  factory PrinterState.initial() {
    return const PrinterState();
  }

  final List<BluetoothInfo> printers;
  final Status status;
  final String? error;

  PrinterState copyWith({
    List<BluetoothInfo>? printers,
    Status? status,
    String? error,
  }) {
    return PrinterState(
      error: error,
      printers: printers ?? this.printers,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [error, printers, status];
}
