--INSERT

GO
USE SandwEJ

GO
USE master

INSERT INTO Customers
VALUES 
('CS001','Arya Lesmana','Male','1996-1-24','082123456789'),
('CS002','Budianto','Male','1994-2-17','082211564321'),
('CS003','Citra Cantika','Female','1997-4-20','082118756788'),
('CS004','Dirgantara Septiandi','Male','2000-9-10','082336999189'),
('CS005','Bella Melati','Female','2001-8-22','082122456588'),
('CS006','Tiara Pangestika','Female','1999-10-30','082122454685'),
('CS007','Supriadi Putra','Male','1995-12-25','082992333785'),
('CS008','Nandika Riandra','Male','1999-11-11','082111447890'),
('CS009','Geraldine Putri','Female','2001-4-14','082123456789'),
('CS010','Kartika Agustina','Female','1999-8-17','082212345777')


INSERT INTO Staffs
VALUES 
('ST001','Andika Irwansyah','Male',4700000,'085123456789'),
('ST002','Bianca Putri','Female',4550000,'085113556889'),
('ST003','Cempaka Putra','Male',7000000,'085223454989'),
('ST004','Della Melati','Female',8900000,'085343455787'),
('ST005','Mawar Rianti','Female',5600000,'085122446788'),
('ST006','Rianto Kusuma','Male',5800000,'085522656744'),
('ST007','Jojo Terawan','Male',8800000,'085122454483'),
('ST008','Karina Liana','Female',7400000,'085333151662'),
('ST009','Viviana Hermawan','Female',6500000,'085323450881'),
('ST010','Ferry Cendikiawan','Male',6300000,'085922009282')


INSERT INTO Chefs
VALUES
('CH001','Gerald Susanto','Beginner'),
('CH002','Nina Kusuma','Expert'),
('CH003','Yanto Hans','Expert'),
('CH004','Wiwin Fianti','Advance'),
('CH005','Zarah Erika','Beginner'),
('CH006','Oki Jaya','Advance'),
('CH007','Juna Lesmono','Expert'),
('CH008','Yoji Putro','Advance'),
('CH009','Xavier Nugroho','Expert'),
('CH010','Ilham Kuncoro','Advance')


INSERT INTO Vendors
VALUES
('VE001','Jaya Company ','Jl. Mangga No.1','083123456789','jayagroup@gmail.com'),
('VE002','Suka Maju Company ','Jl. Melati No.121','083113446783','sukamajugroup@gmail.com'),
('VE003','Durian Runtuh Company ','Jl. Gold No.76','083223354787','drcompany@yahoo.com'),
('VE004','Harapan Bangsa Company ','Jl. Perintis No.36','083772455728','hbangsagroup@gmail.com'),
('VE005','Benih Unggul Company ','Jl. Pahlawan No.205','083523556711','benihunggulgroup@yahoo.com'),
('VE006','Yes Food Company ','Jl. Lapangan Gembira No.97','083323454785','jayagroup@gmail.com'),
('VE007','Berkah Sejati Company ','Jl. Jambu Air No.55','083822454433','berkahscompany@gmail.com'),
('VE008','Wijaya Company ','Jl. Nasional No.83','083222455181','wijayagroup@gmail.com'),
('VE009','Ketulusan Kasih Bunda Company ','Jl. Pohon Besar No.144','083712255779','ketulusankb01group@gmail.com'),
('VE010','Ketulusan Kasih Bunda Company ','Jl. Pelajar No.24','083112990992','ketulusankb02group@gmail.com')


INSERT INTO Sandwichs
VALUES
('SW001','King Monster','Cabai',100000),
('SW002','Vietnam Sensation','Nuoc Cham',82000),
('SW003','Cheese Addict','Keju',95000),
('SW004','Chicken Mix','Mayones',52000),
('SW005','Tramezzini','Keju',95000),
('SW006','Choripan','Chimichurri',75000),
('SW007','Chicken Katsu','Tiram',50000),
('SW008','Vege Sandwich','Mayones',32000),
('SW009','Vada pav','Cabai',90000),
('SW010','Beef Special','Keju',110000)

SELECT * FROM Sandwichs


INSERT INTO Ingredients
VALUES
('IG001','Roti',25000),
('IG002','Daging Ayam',55000),
('IG003','Daging Sapi',90000),
('IG004','Keju',35000),
('IG005','Bawang Bombay',21000),
('IG006','Tomat',18000),
('IG007','Daun Selada',18000),
('IG008','Mayonaise',20000),
('IG009','Cabai',30000),
('IG010','Ikan Tuna',45000),
('IG011','Ikan Tuna',55000),
('IG012','Daging Sapi',85000)

