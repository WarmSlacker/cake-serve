const express=require("express");
const router=express.Router();
// const session = require("express-session");
const pool=require('../pool.js');
//加入购物车
// router.get("/add",(req,res)=>{
//   var fid=req.query.fid;
//   var sql="SELECT pic,price,title FROM flower where fid=?"
//   pool.query(sql,[fid],(err,result)=>{
//     if (err) throw err;
//     // console.log(result)
//   })
// })
// // 购物车
// router.get("/cart",(req,res)=>{
//     var uid=req.session.uid;
//     // console.log(req.session.uid);
//     if(!uid){
//       res.send({code:-1,msg:"请登录"});
//       return;
//     }
//     var sql="SELECT cid,img_url,price,count,title FROM flower_cart WHERE uid=?"
//     pool.query(sql,[uid],(err,result)=>{
//       if(err) throw err;
//       // console.log(result);
//       res.send({code:1,data:result})
//     })
//   })
//  // 删除购物车商品
//   router.get("/delItem",(req,res)=>{
//     // 参数购物车id
//     // var cid=req.session.cid;
//     var cid=req.query.cid;
//     console.log(cid);
//     var sql="delete from flower_cart where cid=?";
//     pool.query(sql,[cid],(err,result)=>{
//       if (err) throw err;
//       console.log(result);
//       if(result.affectedRows>0){
//         res.send({code :1,msg:"删除成功"})
//       }else{
//         res.send({code:-1,msg:"删除失败"})
//       }
      
//     })
//   });
//   // 删除多个商品
//   router.get("/delAll",(req,res)=>{
//     var cids=req.query.cids;
//     var sql=`DELETE FROM flower_cart WHERE cid IN (${cids})`;
//     pool.query(sql,(err,result)=>{
//       if(err) throw err;
//       if(result.affectedRows>0){
//         res.send({code:1,msg:"删除成功"})
//       }else{
//         res.send({code:-1,msg:"删除失败"});
//       }
//     })
//   });


  module.exports=router;
