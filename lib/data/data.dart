import 'dart:math';
import 'package:flutter/material.dart';

import '../models/exercicio.dart';

List<Exercicio> lst_exercicios = [
  Exercicio(
    id: 'ft${Random().nextInt(9999)}',
    titulo: 'Supino Reto',
    repeticoes: 4,
    series: 12,
    execucao:
        'https://i0.wp.com/www.strengthlog.com/wp-content/uploads/2021/09/bench-press.gif?resize=600%2C600&ssl=1',
    descricao:
        'O supino reto é um exercício que trabalha principalmente os músculos do peito, tríceps e ombros.',
    grupoMuscular: 'peito',
  ),
  Exercicio(
    id: 'ft${Random().nextInt(9999)}',
    titulo: 'Peck Deck',
    repeticoes: 3,
    series: 10,
    execucao:
        'https://i0.wp.com/www.strengthlog.com/wp-content/uploads/2020/04/pec-deck.gif?resize=600%2C600&ssl=1',
    descricao:
        'O Peck Deck é um exercício focado no desenvolvimento dos músculos peitorais, principalmente o peitoral maior.',
    grupoMuscular: 'peito',
  ),
  Exercicio(
    id: 'ft${Random().nextInt(9999)}',
    titulo: 'Rosca Direta',
    repeticoes: 4,
    series: 10,
    execucao:
        'https://i0.wp.com/www.strengthlog.com/wp-content/uploads/2020/12/Barbell-biceps-curl.gif?resize=600%2C600&ssl=1',
    descricao:
        'A Rosca Direta é um exercício que visa o desenvolvimento dos músculos do bíceps braquial, localizado na parte frontal do braço.',
    grupoMuscular: 'biceps',
  ),
  Exercicio(
    id: 'ft${Random().nextInt(9999)}',
    titulo: 'Triceps Pulley',
    repeticoes: 3,
    series: 12,
    execucao:
        'https://i0.wp.com/www.strengthlog.com/wp-content/uploads/2020/03/triceps-pushdown-with-straight-handle.gif?resize=600%2C600&ssl=1',
    descricao:
        'O Triceps Pulley é um exercício que visa o fortalecimento e desenvolvimento dos músculos tríceps, localizados na parte posterior do braço.',
    grupoMuscular: 'triceps',
  ),
];
