#设置客户端连接服务器端使用的编码为UTF8
SET NAMES UTF8;
#丢弃指定数据库,如果存在
DROP DATABASE IF EXISTS cake;
#创建新的数据库
CREATE DATABASE cake CHARSET=UTF8;
#进入数据库
USE cake;
#分类表
CREATE TABLE cake_category(
	cid INT PRIMARY KEY AUTO_INCREMENT, 
	cname VARCHAR(32),              #类名
  pic VARCHAR(25)
);
#种类
CREATE TABLE cake_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  cid INT,             
  fname VARCHAR(32)  
);
#商品表
CREATE TABLE cake_product(
	pid INT PRIMARY KEY AUTO_INCREMENT,
  cid INT,
	fid INT,                 #所属种类编号
	title  VARCHAR(128),             #标题
	price DECIMAL(10,2),             #价格
	spec VARCHAR(64),                #规格/颜色
	size VARCHAR(32),                #尺寸
	unmber VARCHAR(32),              #
	laid VARCHAR(32),
	lname VARCHAR(32),               #商品名称
	details VARCHAR(1024),           #产品详细说明
  shelf_time BIGINT,               #上架时间
  sold_count INT,                  #已售出的数量
  is_onsale BOOLEAN  ,             #是否促销中
  pic VARCHAR(25)
);
CREATE TABLE cake_product_list(
	pid INT PRIMARY KEY ,
	fid INT,                 #所属种类编号
  cid INT,
  pic VARCHAR(25),
	title  VARCHAR(128),             #标题
	price DECIMAL(10,2)             #价格
 
);
#图片
CREATE TABLE cake_product_pic(
	  pid INT PRIMARY KEY AUTO_INCREMENT,
    fid INT,                  #种类编号
    sm VARCHAR(128),             #图片路径
    lg VARCHAR(128)
);
/**用户信息**/
CREATE TABLE cake_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),
  brithday  VARCHAR(16),
  avatar VARCHAR(128),        #头像图片路径
  user_name VARCHAR(32),      #用户名，如王小明
  gender INT                  #性别  0-女  1-男
);
/**收货地址信息**/
CREATE TABLE cake_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编
  is_default BOOLEAN          #是否为当前用户的默认收货地址
);
/**购物车条目**/
CREATE TABLE cake_cart_item(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,      #用户编号
  count INT,        #购买数量
  img_url VARCHAR(25),
  price   DECIMAL(10,2),
  title   VARCHAR(255),
  is_checked BOOLEAN #是否已勾选，确定购买
);
/**用户订单**/
CREATE TABLE cake_order(
  oid INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,
  aid INT,
  status INT,             #订单状态  1-等待付款 2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT    #签收时间
)AUTO_INCREMENT=10000000;
/**用户订单详情**/
CREATE TABLE cake_order_detail(
  did INT  PRIMARY KEY AUTO_INCREMENT,
  oid INT,           #订单编号
  pid INT,         #产品编号
  count INT               #购买数量
);
/****首页轮播广告商品****/
CREATE TABLE cake_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);
/*******首页商品*******/
CREATE TABLE cake_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  details VARCHAR(128),
  pic VARCHAR(128),
  price DECIMAL(10,2),
  href VARCHAR(128)
);
INSERT INTO cake_index_product VALUES
(NULL,'Teatime 浅草','浅草才能没马蹄','img/details/dangao1.jpg',198,1),
(NULL,'Minty White 清境','薄荷的清爽,柑橘风味与缅甸青柠的清香。','img/details/dangao15.jpg',298,15),
(NULL,'Black Label 黑方','纯黑巧克力的香醇','img/details/dangao17.jpg',198,17),
(NULL,'Brownie Cake 布朗尼','时光荏苒亘古不变','img/details/dangao19.jpg',198,19),
(NULL,'杰瑞','清纯鲜奶果仁香气十足 ','img/details/dangao22.jpg',289,22),
(NULL,'Cocoa Island 可可岛','精品巧克力蛋糕风味曲线','img/details/dangao4.jpg',198,4),
(NULL,'Black Forest 黑森林','樱桃酒味从巧克力卷的缝隙飘出','img/details/dangao2.jpg',998,2),
(NULL,'榴莲飘飘','自然成熟榴莲肉 超薄白巧克力片 ','img/details/dangao3.jpg',198,3),
(NULL,'黑白巧克力慕斯 彼尔德（ＨＢＤ）','白巧克力慕斯 冰凉细腻 ','img/details/dangao6.jpg',750,6),
(NULL,'枣儿','红枣奶油戚风，与姜撞奶慕斯 温暖 绵延','img/details/dangao7.jpg',198,7),
(NULL,'黑白巧克力慕斯 彼尔德（Party）',' 醇厚黑巧克力酱与可可戚风  ','img/details/dangao8.jpg',750,8),
(NULL,'芒果奶油蛋糕','鲜切芒果纯乳脂奶油芒果百香果慕斯夹心','img/details/dangao9.jpg',198,9),
(NULL,'百利甜情人','玫瑰的优雅 等于热恋的味道 ','img/details/dangao5.jpg',198,5),
(NULL,'Wall&Tree 东方栗融','优化芝士层口','img/details/dangao23.jpg',298,23),
(NULL,'Chestnut Cream （新）栗蓉暗香','比利时黑巧克力豆','img/details/dangao20.jpg',198,20),
(NULL,'Pine Stone Cowboy 松仁淡奶（木糖醇）','奶油与坚果的和谐、轻甜','img/details/dangao21.jpg',198,21),
(NULL,'帕玛森芝士可颂','清纯鲜奶,果仁香气十足',"img/details/mb3.jpg",39,26),
(NULL,'阳光葡萄卷','太阳造型，天天晴朗',"img/details/mb4.jpg",13,27),
(NULL,'红糖红枣桂圆软欧','柔软、质朴的切片面包奶香',"img/details/mb6.jpg",16,29),
(NULL,'核桃派','焦糖核桃满嵌酥皮',"img/details/mb8.jpg",18,31),
(NULL,'Milk Gelato 原味牛乳冰淇淋','意式杰拉朵冰淇淋细腻、新鲜',"img/details/bq1.jpg",38,33),
(NULL,'Litchi Gelato荔枝冰淇淋','荔枝香味丰富，真实',"img/details/bq2.jpg",38,34),
(NULL,'Latte Gelato 拿铁冰淇淋','，香气浓郁巧克力坚果气息',"img/details/bq3.jpg",38,35),
(NULL,'Durian Gelato 榴莲冰淇淋','榴莲，馥郁、丰满',"img/details/bq4.jpg",38,36),
(NULL,'Yirgacheffe Coffee 耶加雪菲挂耳咖啡','甜酸比柔和柠檬香、花香、蜂蜜味',"img/details/cof1.jpg",10,39),
(NULL,'Brazil Coffee 巴西挂耳咖啡','醇厚坚果香的咖啡液',"img/details/cof2.jpg",10,40),
(NULL,'Sidamo Coffee 西达摩挂耳咖啡','日晒豆成熟的果酱红酒般的滑顺',"img/details/cof3.jpg",10,41),
(NULL,'Papua New Guinea Coffee 巴布亚新几内亚挂耳咖啡','干净绵长微苦巧克力风味',"img/details/cof4.jpg",10,42);
INSERT INTO cake_index_carousel VALUES
(NULL,"img/banner1.jpg","banner","product"),
(NULL,"img/banner1.png","葱油香浓吐司","product"),
(NULL,"img/banner2.jpg","下午茶","product"),
(NULL,"img/banner2.png","香草慕斯蛋糕","product"),
(NULL,"img/banner3.jpg","蔓越莓吐司","product"),
(NULL,"img/banner3.png","香橙","product"),
(NULL,"img/banner4.jpg","芝士","product"),
(NULL,"img/banner4.png","牛奶奶油","product");
/*******************/
/******数据导入******/
/*******************/
/******分类表*****/
INSERT INTO cake_category VALUES
(NULL,'蛋糕',"img/dangao/dangao1.jpg"),
(NULL,'面包',"img/mianbao/mb1.jpg"),
(NULL,'冰淇淋',"img/bingqilin/bq1.jpg"),
(NULL,'咖啡',"img/coffee/cof1.jpg");
/********************/
INSERT INTO cake_family VALUES
(NULL,1,'Teatime 浅草'),
(NULL,1,'Black Forest 黑森林'),
(NULL,1,'榴莲飘飘'),
(NULL,1,'Cocoa Island 可可岛'),
(NULL,1,'百利甜情人'),
(NULL,1,'黑白巧克力慕斯 彼尔德（ＨＢＤ）'),
(NULL,1,'枣儿'),
(NULL,1,'黑白巧克力慕斯 彼尔德（Party）'),
(NULL,1,'芒果奶油蛋糕'),
(NULL,1,'百香果酸乳酪慕斯（木糖醇）'),
(NULL,1,'Heartfelt Wish 心语心愿'),
(NULL,1,'6口味切块'),
(NULL,1,'Black and White Chocolate Mousse 黑白巧克力慕斯'),
(NULL,1,'Cool&Hot 冻慕斯与焗芝士'),
(NULL,1,'Minty White 清境'),
(NULL,1,'forget Tiramisu 新马斯卡彭-咖啡软芝士蛋糕'),
(NULL,1,'Black Label 黑方'),
(NULL,1,'Crumble 杏仁克鲁兹'),
(NULL,1,'Brownie Cake 布朗尼'),
(NULL,1,'Chestnut Cream （新）栗蓉暗香'),
(NULL,1,'Pine Stone Cowboy 松仁淡奶（木糖醇）'),
(NULL,1,'杰瑞'),
(NULL,1,'Wall&Tree 东方栗融'),
(NULL,2,'北海道吐司（4片）'),
(NULL,2,'卜壳吐司（2片）'),
(NULL,2,'帕玛森芝士可颂'),
(NULL,2,'阳光葡萄卷'),
(NULL,2,'官网原味可颂'),   
(NULL,2,'红糖红枣桂圆软欧'),
(NULL,2,'榛子巧克力软欧'),
(NULL,2,'核桃派'),
(NULL,2,'肉桂卷'),
(NULL,3,'Milk Gelato 原味牛乳冰淇淋'),
(NULL,3,'Litchi Gelato荔枝冰淇淋'),
(NULL,3,'Latte Gelato 拿铁冰淇淋'),
(NULL,3,'Durian Gelato 榴莲冰淇淋'),
(NULL,3,'四口味Gelato冰淇淋混合装（4盒入）'),
(NULL,3,'原味牛乳冰淇淋2个+荔枝冰淇淋2个+冰淇淋包装盒'),
(NULL,3,'Milk Gelato 原味牛乳冰淇淋'),
(NULL,3,'Litchi Gelato荔枝冰淇淋'),
(NULL,3,'Latte Gelato 拿铁冰淇淋'),
(NULL,3,'Durian Gelato 榴莲冰淇淋'),
(NULL,3,'四口味Gelato冰淇淋混合装（4盒入）'),
(NULL,3,'原味牛乳冰淇淋2个+荔枝冰淇淋2个+冰淇淋包装盒'),
(NULL,4,'Yirgacheffe Coffee 耶加雪菲挂耳咖啡'),
(NULL,4,'Brazil Coffee 巴西挂耳咖啡'),
(NULL,4,'Sidamo Coffee 西达摩挂耳咖啡'),
(NULL,4,'Papua New Guinea Coffee 巴布亚新几内亚挂耳咖啡'),
(NULL,4,'Yirgacheffe Coffee 耶加雪菲挂耳咖啡'),
(NULL,4,'Brazil Coffee 巴西挂耳咖啡'),
(NULL,4,'Sidamo Coffee 西达摩挂耳咖啡'),
(NULL,4,'Papua New Guinea Coffee 巴布亚新几内亚挂耳咖啡');

