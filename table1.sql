use nien_luan;
drop table if exists DANH_GIA;
drop table if exists TRA_LOI_BL;
drop table if exists NHAN_VIEN_PHU_TRACH;
drop table if exists BINH_LUAN;
drop table if exists dia_chi;
drop table if exists khach_hang;
drop table if exists ANH_MON_AN;
drop table if exists MA_MON_AN;
drop table if exists CHI_TIET_MON_AN;
drop table if exists mon_an;
drop table if exists loai_mon_an;
###
create table LOAI_MON_AN(
	count int invisible,
    LMA_MALOAI varchar(11)  constraint LMA_MALOAI_format check (regexp_like(LMA_MALOAI,'^LMA[0-9]{1,8}$' )),
    LMA_TENLOAI varchar(15) unique not null,
    LMA_MOTA tinytext,
    primary key (LMA_MALOAI)
);
###
create table MON_AN(
	count int invisible,
    MA_MAMON varchar(10) primary key constraint MA_MAMON_format check (regexp_like(MA_MAMON,'^MA[0-9]{1,8}$' )),
    LMA_MALOAI varchar(11), 
    constraint MA_LMA FOREIGN KEY(LMA_MALOAI)  REFERENCES LOAI_MON_AN(LMA_MALOAI),
	MA_TENMON varchar(40) unique not null,
	MA_MOTA text
);
###
create table CHI_TIET_MON_AN(
    MA_MAMON varchar(10) , 
	constraint CT_MONAN FOREIGN KEY (MA_MAMON)  REFERENCES MON_AN(MA_MAMON),
    CTMA_MACT varchar(20) primary key constraint CTMA_MACT_format check (regexp_like(CTMA_MACT,'^CTMA[0-9]{1,8}_[0-9]{1,18}$' )) ,
	CTMA_MUCGIA int not null,
	CTMA_KHAUPHAN tinyint default 1,
	constraint MAMON_check check (regexp_like(REGEXP_SUBSTR(CTMA_MACT,'(?<=CTMA)[0-9]{1,8}'),REGEXP_SUBSTR(MA_MAMON,'(?<=MA)[0-9]{1,8}' )))
);
###
create table ANH_MON_AN(
	AMA_URL varchar(150),
    MA_MAMON varchar(10) , 
    constraint ANH_MINH_HOA FOREIGN KEY (MA_MAMON)  REFERENCES MON_AN(MA_MAMON),
	AMA_TIEU_DE varchar(50)
);
###
create table KHACH_HANG(
	count int invisible,
    KH_MAKH varchar(20) primary key, 
    constraint KH_MAKH_format check (regexp_like(KH_MAKH,'^KH[0-9]{1,18}$')),
	KH_TENKH varchar(32) not null,
	KH_SDT  char(10) unique not null, 
    KH_EMAIL varchar(50) unique, 
    constraint KH_EMAIL_format check (regexp_like(KH_EMAIL,'^[^@]+@[^@]+\.[^@]{2,}$' )),
    KH_MATKHAU char(40), #^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,32}$,
	KH_TRANGTHAI tinyint default 1
);
###
create table DIA_CHI(
	count int invisible,
    DC_MADC varchar(20) primary key,
	constraint DC_MADC_format check (regexp_like(DC_MADC,'^DC[0-9]{1,18}$')),
    KH_MAKH varchar(20),
	constraint DC_KH FOREIGN KEY (KH_MAKH)  REFERENCES KHACH_HANG(KH_MAKH),
    DC_TENDUONG varchar(32),
    DC_TENPHUONG varchar(32),
    DC_TENQUANHUYEN varchar(32),
    DC_SONHA varchar(10)
);
###
create table NHAN_VIEN_PHU_TRACH(
	count int invisible,
	NVPT_MANV varchar(10) primary key, constraint NVPT_MANV_format check (regexp_like(NVPT_MANV,'^NV[0-9]{1,8}' )),
    NVPT_TENNV varchar(32) not null,
	NVPT_SDT  char(12) unique not null, 
    constraint NVPT_SDT_format check (regexp_like(NVPT_SDT,'^[0-9]{3}-[0-9]{3}-[0-9]{4}$' )), #123-456-7890 format 
    NVPT_MATKHAU char(40) #^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,32}$,
);
###
create table BINH_LUAN(	
	count int invisible,
	BL_MABL varchar(20) primary key, 
    constraint BL_MABL_format check (regexp_like(BL_MABL,'(^BL[0-9]{1,18}$)' )),
    MA_MAMON varchar(10), 
	constraint BL_MONAN FOREIGN KEY (MA_MAMON)  REFERENCES MON_AN(MA_MAMON),
	KH_MAKH varchar(20),
	constraint KH_BL FOREIGN KEY (KH_MAKH)  REFERENCES KHACH_HANG(KH_MAKH),
	BL_NOIDUNG varchar(255) not null,
	BL_THOIGIANBL timestamp default CURRENT_TIMESTAMP
);
###
create table TRA_LOI_BL(
	count int invisible,
	TLBL_MATLBL varchar(24) primary key,
    constraint TLBL_MATLBL_format check (regexp_like(TLBL_MATLBL,'(^TLBL[0-9]{1,20}$)' )) ,
	BL_MABL varchar(20),
	constraint THUOC_BINH_LUAN FOREIGN KEY (BL_MABL)  REFERENCES BINH_LUAN(BL_MABL),
	NVPT_MANV varchar(10),
	constraint NVPT_TLBL FOREIGN KEY (NVPT_MANV)  REFERENCES NHAN_VIEN_PHU_TRACH(NVPT_MANV),
	TLBL_NOIDUNG varchar(255),
	TLBL_THOIGIAN timestamp default CURRENT_TIMESTAMP
);
###
create table DANH_GIA
(	count int invisible,
	DG_MADG varchar(20) primary key, 
    constraint DG_MADG_format check (regexp_like(DG_MADG,'(^DG[0-9]{1,18}$)' )),
    MA_MAMON varchar(10) , 
	constraint DG_MONAN FOREIGN KEY (MA_MAMON)  REFERENCES MON_AN(MA_MAMON),
	KH_MAKH varchar(20) ,
	constraint KH_DG FOREIGN KEY (KH_MAKH)  REFERENCES KHACH_HANG(KH_MAKH),
	DG_DIEMDG tinyint,
	constraint sosaolonhon0behon5 check (DG_DIEMDG <=5 and DG_DIEMDG >=0),
	DG_THOIGIANDG  timestamp default CURRENT_TIMESTAMP
);
create unique index kh_dg_1lan ON DANH_GIA (MA_MAMON,KH_MAKH);
###
