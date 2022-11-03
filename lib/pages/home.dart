import 'package:app/models/endereco_model.dart';
import 'package:app/repositories/cep_repositories.dart';
import 'package:app/repositories/cep_repositories_impl.dart';
import 'package:flutter/material.dart';
import 'package:responsive_ui/responsive_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CepRepositories cepRepositories = CepRepositoriesImpl();
  EnderecoModel? enderecoModel;
  final formKey = GlobalKey<FormState>();
  final cepEC = TextEditingController();
  bool loading = false;

  @override
  void dispose() {
    cepEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar CEP'),
      ),
      body: SingleChildScrollView(
          child: Form(
        key: formKey,
        child: Responsive(children: [
          Column(children: [
            Div(
              divison: const Division(
                colS: 5,
                offsetL: 2,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: cepEC,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Cep Obrigatório';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Div(
              divison: const Division(colS: 2, colXS: 2, colM: 2),
              child: ElevatedButton(
                onPressed: () async {
                  final valid = formKey.currentState?.validate() ?? false;
                  if (valid) {
                    try {
                      setState(() {
                        loading = true;
                      });
                      final endereco = await cepRepositories.getCep(cepEC.text);
                      setState(() {
                        enderecoModel = endereco;
                        loading = false;
                      });
                    } catch (e) {
                      setState(() {
                        enderecoModel = null;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Erro ao buscar endereço")));
                      loading = false;
                    }
                  }
                },
                child: const Text("Buscar"),
              ),
            ),
            Visibility(
                visible: loading, child: const CircularProgressIndicator()),
            enderecoModel != null
                ? Text(
                    '${enderecoModel?.logradouro} ${enderecoModel?.bairro} ${enderecoModel?.localidade} ${enderecoModel?.cep}. ')
                : const SizedBox.shrink(),
          ]),
        ]),
      )),
    );
  }
}