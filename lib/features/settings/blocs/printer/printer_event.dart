part of 'printer_bloc.dart';

class PrinterEvent extends Equatable {
  const PrinterEvent();

  @override
  List<Object> get props => [];
}

class TransactionPrinterEvent extends PrinterEvent {
  final TransactionModel transaction;

  const TransactionPrinterEvent(this.transaction);

  @override
  List<Object> get props => [transaction];
}

class GetPrinterEvent extends PrinterEvent {}

class TestPrinterEvent extends PrinterEvent {
  final String macAdd;

  const TestPrinterEvent(this.macAdd);
  @override
  List<Object> get props => [macAdd];
}

class OpenSettingsPrinterEvent extends PrinterEvent {}
