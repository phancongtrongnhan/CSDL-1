﻿------------------------------------------------
/* Học phần: Cơ sở dữ liệu
   Ngày: 10/05/2020
   Người thực hiện: Nguyễn Trọng Hiếu
   MSSV: 1812756
   Lớp: CTK42
*/
------------------------------------------------

CREATE DATABASE Lab06_QuanLyHocVien;
USE Lab06_QuanLyHocVien;

CREATE TABLE GiaoVien
(
	id CHAR(4) PRIMARY KEY,
	ho NVARCHAR(30),
	ten NVARCHAR(30),
	dienThoai CHAR(6)
);

CREATE TABLE CaHoc
(
	id CHAR(1) PRIMARY KEY,
	gioBD TIME(0),
	gioKT TIME(0)
);

CREATE TABLE Lop
(
	id CHAR(4) PRIMARY KEY,
	ten NVARCHAR(30),
	ngayKG DATE,
	hocPhi INT, 
	ca_id CHAR(1),
	soTiet INT,
	soHV INT,
	giaoVien_id CHAR(4),
	FOREIGN KEY (ca_id) REFERENCES CaHoc(id),
	FOREIGN KEY (giaoVien_id) REFERENCES GiaoVien(id)
);

CREATE TABLE HocVien
(
	id CHAR(6) PRIMARY KEY,
	ho NVARCHAR(30),
	ten NVARCHAR(30),
	ngaySinh DATE,
	phai NVARCHAR(30),
	lop_id CHAR(4),
	FOREIGN KEY (lop_id) REFERENCES Lop(id) ON DELETE CASCADE
);

CREATE TABLE HocPhi
(
	id CHAR(4) PRIMARY KEY,
	hocVien_id CHAR(6),
	ngayThu DATE,
	soTien INT,
	noiDung NVARCHAR(30),
	nguoiThu NVARCHAR(30),
	FOREIGN KEY (hocVien_id) REFERENCES HocVien(id) ON DELETE CASCADE
);

INSERT INTO GiaoVien(id, ho, ten, dienThoai)
VALUES ('G001', N'Lê Hoàng', N'Anh', '858963'),
	   ('G002', N'Nguyễn Ngọc', N'Lan', '845623'),
	   ('G003', N'Trần Minh', N'Hùng', '823456'),
	   ('G004', N'Võ Thanh', N'Trung', '841256');
SELECT * FROM GiaoVien;

INSERT INTO CaHoc (id, gioBD, gioKT)
VALUES ('1', '7:30:00', '10:45:00'),
	   ('2', '13:30:00', '16:45:00'),
	   ('3', '17:30:00', '20:45:00');
SELECT * FROM CaHoc;

SET DATEFORMAT dmy;
INSERT INTO Lop(id, ten, ngayKG, hocPhi, ca_id, soTiet, soHV, giaoVien_id)
VALUES ('E114', N'Excel 3-5-7', '02/01/2008', 120000, '1', 45, 3, 'G003'),
	   ('E115', N'Excel 2-4-6', '22/01/2008', 120000, '3', 45, 0, 'G001'),
	   ('W123', N'Word 2-4-6', '18/02/2008', 100000, '3', 30, 1, 'G001'),
	   ('W124', N'Word 3-5-7', '01/03/2008', 100000, '1', 30, 0, 'G002'),
	   ('A075', N'Access 2-4-6', '18/12/2008', 150000, '3', 60, 3, 'G003');
SELECT * FROM Lop;

SET DATEFORMAT dmy;
INSERT INTO HocVien(id, ho, ten, ngaySinh, phai, lop_id)
VALUES ('A07501', N'Lê Văn', N'Minh', '10/06/1998', N'Nam', 'A075'),
	   ('A07502', N'Nguyễn Thị', N'Mai', '20/04/1998', N'Nữ', 'A075'),
	   ('A07503', N'Lê Ngọc', N'Tuấn', '10/06/1994', N'Nam', 'A075'),
	   ('E11401', N'Vương Tuấn', N'Vũ', '25/03/1999', N'Nam', 'E114'),
	   ('E11402', N'Lý Ngọc', N'Hân', '01/12/1995', N'Nữ', 'E114'),
	   ('E11403', N'Trần Mai', N'Linh', '04/06/1990', N'Nữ', 'E114'),
	   ('W12301', N'Nguyễn Ngọc', N'Tuyết', '12/05/1996', N'Nữ', 'W123');
SELECT * FROM HocVien;

SET DATEFORMAT dmy;
INSERT INTO HocPhi(id, hocVien_id, ngayThu, soTien, noiDung, nguoiThu)
VALUES ('0001', 'E11401', '02/01/2008', 120000, 'HP Excel 3-5-7', N'Vân'),
	   ('0002', 'E11402', '02/01/2008', 120000, 'HP Excel 3-5-7', N'Vân'),
	   ('0003', 'E11403', '02/01/2008', 80000, 'HP Excel 3-5-7', N'Vân'),
	   ('0004', 'W12301', '18/02/2008', 100000, 'HP Word 2-4-6', N'Lan'),
	   ('0005', 'A07501', '16/12/2008', 150000, 'HP Access 2-4-6', N'Lan'),
	   ('0006', 'A07502', '16/12/2008', 100000, 'HP Access 2-4-6', N'Lan'),
	   ('0007', 'A07503', '18/12/2008', 150000, 'HP Access 2-4-6', N'Vân'),
	   ('0008', 'A07502', '15/01/2009', 50000, 'HP Access 2-4-6', N'Vân');
SELECT * FROM HocPhi;
