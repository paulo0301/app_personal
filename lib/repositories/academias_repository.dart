import 'package:app_personal/models/academia.dart';
import 'package:flutter/material.dart';

class AcademiasRepository extends ChangeNotifier {
  final List<Academia> _academias = [
    Academia(
      nome: 'Oficial Power Fitness 24 hs',
      endereco:
          'Av. Itapetinga, 270 A - Potengi, Natal - RN, 59112-110, Brasil',
      latitude: -5.8265265,
      longitude: -35.201424,
    ),
    Academia(
      nome: 'Academia Personalfit',
      endereco:
          'Av. Dr. João Medeiros Filho, 4767 - Loja 01 - Pajuçara, Natal - RN, 59122-518, Brasil',
      latitude: -5.805272,
      longitude: -35.215983,
    ),
    Academia(
      nome: 'Império Fitness Academia',
      endereco:
          'Av. Moema Tinoco da Cunha Lima, 500A - Pajuçara, Natal - RN, 59122-335, Brasil',
      latitude: -5.808755,
      longitude: -35.214137,
    ),
    Academia(
      nome: 'Gêmeos Fit Academia',
      endereco: 'R. Belo Horizonte, 361 - Rocas, Natal - RN, 59010-280, Brasil',
      latitude: -5.774016,
      longitude: -35.212901,
    ),
    Academia(
      nome: 'Rocks Fit - academia',
      endereco:
          'R. Cel. Flamínio, 32 - Santos Reis, Natal - RN, 59010-500, Brasil',
      latitude: -5.773234,
      longitude: -35.216199,
    ),
    Academia(
      nome: 'Smart Fit Natal Shopping',
      endereco:
          'Av. Sen. Salgado Filho, 2234 - Candelária, Natal - RN, 59064-900, Brasil',
      latitude: -5.796735,
      longitude: -35.205826,
    ),
    Academia(
      nome: 'Top Fit Academia',
      endereco:
          'Av. Amintas Barros, 3000 - Lagoa Nova, Natal - RN, 59056-100, Brasil',
      latitude: -5.819236,
      longitude: -35.197589,
    ),
    Academia(
      nome: 'Corpus Academia',
      endereco: 'R. Mossoró, 780 - Petrópolis, Natal - RN, 59020-400, Brasil',
      latitude: -5.790993,
      longitude: -35.198769,
    ),
    Academia(
      nome: 'Arena Fitness',
      endereco:
          'Av. Prudente de Morais, 6600 - Candelária, Natal - RN, 59067-510, Brasil',
      latitude: -5.791465,
      longitude: -35.212627,
    ),
    Academia(
      nome: 'Bio Ritmo Academia',
      endereco:
          'Av. Engenheiro Roberto Freire, 3939 - Capim Macio, Natal - RN, 59082-100, Brasil',
      latitude: -5.860996,
      longitude: -35.182068,
    ),
    Academia(
      nome: 'Espaço Vida Saudável Academia',
      endereco: 'R. São José, 678 - Lagoa Nova, Natal - RN, 59056-480, Brasil',
      latitude: -5.817545,
      longitude: -35.198739,
    ),
    Academia(
      nome: 'Academia Fórmula',
      endereco:
          'Av. Hermes da Fonseca, 1296 - Tirol, Natal - RN, 59020-300, Brasil',
      latitude: -5.793633,
      longitude: -35.200393,
    ),
    Academia(
      nome: 'Academia Infinity',
      endereco: 'R. Apodi, 500 - Tirol, Natal - RN, 59020-160, Brasil',
      latitude: -5.794545,
      longitude: -35.197545,
    ),
    Academia(
      nome: 'Well Prime',
      endereco:
          'Av. Sen. Salgado Filho, 2234 - Lagoa Nova, Natal - RN, 59056-000, Brasil',
      latitude: -5.796735,
      longitude: -35.205826,
    ),
    Academia(
      nome: 'Bluefit',
      endereco:
          'Av. Prudente de Morais, 3805 - Candelária, Natal - RN, 59067-510, Brasil',
      latitude: -5.791465,
      longitude: -35.212627,
    ),
    Academia(
      nome: 'Pratique Fitness',
      endereco:
          'R. Jaguarari, 2886 - Lagoa Nova, Natal - RN, 59054-500, Brasil',
      latitude: -5.810831,
      longitude: -35.202409,
    ),
    Academia(
      nome: 'Selfit Academia',
      endereco: 'Av. Afonso Pena, 945 - Tirol, Natal - RN, 59020-100, Brasil',
      latitude: -5.796273,
      longitude: -35.198723,
    ),
    Academia(
      nome: 'Power Gym',
      endereco: 'R. Potengi, 588 - Petrópolis, Natal - RN, 59012-310, Brasil',
      latitude: -5.789089,
      longitude: -35.200675,
    ),
    Academia(
      nome: 'Academia Central do Corpo',
      endereco:
          'R. dos Caicós, 2138 - Dix-Sept Rosado, Natal - RN, 59054-220, Brasil',
      latitude: -5.808264,
      longitude: -35.204021,
    ),
    Academia(
      nome: 'Fit Life Academia',
      endereco: 'R. Açu, 1013 - Tirol, Natal - RN, 59020-040, Brasil',
      latitude: -5.792989,
      longitude: -35.199765,
    ),
  ];

  List<Academia> get academias => _academias;
}
