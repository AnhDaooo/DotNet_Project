CREATE DATABASE qlks COLLATE Vietnamese_100_CI_AS_SC_UTF8;

use qlks

create table tblKh (
   makh varchar(20) primary key not null,
   tenkh nvarchar(100) not null,
   diachi nvarchar(255) not null,
   sdt varchar(20) not null,
   gioitinh nvarchar(50) not null,
   ghichu nvarchar(255)
)

create table tblPhong (
   maphong varchar(10) primary key not null,
   sophong varchar(10) not null,
   loaiphong nvarchar(50) not null,
   gia decimal(18,2) not null,
   trangthai nvarchar(50) not null,
   ghichu nvarchar(255)
)

create table tblDv (
   madv varchar(10) primary key not null,
   tendv nvarchar(100) not null,
   gia decimal(18,2) not null,
   ghichu nvarchar(255)
)

create table tblBookings (
   mabooking varchar(20) primary key not null,
   makh varchar(10) not null,
   maphong varchar(10) not null,
   ngaynhan date not null,
   ngaytra date not null,
   trangthai nvarchar(50) not null,
   ghichu nvarchar(255)
   FOREIGN KEY (makh) REFERENCES tblKh(makh),
   FOREIGN KEY (maphong) REFERENCES tblPhong(maphong)
)

create table tblBookingDv (
   mabooking varchar(10) not null,
   madv varchar(10) not null,
   soluong int not null,
   ngaydung date not null,
   trangthai nvarchar(50) not null,
   ghichu nvarchar(255),
   PRIMARY KEY (mabooking, madv),
   FOREIGN KEY (mabooking) REFERENCES tblBookings(mabooking),
   FOREIGN KEY (madv) REFERENCES tblDv(madv)
)

create table tblHoadon (
   mahoadon int primary key not null,
   mabooking varchar(20) not null,
   ngaytrathucte date not null,
   ngaytaohd date not null,
   tamtinh decimal(18,2),
   thue decimal(18,2),
   giamgia decimal(18,2),
   tong decimal(18,2),
   ghichu nvarchar(255),
   FOREIGN KEY (mabooking) REFERENCES tblBookings(mabooking)
)

create table tblUser (
	id int primary key not null,
	name nvarchar(50) not null,
	ngaysinh date not null,
	gioitinh nvarchar(50) not null,
	address nvarchar(255) not null,
	quyen nvarchar(50) not null,
	tendangnhap nvarchar(100) not null,
	matkhau nvarchar(100) not null,
	mota nvarchar(255),
	ghichu nvarchar(255)
)
