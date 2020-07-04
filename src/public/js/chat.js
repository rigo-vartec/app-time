const socket = io();
let btn = document.getElementById('send');
let output1 = document.getElementById('message-calidad');
let output2 = document.getElementById('output2');
let mensaje = document.getElementById('mensaje');
let username = document.getElementById('username');
let verchat = document.querySelectorAll(".item ul li");



window.addEventListener('load',Emitir, false);
function Emitir(){
    socket.emit('join',{
        username: username.value
    });
}

for (let i = 0; i < verchat.length; i++) {
    verchat[i].addEventListener("click", function(e){
        console.log(e.target);
        let btn = e.target;
        if (btn.className==".item ul li.active") {
            removerClase();
        }else{
            removerClase();
            btn.classList.add("active");
        }
    })
}

function removerClase(){
    for (let i = 0; i < verchat.length; i++) {
        verchat[i].classList.remove("active");
    }
}

function ocultarchat(){
    let chatmensajes = document.getElementsByClassName("oculto")
    for (let i = 0; i < chatmensajes.length; i++) {
            chatmensajes[i].style.display="none";
    }
}

function Chat1() {
    ocultarchat();
    document.getElementById("chat-a01").style.display = "block";
}
function Chat2() {
    ocultarchat();
    document.getElementById("chat-a02").style.display = "block";
}
function Chat3() {
    ocultarchat();
    document.getElementById("chat-a03").style.display = "block";
}


function ocultaruserchat(){
    let ocultaruserchat = document.getElementsByClassName("chat")
    for (let i = 0; i < ocultaruserchat.length; i++) {
            ocultaruserchat[i].style.display="none";
    }
}

function mostraruserchat(){
    let mostraruserchat = document.getElementsByClassName("chat")
    for (let i = 0; i < mostraruserchat.length; i++) {
            mostraruserchat[i].style.display="block";
    }
}

function Buscarchat(){
    let numeromaquina = document.getElementById("search").value;
    ocultarchat()
    document.getElementById("chatmensaje").style.display="block";
    if (numeromaquina=="TODOS") {
        ocultaruserchat();
        mostraruserchat();
    }else{
        ocultaruserchat();
        document.getElementById("maquina"+numeromaquina).style.display = "block";
    }
    document.getElementById("search").value="";
}


function enviarchat1(){
    socket.emit('chat1:mensajes',{
        mensaje: mensaje.value,
        username: username.value
    });
    mensaje.value = "";
}

function enviarchat02(){
    socket.emit('chat:mensajes03',{
        mensaje: mensaje.value,
        username: username.value
    });
    mensaje.value = "";
}

function enviarchat3(){
    socket.emit('chat3:mensajes',{
        mensaje: mensaje.value,
        username: username.value
    });
    mensaje.value = "";
}

socket.on('message:server1', function(data){
    output1.innerHTML +=  `<p><strong>${data.username}</strong>:${data.mensaje}</p>`
});


