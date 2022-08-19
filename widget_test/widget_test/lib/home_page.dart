import 'package:flutter/material.dart';

import 'secound_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                print('Salvando..');
              },
              child: const Text('Salvar'),
            ),
            ElevatedButton(
              key: const Key('button_duplicated'),
              onPressed: () {
                print('Salvando duplicado..');
              },
              child: const Text('Salvar 2'),
            ),
            InkWell(
              onTap: () {
                print('Editando');
              },
              child: const Text('Edit'),
            ),
            MaterialButton(
              key: const Key('ink_long_press'),
              onPressed: () {
                print('Atualizando..');
              },
              onLongPress: () {
                print('Long Press Atualizando');
              },
              child: const Text('Atualizar'),
            ),
            TextButton(
              key: const Key('button_delete'),
              onPressed: () {
                print('Excluindo..');
              },
              child: const Text('Excluír'),
            ),
            IconButton(
              tooltip: 'Button Refresh',
              icon: const Icon(Icons.refresh),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SecoundPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
