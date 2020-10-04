BEGIN TRAN
insert into PurchaseTransaction
values
('PH016', 'ST001', 'VE001', '2019-10-10', 'Roti'),
('PH017', 'ST002', 'VE002', '2019-10-11', 'Daging Ayam'),
('PH018', 'ST003', 'VE003', '2019-10-12', 'Daging Sapi'),
('PH019', 'ST004', 'VE004', '2019-10-13', 'Keju'),
('PH020', 'ST005', 'VE005', '2019-10-07', 'Roti'),
ROLLBACK
COMMIT

BEGIN TRAN
insert into DetailPurchaseTransaction
values
('PH001', 'IG001', '100'),
('PH002', 'IG002', '20'),
('PH003', 'IG003', '25'),
('PH004', 'IG004', '50'),
('PH005', 'IG001', '100'),
ROLLBACK
COMMIT

BEGIN TRAN
insert into SalesTransaction
values 
('SH016', 'ST001', 'CS001', 'CH001', '2019-10-12', 'King Monster'),
('SH017', 'ST002', 'CS002', 'CH002', '2019-10-12', 'Cheese Addict'),
('SH018', 'ST004', 'CS003', 'CH004', '2019-10-12', 'King Monster'),
('SH019', 'ST005', 'CS004', 'CH003', '2019-10-13', 'Beef Special'),
('SH020', 'ST001', 'CS005', 'CH001', '2019-10-13', 'King Monster'),
ROLLBACK
COMMIT

BEGIN TRAN
insert into DetailSalesTransaction
values 
('SH001', 'SW001', '1'),
('SH002', 'SW003', '2'),
('SH003', 'SW001', '1'),
('SH004', 'SW010', '2'),
('SH005', 'SW001', '4'),
ROLLBACK
COMMIT










































