import 'package:flutter_esc_pos_utils/flutter_esc_pos_utils.dart';
import 'package:kasir_super/core/core.dart';
import 'package:kasir_super/features/settings/services/services.dart';

import '../../app/config.dart';
import '../../features/transaction/models/models.dart';

class TicketTemplate {
  TicketTemplate._();

  static Future<List<int>> ticket({TransactionModel? transaction}) async {
    final user = await ProfileServices.getProfile();
    final printer = await StruckServices.get();

    List<int> bytes = [];

    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);
    bytes += generator.setStyles(const PosStyles(height: PosTextSize.size4));
    bytes += generator.reset();

    bytes += generator.text(
      user?.name ?? '${AppConfig.appName} Group',
      styles: const PosStyles(
        bold: true,
        align: PosAlign.center,
        height: PosTextSize.size2,
      ),
    );
    bytes += generator.text(
      printer?.desc ?? 'Instagram : @kasirsuper.id',
      styles: const PosStyles(align: PosAlign.center),
    );

    bytes += generator.hr();

    bytes += generator.row(posColumn(
      'Tipe Pembayaran',
      transaction?.paymentType.valueName ?? 'Tunai',
    ));
    bytes += generator.row(posColumn(
      'Order ID',
      transaction?.referenceId ?? 'TRX-100-10102030405',
    ));

    bytes += generator.hr();

    bytes += title(generator, 'Pesanan');
    bytes += generator.hr();

    if (transaction != null) {
      for (var element in transaction.items) {
        bytes += title(generator, element.title);
        bytes += generator.row(posColumn(
          element.price.toIDR(),
          '${element.qty}x',
        ));
      }
    } else {
      bytes += title(generator, 'Organic Potato');
      bytes += generator.row(posColumn('Rp 18.900', '2x'));
      bytes += title(generator, 'Organic Beans');
      bytes += generator.row(posColumn('Rp 7.000', '1x'));
    }

    bytes += generator.hr();
    bytes += generator.row(posColumn(
      'Subtotal',
      transaction?.amount.toIDR() ?? 'Rp 44.800',
      isBold: true,
    ));

    bytes += generator.hr();

    bytes += title(generator, 'Detail Transaksi');
    bytes += generator.hr();
    bytes += generator.row(posColumn('Jumlah pesanan', '3'));
    bytes += generator.row(
      posColumn(
        'Subtotal',
        transaction?.amount.toIDR() ?? 'Rp 44.800',
      ),
    );
    bytes += generator.row(posColumn('Pajak', 0.toIDR()));
    bytes += generator.row(posColumn(
      'Diskon',
      '- ${transaction?.discount.toIDR() ?? 0.toIDR()}',
    ));
    bytes += generator.hr();
    if (transaction != null) {
      bytes += generator.row(
        posColumn(
          'Total Tagihan',
          (transaction.amount - transaction.discount).toIDR(),
          isBold: true,
        ),
      );
    } else {
      bytes += generator.row(
        posColumn('Total Tagihan', 'Rp 44.800', isBold: true),
      );
    }
    bytes += generator.row(
      posColumn(
        'Total Pembayaran',
        transaction?.payAmount.toIDR() ?? 'Rp. 50.000',
        isBold: true,
      ),
    );
    bytes += generator.hr();
    if (transaction != null) {
      bytes += generator.row(
        posColumn(
            'Total Kembali',
            (transaction.payAmount -
                    (transaction.amount - transaction.discount))
                .toIDR(),
            isBold: true),
      );
    } else {
      bytes += generator.row(
        posColumn('Total Kembali', 'Rp 5.200', isBold: true),
      );
    }

    bytes += generator.emptyLines(1);

    bytes += generator.text(
      printer?.message ?? 'Terimakasih sudah berkunjung.',
      styles: const PosStyles(align: PosAlign.center),
    );
    bytes += generator.text(
      'Powered by ${AppConfig.appName}',
      styles: const PosStyles(align: PosAlign.center),
    );

    bytes += generator.feed(2);
    return bytes;
  }

  static List<int> title(Generator generator, String title) {
    return generator.text(
      title,
      styles: const PosStyles(bold: true),
    );
  }

  static List<PosColumn> posColumn(
    String title,
    String value, {
    bool isBold = false,
  }) {
    return [
      PosColumn(text: title, width: 6, styles: PosStyles(bold: isBold)),
      PosColumn(
        text: value,
        styles: const PosStyles(bold: true, align: PosAlign.right),
        width: 6,
      ),
    ];
  }
}
