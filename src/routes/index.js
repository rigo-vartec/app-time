const express = require("express");
const router = express.Router();
const db = require("../database");


router.get("/inicio/facilitador", (req, res) => {
  res.render("formularios/inicio_facilitador");
});

router.get("/inicio/maquina/:inicio", (req, res) => {
  const { inicio } = req.params;
  res.render("maquinas-user/" + inicio);
});

router.get("/inicio/logged/:inicio", (req, res) => {
  const { inicio } = req.params;
  res.render("formularios/" + inicio);
});

router.post("/incidencia/add", async (req, res) => {
  let username = req.body.num_ope;
  let maquina = req.body.num_machine;
  const {
    creation_date,turno,num_machine,num_ope,start_date,start_time,step,page} = req.body;
  const newave = {
    creation_date,
    turno,
    num_machine,
    num_ope,
    start_date,
    start_time,
    step,
    page,
  };
  const row = await db.query('SELECT * FROM users WHERE username = ? AND rol="operador_corte"',[username]);
  if (row.length > 0) {
    const id = row[0];
    const user_id = id.id;
    const averias = await db.query(
      'SELECT* FROM incidencias WHERE num_ope = ?  AND step = "1" order by id desc limit 1',[username]);
    if (averias.length > 0) {
      const user = averias[0];
      res.render("incidencias/" + user.page, { averias,row });
    } else {
      const averia = await db.query("INSERT INTO incidencias set?", [newave]);
      await db.query("UPDATE incidencias set user_id=?  WHERE id = ?", [user_id,averia.insertId]);
      const averias = await db.query("SELECT * FROM incidencias WHERE id=?", [averia.insertId,]);
      res.render("incidencias/incidencia", { averias});
    }
  } else {
    req.flash("info", "Por favor introduce un numero de operador valido");
    res.redirect("/inicio/maquina/" + maquina);
  }
});

router.post("/incidencia/new/:id", async (req, res) => {
  const { id } = req.params;
  let maquina = req.body.num_machine;
  const {type_break,end_time,total_time,step } = req.body;
  const newave = {
    type_break,
    end_time,
    total_time,
    step
  };
    await db.query("UPDATE incidencias set ? WHERE id = ?", [newave, id]);
    req.flash("info", "La incidencia fue cerrada");
    res.redirect("/inicio/maquina/" + maquina);
});

router.post("/averia/add", async (req, res) => {
  let username = req.body.num_ope;
  let maquina = req.body.num_machine;
  const {
    creation_date,turno,num_machine,num_ope,start_date,start_time,step,page} = req.body;
  const newave = {
    creation_date,
    turno,
    num_machine,
    num_ope,
    start_date,
    start_time,
    step,
    page,
  };
  const row = await db.query('SELECT * FROM users WHERE username = ? AND rol="operador_corte"',[username]);
  if (row.length > 0) {
    const id = row[0];
    const user_id = id.id;
    const averias = await db.query(
      'SELECT* FROM averias_1 WHERE num_ope = ?  AND step = "1" order by id desc limit 1',[username]);
    if (averias.length > 0) {
      const user = averias[0];
      const alert2 = "true";
      res.render("averias/" + user.page, { averias,row,alert2 });
    } else {
      const averia = await db.query("INSERT INTO averias_1 set?", [newave]);
      await db.query("UPDATE averias_1 set user_id=?  WHERE id = ?", [user_id,averia.insertId]);
      const averias = await db.query("SELECT * FROM averias_1 WHERE id=?", [averia.insertId,]);
      res.render("averias/arrival", { averias});
    }
  } else {
    req.flash("info", "Por favor introduce un numero de operador valido");
    res.redirect("/inicio/maquina/" + maquina);
  }
});

router.post("/arrival/validate/:id", async (req, res) => {
  let username = req.body.op_mantto;
  const { id } = req.params;
  const { op_mantto,arrival_time,sub_time,page } = req.body;
  const newave = {
    op_mantto,
    arrival_time,
    sub_time,
    page,
  };
  const row = await db.query(
    'SELECT * FROM users WHERE username = ? AND rol="operador_mantenimiento"',[username]);
  if (row.length > 0) {
    const id1 = row[0];
    const mantto_id = id1.id;
    await db.query("UPDATE averias_1 set mantto_id=? WHERE id = ?", [mantto_id, id]);
    await db.query("UPDATE averias_1 set ? WHERE id = ?", [newave, id]);
    const averias = await db.query("SELECT * FROM averias_1 WHERE id=?", [id]);
    const alert = "True";
    res.render("averias/arrival_2", { averias,alert });
  } else {
    const averias = await db.query("SELECT * FROM averias_1 WHERE id=?", [id]);
    const alerta = "True";
    res.render("averias/arrival", { averias, alerta });
  }
});

