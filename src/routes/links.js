const express = require("express");
const router = express.Router();
const db = require("../database");

router.post('/add', async(req,res) =>{
    const {creation_date,turno,num_maquina,num_op,start_date,start_time} = req.body;
    const newave={
        creation_date,
           turno,
           num_maquina,
            num_op,
            start_date,
            start_time
       };
    
      req.flash('info', 'Por favor indica si ha llegado el operador de mantenimiento');
      await db.query('INSERT INTO averias set?',[newave]);
        res.redirect('/links/arrival');
    });
    
    router.get('/arrival', async(req, res) =>{
        const averia =await db.query('SELECT* from averias order by id desc limit 1');
        console.log(averia);
        res.render('averias/arrival', {averia});
    });

router.get('/arrival', async(req, res) =>{
    const averia =await db.query('SELECT* from averias order by id desc limit 1');
    console.log(averia);
    res.render('averias/arrival', {averia});
});

router.post('/arrival/:id', async(req,res) =>{
 const {id} = req.params;
 const {op_mantto,arrival_time,opening_time} = req.body;
 const newave ={
     op_mantto,
     arrival_time,
     opening_time
 };
 await db.query('UPDATE averias_x06 set ? WHERE id = ?', [newave, id] );
 req.flash('info', 'El tiempo de tolerancia fue agotado y se inicio una nueva averia para esta maquina');
 res.redirect('/links/new');
});

router.post('/arrival/close/:id', async(req,res) =>{
    const {id} = req.params;
    const {op_mantto,arrival_time,canceled_time} = req.body;
    const newave ={
        op_mantto,
        arrival_time,
        canceled_time
    };
    await db.query('UPDATE averias_x06 set ? WHERE id = ?', [newave, id] );
    req.flash('info', 'La averia fue cancelada con exito');
    res.redirect('/links/add');
   });


router.post('/buscador_averias', async(req, res) =>{
    let turno = req.body.turno;
    const averia =await db.query('SELECT * FROM averias WHERE fecha = CURDATE() AND turno=?', [turno]);
    res.render('averias/buscador_mañana', { averia });
});

router.post('/modificar', async(req, res) =>{
    let fecha = req.body.creation_date;
    let maquina = req.body.num_maquina;
    const averia = await db.query('select num_maquina,creation_date,opening_time from averias where creation_date=? AND num_maquina=? AND turno="NOCHE"', [fecha,maquina] );
    res.render('averias/modificar', {averia});
  });
  
router.get('/inicio', (req, res) =>{
    res.render('formularios/inicio',);
});



router.post('/reportes', async(req, res) =>{
    let turno = req.body.turno;
    const reporte_a01 =await db.query('SELECT * FROM averias WHERE fecha = CURDATE() AND turno=?',[turno]);
    const reporte_a01_1 =await db.query('SELECT * FROM averias WHERE fecha = DATE_SUB(CURDATE(), INTERVAL 1 DAY) AND start_time>"22:59:59" AND turno=?',[turno]);
    /*const reporte_a02 =await db.query('SELECT * FROM averias_a02 WHERE fecha = CURDATE() AND turno="NOCHE"');
    const reporte_a03 =await db.query('SELECT * FROM averias_a03 WHERE fecha = CURDATE() AND turno="NOCHE"');
    const reporte_a04 =await db.query('SELECT * FROM averias_a04 WHERE fecha = CURDATE() AND turno="NOCHE"');
    const reporte_a05 =await db.query('SELECT * FROM averias_a05 WHERE fecha = CURDATE() AND turno="NOCHE"');
    const reporte_a06 =await db.query('SELECT * FROM averias_a06 WHERE fecha = CURDATE() AND turno="NOCHE"');
    const reporte_a07 =await db.query('SELECT * FROM averias_a07 WHERE fecha = CURDATE() AND turno="NOCHE"');
    const reporte_a08 =await db.query('SELECT * FROM averias_a08 WHERE fecha = CURDATE() AND turno="NOCHE"');
    const reporte_a09 =await db.query('SELECT * FROM averias_a09 WHERE fecha = CURDATE() AND turno="NOCHE"');
    const reporte_a10 =await db.query('SELECT * FROM averias_a10 WHERE fecha = CURDATE() AND turno="NOCHE"');
    const reporte_a11 =await db.query('SELECT * FROM averias_a11 WHERE fecha = CURDATE() AND turno="NOCHE"');
    const reporte_a12 =await db.query('SELECT * FROM averias_a12 WHERE fecha = CURDATE() AND turno="NOCHE"');
    const reporte_a13 =await db.query('SELECT * FROM averias_a13 WHERE fecha = CURDATE() AND turno="NOCHE"');
    const reporte_G01 =await db.query('SELECT * FROM averias_G01 WHERE fecha = CURDATE() AND turno="NOCHE"');
    const reporte_G02 =await db.query('SELECT * FROM averias_G02 WHERE fecha = CURDATE() AND turno="NOCHE"');
    const reporte_G03 =await db.query('SELECT * FROM averias_G03 WHERE fecha = CURDATE() AND turno="NOCHE"');
    const reporte_G04 =await db.query('SELECT * FROM averias_G04 WHERE fecha = CURDATE() AND turno="NOCHE"');
    const reporte_x06 =await db.query('SELECT * FROM averias_x06 WHERE fecha = CURDATE() AND turno="NOCHE"');
    const reporte_x07 =await db.query('SELECT * FROM averias_x07 WHERE fecha = CURDATE() AND turno="NOCHE"');
    */
   res.render('averias/reportes', { reporte_a01, reporte_a01_1});
});

router.get('/hxh', (req, res) =>{
    res.render('averias/HxH');
}); 

router.get('/graficas', async(req, res) =>{
    const a01 =await db.query('SELECT * FROM produccion ');
    res.render('produccion/graficas', {a01});
});

router.post('/averias/operador/corte/:id', async(req, res) =>{
    const {id} = req.params;
    const averias =await db.query('SELECT * FROM averias WHERE user_id= ? and fecha = CURDATE()',[id]);
    res.render('averias/averias_operador', { averias});
});



module.exports = router;