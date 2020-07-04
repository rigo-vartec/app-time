const db = require('./database')
module.exports = function (server,sessionMiddleware) {
  const io = require("socket.io")(server);
  
  io.use(function (socket,next) {
    sessionMiddleware(socket.request, {}, next);
  });
  
  io.sockets.on("connection", function (socket) {
    console.log('new user',socket.request.session.id);

    socket.on('join', function (data) { 
      console.log(data);
      socket.join(data.username);
    });
    
    socket.on('buscar:chat',(data) =>{
        io.to('calidad').emit('message:serverchat'+data.busqueda,data);
    });

    for (let i = 1; i < 14; i++) {
      socket.on('chat:mensajes0'+(i),(data) =>{
        io.to('A0'+(i)).emit('message:server0'+(i),data);
        io.to('calidad').emit('message:server1',data);
        console.log(data);
      });
    }
    

  });

}