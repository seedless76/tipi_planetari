import 'package:flutter/cupertino.dart';

const kImmanuelURL = 'https://api.immanuel.app/chart/natal';
const kImmanuelApiKey = 'SzQN82nJLOmFX7ASAuWxpYywTFVT55Ov';
const kImmanuelSecret = 'rX9sgmysBLVj';
const kHouseSystem = 'Placidus';

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
const kPlanSlowInExal = 1; //esaltazione

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
const kPlanetInHouseOfSecondSun =
    5; //domicilio secondario in caso di dominante solare
const kPlanetInHouseOfExalt = 3; //esaltazione

// Punti per sole in casa cosignificante al segno del
const kSunInHouseOfPrime = 3; //domicilio primario
const kSunInHouseOfSecond = 2; //domicilio secondario
const kSunInHouseOfExalt = 1; //esaltazione

enum Sign {
  Aries,
  Taurus,
  Gemini,
  Cancer,
  Leo,
  Virgo,
  Libra,
  Scorpio,
  Sagittarius,
  Capricorn,
  Aquarius,
  Pisces
}
enum PlanetName {
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

  final PlanetName name;

  bool isFast() {
    return kPlanetsFast.contains(name);
  }

  bool isSlow() {
    return kPlanetsSlow.contains(name);
  }
}

//Lista dei pianeti lenti
final List<PlanetName> kPlanetsSlow = const [
  PlanetName.jupiter,
  PlanetName.saturn,
  PlanetName.uranus,
  PlanetName.neptune,
  PlanetName.pluto,
];

//Lista dei pianeti veloci
final List<PlanetName> kPlanetsFast = const [
  PlanetName.mars,
  PlanetName.venus,
  PlanetName.mercury,
  PlanetName.moon,
  PlanetName.sun,
];

final List<int> kHousesName =
    List.generate(12, (int index) => index + 1, growable: false);

class House {
  House({@required this.init, @required this.end});
  double init;
  double end;
}

class Dominant {
  Dominant({@required this.planet, @required this.value});
  PlanetName planet;
  int value;
}

class PlanetsOfSign {
  PlanetsOfSign(
      {@required this.primaryDom,
      @required this.exaltation,
      @required this.secondaryDom});

  PlanetName primaryDom;
  PlanetName exaltation;
  PlanetName secondaryDom;
}

final Map<Sign, PlanetsOfSign> kPlanetsOfSigns = {
  Sign.Aries: PlanetsOfSign(
      primaryDom: PlanetName.mars,
      exaltation: PlanetName.sun,
      secondaryDom: PlanetName.pluto),
  Sign.Taurus: PlanetsOfSign(
      primaryDom: null,
      exaltation: PlanetName.jupiter,
      secondaryDom: PlanetName.venus),
  Sign.Gemini: PlanetsOfSign(
      primaryDom: PlanetName.mercury,
      exaltation: PlanetName.pluto,
      secondaryDom: null),
  Sign.Cancer: PlanetsOfSign(
      primaryDom: PlanetName.moon,
      exaltation: PlanetName.venus,
      secondaryDom: null),
  Sign.Leo: PlanetsOfSign(
      primaryDom: null, exaltation: null, secondaryDom: PlanetName.sun),
  Sign.Virgo: PlanetsOfSign(
      primaryDom: null,
      exaltation: PlanetName.uranus,
      secondaryDom: PlanetName.mercury),
  Sign.Libra: PlanetsOfSign(
      primaryDom: PlanetName.venus,
      exaltation: PlanetName.saturn,
      secondaryDom: null),
  Sign.Scorpio: PlanetsOfSign(
      primaryDom: PlanetName.pluto,
      exaltation: PlanetName.mercury,
      secondaryDom: PlanetName.mars),
  Sign.Sagittarius: PlanetsOfSign(
      primaryDom: PlanetName.jupiter,
      exaltation: null,
      secondaryDom: PlanetName.neptune),
  Sign.Capricorn: PlanetsOfSign(
      primaryDom: PlanetName.saturn,
      exaltation: PlanetName.mars,
      secondaryDom: PlanetName.uranus),
  Sign.Aquarius: PlanetsOfSign(
      primaryDom: PlanetName.uranus,
      exaltation: PlanetName.neptune,
      secondaryDom: PlanetName.saturn),
  Sign.Pisces: PlanetsOfSign(
      primaryDom: PlanetName.neptune,
      exaltation: PlanetName.moon,
      secondaryDom: PlanetName.jupiter)
};