router.post("/arrival/validate/close/:id", async (req, res) => {
  const { id } = req.params;
  let maquina = req.body.num_machine;
  let username = req.body.op_mantto;
  const { op_mantto, canceled_time,sub_time,step } = req.body;
  const newave = {
    op_mantto,
    canceled_time,
    sub_time,
    step,
  };
  const row = await db.query(
    'SELECT * FROM users WHERE username = ? AND rol="operador_mantenimiento"',[username]);
  if (row.length > 0) {
    const id1 = row[0];
    const mantto_id = id1.id;
    await db.query("UPDATE averias_1 set mantto_id=? WHERE id = ?", [mantto_id, id]);
    await db.query("UPDATE averias_1 set ? WHERE id = ?", [newave, id]);
    req.flash("info", "La averia fue cancelada");
    res.redirect("/inicio/maquina/" + maquina);
  } else {
    const averias = await db.query("SELECT * FROM averias_1 WHERE id=?", [id]);
    const alerta = "True";
    res.render("averias/arrival", { averias, alerta });
  }
});

router.post("/arrival/validated/:id", async (req, res) => {
  const { id } = req.params;
  const { opening_time,type_break,page } = req.body;
  const newave = {
    opening_time,
    type_break,
    page,
  };
  await db.query("UPDATE averias_1 set ? WHERE id = ?", [newave, id]);
  const averias = await db.query("SELECT * FROM averias_1 WHERE id=?", [id]);
  const alerta = "True";
  res.render("averias/new", { averias, alerta });
});

router.post("/arrival/close/validated/:id", async (req, res) => {
  const { id } = req.params;
  let maquina = req.body.num_machine;
  const {
    creation_date,num_machine,num_ope,turno,op_mantto,start_time,start_date,arrival_time,sub_time,canceled_time,total_time,type_break,user_id,mantto_id,step} = req.body;
  const newave = {
    canceled_time,
    mantto_id,
    step,
  };
  const newave2 = {
    creation_date,
    num_machine,
    num_ope,
    turno,
    op_mantto,
    start_time,
    start_date,
    arrival_time,
    sub_time,
    canceled_time,
    total_time,
    type_break,
    user_id,
    mantto_id
  };
  await db.query("INSERT INTO averias_canceladas set?", [newave2]);
  await db.query("UPDATE averias_1 set ? WHERE id = ?", [newave, id]);
  req.flash("info", "La averia fue cancelada");
  res.redirect("/inicio/maquina/" + maquina);
});

router.post("/averia/new/:id", async (req, res) => {
  const {id} = req.params;
  let maquina = req.body.num_machine;
  const {
    creation_date,num_machine,num_ope,turno,op_mantto,start_time,start_date,arrival_time,sub_time,type_break,user_id,opening_time,end_time,total_time,mantto_id,step,description} = req.body;
  const newave = {
    end_time,
    total_time,
    step,
    description

  };
  const newave2 = {
    creation_date,
    num_machine,
    num_ope,
    turno,
    op_mantto,
    start_time,
    start_date,
    arrival_time,
    sub_time,
    opening_time,
    end_time,
    total_time,
    type_break,
    user_id,
    mantto_id,
    description
    
  };
  await db.query("INSERT INTO averias_cerradas set?", [newave2]);
  await db.query("UPDATE averias_1 set ? WHERE id = ?", [newave, id]);
  req.flash("info", "La averia fue cerrada");
  res.redirect("/inicio/maquina/" + maquina);
});

router.get('/averias/operador/buscar', async(req,res) =>{
  const averias = await db.query("SELECT * FROM averias_cerradas WHERE user_id=? AND estatus_corte='indefinido'", [req.user.id]);
  res.render("averias/operador", {averias});
  });

  router.get('/averia/corte/cambiar/estatus/:id', async(req,res) =>{
    const {id} = req.params;
    const averia = await db.query("SELECT * FROM averias_cerradas WHERE id=?", [id]);
    res.render("averias/modificar", {averia});
    });

    router.post('/averia/corte/estatus/:id', async(req,res) =>{
      const {id} = req.params;
      let estatus_corte = req.body.estatus;
      await db.query("UPDATE averias_cerradas set estatus_corte=? WHERE id=?", [estatus_corte,id]);
      req.flash('info', 'El estatus de tu averia fue enviado con exito');
      res.redirect("/averias/operador/buscar");
      });

      router.get('/incidencias/operador/buscar', async(req,res) =>{
        const averias = await db.query("SELECT * FROM incidencias WHERE user_id=?", [req.user.id]);
        res.render("incidencias/operador", {averias});
        });

  router.get('/averias/operador/mantto/buscar', async(req,res) =>{
    const averias = await db.query("SELECT * FROM averias_cerradas WHERE mantto_id=? AND estatus_mantto='indefinido'", [req.user.id]);
    res.render("averias/operador_mantto", {averias});
    });
  
    router.get('/averia/mantto/cambiar/estatus/:id', async(req,res) =>{
      const {id} = req.params;
      const averia_mantto = await db.query("SELECT * FROM averias_cerradas WHERE id=?", [id]);
      res.render("averias/modificar", {averia_mantto});
      });

      router.post('/averia/mantto/estatus/:id', async(req,res) =>{
        const {id} = req.params;
        let estatus_corte = req.body.estatus;
        await db.query("UPDATE averias_cerradas set estatus_mantto=? WHERE id=?", [estatus_corte,id]);
        req.flash('info', 'El estatus de tu averia fue enviado con exito');
        res.redirect("/averias/operador/mantto/buscar");
        });

