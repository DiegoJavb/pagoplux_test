import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:pagoplux_flutter/src/components/paybox.dart';
import 'package:pagoplux_flutter/src/models/models.dart';

/*
 * Clase demo para uso de botón de pagos flutter
 * Widget con estado
 */
class PayboxDemoPage extends StatefulWidget {
  const PayboxDemoPage({super.key});

  @override
  State<PayboxDemoPage> createState() => _PayboxDemoPageState();
}

class _PayboxDemoPageState extends State<PayboxDemoPage> {
  late PagoPluxModel _paymentModelExample;
  String voucher = 'Pendiente Pago';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // openPpx();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin Flutter PPX'),
        actions: const [
          Icon(Icons.access_alarm),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: size.height / 4),
        margin: const EdgeInsets.all(20),
        height: size.height,
        width: size.width,
        child: Text(
          voucher,
          // this.voucher,
          style: const TextStyle(fontSize: 20.0),
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showMaterialModalBottomSheet(
          useRootNavigator: true,
          elevation: 5,
          expand: true,
          context: context,
          // builder: (_) => Text('data'),
          builder: (_) => ModalPagoPluxView(
            pagoPluxModel: _paymentModelExample,
            onClose: obtenerDatos,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.payments_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  /*
   * Se encarga de iniciar los datos para el proceso de pago
   */
  openPpx() {
    print('Se habre el botón de pagos');
    _paymentModelExample = PagoPluxModel();
    _paymentModelExample.payboxRemail = 'cristian.bastidas@aol.com';
    _paymentModelExample.payboxEnvironment = 'product';
    _paymentModelExample.payboxProduction = false;
    _paymentModelExample.payboxBase0 = 1.0;
    _paymentModelExample.payboxBase12 = 2.212;
    _paymentModelExample.payboxSendname = 'JHON DOE';
    _paymentModelExample.payboxSendmail = 'jhondoe@gmail.com';
    _paymentModelExample.payboxRename = 'PagoPlux Shop';
    _paymentModelExample.payboxDescription = 'Pago desde Flutter';
  }

  Widget crearTop(BuildContext context) {
    return Container(height: 0);
  }

  obtenerDatos(PagoResponseModel datos) {
    voucher = 'Voucher: ${datos.detail!.token}';
    setState(() {});
    print('LLego ${datos.detail!.token}');
  }
}
