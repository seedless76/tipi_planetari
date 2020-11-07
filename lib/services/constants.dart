import 'dart:math';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';

const kImmanuelURL = 'https://api.immanuel.app/chart/natal';
const kImmanuelApiKey = 'SzQN82nJLOmFX7ASAuWxpYywTFVT55Ov';
const kImmanuelSecret = 'rX9sgmysBLVj';
const kHouseSystem = 'Placidus';

//Massimo valore della dominante per i pianeti lenti
const kMaxSlowDominantValue = 60.0;

//Massimo valore della dominante per i pianeti veloci
const kMaxFastDominantValue = 73.0;

//Massimo valore della dominante per la luna
const kMaxMoonDominantValue = 50.0;

//Massimo valore della dominante per il sole
const kMaxSunDominantValue = 39.0;

// Ampiezza della congiunzione
const kConjunction = 10;

// Numero di pianeti per avere uno stellium
const kStelliumPlanetsNr = 3;

// Punti per congiunzione del pianeta al
const kUpperConjunction = 10; //MC o ASC
const kDownConjunction = 7; //FC o DIS

// Punti per Ascendente in
const kAscInPrimeDom = 5; //domicilio primario
const kAscInSecondDom = 4; //domicilio secondario
const kAscInSecondDomSun = 5; //domicilio secondario per dominante solare
const kAscInExalt = 3; //esaltazione

//TODO da verificare se Plutone va gestito come caso speciale
// Punti per Sole in
const kSunInPrimeDom = 6; //domicilio primario
const kSunInSecondDom = 5; //domicilio secondario
const kSunInSecondDomSun = 6; //domicilio secondario per dominante solare
const kSunInExalt = 4; //esaltazione

//TODO da verificare se Plutone va gestito come caso speciale
//Punti per pianeta lento in
const kPlanSlowInPrimeDom = 3; //domicilio primario
const kPlanSlowInSecondDom = 2; //domicilio secondario
const kPlanSlowInExalt = 1; //esaltazione

//Punti per pianeta veloce in
const kPlanFastInPrimeDom = 6; //domicilio primario
const kPlanFastInSecondDom = 5; //domicilio secondario
const kPlanFastInExalt = 4; //esaltazione

//Punti per luna in domicilio primario o domicilio secondario o esaltazione
const kMoonInPlanetSigns = 3;

// Punti per stellium in
const kStelliumInPrimeDom = 3; //domicilio primario
const kStelliumInSecondDom = 3; //domicilio secondario
const kStelliumInExalt = 3; //esaltazione

// Punti per sole congiunto al pianeta
const kSunPlanetConjunction = 5;

// Punti per luna congiunto al pianeta
const kMoonPlanetConjunction = 5;

// Punti per pianeta in casa cosignificante al segno del
const kPlanetInHouseOfPrime = 5; //domicilio primario
const kPlanetInHouseOfSecond = 4; //domicilio secondario
const kPlanetInHouseOfSecondSun = 5; //domicilio secondario in caso di dominante solare
const kPlanetInHouseOfExalt = 3; //esaltazione

// Punti per sole in casa cosignificante al segno del
const kSunInHouseOfPrime = 3; //domicilio primario
const kSunInHouseOfSecond = 2; //domicilio secondario
const kSunInHouseOfExalt = 1; //esaltazione

// Punti per stellium in casa cosignificante al segno del
const kStelliumInHouseOfPrime = 3; //domicilio primario
const kStelliumInHouseOfSecond = 2; //domicilio secondario
const kStelliumInHouseOfSecondSun = 3; //domicilio secondario in caso di sole
const kStelliumInHouseOfExalt = 1; //esaltazione
enum Signs { Aries, Taurus, Gemini, Cancer, Leo, Virgo, Libra, Scorpio, Sagittarius, Capricorn, Aquarius, Pisces }
enum kPlanetsNames {
  sun,
  moon,
  mercury,
  venus,
  mars,
  jupiter,
  saturn,
  uranus,
  neptune,
  pluto,
}
enum PlanetSpeed {
  slow,
  fast,
}
enum Angles {
  asc,
  mc,
  desc,
  ic,
}

class Planet {
  Planet(this.name);

  final kPlanetsNames name;

  bool isFast() {
    return kPlanetsFast.contains(name);
  }

  bool isSlow() {
    return kPlanetsSlow.contains(name);
  }

