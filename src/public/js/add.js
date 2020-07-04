const socket = io();
let turno = d.getHours();

document.getElementById("fecha-inicio").value =diasSemana[d.getDay()] + ", " + d.getDate() + 
  " de"     +  meses[d.getMonth()] + " de " +d.getFullYear();

document.getElementById("fecha-creacion").value =
    dia + "-" + mes + "-" + d.getFullYear();
    
document.getElementById("fecha-inicio-1").value =diasSemana[d.getDay()] + ", " + d.getDate() + 
    " de"     +  meses[d.getMonth()] + " de " +d.getFullYear();

document.getElementById("fecha-creacion-1").value = dia + "-" + mes + "-" + d.getFullYear();

if (turno > 22) {
  document.getElementById("turno").value = "NOCHE";
  document.getElementById("turno-1").value = "NOCHE";
  document.getElementById("turno-2").value = "NOCHE";
}
if (turno > -1 && turno < 6) {
  document.getElementById("turno").value = "NOCHE";
  document.getElementById("turno-1").value = "NOCHE";
  document.getElementById("turno-2").value = "NOCHE";
}
if (turno > 5 && turno < 14) {
  document.getElementById("turno").value = "MAÑANA";
  document.getElementById("turno-1").value = "MAÑANA";
  document.getElementById("turno-2").value = "MAÑANA";
}
if (turno > 13 && turno < 23) {
  document.getElementById("turno").value = "TARDE";
  document.getElementById("turno-1").value = "TARDE";
  document.getElementById("turno-2").value = "TARDE";
}

let username = document.getElementById('username');
let output1 = document.getElementById('message');


window.addEventListener('load',Emitir, false);
function Emitir(){
    socket.emit('join',{
        username: username.value
    });
}

function StartformA() {
  opmantto = document.getElementById("text").value;
  if (opmantto === "") {
    alert("Existe un campo vacio en el formulario");
    return false;
  } else {
    Timer();
    document.getElementById("hora-inicio").value =
    hora + ":" + minutos + ":" + segundos;
    var texto = document.getElementById("text").value;
    document.getElementById("text1").value = texto;
    hora + ":" + minutos + ":" + segundos;
    document.getElementById("test").submit();
  }
}

function StartformI() {
  opmantto = document.getElementById("text").value;
  if (opmantto === "") {
    alert("Existe un campo vacio en el formulario");
    return false;
  } else {
    Timer();
    document.getElementById("hora-inicio-1").value =
    hora + ":" + minutos + ":" + segundos;
    var texto = document.getElementById("text").value;
    document.getElementById("text2").value = texto;
    document.getElementById("test1").submit();
  }
}

function enviarchat01(){
  let mensaje = document.getElementById('mensaje');
  socket.emit('chat:mensajes01',{
    mensaje: mensaje.value,
    username: username.value
});
  mensaje.value = "";
}

socket.on('message:server01', function(data){
  output1.innerHTML +=  `<li class="msg-right">
  <div class="msg-left-sub">
    <img src="/logos/a1.png">
    <div class="msg-desc">
    ${data.mensaje}
    </div>
  </div>
</li>`
});