/************/
INSERT INTO cake_product_pic VALUES
(NULL,1,"img/dangao/dangao1.jpg","img/dangao/dangao1.jpg"),
(NULL,1,"img/dangao/dangao1_1.jpg","img/dangao/dangao1_1.jpg"),
(NULL,1,"img/dangao/dangao1_2.jpg","img/dangao/dangao1_2.jpg"),
(NULL,1,"img/dangao/dangao1_3.jpg","img/dangao/dangao1_3.jpg"),
(NULL,2,"img/dangao/dangao2.jpg","img/dangao/dangao2.jpg"),
(NULL,2,"img/dangao/dangao2_1.jpg","img/dangao/dangao2_1.jpg"),
(NULL,2,"img/dangao/dangao2_2.jpg","img/dangao/dangao2_2.jpg"),
(NULL,2,"img/dangao/dangao2_3.jpg","img/dangao/dangao2_3.jpg"),
(NULL,3,"img/dangao/dangao3.jpg","img/dangao/dangao3.jpg"),
(NULL,3,"img/dangao/dangao3_1.jpg","img/dangao/dangao3_1.jpg"),
(NULL,3,"img/dangao/dangao3_2.jpg","img/dangao/dangao3_2.jpg"),
(NULL,4,"img/dangao/dangao4_1.jpg","img/dangao/dangao4_1.jpg"),
(NULL,4,"img/dangao/dangao4_2.jpg","img/dangao/dangao4_2.jpg"),
(NULL,4,"img/dangao/dangao4_3.jpg","img/dangao/dangao4_3.jpg"),
(NULL,5,"img/dangao/dangao5.jpg","img/dangao/dangao5.jpg"),
(NULL,5,"img/dangao/dangao5_1.jpg","img/dangao/dangao5_1.jpg"),
(NULL,5,"img/dangao/dangao5_2.jpg","img/dangao/dangao5_2.jpg"),
(NULL,6,"img/dangao/dangao6.jpg","img/dangao/dangao6.jpg"),
(NULL,6,"img/dangao/dangao6_1.jpg","img/dangao/dangao6_1.jpg"),
(NULL,6,"img/dangao/dangao6_2.jpg","img/dangao/dangao6_2.jpg"),
(NULL,7,"img/dangao/dangao7.jpg","img/dangao/dangao7.jpg"),
(NULL,7,"img/dangao/dangao7_1.jpg","img/dangao/dangao7_1.jpg"),
(NULL,7,"img/dangao/dangao7_2.jpg","img/dangao/dangao7_2.jpg"),
(NULL,7,"img/dangao/dangao7_3.jpg","img/dangao/dangao7_3.jpg"),
(NULL,8,"img/dangao/dangao8.jpg","img/dangao/dangao8.jpg"),
(NULL,8,"img/dangao/dangao8_1.jpg","img/dangao/dangao8_1.jpg"),
(NULL,8,"img/dangao/dangao8_2.jpg","img/dangao/dangao8_2.jpg"),
(NULL,9,"img/dangao/dangao9.jpg","img/dangao/dangao9.jpg"),
(NULL,9,"img/dangao/dangao9_1.jpg","img/dangao/dangao9_1.jpg"),
(NULL,9,"img/dangao/dangao9_2.jpg","img/dangao/dangao9_2.jpg"),
(NULL,9,"img/dangao/dangao9_3.jpg","img/dangao/dangao9_3.jpg"),
(NULL,10,"img/dangao/dangao10.jpg","img/dangao/dangao10.jpg"),
(NULL,10,"img/dangao/dangao10_1.jpg","img/dangao/dangao10_1.jpg"),
(NULL,10,"img/dangao/dangao10_2.jpg","img/dangao/dangao10_2.jpg"),
(NULL,10,"img/dangao/dangao10_3.jpg","img/dangao/dangao10_3.jpg"),
(NULL,11,"img/dangao/dangao11.jpg","img/dangao/dangao11.jpg"),
(NULL,11,"img/dangao/dangao11_1.jpg","img/dangao/dangao11_1.jpg"),
(NULL,11,"img/dangao/dangao11_2.jpg","img/dangao/dangao11_2.jpg"),
(NULL,11,"img/dangao/dangao11_3.jpg","img/dangao/dangao11_3.jpg"),
(NULL,12,"img/dangao/dangao12.jpg","img/dangao/dangao12.jpg"),
(NULL,12,"img/dangao/dangao12_1.jpg","img/dangao/dangao12_1.jpg"),
(NULL,12,"img/dangao/dangao12_2.jpg","img/dangao/dangao12_2.jpg"),
(NULL,12,"img/dangao/dangao12_3.jpg","img/dangao/dangao12_3.jpg"),
(NULL,13,"img/dangao/dangao13.jpg","img/dangao/dangao13.jpg"),
(NULL,13,"img/dangao/dangao13_1.jpg","img/dangao/dangao13_1.jpg"),
(NULL,14,"img/dangao/dangao14.jpg","img/dangao/dangao14.jpg"),
(NULL,14,"img/dangao/dangao14_1.jpg","img/dangao/dangao14_1.jpg"),
(NULL,14,"img/dangao/dangao14_2.jpg","img/dangao/dangao14_2.jpg"),
(NULL,15,"img/dangao/dangao15.jpg","img/dangao/dangao15.jpg"),
(NULL,15,"img/dangao/dangao15_1.jpg","img/dangao/dangao15_1.jpg"),
(NULL,15,"img/dangao/dangao15_2.jpg","img/dangao/dangao15_2.jpg"),
(NULL,15,"img/dangao/dangao15_3.jpg","img/dangao/dangao15_3.jpg"),
(NULL,16,"img/dangao/dangao16.jpg","img/dangao/dangao16.jpg"),
(NULL,16,"img/dangao/dangao16_1.jpg","img/dangao/dangao16_1.jpg"),
(NULL,16,"img/dangao/dangao16_2.jpg","img/dangao/dangao16_2.jpg"),
(NULL,16,"img/dangao/dangao16_3.jpg","img/dangao/dangao16_3.jpg"),
(NULL,17,"img/dangao/dangao17.jpg","img/dangao/dangao17.jpg"),
(NULL,17,"img/dangao/dangao17_1.jpg","img/dangao/dangao17_1.jpg"),
(NULL,17,"img/dangaodangao/17_2.jpg","img/dangao/dangao17_2.jpg"),
(NULL,17,"img/dangao/dangao17_3.jpg","img/dangao/dangao17_3.jpg"),
(NULL,18,"img/dangao/dangao18.jpg","img/dangao/dangao18.jpg"),
(NULL,18,"img/dangao/dangao18_1.jpg","img/dangao/dangao18_1.jpg"),
(NULL,18,"img/dangao/dangao18_2.jpg","img/dangao/dangao18_2.jpg"),
(NULL,18,"img/dangao/dangao18_3.jpg","img/dangao/dangao18_3.jpg"),
(NULL,19,"img/dangao/dangao19.jpg","img/dangao/dangao19.jpg"),
(NULL,19,"img/dangao/dangao19_1.jpg","img/dangao/dangao19_1.jpg"),
(NULL,20,"img/dangao/dangao20.jpg","img/dangao/dangao20.jpg"),
(NULL,20,"img/dangao/dangao20_1.jpg","img/dangao/dangao20_1.jpg"),
(NULL,20,"img/dangao/dangao20_2.jpg","img/dangao/dangao20_2.jpg"),
(NULL,20,"img/dangao/dangao20_3.jpg","img/dangao/dangao20_3.jpg"),
(NULL,21,"img/dangao/dangao21.jpg","img/dangao/dangao21.jpg"),
(NULL,21,"img/dangao/dangao21_1.jpg","img/dangao/dangao21_1.jpg"),
(NULL,21,"img/dangao/dangao21_2.jpg","img/dangao/dangao21_2.jpg"),
(NULL,21,"img/dangao/dangao21_3.jpg","img/dangao/dangao21_3.jpg"),
(NULL,22,"img/dangao/dangao22.jpg","img/dangao/dangao22.jpg"),
(NULL,22,"img/dangao/dangao22_1.jpg","img/dangao/dangao22_1.jpg"),
(NULL,22,"img/dangao/dangao22_2.jpg","img/dangao/dangao22_2.jpg"),
(NULL,22,"img/dangao/dangao22_3.jpg","img/dangao/dangao22_3.jpg"),
(NULL,23,"img/dangao/dangao23.jpg","img/dangao/dangao23.jpg"),
(NULL,23,"img/dangao/dangao23_1.jpg","img/dangao/dangao23_1.jpg"),
(NULL,23,"img/dangao/dangao23_2.jpg","img/dangao/dangao23_2.jpg"),
(NULL,23,"img/dangao/dangao23_3.jpg","img/dangao/dangao23_3.jpg"),
(NULL,24,"img/mianbao/mb1.jpg","img/mianbao/mb1.jpg"),
(NULL,24,"img/mianbao/mb1_1.jpg","img/mianbao/mb1_1.jpg"),
(NULL,24,"img/mianbao/mb1_2.jpg","img/mianbao/mb1_2.jpg"),
(NULL,25,"img/mianbao/mb2.jpg","img/mianbao/mb2.jpg"),
(NULL,25,"img/mianbao/mb2_1.jpg","img/mianbao/mb2_1.jpg"),
(NULL,26,"img/mianbao/mb3.jpg","img/mianbao/mb3.jpg"),
(NULL,26,"img/mianbao/mb3_1.jpg","img/mianbao/mb3_1.jpg"),
(NULL,26,"img/mianbao/mb3_2.jpg","img/mianbao/mb3_2.jpg"),
(NULL,27,"img/mianbao/mb4.jpg","img/mianbao/mb4.jpg"),
(NULL,27,"img/mianbao/mb4_1.jpg","img/mianbao/mb4_1.jpg"),
(NULL,27,"img/mianbao/mb4_2.jpg","img/mianbao/mb4_2.jpg"),
(NULL,28,"img/mianbao/mb5.jpg","img/mianbao/mb5.jpg"),
(NULL,28,"img/mianbao/mb5_1.jpg","img/mianbao/mb5_1.jpg"),
(NULL,28,"img/mianbao/mb5_2.jpg","img/mianbao/mb5_2.jpg"),
(NULL,29,"img/mianbao/mb6.jpg","img/mianbao/mb6.jpg"),
(NULL,29,"img/mianbao/mb6_1.jpg","img/mianbao/mb6_1.jpg"),
(NULL,29,"img/mianbao/mb6_2.jpg","img/mianbao/mb6_2.jpg"),
(NULL,29,"img/mianbao/mb6_3.jpg","img/mianbao/mb6_3.jpg"),
(NULL,30,"img/mianbao/mb7.jpg","img/mianbao/mb7.jpg"),
(NULL,30,"img/mianbao/mb7_1.jpg","img/mianbao/mb7_1.jpg"),
(NULL,30,"img/mianbao/mb7_2.jpg","img/mianbao/mb7_2.jpg"),
(NULL,31,"img/mianbao/mb8.jpg","img/mianbao/mb8.jpg"),
(NULL,31,"img/mianbao/mb8_1.jpg","img/mianbao/mb8_1.jpg"),
(NULL,31,"img/mianbao/mb8_2.jpg","img/mianbao/mb8_2.jpg"),
(NULL,32,"img/mianbao/mb9.jpg","img/mianbao/mb9.jpg"),
(NULL,32,"img/mianbao/mb9_1.jpg","img/mianbao/mb9_1.jpg"),
(NULL,32,"img/mianbao/mb9_2.jpg","img/mianbao/mb9_2.jpg"),
(NULL,33,"img/mianbao/mb1_1.jpg","img/mianbao/mb1_1.jpg"),
(NULL,33,"img/mianbao/mb1_2.jpg","img/mianbao/mb1_2.jpg"),
(NULL,34,"img/mianbao/mb2.jpg","img/mianbao/mb2.jpg"),
(NULL,34,"img/mianbao/mb2_1.jpg","img/mianbao/mb2_1.jpg"),
(NULL,35,"img/mianbao/mb3.jpg","img/mianbao/mb3.jpg"),
(NULL,35,"img/mianbao/mb3_1.jpg","img/mianbao/mb3_1.jpg"),
(NULL,35,"img/mianbao/mb3_2.jpg","img/mianbao/mb3_2.jpg"),
(NULL,36,"img/mianbao/mb4.jpg","img/mianbao/mb4.jpg"),
(NULL,36,"img/mianbao/mb4_1.jpg","img/mianbao/mb4_1.jpg"),
(NULL,36,"img/mianbao/mb4_2.jpg","img/mianbao/mb4_2.jpg"),
(NULL,37,"img/mianbao/mb5.jpg","img/mianbao/mb5.jpg"),
(NULL,37,"img/mianbao/mb5_1.jpg","img/mianbao/mb5_1.jpg"),
(NULL,37,"img/mianbao/mb5_2.jpg","img/mianbao/mb5_2.jpg"),
(NULL,38,"img/mianbao/mb6.jpg","img/mianbao/mb6.jpg"),
(NULL,38,"img/mianbao/mb6_1.jpg","img/mianbao/mb6_1.jpg"),
(NULL,38,"img/mianbao/mb6_2.jpg","img/mianbao/mb6_2.jpg"),
(NULL,38,"img/mianbao/mb6_3.jpg","img/mianbao/mb6_3.jpg"),
(NULL,39,"img/mianbao/mb7.jpg","img/mianbao/mb7.jpg"),
(NULL,39,"img/mianbao/mb7_1.jpg","img/mianbao/mb7_1.jpg"),
(NULL,39,"img/mianbao/mb7_2.jpg","img/mianbao/mb7_2.jpg"),
(NULL,40,"img/mianbao/mb8.jpg","img/mianbao/mb8.jpg"),
(NULL,40,"img/mianbao/mb8_1.jpg","img/mianbao/mb8_1.jpg"),
(NULL,40,"img/mianbao/mb8_2.jpg","img/mianbao/mb8_2.jpg"),
(NULL,41,"img/mianbao/mb9.jpg","img/mianbao/mb9.jpg"),
(NULL,41,"img/mianbao/mb9_1.jpg","img/mianbao/mb9_1.jpg"),
(NULL,41,"img/mianbao/mb9_2.jpg","img/mianbao/mb9_2.jpg"),
(NULL,42,"img/bingqilin/bq1.jpg","img/bingqilin/bq1.jpg"),
(NULL,43,"img/bingqilin/bq2.jpg","img/bingqilin/bq2.jpg"),
(NULL,43,"img/bingqilin/bq2_1.jpg","img/bingqilin/bq2_1.jpg"),
(NULL,43,"img/bingqilin/bq2_2.jpg","img/bingqilin/bq2_2.jpg"),
(NULL,44,"img/bingqilin/bq3.jpg","img/bingqilin/bq3.jpg"),
(NULL,45,"img/bingqilin/bq4.jpg","img/bingqilin/bq4.jpg"),
(NULL,46,"img/bingqilin/bq5.jpg","img/bingqilin/bq5.jpg"),
(NULL,46,"img/bingqilin/bq5_1.jpg","img/bingqilin/bq5_1.jpg"),
(NULL,46,"img/bingqilin/bq5_2.jpg","img/bingqilin/bq5_2.jpg"),
(NULL,47,"img/bingqilin/bq6.jpg","img/bingqilin/bq6.jpg"),
(NULL,47,"img/bingqilin/bq6_1.jpg","img/bingqilin/bq6_1.jpg"),
(NULL,47,"img/bingqilin/bq6_2.jpg","img/bingqilin/bq6_2.jpg"),
(NULL,48,"img/coffee/cof1.jpg","img/coffee/cof1.jpg"),
(NULL,48,"img/coffee/cof1_1.jpg","img/coffee/cof1_1.jpg"),
(NULL,48,"img/coffee/cof1_2.jpg","img/coffee/cof1_2.jpg"),
(NULL,48,"img/coffee/cof1_3.jpg","img/coffee/cof1_3.jpg"),
(NULL,49,"img/coffee/cof1.jpg","img/coffee/cof1.jpg"),
(NULL,49,"img/coffee/cof1_ 1.jpg","img/coffee/cof1_1.jpg"),
(NULL,49,"img/coffee/cof1_2.jpg","img/coffee/cof1_2.jpg"),
(NULL,49,"img/coffee/cof1_3.jpg","img/coffee/cof1_3.jpg"),
(NULL,50,"img/coffee/cof1.jpg","img/coffee/cof1.jpg"),
(NULL,50,"img/coffee/cof1_ 1.jpg","img/coffee/cof1_1.jpg"),
(NULL,50,"img/coffee/cof1_2.jpg","img/coffee/cof1_2.jpg"),
(NULL,50,"img/coffee/cof1_3.jpg","img/coffee/cof1_3.jpg"),
(NULL,51,"img/coffee/cof1.jpg","img/coffee/cof1.jpg"),
(NULL,51,"img/coffee/cof1_ 1.jpg","img/coffee/cof1_1.jpg"),
(NULL,51,"img/coffee/cof1_2.jpg","img/coffee/cof1_2.jpg"),
(NULL,51 ,"img/coffee/cof1_3.jpg","img/coffee/cof1_3.jpg"),
(NULL,52,"img/coffee/cof1.jpg","img/coffee/cof1.jpg"),
(NULL,52,"img/coffee/cof1_1.jpg","img/coffee/cof1_1.jpg"),
(NULL,52,"img/coffee/cof1_2.jpg","img/coffee/cof1_2.jpg"),
(NULL,52,"img/coffee/cof1_3.jpg","img/coffee/cof1_3.jpg"),
(NULL,53,"img/coffee/cof1.jpg","img/coffee/cof1.jpg"),
(NULL,53,"img/coffee/cof1_ 1.jpg","img/coffee/cof1_1.jpg"),
(NULL,53,"img/coffee/cof1_2.jpg","img/coffee/cof1_2.jpg"),
(NULL,53,"img/coffee/cof1_3.jpg","img/coffee/cof1_3.jpg"),
(NULL,54,"img/coffee/cof1.jpg","img/coffee/cof1.jpg"),
(NULL,54,"img/coffee/cof1_ 1.jpg","img/coffee/cof1_1.jpg"),
(NULL,54,"img/coffee/cof1_2.jpg","img/coffee/cof1_2.jpg"),
(NULL,54,"img/coffee/cof1_3.jpg","img/coffee/cof1_3.jpg"),
(NULL,55,"img/coffee/cof1.jpg","img/coffee/cof1.jpg"),
(NULL,55,"img/coffee/cof1_ 1.jpg","img/coffee/cof1_1.jpg"),
(NULL,55,"img/coffee/cof1_2.jpg","img/coffee/cof1_2.jpg"),
(NULL,55 ,"img/coffee/cof1_3.jpg","img/coffee/cof1_3.jpg");
/*********************************************/
INSERT INTO cake_product_list VALUES
( 1,1,1,'img/details/dangao1.jpg','Teatime 浅草',198),
( 2,2,1,'img/details/dangao2.jpg','Black Forest 黑森林',268),
( 3,3,1,'img/details/dangao3.jpg','榴莲飘飘',198),
( 4,4,1,'img/details/dangao4.jpg','Cocoa Island 可可岛',198),
( 5,5,1,'img/details/dangao5.jpg','百利甜情人',298),
( 6,6,1,'img/details/dangao6.jpg','黑白巧克力慕斯 彼尔德（ＨＢＤ）',198),
( 7,7,1,'img/details/dangao7.jpg','枣儿',198),
( 8,8,1,'img/details/dangao8.jpg','黑白巧克力慕斯 彼尔德（Party）',198),
( 9,9,1,'img/details/dangao9.jpg','芒果奶油蛋糕',198),
( 10,10,1,'img/details/dangao10.jpg','百香果酸乳酪慕斯（木糖醇）',198),
( 11,11,1,'img/details/dangao11.jpg','Heartfelt Wish 心语心愿',198),
( 12,12,1,'img/details/dangao12.jpg','6口味切块',398),
( 13,13,1,'img/details/dangao13.jpg','Black and White Chocolate Mousse 黑白巧克力慕斯',998),
( 14,14,1,'img/details/dangao14.jpg','Cool&Hot 冻慕斯与焗芝士',198),
( 15,15,1,'img/details/dangao15.jpg','Minty White 清境',198),
( 16,16,1,'img/details/dangao16.jpg','forget Tiramisu 新马斯卡彭-咖啡软芝士蛋糕',198),
( 17,17,1,'img/details/dangao17.jpg','Black Label 黑方',198),
( 18,18,1,'img/details/dangao18.jpg','Crumble 杏仁克鲁兹',198),
( 19,19,1,'img/details/dangao19.jpg','Brownie Cake 布朗尼',268),
( 20,20,1,'img/details/dangao20.jpg','Chestnut Cream （新）栗蓉暗香',198),
( 21,21,1,'img/details/dangao21.jpg','Pine Stone Cowboy 松仁淡奶（木糖醇）',198),
( 22,22,1,'img/details/dangao22.jpg','杰瑞',198),
( 23,23,1,'img/details/dangao23.jpg','Wall&Tree 东方栗融',398),
( 24,24,2,'img/details/mb1.jpg','北海道吐司（4片）',12),
( 25,25,2,'img/details/mb2.jpg','卜壳吐司（2片）',12),
( 26,26,2,'img/details/mb3.jpg','帕玛森芝士可颂',39),
( 27,27,2,'img/details/mb4.jpg','阳光葡萄卷',13),
( 28,28,2,'img/details/mb5.jpg','官网原味可颂',12),
( 29,29,2,'img/details/mb6.jpg','红糖红枣桂圆软欧',16),
( 30,30,2,'img/details/mb7.jpg','榛子巧克力软欧',12),
( 31,31,2,'img/details/mb8.jpg','核桃派',18),
( 32,32,2,'img/details/mb9.jpg','肉桂卷',13),
( 33,33,2,'img/details/mb1.jpg','北海道吐司（4片）',12),
( 34,34,2,'img/details/mb2.jpg','卜壳吐司（2片）',12),
( 35,35,2,'img/details/mb3.jpg','帕玛森芝士可颂',39),
( 36,36,2,'img/details/mb4.jpg','阳光葡萄卷',13),
( 37,37,2,'img/details/mb5.jpg','官网原味可颂',12),
( 38,38,2,'img/details/mb6.jpg','红糖红枣桂圆软欧',16),
( 39,39,2,'img/details/mb7.jpg','榛子巧克力软欧',12),
( 40,40,2,'img/details/mb8.jpg','核桃派',18),
( 41,41,2,'img/details/mb9.jpg','肉桂卷',13),
( 42,42,3,'img/details/bq1.jpg','Milk Gelato 原味牛乳冰淇淋',38),
( 43,43,3,'img/details/bq2.jpg','Litchi Gelato荔枝冰淇淋',38),
( 44,44,3,'img/details/bq3.jpg','Latte Gelato 拿铁冰淇淋',38),
( 45,45,3,'img/details/bq4.jpg','Durian Gelato 榴莲冰淇淋',38),
( 46,46,3,'img/details/bq5.jpg','四口味Gelato冰淇淋混合装（4盒入）',38),
( 47,47,3,'img/details/bq6.jpg','原味牛乳冰淇淋2个+荔枝冰淇淋2个+冰淇淋包装盒',38),
( 48,48,4,'img/details/cof1.jpg','Yirgacheffe Coffee 耶加雪菲挂耳咖啡',10),
( 49,49,4,'img/details/cof2.jpg','Brazil Coffee 巴西挂耳咖啡',10),
( 50,50,4,'img/details/cof3.jpg','Sidamo Coffee 西达摩挂耳咖啡',10),
( 51,51,4,'img/details/cof4.jpg','Papua New Guinea Coffee 巴布亚新几内亚挂耳咖啡',10),
( 52,52,4,'img/details/cof1.jpg','Yirgacheffe Coffee 耶加雪菲挂耳咖啡',10),
( 53,53,4,'img/details/cof2.jpg','Brazil Coffee 巴西挂耳咖啡',10),
( 54,54,4,'img/details/cof3.jpg','Sidamo Coffee 西达摩挂耳咖啡',10),
( 55,55,4,'img/details/cof4.jpg','Papua New Guinea Coffee 巴布亚新几内亚挂耳咖啡',10);

