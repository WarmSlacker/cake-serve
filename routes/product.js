const express=require("express");
const router=express.Router();
const pool=require('../pool.js');

// 商品的显示
router.get('/product',(req,res)=>{
  
  // 3.创建SQL语句执行
  var sql="SELECT pid,title,price,pic FROM cake_product"
  // 4.返回值{code:1,msg:"查询成功",data:[],pageCount:}
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    //   console.log(result);
    var product={code:1,msg:"查询成功",data:result}
    product.data=result;
    res.send(product);
    // console.log(result)
  })
})
router.get('/list',(req,res)=>{
  var cid=req.query.cid;
  // console.log(cid)
  // 3.创建SQL语句执行
  
  var sql="SELECT fid,title,price,pic FROM cake_product_list WHERE cid=?"
  // 4.返回值{code:1,msg:"查询成功",data:[],pageCount:}
  pool.query(sql,[cid],(err,result)=>{
    if(err) throw err;
    //  console.log(result);
    var product={code:1,msg:"查询成功",data:result}
    product.data=result;
    var sql="SELECT pic FROM cake_category WHERE cid=?"
  pool.query(sql,[cid],(err,result)=>{
    if(err) throw err;
    product.pic=result
    res.send(product);
    // console.log(result)
  })
})
})
// //新品人气
// router.get('/newlist',(req,res)=>{
//   var xin=req.query.xin;
//   var pno=req.query.pno;
//   var ps=req.query.ps;
//   // 2.设置默认值
//   if(!pno){pno=1};
//   if(!ps){ps=16};
//   // if(!xin){
//   var sql="SELECT fid,title,price,pic FROM flower WHERE xin=? LIMIT ?,?"
//   var offset=(pno-1)*ps;
//   ps=parseInt(ps);
//   pool.query(sql,[xin,offset,ps],(err,result)=>{
//     if(err) throw err;
//     var product={code:1,msg:"查询成功",data:result}
//     product.data=result;

//     var sql="SELECT count(*) AS c FROM flower WHERE xin=? "
//     pool.query(sql,[xin],(err,result)=>{
//       if(err) throw err;
//       var pages=result[0].c;
//         var pc=Math.ceil(result[0].c/ps);
//         product.pages=pages;
//         product.pc=pc;
//         res.send(product);
//       })    
//   })
// // }
// })
// //商品类型
// router.get('/flist',(req,res)=>{
//   var sid=req.query.sid;
//   var pno=req.query.pno;
//   var ps=req.query.ps;
//   // 2.设置默认值
//   if(!pno){pno=1};
//   if(!ps){ps=16};
//   // if(!sid){
//   var sql="SELECT fid,title,price,pic FROM flower WHERE sid=? LIMIT ?,?"
//   var offset=(pno-1)*ps;
//   ps=parseInt(ps);
//   pool.query(sql,[sid,offset,ps],(err,result)=>{
//     if(err) throw err;
//     var product={code:1,msg:"查询成功",data:result}
//     product.data=result;
//     var sql="SELECT count(*) AS c FROM flower WHERE sid=? "
//     pool.query(sql,[sid],(err,result)=>{
//       if(err) throw err;
//       var pages=result[0].c;
//         var pc=Math.ceil(result[0].c/ps); 
//         // console.log(pc);
//         product.pages=pages;
//         product.pc=pc;
//         // console.log(pc);
//         res.send(product);
//       })    
//   })
// // }
// })
//详情页
router.get('/details',(req,res)=>{
  var fid=req.query.fid;
  var output={
    product:{},
    pics:[]
  }
  if(fid!==undefined){
  var sql="SELECT * FROM cake_product WHERE fid=?" 
  pool.query(sql,[fid],(err,result)=>{
    if(err) throw err;
    // console.log(result);
    output.product=result
    var sql="SELECT sm,lg FROM cake_product_pic WHERE fid=?"
    pool.query(sql,[fid],(err,result)=>{
      if(err) throw err;
      // console.log(result)
      output.pics=result;
      res.send(output);
    })
  })
}
})


module.exports=router;