select * from Ingredients

INSERT INTO PurchaseTransactions
VALUES
('PH001','ST007','VE009','2019-11-1','Cabai'),
('PH002','ST003','VE010','2019-11-15','Daun Selada'),
('PH003','ST002','VE004','2019-11-12','Tomat'),
('PH004','ST010','VE005','2019-11-21','Daging Ayam'),
('PH005','ST005','VE007','2019-11-19','Daging Sapi'),
('PH006','ST001','VE001','2019-11-30','Roti'),
('PH007','ST004','VE003','2019-12-5','Mayonaise'),
('PH008','ST009','VE004','2019-11-17','Bawang Bombay'),
('PH009','ST008','VE002','2019-12-10','Daging Sapi'),
('PH010','ST006','VE006','2019-11-27','Roti'),
('PH011','ST003','VE009','2019-11-25','Mayonaise'),
('PH012','ST008','VE008','2019-12-12','Keju'),
('PH013','ST004','VE010','2019-11-9','Ikan Tuna'),
('PH014','ST006','VE010','2019-12-20','Ikan Tuna'),
('PH015','ST005','VE003','2019-11-29','Keju')


INSERT INTO DetailPurchaseTransaction
VALUES
('PH006','IG001',100),
('PH007','IG008',20),
('PH009','IG003',60),
('PH010','IG001',125),
('PH014','IG011',45),
('PH001','IG008',150),
('PH005','IG003',55),
('PH004','IG002',70),
('PH003','IG001',120),
('PH011','IG009',115),
('PH002','IG002',90),
('PH006','IG007',90),
('PH008','IG004',130),
('PH001','IG009',145),
('PH009','IG012',55),
('PH012','IG004',85),
('PH010','IG006',100),
('PH013','IG010',70),
('PH004','IG001',80),
('PH002','IG007',100),
('PH007','IG005',95),
('PH008','IG008',125),
('PH015','IG004',70),
('PH015','IG005',90),
('PH005','IG007',90)

SELECT * FROM Customers

INSERT INTO SalesTransactions
VALUES
('SH001','ST008','CS001','CH001','2019-11-7','Chicken Mix'),
('SH002','ST001','CS002','CH006','2019-11-9','King Monster'),
('SH003','ST007','CS006','CH005','2019-11-11','Vege Sandwich'),
('SH004','ST009','CS004','CH002','2019-11-13','Vietnam Sensation'),
('SH005','ST006','CS005','CH007','2019-11-15','Cheese Addict'),
('SH006','ST002','CS006','CH009','2019-11-17','Chicken Katsu'),
('SH007','ST005','CS007','CH003','2019-11-19','Choripan'),
('SH008','ST010','CS008','CH008','2019-11-21','Beef Special'),
('SH009','ST004','CS009','CH007','2019-11-24','Cheese Addict'),
('SH010','ST005','CS010','CH004','2019-11-25','Vada pav'),
('SH011','ST003','CS008','CH009','2019-12-4','Chicken Katsu'),
('SH012','ST004','CS010','CH005','2019-12-7','Choripan'),
('SH013','ST002','CS006','CH003','2019-12-8','Vege Sandwich'),
('SH014','ST003','CS001','CH010','2019-12-12','Tramezzini'),
('SH015','ST001','CS003','CH002','2019-12-19','Vietnam Sensation')

select * from Chefs
INSERT INTO DetailSalesTransaction
VALUES
('SH001','SW004',1),
('SH014','SW005',2),
('SH002','SW001',4),
('SH001','SW004',2),
('SH003','SW008',2),
('SH015','SW002',1),
('SH004','SW002',3),
('SH002','SW001',2),
('SH005','SW003',1),
('SH009','SW003',4),
('SH006','SW007',2),
('SH003','SW008',2),
('SH007','SW006',1),
('SH010','SW009',2),
('SH008','SW010',1),
('SH015','SW002',2),
('SH009','SW003',3),
('SH008','SW010',3),
('SH010','SW009',2),
('SH011','SW007',3),
('SH011','SW007',3),
('SH007','SW006',3),
('SH012','SW006',1),
('SH008','SW010',2),
('SH013','SW008',2)