let horario = h+""+minutos;
let turno = parseInt(horario);

console.log(turno);

  if (turno > 29 && turno < 600) {
    document.getElementById("turno").value = "NOCHE";
    document.getElementById("turno1").value = "NOCHE";
    document.getElementById("turno2").value = "NOCHE";
    document.getElementById("turno3").value = "NOCHE";
    console.log("noche");
  }
  if (turno > 600 && turno < 1530) {
    document.getElementById("turno").value = "MAÑANA";
    document.getElementById("turno1").value = "MAÑANA";
    document.getElementById("turno2").value = "MAÑANA";
    document.getElementById("turno3").value = "MAÑANA";
    console.log("tarde");
  }
  if (turno > 1529 && turno < 2360) {
    document.getElementById("turno").value = "TARDE";
    document.getElementById("turno1").value = "TARDE";
    document.getElementById("turno2").value = "TARDE";
    document.getElementById("turno3").value = "TARDE";
    console.log("tarde");
  }
  if (turno > 0 && turno < 30) {
    document.getElementById("turno").value = "TARDE:";
    document.getElementById("turno1").value = "TARDE:";
    document.getElementById("turno2").value = "TARDE:";
    document.getElementById("turno3").value = "TARDE:";
    console.log("tarde2");
  }