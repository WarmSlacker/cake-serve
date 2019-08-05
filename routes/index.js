const express=require("express");
const router=express.Router();
const pool=require('../pool.js');


router.get('/index',(req,res)=>{
    var sql="SELECT * FROM cake_index_product";
    pool.query(sql,(err,result)=>{
      if (err) throw err;
      res.send(result);
    
    })
  
  })
  router.get("/carousel",(req,res)=>{
    var sql="SELECT title,img,href FROM cake_index_carousel"
    pool.query(sql,(err,result)=>{
      if(err) throw err;
      res.send(result);
      
    })
  })
module.exports=router;