/***商品表****/
INSERT INTO cake_product VALUES
(NULL,1,1,'Teatime 浅草',198,'1.0磅',' 约13.5x13.5',' 适合3-4人分享',' 含5套餐具','Teatime 浅草','浅草才能没马蹄 中国绿茶与爽脆果实，工笔勾勒一杯好茶 复杂而纯粹的深浅绿意',2019-01-01,1000,true,'img/details/dangao1.jpg'),
(NULL,1,1,'Teatime 浅草',298,'2.0磅',' 约18x18cm',' 适合7-8人分享',' 含10套餐具','Teatime 浅草','浅草才能没马蹄 中国绿茶与爽脆果实，工笔勾勒一杯好茶 复杂而纯粹的深浅绿意',2019-01-01,800,true,'img/details/dangao1.jpg'),
(NULL,1,1,'Teatime 浅草',458,'3.0磅',' 约24x24cm',' 适合11-12人分享',' 含15套餐具','Teatime 浅草','浅草才能没马蹄 中国绿茶与爽脆果实，工笔勾勒一杯好茶 复杂而纯粹的深浅绿意',2019-01-01,600,true,'img/details/dangao1.jpg'),
(NULL,1,1,'Teatime 浅草',750,'5.0磅','约31x31cm',' 适合15-20人分享',' 含20套餐具','Teatime 浅草','浅草才能没马蹄 中国绿茶与爽脆果实，工笔勾勒一杯好茶 复杂而纯粹的深浅绿意',2019-01-01,400,true,'img/details/dangao1.jpg'),
(NULL,1,2,'Black Forest 黑森林',268,'1.0磅',' 约13x13cm',' 适合3-4人分享',' 含5套餐具','Black Forest 黑森林','樱桃酒味从巧克力卷的缝隙飘出 向往极北的黑森林，纷飞的雪花里有精灵的歌咏',2019-01-01,100,true,'img/details/dangao2.jpg'),
(NULL,1,2,'Black Forest 黑森林',398,'2.0磅',' 约17×17cm','适合7-8人分享','含10套餐具','Black Forest 黑森林','樱桃酒味从巧克力卷的缝隙飘出 向往极北的黑森林，纷飞的雪花里有精灵的歌咏',2019-01-01,1000,true,'img/details/dangao2.jpg'),
(NULL,1,2,'Black Forest 黑森林',598,'3.0磅 ','约23×23cm','适合11-12人分享','含15套餐具','Black Forest 黑森林','樱桃酒味从巧克力卷的缝隙飘出 向往极北的黑森林，纷飞的雪花里有精灵的歌咏',2019-01-01,200,true,'img/details/dangao2.jpg'),
(NULL,1,2,'Black Forest 黑森林',998,'5.0磅 ','约30×30cm','适合15-20人食用 ','含20套餐具','Black Forest 黑森林','樱桃酒味从巧克力卷的缝隙飘出 向往极北的黑森林，纷飞的雪花里有精灵的歌咏',2019-01-01,300,true,'img/details/dangao2.jpg'),
(NULL,1,3,'榴莲飘飘',198,'1.0磅', '约13x13cm',' 适合3-4人分享',' 含5套餐具','榴莲飘飘','自然成熟榴莲肉 超薄白巧克力片 纯榴莲果肉夹层每一口都是十足的榴莲味道，口齿生香',2019-01-01,100,true,'img/details/dangao3.jpg'),
(NULL,1,3,'榴莲飘飘',298,'2.0磅',' 约17×17cm','适合7-8人分享','含10套餐具','榴莲飘飘','自然成熟榴莲肉 超薄白巧克力片 纯榴莲果肉夹层每一口都是十足的榴莲味道，口齿生香',2019-01-01,200,true,'img/details/dangao3.jpg'),
(NULL,1,3,'榴莲飘飘',458,'3.0磅',' 约23×23cm','适合11-12人分享','含15套餐具','榴莲飘飘','自然成熟榴莲肉 超薄白巧克力片 纯榴莲果肉夹层每一口都是十足的榴莲味道，口齿生香',2019-01-01,500,true,'img/details/dangao3.jpg'),
(NULL,1,3,'榴莲飘飘',750,'5.0磅',' 约30×30cm','适合15-20人食用',' 含20套餐具','榴莲飘飘','自然成熟榴莲肉 超薄白巧克力片 纯榴莲果肉夹层每一口都是十足的榴莲味道，口齿生香',2019-01-01,400,true,'img/details/dangao3.jpg'),
(NULL,1,4,'Cocoa Island 可可岛',298,'1.0磅 ','约13x13cm ',' 适合3-4人分享',' 含5套餐具','Cocoa Island 可可岛','精品巧克力蛋糕，四种不同可可含量巧克力食材 搭配葡萄酒，展现风味曲线',2019-01-01,800,true,'img/details/dangao4.jpg'),
(NULL,1,4,'Cocoa Island 可可岛',458,'2.0磅 ','约17×17cm','适合7-8人分享','含10套餐具','Cocoa Island 可可岛','精品巧克力蛋糕，四种不同可可含量巧克力食材 搭配葡萄酒，展现风味曲线',2019-01-01,400,true,'img/details/dangao4.jpg'),
(NULL,1,4,'Cocoa Island 可可岛',750,'3.0磅',' 约23×23cm','适合11-12人分享	','含15套餐具','Cocoa Island 可可岛','精品巧克力蛋糕，四种不同可可含量巧克力食材 搭配葡萄酒，展现风味曲线',2019-01-01,300,true,'img/details/dangao4.jpg'),
(NULL,1,5,'百利甜情人',198,'1.0磅',' 约13x13cm',' 适合3-4人分享',' 含5套餐具','百利甜情人','柔和奶酒 慕斯夹心与切开的水果 混入玫瑰的优雅 等于热恋的味道 ',2019-01-01,600,true,'img/details/dangao5.jpg'),
(NULL,1,5,'百利甜情人',298,'2.0磅',' 约17×17cm','	适合7-8人分享','含10套餐具','百利甜情人','柔和奶酒 慕斯夹心与切开的水果 混入玫瑰的优雅 等于热恋的味道',2019-01-01,600,true,'img/details/dangao5.jpg'),
(NULL,1,5,'百利甜情人',458,'3.0磅',' 约23×23cm','适合11-12人分享','含15套餐具','百利甜情人','柔和奶酒 慕斯夹心与切开的水果 混入玫瑰的优雅 等于热恋的味道',2019-01-01,600,true,'img/details/dangao5.jpg'),
(NULL,1,5,'百利甜情人',750,'5.0磅',' 约30×30cm','	适合15-20人食用 ','含20套餐具','百利甜情人','柔和奶酒 慕斯夹心与切开的水果 混入玫瑰的优雅 等于热恋的味道',2019-01-01,600,true,'img/details/dangao5.jpg'),
(NULL,1,6,'黑白巧克力慕斯 彼尔德（ＨＢＤ）',198,'1.0磅 ','约13x13cm ','适合3-4人分享','含5套餐具','黑白巧克力慕斯 彼尔德（ＨＢＤ）','白巧克力慕斯 冰凉细腻 醇厚黑巧克力酱与可可戚风 带来咀嚼感  ',2019-01-01,600,true,'img/details/dangao6.jpg'),
(NULL,1,6,'黑白巧克力慕斯 彼尔德（ＨＢＤ）',298,'2.0磅 ','约17×17cm',' 适合7-8人分享','含10套餐具','黑白巧克力慕斯 彼尔德（ＨＢＤ）','白巧克力慕斯 冰凉细腻 醇厚黑巧克力酱与可可戚风 带来咀嚼感 ',2019-01-01,600,true,'img/details/dangao6.jpg'),
(NULL,1,6,'黑白巧克力慕斯 彼尔德（ＨＢＤ）',458,'3.0磅',' 约23×23cm ','适合11-12人分享','含15套餐具','黑白巧克力慕斯 彼尔德（ＨＢＤ）','白巧克力慕斯 冰凉细腻 醇厚黑巧克力酱与可可戚风 带来咀嚼感 ',2019-01-01,600,true,'img/details/dangao6.jpg'),
(NULL,1,6,'黑白巧克力慕斯 彼尔德（ＨＢＤ）',750,'5.0磅',' 约30×30cm',' 适合15-20人食用 ','含20套餐具','黑白巧克力慕斯 彼尔德（ＨＢＤ）','白巧克力慕斯 冰凉细腻 醇厚黑巧克力酱与可可戚风 带来咀嚼感 ',2019-01-01,600,true,'img/details/dangao6.jpg'),
(NULL,1,7,'枣儿',198,'1.0磅',' 约13x13cm ','适合3-4人分享',' 含5套餐具','枣儿','红枣奶油戚风，与姜撞奶慕斯 温暖 绵延',2019-01-01,600,true,'img/details/dangao7.jpg'),
(NULL,1,7,'枣儿',298,'2.0磅',' 约17×17cm','适合7-8人分享','含10套餐具','枣儿','红枣奶油戚风，与姜撞奶慕斯 温暖 绵延',2019-01-01,600,true,'img/details/dangao7.jpg'),
(NULL,1,7,'枣儿',458,'3.0磅 ','约23×23cm','适合11-12人分享','含15套餐具','枣儿','红枣奶油戚风，与姜撞奶慕斯 温暖 绵延',2019-01-01,600,true,'img/details/dangao7.jpg'),
(NULL,1,7,'枣儿',750,'5.0磅',' 约30×30cm','适合15-20人食用 ','含20套餐具','枣儿','红枣奶油戚风，与姜撞奶慕斯 温暖 绵延',2019-01-01,600,true,'img/details/dangao7.jpg'),
(NULL,1,8,'黑白巧克力慕斯 彼尔德（Party）',198,'1.0磅',' 约13x13cm',' 适合3-4人分享',' 含5套餐具','Black and White Chocolate Mousse 黑白巧克力慕斯 彼尔德（Party）','白巧克力慕斯 冰凉细腻 醇厚黑巧克力酱与可可戚风 带来咀嚼感  ',2019-01-01,600,true,'img/details/dangao8.jpg'),
(NULL,1,8,'黑白巧克力慕斯 彼尔德（Party）',298,'2.0磅',' 约17×17cm',' 适合7-8人分享','含10套餐具','Black and White Chocolate Mousse 黑白巧克力慕斯 彼尔德（Party）','白巧克力慕斯 冰凉细腻 醇厚黑巧克力酱与可可戚风 带来咀嚼感 ',2019-01-01,600,true,'img/details/dangao8.jpg'),
(NULL,1,8,'黑白巧克力慕斯 彼尔德（Party）',458,'3.0磅',' 约23×23cm',' 适合11-12人分享','	含15套餐具','Black and White Chocolate Mousse 黑白巧克力慕斯 彼尔德（Party）','白巧克力慕斯 冰凉细腻 醇厚黑巧克力酱与可可戚风 带来咀嚼感 ',2019-01-01,600,true,'img/details/dangao8.jpg'),
(NULL,1,8,'黑白巧克力慕斯 彼尔德（Party）',750,'5.0磅',' 约30×30cm ','适合15-20人食用 ','含20套餐具','Black and White Chocolate Mousse 黑白巧克力慕斯 彼尔德（Party）','白巧克力慕斯 冰凉细腻 醇厚黑巧克力酱与可可戚风 带来咀嚼感 ',2019-01-01,600,true,'img/details/dangao8.jpg'),
(NULL,1,9,'芒果奶油蛋糕',198,'2.0磅 ','约18x18cm ','适合7-8人分享 ','含10套餐具','Mango Cream Cake芒果奶油蛋糕','不使用罐头水果和植混奶油/坚持自然成熟，应季鲜切芒果//新西兰纯乳脂奶油//自研芒果百香果慕斯夹心',2019-01-01,800,true,'img/details/dangao9.jpg'),
(NULL,1,9,'芒果奶油蛋糕',298,'3.0磅 ','约24x24cm',' 适合11-12人分享',' 含15套餐具','Mango Cream Cake芒果奶油蛋糕','不使用罐头水果和植混奶油/坚持自然成熟，应季鲜切芒果//新西兰纯乳脂奶油//自研芒果百香果慕斯夹心',2019-01-01,600,true,'img/details/dangao9.jpg'),
(NULL,1,9,'芒果奶油蛋糕',398,'5.0磅 ','约31x31cm',' 适合15-20人分享',' 含20套餐具','Mango Cream Cake芒果奶油蛋糕','/不使用罐头水果和植混奶油/坚持自然成熟，应季鲜切芒果//新西兰纯乳脂奶油//自研芒果百香果慕斯夹心/',2019-01-01,400,true,'img/details/dangao9.jpg'),
(NULL,1,10,'百香果酸乳酪慕斯（木糖醇）',198,'1.0磅 ','约13x13cm ','适合3-4人分享',' 含5套餐具','Easycake 百香果酸乳酪慕斯（木糖醇','有超过130种芳香/除了酸味，百香果是世界上已知，/充满芳香的水果之一。/冰淇淋口感，不同层次的酸与冰凉/',2019-01-01,600,true,'img/details/dangao10.jpg'),
(NULL,1,10,'百香果酸乳酪慕斯（木糖醇）',298,'2.0磅 ','约17×17cm','适合7-8人分享','含10套餐具','Easycake 百香果酸乳酪慕斯（木糖醇','有超过130种芳香/除了酸味，百香果是世界上已知，/充满芳香的水果之一。/冰淇淋口感，不同层次的酸与冰凉/',2019-01-01,600,true,'img/details/dangao10.jpg'),
(NULL,1,11,'Heartfelt Wish 心语心愿',398,'2.0磅',' 约17×17cm','适合7-8人分享','含10套餐具','Heartfelt Wish 心语心愿','樱桃酒味从巧克力卷的缝隙飘出 向往极北的黑森林，纷飞的雪花里有精灵的歌咏',2019-01-01,1000,true,'img/details/dangao11.jpg'),
 (NULL,1,11,'Heartfelt Wish 心语心愿',598,'3.0磅 ','约23×23cm','适合11-12人分享','含15套餐具','Heartfelt Wish 心语心愿','樱桃酒味从巧克力卷的缝隙飘出 向往极北的黑森林，纷飞的雪花里有精灵的歌咏',2019-01-01,200,true,'img/details/dangao11.jpg'),
 (NULL,1,11,'Heartfelt Wish 心语心愿',998,'5.0磅 ','约30×30cm','适合15-20人食用',' 含20套餐具','Heartfelt Wish 心语心愿','樱桃酒味从巧克力卷的缝隙飘出 向往极北的黑森林，纷飞的雪花里有精灵的歌咏',2019-01-01,300,true,'img/details/dangao11.jpg'),
