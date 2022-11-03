import 'package:app/pages/buscacep/home.dart';
import 'package:app/pages/delivery/pages/delivery_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimacoesPage extends StatefulWidget {
  const AnimacoesPage({Key? key}) : super(key: key);

  @override
  _AnimacoesPageState createState() => _AnimacoesPageState();
}

class _AnimacoesPageState extends State<AnimacoesPage> {
  open(pagina) {
    Navigator.push(context, MaterialPageRoute(builder: pagina));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Portfólio Diego'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Template: Busca CEP'),
            onTap: () => open((_) => const HomePage()),
          ),
          const Divider(),
          ListTile(
            title: const Text('Template: Delivery'),
            onTap: () => open((_) => const DeliveryPage()),
          ),
          const Divider(),
          const SizedBox(
            height: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 180,
                child: Lottie.network(
                    'https://assets1.lottiefiles.com/packages/lf20_VZM1F2RW6m.json'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 180,
                child: Lottie.network(
                    'https://assets1.lottiefiles.com/packages/lf20_eHZRuUxa9i.json'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