router.get('/averias/operador/calidad/buscar', async(req,res) =>{
    const averias = await db.query("SELECT * FROM averias_cerradas WHERE estatus_mantto='aprobado' AND estatus_calidad='indefinido'", [req.user.id]);
    res.render("averias/operador_calidad", {averias});
    });

    router.get('/averia/calidad/cambiar/estatus/:id', async(req,res) =>{
      const {id} = req.params;
      const averia_calidad = await db.query("SELECT * FROM averias_cerradas WHERE id=?", [id]);
      res.render("averias/modificar", {averia_calidad});
      });

      router.post('/averia/calidad/estatus/:id', async(req,res) =>{
        const {id} = req.params;
        let estatus_corte = req.body.estatus;
        await db.query("UPDATE averias_cerradas set estatus_calidad=? WHERE id=?", [estatus_corte,id]);
        req.flash('info', 'El estatus de tu averia fue enviado con exito');
        res.redirect("/averias/operador/calidad/buscar");
        });

  router.post("/incidencia/add", async (req, res) => {
  let username = req.body.num_ope;
  let maquina = req.body.num_machine;
  const {
    creation_date,turno,num_machine,num_ope,start_date,start_time,step,page} = req.body;
  const newave = {
    creation_date,
    turno,
    num_machine,
    num_ope,
    start_date,
    start_time,
    step,
    page,
  };
  const row = await db.query('SELECT * FROM users WHERE username = ? AND rol="operador_corte"',[username]);
  if (row.length > 0) {
    const id = row[0];
    const user_id = id.id;
    const averias = await db.query(
      'SELECT* FROM incidencias WHERE num_ope = ?  AND step = "1" order by id desc limit 1',[username]);
    if (averias.length > 0) {
      const user = averias[0];
      res.render("incidencias/" + user.page, { averias,row });
    } else {
      const averia = await db.query("INSERT INTO incidencias set?", [newave]);
      await db.query("UPDATE incidencias set user_id=?  WHERE id = ?", [user_id,averia.insertId]);
      const averias = await db.query("SELECT * FROM incidencias WHERE id=?", [averia.insertId,]);
      res.render("incidencias/incidencia", { averias});
    }
  } else {
    req.flash("info", "Por favor introduce un numero de operador valido");
    res.redirect("/inicio/maquina/" + maquina);
  }
});

router.post("/registro/produccion/maquinas", async (req, res) => {
  let maquina = req.body.num_machine;
  const {
    turno,num_machine} = req.body;
  const newregs = {
    turno,
    num_machine
  };
  const row = await db.query('SELECT * FROM produccion WHERE num_machine = ? AND step=1',[maquina]);
  if (row.length > 0) {
    const registro = await db.query('SELECT * FROM produccion WHERE num_machine = ? AND step=1',[maquina]);
      res.render("produccion/"+turno, {registro});
  } else {
    const registros = await db.query("INSERT INTO produccion set?", [newregs]);
    const registro = await db.query("SELECT * FROM produccion WHERE id=?", [registros.insertId,]);
      res.render("produccion/"+turno, {registro});
  }
});

router.get("/produccion/grafica", (req, res) => {
  res.render("produccion/grafica");
});

router.post("/produccion/maquinas/noche/:id", async (req, res) =>  {
  const {id} = req.params;
  let turno = req.body.turno;
  const {hora_1,hora_2,hora_3,hora_4,hora_5,hora_6,hora_7} = req.body;
  const newregs = {
    hora_1,
    hora_2,
    hora_3,
    hora_4,
    hora_5,
    hora_6,
    hora_7
  };
  await db.query("UPDATE produccion set ? WHERE id=?",[newregs,id]);
  const registro = await db.query("SELECT * FROM produccion WHERE id=?", [id]);
  const alert = "true";
  res.render("produccion/"+turno, {registro,alert});
});


router.get("/chat/supervisor/calidad", (req,res) =>{
  res.render("chats/chatcalidad");
});

router.get("/chat/a01", (req,res) =>{
  res.render("produccion/chat");
});

router.get("/chat/a02", (req,res) =>{
  res.render("produccion/chat02");
});

router.get("/ejemplo", (req,res) =>{
  res.render("produccion/ejemplos");
});

module.exports = router;
