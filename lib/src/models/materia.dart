class Materia {
  String nombre_materia;
  String nombre_profesor;
  var crn;

  Materia(this.nombre_materia, this.nombre_profesor, this.crn);

  Materia.fromJson(Map<String, dynamic>json){
    nombre_materia = json['nombre_materia'];
    nombre_profesor = json['nombre_profesor'];
    crn = json['crn'];
  }
}