(NULL,1,12,'6口味切块',998,'独立包装 ','六块','适合6人食用 ','含6套餐具','6口味切块','浅草、芒果慕斯、新卡、心语心愿、栗蓉暗香、黑白巧克力慕斯',2019-01-01,300,true,'img/details/dangao12.jpg'),
 (NULL,1,13,'Black and White Chocolate Mousse 黑白巧克力慕斯',198,'1.0磅',' 约13.5x13.5 ','适合3-4人分享',' 含5套餐具','黑白巧克力慕斯','口感冰凉细腻，白巧克力慕斯的甜，与底部黑巧克力酱的苦',2019-01-01,1000,true,'img/details/dangao13.jpg'),
(NULL,1,13,'Black and White Chocolate Mousse 黑白巧克力慕斯',298,'2.0磅 ','约18x18cm ','适合7-8人分享 ','含10套餐具','黑白巧克力慕斯','口感冰凉细腻，白巧克力慕斯的甜，与底部黑巧克力酱的苦',2019-01-01,800,true,'img/details/dangao13.jpg'),
(NULL,1,13,'Black and White Chocolate Mousse 黑白巧克力慕斯',458,'3.0磅 ','约24x24cm',' 适合11-12人分享 ','含15套餐具','黑白巧克力慕斯','口感冰凉细腻，白巧克力慕斯的甜，与底部黑巧克力酱的苦',2019-01-01,600,true,'img/details/dangao13.jpg'),
(NULL,1,13,'Black and White Chocolate Mousse 黑白巧克力慕斯',750,'5.0磅',' 约31x31cm ','适合15-20人分享 ','含20套餐具','黑白巧克力慕斯','口感冰凉细腻，白巧克力慕斯的甜，与底部黑巧克力酱的苦',2019-01-01,400,true,'img/details/dangao13.jpg'),
(NULL,1,14,'Cool&Hot 冻慕斯与焗芝士',198,'1.0磅',' 约13.5x13.5 ','适合3-4人分享',' 含5套餐具','冻慕斯与焗芝士','新鲜奶油慕斯，平滑叠加降温至4度的现焗法国软芝士，轻盐味，诱发原香，丰富甜',2019-01-01,1000,true,'img/details/dangao14.jpg'),
(NULL,1,14,'Cool&Hot 冻慕斯与焗芝士',298,'2.0磅 ','约18x18cm',' 适合7-8人分享',' 含10套餐具','冻慕斯与焗芝士','新鲜奶油慕斯，平滑叠加降温至4度的现焗法国软芝士，轻盐味，诱发原香，丰富甜',2019-01-01,800,true,'img/details/dangao14.jpg'),
(NULL,1,14,'Cool&Hot 冻慕斯与焗芝士',458,'3.0磅 ','约24x24cm',' 适合11-12人分享 ','含15套餐具','冻慕斯与焗芝士','新鲜奶油慕斯，平滑叠加降温至4度的现焗法国软芝士，轻盐味，诱发原香，丰富甜',2019-01-01,600,true,'img/details/dangao14.jpg'),
(NULL,1,14,'Cool&Hot 冻慕斯与焗芝士',750,'5.0磅',' 约31x31cm ','适合15-20人分享',' 含20套餐具','冻慕斯与焗芝士','新鲜奶油慕斯，平滑叠加降温至4度的现焗法国软芝士，轻盐味，诱发原香，丰富甜',2019-01-01,400,true,'img/details/dangao14.jpg'),
(NULL,1,15,'Minty White 清境',198,'1.0磅 ','约13x13cm ','适合3-4人分享 ','含5套餐具','清境','薄荷的清爽，搭配泰式青柠叶特有的柑橘风味与缅甸青柠的清香。',2019-01-01,600,true,'img/details/dangao15.jpg'),
(NULL,1,15,'Minty White 清境',298,'2.0磅',' 约17×17cm','适合7-8人分享','含10套餐具','清境','薄荷的清爽，搭配泰式青柠叶特有的柑橘风味与缅甸青柠的清香。',2019-01-01,600,true,'img/details/dangao15.jpg'),
(NULL,1,15,'Minty White 清境',458,'3.0磅 ','约23×23cm','适合11-12人分享','含15套餐具','清境','薄荷的清爽，搭配泰式青柠叶特有的柑橘风味与缅甸青柠的清香。',2019-01-01,600,true,'img/details/dangao15.jpg'),
(NULL,1,15,'Minty White 清境',750,'5.0磅 ','约30×30cm','适合15-20人食用 ','含20套餐具','清境','薄荷的清爽，搭配泰式青柠叶特有的柑橘风味与缅甸青柠的清香。',2019-01-01,600,true,'img/details/dangao15.jpg'),
(NULL,1,16,'forget Tiramisu 新马斯卡彭-咖啡软芝士蛋糕',198,'1.0磅' ,'约13x13cm',' 适合3-4人分享 ','含5套餐具','新马斯卡彭-咖啡软芝士蛋糕','多孔蛋糕坯，深深沉浸墨西哥咖啡甘露/加杯咖啡，忘记提拉米苏',2019-01-01,600,true,'img/details/dangao16.jpg'),
(NULL,1,17,'Black Label 黑方',198,'1.0磅',' 约13.5x13.5',' 适合3-4人分享',' 含5套餐具','Black Label 黑方','法国白兰地的味道，更衬纯黑巧克力的香醇/As absence makes the heart grow fonder, whisky makes chocolate grow stronger, or at least its aroma. Here the pristine modern lines mirror China’s sparkling new architecture...',2019-01-01,1000,true,'img/details/dangao17.jpg'),
(NULL,1,17,'Black Label 黑方',298,'2.0磅 ','约18x18cm',' 适合7-8人分享 ','含10套餐具','Black Label 黑方','法国白兰地的味道，更衬纯黑巧克力的香醇/As absence makes the heart grow fonder, whisky makes chocolate grow stronger, or at least its aroma. Here the pristine modern lines mirror China’s sparkling new architecture...',2019-01-01,800,true,'img/details/dangao17.jpg'),
(NULL,1,17,'Black Label 黑方',458,'3.0磅 ','约24x24cm ','适合11-12人分享',' 含15套餐具','Black Label 黑方','法国白兰地的味道，更衬纯黑巧克力的香醇/As absence makes the heart grow fonder, whisky makes chocolate grow stronger, or at least its aroma. Here the pristine modern lines mirror China’s sparkling new architecture...',2019-01-01,600,true,'img/details/dangao17.jpg'),
(NULL,1,17,'Black Label 黑方',750,'5.0磅',' 约31x31cm',' 适合15-20人分享 ','含20套餐具','Black Label 黑方','法国白兰地的味道，更衬纯黑巧克力的香醇/As absence makes the heart grow fonder, whisky makes chocolate grow stronger, or at least its aroma. Here the pristine modern lines mirror China’s sparkling new architecture...',2019-01-01,400,true,'img/details/dangao17.jpg'),
(NULL,1,18,'Crumble 杏仁克鲁兹',268,'1.0磅',' 约13x13cm',' 适合3-4人分享',' 含5套餐具','Crumble 杏仁克鲁兹','烘烤出的扁桃仁片，混合新西兰乳脂奶油的香/要怎么体会，让自己决定/ Roasted almond slices dally with pure New Zealand cream, like an awkward philosophical question followed by a sensual Eureka moment. A teasingly crunchy premise delivering a smooth creamy pay off.',2019-01-01,100,true,'img/details/dangao18.jpg'),
(NULL,1,18,'Crumble 杏仁克鲁兹',398,'2.0磅',' 约17×17cm','适合7-8人分享','含10套餐具','Crumble 杏仁克鲁兹','烘烤出的扁桃仁片，混合新西兰乳脂奶油的香/要怎么体会，让自己决定/ Roasted almond slices dally with pure New Zealand cream, like an awkward philosophical question followed by a sensual Eureka moment. A teasingly crunchy premise delivering a smooth creamy pay off.',2019-01-01,1000,true,'img/details/dangao18.jpg'),
(NULL,1,18,'Crumble 杏仁克鲁兹',598,'3.0磅 ','约23×23cm	','适合11-12人分享','含15套餐具','Crumble 杏仁克鲁兹','烘烤出的扁桃仁片，混合新西兰乳脂奶油的香/要怎么体会，让自己决定/ Roasted almond slices dally with pure New Zealand cream, like an awkward philosophical question followed by a sensual Eureka moment. A teasingly crunchy premise delivering a smooth creamy pay off.',2019-01-01,200,true,'img/details/dangao18.jpg'),
(NULL,1,18,'Crumble 杏仁克鲁兹',998,'5.0磅',' 约30×30cm','适合15-20人食用 ','含20套餐具','Crumble 杏仁克鲁兹','烘烤出的扁桃仁片，混合新西兰乳脂奶油的香/要怎么体会，让自己决定/ Roasted almond slices dally with pure New Zealand cream, like an awkward philosophical question followed by a sensual Eureka moment. A teasingly crunchy premise delivering a smooth creamy pay off.',2019-01-01,300,true,'img/details/dangao18.jpg'),
(NULL,1,19,'Brownie Cake 布朗尼',198,'1.0磅',' 约13x13cm ','适合3-4人分享',' 含5套餐具','Brownie Cake 布朗尼','/时光荏苒，亘古不变/
If you ever find yourself packing God’s own lunchbox and you’re looking for the perfect sweet treat, this is it. The humble brownie just got uppity: sure it might look down its nose at you, but only on its way to your mouth. ',2019-01-01,600,true,'img/details/dangao19.jpg'),
(NULL,1,19,'Brownie Cake 布朗尼',298,'2.0磅',' 约17×17cm','适合7-8人分享','含10套餐具','Brownie Cake 布朗尼','/时光荏苒，亘古不变/
If you ever find yourself packing God’s own lunchbox and you’re looking for the perfect sweet treat, this is it. The humble brownie just got uppity: sure it might look down its nose at you, but only on its way to your mouth. ',2019-01-01,600,true,'img/details/dangao19.jpg'),
(NULL,1,19,'Brownie Cake 布朗尼',458,'3.0磅 ','约23×23cm	','适合11-12人分享','含15套餐具','Brownie Cake 布朗尼','/时光荏苒，亘古不变/
If you ever find yourself packing God’s own lunchbox and you’re looking for the perfect sweet treat, this is it. The humble brownie just got uppity: sure it might look down its nose at you, but only on its way to your mouth. ',2019-01-01,600,true,'img/details/dangao19.jpg'),
(NULL,1,19,'Brownie Cake 布朗尼',750,'5.0磅',' 约30×30cm	','适合15-20人食用',' 含20套餐具','Brownie Cake 布朗尼','/时光荏苒，亘古不变/
If you ever find yourself packing God’s own lunchbox and you’re looking for the perfect sweet treat, this is it. The humble brownie just got uppity: sure it might look down its nose at you, but only on its way to your mouth. ',2019-01-01,600,true,'img/details/dangao19.jpg'),
(NULL,1,20,'Chestnut Cream （新）栗蓉暗香',198,'1.0磅 ','约13x13cm',' 适合3-4人分享',' 含5套餐具','栗蓉暗香','/栗子烘烤的蛋糕坯，鲜栗蓉，点缀手工比利时黑巧克力豆/Chestnuts and real fresh cream go so well together you know this isn’t going to be a short term dalliance. In fact, one whiff of the aroma of Chestnut Cream and you’ll realize you’re attending their wedding...',2019-01-01,600,true,'img/details/dangao20.jpg'),
(NULL,1,20,'Chestnut Cream （新）栗蓉暗香',298,'2.0磅',' 约17×17cm','适合7-8人分享','含10套餐具','栗蓉暗香','/栗子烘烤的蛋糕坯，鲜栗蓉，点缀手工比利时黑巧克力豆/Chestnuts and real fresh cream go so well together you know this isn’t going to be a short term dalliance. In fact, one whiff of the aroma of Chestnut Cream and you’ll realize you’re attending their wedding...',2019-01-01,600,true,'img/details/dangao20.jpg'),
(NULL,1,20,'Chestnut Cream （新）栗蓉暗香',458,'3.0磅',' 约23×23cm','适合11-12人分享','含15套餐具','栗蓉暗香','/栗子烘烤的蛋糕坯，鲜栗蓉，点缀手工比利时黑巧克力豆/Chestnuts and real fresh cream go so well together you know this isn’t going to be a short term dalliance. In fact, one whiff of the aroma of Chestnut Cream and you’ll realize you’re attending their wedding...',2019-01-01,600,true,'img/details/dangao20.jpg'),
(NULL,1,20,'Chestnut Cream （新）栗蓉暗香',750,'5.0磅 ','约30×30cm','适合15-20人食用 ','含20套餐具','栗蓉暗香','/栗子烘烤的蛋糕坯，鲜栗蓉，点缀手工比利时黑巧克力豆/Chestnuts and real fresh cream go so well together you know this isn’t going to be a short term dalliance. In fact, one whiff of the aroma of Chestnut Cream and you’ll realize you’re attending their wedding...',2019-01-01,600,true,'img/details/dangao20.jpg'),
(NULL,1,21,'Pine Stone Cowboy 松仁淡奶（木糖醇）',198,'1.0磅','约13.5x13.5 ','适合3-4人分享',' 含5套餐具','松仁淡奶（木糖醇）','奶油与坚果的和谐、轻甜',2019-01-01,1000,true,'img/details/dangao21.jpg'),
(NULL,1,21,'Pine Stone Cowboy 松仁淡奶（木糖醇）',298,'2.0磅','约18x18cm',' 适合7-8人分享',' 含10套餐具','松仁淡奶（木糖醇）','奶油与坚果的和谐、轻甜',2019-01-01,800,true,'img/details/dangao21.jpg'),
(NULL,1,21,'Pine Stone Cowboy 松仁淡奶（木糖醇）',458,'3.0磅','约24x24cm ','适合11-12人分享',' 含15套餐具','松仁淡奶（木糖醇）','奶油与坚果的和谐、轻甜',2019-01-01,600,true,'img/details/dangao21.jpg'),
(NULL,1,21,'Pine Stone Cowboy 松仁淡奶（木糖醇）',750,'5.0磅','约31x31cm ','适合15-20人分享',' 含20套餐具','松仁淡奶（木糖醇）','奶油与坚果的和谐、轻甜',2019-01-01,400,true,'img/details/dangao21.jpg'),
(NULL,1,22,'杰瑞',198,'1.0磅',' 约13x13cm',' 适合3-4人分享',' 含5套餐具','杰瑞','融入清纯鲜奶,优化芝士层口感 重制蛋糕坯,果仁香气十足 轻轻一抿,软嫩芝士就能畅快融化',2019-01-01,600,true,'img/details/dangao22.jpg'),
(NULL,1,22,'杰瑞',298,'2.0磅',' 约17×17cm	','适合7-8人分享','含10套餐具','杰瑞','融入清纯鲜奶,优化芝士层口感 重制蛋糕坯,果仁香气十足 轻轻一抿,软嫩芝士就能畅快融化',2019-01-01,600,true,'img/details/dangao22.jpg'),
(NULL,1,22,'杰瑞',458,'3.0磅 ','约23×23cm	','适合11-12人分享','含15套餐具','杰瑞','融入清纯鲜奶,优化芝士层口感 重制蛋糕坯,果仁香气十足 轻轻一抿,软嫩芝士就能畅快融化',2019-01-01,600,true,'img/details/dangao22.jpg'),
(NULL,1,22,'杰瑞',750,'5.0磅 ','约30×30cm','适合15-20人食用 ','含20套餐具','杰瑞','融入清纯鲜奶,优化芝士层口感 重制蛋糕坯,果仁香气十足 轻轻一抿,软嫩芝士就能畅快融化',2019-01-01,600,true,'img/details/dangao22.jpg'),
(NULL,1,23,'Wall&Tree 东方栗融',398,'2.0磅 ','约17×17cm','适合7-8人分享','含10套餐具','Wall&Tree 东方栗融','融入清纯鲜奶,优化芝士层口感 重制蛋糕坯,果仁香气十足 轻轻一抿,软嫩芝士就能畅快融化',2019-01-01,600,true,'img/details/dangao23.jpg'),
(NULL,2,24,'北海道吐司（4片）',12,'一份 ',"约150g",'适合2-3人分享',NULL,'北海道吐司（4片）','/使用自研奶酱//制作柔软、质朴的切片面包//抿一下//奶香由内而外溢出/',2019-01-01,1000,true,"img/details/mb1.jpg"),
(NULL,2,25,'卜壳吐司（2片）',12,'一份 ','约50g','适合1-2人分享',NULL,'卜壳吐司（2片）','/使用自研奶酱//制作柔软、质朴的切片面包//抿一下//奶香由内而外溢出/',2019-01-01,1000,true,"img/details/mb2.jpg"),
(NULL,2,26,'帕玛森芝士可颂',39,'一份 ','约50g','适合1-2人分享',NULL,'帕玛森芝士可颂','融入清纯鲜奶,优化芝士层口感 重制蛋糕坯,果仁香气十足 轻轻一抿,软嫩芝士就能畅快融化',2019-01-01,600,true,"img/details/mb3.jpg"),
(NULL,2,27,'阳光葡萄卷',13,'一份 ',"约70g","适合1-2人分享",NULL,'阳光葡萄卷','/为儿童设计/
/太阳造型，天天晴朗/',2019-01-01,1000,true,"img/details/mb4.jpg"),
(NULL,2,28,'官网原味可颂',12,'一份 ',"约45g","适合1-2人分享",NULL,'官网原味可颂','与纯正瑞士鲜奶/
/整个过程不添加一滴水。',2019-01-01,1000,true,"img/details/mb5.jpg"),
(NULL,2,29,'红糖红枣桂圆软欧',16,'一份 ',"约90g","适合1-2人分享",NULL,'红糖红枣桂圆软欧','/使用自研奶酱//制作柔软、质朴的切片面包/抿一下//奶香由内而外溢出/',2019-01-01,1000,true,"img/details/mb6.jpg"),
(NULL,2,30,'榛子巧克力软欧',12,'一份 ',"约90g","适合1-2人分享",NULL,'榛子巧克力软欧','平静的褐色面包，柔韧、微苦/
/每一口都可以吃到香脆榛子碎与巧克力颗粒//坚果与黑巧的多巴胺搭配//让我们健康、快乐，能够承受辛苦的工作',2019-01-01,1000,true,"img/details/mb7.jpg"),
(NULL,2,31,'核桃派',18,'一份 ',"约90g","适合1-2人分享",NULL,'核桃派','焦糖核桃满嵌酥皮/酥甜，温暖//让你在这个寒冬，还想期待一场雪/',2019-01-01,1000,true,"img/details/mb8.jpg"),
(NULL,2,32,'肉桂卷',13,'一份 ',"约90g","适合1-2人分享",NULL,'肉桂卷','从肉桂卷开始/重新认识肉桂这种古老的香辛料/',2019-01-01,1000,true,"img/details/mb9.jpg"),
(NULL,2,33,'北海道吐司（4片）',12,'一份 ',"约150g",'适合2-3人分享',NULL,'北海道吐司（4片）','/使用自研奶酱//制作柔软、质朴的切片面包//抿一下//奶香由内而外溢出/',2019-01-01,1000,true,"img/details/mb1.jpg"),
(NULL,2,34,'卜壳吐司（2片）',12,'一份 ','约50g','适合1-2人分享',NULL,'卜壳吐司（2片）','/使用自研奶酱//制作柔软、质朴的切片面包//抿一下//奶香由内而外溢出/',2019-01-01,1000,true,"img/details/mb2.jpg"),
(NULL,2,35,'帕玛森芝士可颂',39,'一份 ','约50g','适合1-2人分享',NULL,'帕玛森芝士可颂','融入清纯鲜奶,优化芝士层口感 重制蛋糕坯,果仁香气十足 轻轻一抿,软嫩芝士就能畅快融化',2019-01-01,600,true,"img/details/mb3.jpg"),
(NULL,2,36,'阳光葡萄卷',13,'一份 ',"约70g","适合1-2人分享",NULL,'阳光葡萄卷','/为儿童设计/
/太阳造型，天天晴朗/',2019-01-01,1000,true,"img/details/mb4.jpg"),
(NULL,2,37,'官网原味可颂',12,'一份 ',"约45g","适合1-2人分享",NULL,'官网原味可颂','与纯正瑞士鲜奶/
/整个过程不添加一滴水。',2019-01-01,1000,true,"img/details/mb5.jpg"),
(NULL,2,38,'红糖红枣桂圆软欧',16,'一份 ',"约90g","适合1-2人分享",NULL,'红糖红枣桂圆软欧','/使用自研奶酱//制作柔软、质朴的切片面包/抿一下//奶香由内而外溢出/',2019-01-01,1000,true,"img/details/mb6.jpg"),
(NULL,2,39,'榛子巧克力软欧',12,'一份 ',"约90g","适合1-2人分享",NULL,'榛子巧克力软欧','平静的褐色面包，柔韧、微苦/
/每一口都可以吃到香脆榛子碎与巧克力颗粒//坚果与黑巧的多巴胺搭配//让我们健康、快乐，能够承受辛苦的工作',2019-01-01,1000,true,"img/details/mb7.jpg"),
(NULL,2,40,'核桃派',18,'一份 ',"约90g","适合1-2人分享",NULL,'核桃派','焦糖核桃满嵌酥皮/酥甜，温暖//让你在这个寒冬，还想期待一场雪/',2019-01-01,1000,true,"img/details/mb8.jpg"),
(NULL,2,41,'肉桂卷',13,'一份 ',"约90g","适合1-2人分享",NULL,'肉桂卷','从肉桂卷开始/重新认识肉桂这种古老的香辛料/',2019-01-01,1000,true,"img/details/mb9.jpg"),
(NULL,3,42,'Milk Gelato 原味牛乳冰淇淋',38,'一盒 ',"约80g","适合1人分享","含1把竹勺",'Milk Gelato 原味牛乳冰淇淋','意式杰拉朵冰淇淋--绵密、细腻、新鲜/Gelato10自研，新西兰乳脂奶油/融入鲜奶，单纯之能及',2019-01-01,1000,true,"img/details/bq1.jpg"),
(NULL,3,43,'Litchi Gelato荔枝冰淇淋',38,'一盒 ',"约80g","适合1人分享","含1把竹勺",'Litchi Gelato荔枝冰淇淋','丰富，真实/小众口味荔枝冰淇淋/少见的口味，少见的工艺/每盒gelato10，荔枝冰淇淋/使用超过35%荔枝食材/而非浓缩调味汁 /荔枝香味丰富，真实/',2019-01-01,1000,true,"img/details/bq2.jpg"),
(NULL,3,44,'Latte Gelato 拿铁冰淇淋',38,'一盒 ',"约80g","适合1人分享","含1把竹勺",'Latte Gelato 拿铁冰淇淋','日晒与水洗西达摩拼配，香气浓郁/中偏深烘焙，带来巧克力坚果气息，和烟熏尾韵/咖啡加牛奶，平衡、醇厚/',2019-01-01,1000,true,"img/details/bq3.jpg"),
(NULL,3,45,'Durian Gelato 榴莲冰淇淋',38,'一盒 ',"约80g","适合1人分享","含1把竹勺",'Durian Gelato 榴莲冰淇淋','自采榴莲，馥郁、丰满的种植园级新鲜/每一颗榴莲，都在达到标准成熟度时采摘、筛选并择取/现开果肉，手工打碎，正负1度误差下均值合一/',2019-01-01,1000,true,"img/details/bq4.jpg"),
(NULL,3,46,'四口味Gelato冰淇淋混合装（4盒入）',38,'一份 ',"约150g","适合3-4人分享","含4把竹勺",'四口味Gelato冰淇淋混合装（4盒入）','四种口味Gelato 10：原味、拿铁、荔枝、榴莲',2019-01-01,1000,true,"img/details/bq5.jpg"),
(NULL,3,47,'原味牛乳冰淇淋2个+荔枝冰淇淋2个+冰淇淋包装盒',38,'一份',"约150g","适合3-4人分享","含4把竹勺",'原味牛乳冰淇淋2个+荔枝冰淇淋2个+冰淇淋包装盒','纯正牛乳，牛乳香，单纯/Gelato10自研，新西兰乳脂奶油/融入鲜奶，单纯之能及/',2019-01-01,1000,true,"img/details/bq6.jpg"),
(NULL,4,48,'Yirgacheffe Coffee 耶加雪菲挂耳咖啡',10,'一包'," 约10g","适合1人享用","无",'耶加雪菲挂耳咖啡','自烘焙G1等级水洗耶加雪菲豆烘焙时注意到降低酸度得到最适合人类味蕾的甜酸比柔和柠檬香、花香、蜂蜜味，扑面而来/',2019-01-01,1000,true,"img/details/cof1.jpg"),
(NULL,4,49,'Brazil Coffee 巴西挂耳咖啡',10,'一包'," 约10g","适合1人享用","无",'Brazil Coffee 巴西挂耳咖啡','得到干净、低酸，有醇厚坚果香的咖啡液/焦糖、巧克力尾韵持久/类味蕾的甜酸比柔和柠檬香、花香、蜂蜜味，扑面而来/',2019-01-01,1000,true,"img/details/cof2.jpg"),
(NULL,4,50,'Sidamo Coffee 西达摩挂耳咖啡',10,'一包'," 约10g","适合1人享用","无",'西达摩挂耳咖啡','/浅中焙，G1等级日晒西达摩豆/在降低酸度的同时/充分激发日晒豆成熟的果酱、发酵香/可以品尝到，红酒般的滑顺和重量感/',2019-01-01,1000,true,"img/details/cof3.jpg"),
(NULL,4,51,'Papua New Guinea Coffee 巴布亚新几内亚挂耳咖啡',10,'一包'," 约10g","适合1人享用","无",' 巴布亚新几内亚挂耳咖啡','原豆经过三次水洗发酵，口感干净绵长/释放草本，与微苦巧克力风味/烘焙时加上优雅烟熏尾调，很别致/',2019-01-01,1000,true,"img/details/cof4.jpg"),
(NULL,4,52,'Yirgacheffe Coffee 耶加雪菲挂耳咖啡',10,'一包'," 约10g","适合1人享用","无",'耶加雪菲挂耳咖啡','自烘焙G1等级水洗耶加雪菲豆烘焙时注意到降低酸度得到最适合人类味蕾的甜酸比柔和柠檬香、花香、蜂蜜味，扑面而来/',2019-01-01,1000,true,"img/details/cof1.jpg"),
(NULL,4,53,'Brazil Coffee 巴西挂耳咖啡',10,'一包'," 约10g","适合1人享用","无",'Brazil Coffee 巴西挂耳咖啡','得到干净、低酸，有醇厚坚果香的咖啡液/焦糖、巧克力尾韵持久/类味蕾的甜酸比柔和柠檬香、花香、蜂蜜味，扑面而来/',2019-01-01,1000,true,"img/details/cof2.jpg"),
(NULL,4,54,'Sidamo Coffee 西达摩挂耳咖啡',10,'一包'," 约10g","适合1人享用","无",'西达摩挂耳咖啡','/浅中焙，G1等级日晒西达摩豆/在降低酸度的同时/充分激发日晒豆成熟的果酱、发酵香/可以品尝到，红酒般的滑顺和重量感/',2019-01-01,1000,true,"img/details/cof3.jpg"),
(NULL,4,55,'Papua New Guinea Coffee 巴布亚新几内亚挂耳咖啡',10,'一包'," 约10g","适合1人享用","无",' 巴布亚新几内亚挂耳咖啡','原豆经过三次水洗发酵，口感干净绵长/释放草本，与微苦巧克力风味/烘焙时加上优雅烟熏尾调，很别致/',2019-01-01,1000,true,"img/details/cof4.jpg");



INSERT INTO cake_user VALUES
(NULL,"暖暖","123456","79434135@qq.com","18439432116","1990-11-22",null,"小暖","0");
 
