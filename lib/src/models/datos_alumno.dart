import 'dart:convert';

DatosAlumno datosAlumnoFromJson(String str) =>
    DatosAlumno.fromJson(json.decode(str));

String datosAlumnoToJson(DatosAlumno data) => json.encode(data.toJson());

class DatosAlumno {
  DatosAlumno({
    this.codigo,
    this.apaterno,
    this.amaterno,
    this.nombre,
    this.tipo,
    this.fotografia,
    this.fecNac,
    this.sexo,
    this.datosPersonales,
  });

  String codigo;
  String apaterno;
  String amaterno;
  String nombre;
  String tipo;
  dynamic fotografia;
  DateTime fecNac;
  String sexo;
  DatosPersonales datosPersonales;

  factory DatosAlumno.fromJson(Map<String, dynamic> json) => DatosAlumno(
        codigo: json["codigo"],
        apaterno: json["apaterno"],
        amaterno: json["amaterno"],
        nombre: json["nombre"],
        tipo: json["tipo"],
        fotografia: json["fotografia"],
        fecNac: DateTime.parse(json["fec_nac"]),
        sexo: json["sexo"],
        datosPersonales: DatosPersonales.fromJson(json["datos_personales"]),
      );

  Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "apaterno": apaterno,
        "amaterno": amaterno,
        "nombre": nombre,
        "tipo": tipo,
        "fotografia": fotografia,
        "fec_nac":
            "${fecNac.year.toString().padLeft(4, '0')}-${fecNac.month.toString().padLeft(2, '0')}-${fecNac.day.toString().padLeft(2, '0')}",
        "sexo": sexo,
        "datos_personales": datosPersonales.toJson(),
      };
}

class DatosPersonales {
  DatosPersonales({
    this.idDatper,
    this.telefono,
    this.domicilio,
    this.religion,
    this.estadoCivil,
    this.lugNac,
    this.lugRes,
    this.escolaridad,
    this.actividadEconomica,
    this.interrogatorio,
    this.carreraId,
    this.personaCodigo,
    this.email,
    this.semestre,
    this.datosContacto,
    this.carrera,
  });

  int idDatper;
  String telefono;
  String domicilio;
  String religion;
  String estadoCivil;
  String lugNac;
  String lugRes;
  String escolaridad;
  String actividadEconomica;
  String interrogatorio;
  int carreraId;
  String personaCodigo;
  String email;
  String semestre;
  DatosContacto datosContacto;
  Carrera carrera;

  factory DatosPersonales.fromJson(Map<String, dynamic> json) =>
      DatosPersonales(
        idDatper: json["id_datper"],
        telefono: json["telefono"],
        domicilio: json["domicilio"],
        religion: json["religion"],
        estadoCivil: json["estado_civil"],
        lugNac: json["lug_nac"],
        lugRes: json["lug_res"],
        escolaridad: json["escolaridad"],
        actividadEconomica: json["actividad_economica"],
        interrogatorio: json["interrogatorio"],
        carreraId: json["carrera_id"],
        personaCodigo: json["persona_codigo"],
        email: json["email"],
        semestre: json["semestre"],
        datosContacto: DatosContacto.fromJson(json["datos_contacto"]),
        carrera: Carrera.fromJson(json["carrera"]),
      );

  Map<String, dynamic> toJson() => {
        "id_datper": idDatper,
        "telefono": telefono,
        "domicilio": domicilio,
        "religion": religion,
        "estado_civil": estadoCivil,
        "lug_nac": lugNac,
        "lug_res": lugRes,
        "escolaridad": escolaridad,
        "actividad_economica": actividadEconomica,
        "interrogatorio": interrogatorio,
        "carrera_id": carreraId,
        "persona_codigo": personaCodigo,
        "email": email,
        "semestre": semestre,
        "datos_contacto": datosContacto.toJson(),
        "carrera": carrera.toJson(),
      };
}

class Carrera {
  Carrera({
    this.id,
    this.carrera,
  });

  int id;
  String carrera;

  factory Carrera.fromJson(Map<String, dynamic> json) => Carrera(
        id: json["id"],
        carrera: json["carrera"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "carrera": carrera,
      };
}

class DatosContacto {
  DatosContacto({
    this.idCon,
    this.nombre,
    this.domicilio,
    this.telefono,
    this.email,
    this.parentesco,
    this.datosPersonalesIdDatper,
  });

  int idCon;
  String nombre;
  String domicilio;
  String telefono;
  String email;
  String parentesco;
  int datosPersonalesIdDatper;

  factory DatosContacto.fromJson(Map<String, dynamic> json) => DatosContacto(
        idCon: json["id_con"],
        nombre: json["nombre"],
        domicilio: json["domicilio"],
        telefono: json["telefono"],
        email: json["email"],
        parentesco: json["parentesco"],
        datosPersonalesIdDatper: json["datos_personales_id_datper"],
      );

  Map<String, dynamic> toJson() => {
        "id_con": idCon,
        "nombre": nombre,
        "domicilio": domicilio,
        "telefono": telefono,
        "email": email,
        "parentesco": parentesco,
        "datos_personales_id_datper": datosPersonalesIdDatper,
      };
}
