const express = require("express");
const router = express.Router();
const db = require("../database");


   






router.post('/buscador_averias', async(req, res) =>{
    let turno = req.body.turno;
    const averia =await db.query('SELECT * FROM averias_1 WHERE fecha = CURDATE() AND turno=?', [turno]);
    res.render('averias/buscador_mañana', { averia });
});

router.post('/modificar', async(req, res) =>{
    let fecha = req.body.creation_date;
    let maquina = req.body.num_maquina;
    const averia = await db.query('select num_maquina,creation_date,opening_time from averias where creation_date=? AND num_maquina=? AND turno="NOCHE"', [fecha,maquina] );
    res.render('averias/modificar', {averia});
  });
  
router.get('/inicio', (req, res) =>{
    res.render('formularios/inicio_supercorte',);
});



router.get('/reportes', async(req, res) =>{
    let turno = req.body.turno;

    a = [01, 02, 03, 04];
(function l () { for (var i = 0, n = a.length; i < n; i++) {
  var e = "b"+[i];
  console.log(e);
}}) ();

    const reporte_a01 =await db.query('SELECT * FROM averias_cerradas WHERE fecha = CURDATE() AND turno=?',[turno]);
    const reporte_a01_1 =await db.query('SELECT * FROM averias_cerradas WHERE fecha = DATE_SUB(CURDATE(), INTERVAL 1 DAY) AND start_time>"22:59:59" AND turno=?',[turno]);
    
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

router.get('/produccion/turno', async(req, res) =>{
    const produccion =await db.query('SELECT * FROM produccion ORDER BY num_machine ASC');
    const averias =await db.query('SELECT * FROM averias_cerradas LIMIT 5');
    console.log(produccion);
    //const a01 = produccion[1];
    res.render('produccion/produccion-turno',{produccion,averias});
});

router.post('/averias/operador/corte/:id', async(req, res) =>{
    const {id} = req.params;
    const averias =await db.query('SELECT * FROM averias WHERE user_id= ? and fecha = CURDATE()',[id]);
    res.render('averias/averias_operador', { averias});
});

module.exports = router;