  String symbol() {
    return kSymbolsName[EnumToString.convertToString(name)];
  }
}

//Lista dei pianeti lenti
final List<kPlanetsNames> kPlanetsSlow = const [
  kPlanetsNames.jupiter,
  kPlanetsNames.saturn,
  kPlanetsNames.uranus,
  kPlanetsNames.neptune,
  kPlanetsNames.pluto,
];

//Lista dei pianeti veloci
final List<kPlanetsNames> kPlanetsFast = const [
  kPlanetsNames.sun,
  kPlanetsNames.moon,
  kPlanetsNames.mercury,
  kPlanetsNames.venus,
  kPlanetsNames.mars,
];

final List<int> kHousesName = List.generate(12, (int index) => index + 1, growable: false);

class House {
  House({@required this.init, @required this.end});
  double init;
  double end;
}

class Dominant {
  Dominant({@required this.planet, @required this.value});

  kPlanetsNames planet;
  int value;
}

class PlanetsOfSign {
  PlanetsOfSign({@required this.primaryDom, @required this.exaltation, @required this.secondaryDom});

  kPlanetsNames primaryDom;
  kPlanetsNames exaltation;
  kPlanetsNames secondaryDom;
}

final Map<Signs, PlanetsOfSign> kPlanetsOfSigns = {
  Signs.Aries: PlanetsOfSign(primaryDom: kPlanetsNames.mars, exaltation: kPlanetsNames.sun, secondaryDom: kPlanetsNames.pluto),
  Signs.Taurus: PlanetsOfSign(primaryDom: null, exaltation: kPlanetsNames.jupiter, secondaryDom: kPlanetsNames.venus),
  Signs.Gemini: PlanetsOfSign(primaryDom: kPlanetsNames.mercury, exaltation: kPlanetsNames.pluto, secondaryDom: null),
  Signs.Cancer: PlanetsOfSign(primaryDom: kPlanetsNames.moon, exaltation: kPlanetsNames.venus, secondaryDom: null),
  Signs.Leo: PlanetsOfSign(primaryDom: null, exaltation: null, secondaryDom: kPlanetsNames.sun),
  Signs.Virgo: PlanetsOfSign(primaryDom: null, exaltation: kPlanetsNames.uranus, secondaryDom: kPlanetsNames.mercury),
  Signs.Libra: PlanetsOfSign(primaryDom: kPlanetsNames.venus, exaltation: kPlanetsNames.saturn, secondaryDom: null),
  Signs.Scorpio: PlanetsOfSign(primaryDom: kPlanetsNames.pluto, exaltation: kPlanetsNames.mercury, secondaryDom: kPlanetsNames.mars),
  Signs.Sagittarius: PlanetsOfSign(primaryDom: kPlanetsNames.jupiter, exaltation: null, secondaryDom: kPlanetsNames.neptune),
  Signs.Capricorn: PlanetsOfSign(primaryDom: kPlanetsNames.saturn, exaltation: kPlanetsNames.mars, secondaryDom: kPlanetsNames.uranus),
  Signs.Aquarius: PlanetsOfSign(primaryDom: kPlanetsNames.uranus, exaltation: kPlanetsNames.neptune, secondaryDom: kPlanetsNames.saturn),
  Signs.Pisces: PlanetsOfSign(primaryDom: kPlanetsNames.neptune, exaltation: kPlanetsNames.moon, secondaryDom: kPlanetsNames.jupiter)
};

const Map<String, String> kSymbolsName = {
  'sun': 'lib/assets/Sun_symbol.svg',
  'moon': 'lib/assets/Moon_symbol.svg',
  'mercury': 'lib/assets/Mercury_symbol.svg',
  'venus': 'lib/assets/Venus_symbol.svg',
  'mars': 'lib/assets/Mars_symbol.svg',
  'jupiter': 'lib/assets/Jupiter_symbol.svg',
  'saturn': 'lib/assets/Saturn_symbol.svg',
  'uranus': 'lib/assets/Uranus_symbol.svg',
  'neptune': 'lib/assets/Neptune_symbol.svg',
  'pluto': 'lib/assets/Pluto_symbol.svg',
};

const TextStyle kTitleTextStyle = TextStyle(
  color: Color(0xffffffff),
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

const TextStyle kInputTextStyle = TextStyle(
  color: Color(0xff39A3FA),
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
