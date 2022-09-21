use nien_luan;
drop table if exists DANH_GIA;
drop table if exists TRA_LOI_BL;
drop table if exists BINH_LUAN;
drop table if exists dia_chi;
drop table if exists khach_hang;
drop table if exists ANH_MON_AN;
drop table if exists MA_MON_AN;
drop table if exists CHI_TIET_MON_AN;
drop table if exists mon_an;
drop table if exists loai_mon_an;
################################
create table MON_AN(
	count int invisible,
    MA_MAMON varchar(10) primary key constraint MA_MAMON_format check (regexp_like(MA_MAMON,'^MA[0-9]{1,8}$' )),
    LMA_MALOAI varchar(11), 
    constraint MA_LMA FOREIGN KEY(LMA_MALOAI)  REFERENCES LOAI_MON_AN(LMA_MALOAI),
	MA_TENMON varchar(40) unique not null,
	MA_MOTA text
);
drop procedure if exists THEM_MON_AN;
DELIMITER |
create procedure THEM_MON_AN(
    LMA_MALOAI varchar(11),
	MA_TENMON varchar(40), 
	MA_MOTA text
    )
 begin
 	DECLARE countvar int;
	IF(EXISTS(SELECT count FROM mon_an ORDER BY count DESC LIMIT 1 )) THEN
    SET countvar= ((SELECT count FROM mon_an ORDER BY count DESC LIMIT 1) + 1) ;
	ELSE SET countvar= 1 ;
    END IF;
    insert into MON_AN (count,MA_MAMON, LMA_MALOAI,MA_TENMON, MA_MOTA) values 
    (countvar,concat('MA',countvar), concat('LMA',LMA_MALOAI) , MA_TENMON, MA_MOTA);
end |
DELIMITER ;
#call THEM_MON_AN(1,'Gà nướng', 'Đây là mô tả của món gà nướng');
#select * from mon_an ma, loai_mon_an lm where ma.lma_maloai = lm.lma_maloai order by length(MA_MAMON);
#select * from mon_an order by length(MA_MAMON); sap xep theo thu tu tu tren xuong cua ma loai
#drop table mon_an;
#select * from mon_an ma, loai_mon_an lm where ma.lma_maloai = lm.lma_maloai order by length(MA_MAMON);
#truncate  MON_AN; xoa bang
##################################
create table CHI_TIET_MON_AN(
    MA_MAMON varchar(10) , 
	constraint CT_MONAN FOREIGN KEY (MA_MAMON)  REFERENCES MON_AN(MA_MAMON),
    CTMA_MACT varchar(20) primary key constraint CTMA_MACT_format check (regexp_like(CTMA_MACT,'^CTMA[0-9]{1,8}_[0-9]{1,18}$' )) ,
	CTMA_MUCGIA int not null,
	CTMA_KHAUPHAN tinyint default 1,
	constraint MAMON_check check (regexp_like(REGEXP_SUBSTR(CTMA_MACT,'(?<=CTMA)[0-9]{1,8}'),REGEXP_SUBSTR(MA_MAMON,'(?<=MA)[0-9]{1,8}' )))
);
#ALTER TABLE CHI_TIET_MON_AN ADD  constraint MAMON_exist check (regexp_like(REGEXP_SUBSTR(CTMA_MACT,'(?<=CTMA)[0-9]{1,8}'),REGEXP_SUBSTR(MA_MAMON,'(?<=MA)[0-9]{1,8}' )));
drop function if exists ktma;
DELIMITER |
create function ktma(
    MA_MAMONN varchar(10))
 returns int
 DETERMINISTIC
 begin
  	declare countvar varchar(20);
    declare mamon_var varchar(10);
    return EXISTS (SELECT MA_MAMON FROM CHI_TIET_MON_AN where MA_MAMON = MA_MAMONN  LIMIT 1);
end |
DELIMITER ;
select * from chi_tiet_mon_an;
drop procedure if exists THEM_CHI_TIET_MON_AN;
DELIMITER |
create procedure THEM_CHI_TIET_MON_AN(
    MA_MAMON varchar(8),
	CTMA_MUCGIA int,
	CTMA_KHAUPHAN tinyint
    )
 begin
  	declare countvar varchar(20);
    declare mamon_var varchar(10);
	declare boola int;
    set mamon_var = concat('MA',MA_MAMON);
  # set mamon_var = MA_MAMON;
	#set mamon_var = concat('MA',MA_MAMON);
    #SELECT MA_MAMON FROM CHI_TIET_MON_AN where MA_MAMON = 'MA1' order by length(MA_MAMON) DESC LIMIT 1;
	set boola = ktma(mamon_var);
	#set boola = EXISTS (SELECT MA_MAMON FROM CHI_TIET_MON_AN where MA_MAMON like '%MA3%' limit 1 );
    #select boola;
    IF boola 
    Then  set countvar = (REGEXP_SUBSTR((SELECT CTMA_MACT FROM CHI_TIET_MON_AN where CHI_TIET_MON_AN.MA_MAMON = mamon_var ORDER BY LPAD(lower(CTMA_MACT), 20,0) desc LIMIT 1),'(?<=CTMA[0-9]{1,8}_)[0-9]{1,8}') + 1);   
    else  
    set  countvar = 1;
    END IF;
    insert into CHI_TIET_MON_AN(MA_MAMON, CTMA_MACT , CTMA_MUCGIA, CTMA_KHAUPHAN) values 
    (mamon_var, concat('CT',mamon_var,'_',countvar), CTMA_MUCGIA,CTMA_KHAUPHAN);
#	insert into CHI_TIET_MON_AN(MA_MAMON, CTMA_MACT , CTMA_MUCGIA, CTMA_KHAUPHAN) values 
  #  ('MA6', concat('CT','MA6','_',), 60000,2);
end |
DELIMITER ;
#truncate chi_tiet_mon_an;
#call THEM_CHI_TIET_MON_AN(1,'40000',1);
#call THEM_CHI_TIET_MON_AN(1,'50000',2);
#call THEM_CHI_TIET_MON_AN(2,'60000',1);
#call THEM_CHI_TIET_MON_AN(2,'45000',2);
#call THEM_CHI_TIET_MON_AN(3,'30000',1);
#call THEM_CHI_TIET_MON_AN(1,'6000',3);
#select * from CHI_TIET_MON_AN;
#drop table CHI_TIET_MON_AN;
#select * from CHI_TIET_MON_AN ct , Mon_an ma where ct.ma_mamon = ma.ma_mamon order by length(ct.MA_MAMON);
#truncate  CHI_TIET_MON_AN;
##################################

create table ANH_MON_AN(
	AMA_URL varchar(50) primary key,
    MA_MAMON varchar(10) , 
    constraint ANH_MINH_HOA FOREIGN KEY (MA_MAMON)  REFERENCES MON_AN(MA_MAMON),
	AMA_TIEU_DE varchar(50)
);
drop procedure if exists THEM_ANH_MON_AN;
DELIMITER |
create procedure THEM_ANH_MON_AN(
    AMA_URL varchar(50),
	MA_MAMON varchar(10) ,
	AMA_TIEU_DE varchar(50)
    )
 begin
    insert into ANH_MON_AN(AMA_URL, MA_MAMON , AMA_TIEU_DE) values 
    (AMA_URL,concat('MA',MA_MAMON), AMA_TIEU_DE);
end |
DELIMITER ;

#call THEM_ANH_MON_AN ('urlanhmonan1.com/etc',1,'Đây là ảnh của món gà chiên');
#select * from ANH_MON_AN;
#truncate ANH_MON_AN;
##################################
create table KHACH_HANG(
	count int invisible,
    KH_MAKH varchar(20) primary key, 
    constraint KH_MAKH_format check (regexp_like(KH_MAKH,'^KH[0-9]{1,18}$')),
	KH_TENKH varchar(32) not null,
	KH_SDT  char(12) unique not null, 
    constraint KH_SDT_format check (regexp_like(KH_SDT,'^[0-9]{3}-[0-9]{3}-[0-9]{4}$' )), #123-456-7890 format 
    KH_EMAIL varchar(50) unique, 
    constraint KH_EMAIL_format check (regexp_like(KH_EMAIL,'^[^@]+@[^@]+\.[^@]{2,}$' )),
    KH_MATKHAU char(40), #^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,32}$,
	KH_TRANGTHAI tinyint default 1
);
drop procedure if exists THEM_KHACH_HANG;
DELIMITER |
create procedure THEM_KHACH_HANG(
	KH_TENKH varchar(32),
    KH_SDT char(12),
    KH_EMAIL varchar(50),
    KH_MATKHAU varchar(32)
    )
 begin
 	DECLARE countvar int;
	IF(EXISTS(SELECT count FROM KHACH_HANG ORDER BY count DESC LIMIT 1 )) THEN
    SET countvar= ((SELECT count FROM KHACH_HANG ORDER BY count DESC LIMIT 1) + 1) ;
	ELSE SET countvar= 1 ;
    END IF;
 
    insert into KHACH_HANG (count,KH_MAKH, KH_TENKH , KH_SDT, KH_EMAIL, KH_MATKHAU) values 
    ( countvar, concat('KH',countvar),KH_TENKH, KH_SDT, KH_EMAIL, sha(KH_MATKHAU) );
end |
DELIMITER ;
#call THEM_KHACH_HANG ('Khách Hàng Một', '123-456-7890', 'khachang1@gmail.com', 'matkhaukh1');
#call THEM_KHACH_HANG ('Khách Hàng Hai', '223-456-7890', 'khachang2@gmail.com', 'matkhaukh2');
#call THEM_KHACH_HANG ('Khách Hàng Ba', '323-456-7890', 'khachang3@gmail.com', 'matkhaukh3');
#call THEM_KHACH_HANG ('Khách Hàng Bốn', '423-456-7890', 'khachang4@gmail.com', 'matkhaukh4');
#call THEM_KHACH_HANG ('Khách Hàng Năm', '523-456-7890', 'khachang5@gmail.com', 'matkhaukh5');
#select * from khach_hang;
#insert into KHACH_HANG (KH_MAKH, KH_TENKH, KH_SDT, KH_DIACHI, KH_EMAIL, KH_MATKHAU) values 
#('KH1','Khách Hàng Môt', '123-456-7890', 'Địa chỉ của Khách Hàng Một','khachang1@gmail.com', MD5('matkhaukh1'));
#insert into KHACH_HANG (KH_MAKH, KH_TENKH, KH_SDT, KH_DIACHI, KH_EMAIL, KH_MATKHAU) values 
#('KH2','Khách Hàng Hai', '223-456-7890', 'Địa chỉ của Khách Hàng Hai','khachhang2@gmail.com', MD5('matkhaukh2'));
#insert into KHACH_HANG (KH_MAKH, KH_TENKH, KH_SDT, KH_DIACHI, KH_EMAIL, KH_MATKHAU) values 
#('KH3','Khách Hàng Ba', '323-456-7890', 'Địa chỉ của Khách Hàng Ba','khachhang3@gmail.com', MD5('matkhaukh3'));
#insert into KHACH_HANG (KH_MAKH, KH_TENKH, KH_SDT, KH_DIACHI, KH_EMAIL, KH_MATKHAU) values 
#('KH4','Khách Hàng Bốn', '423-456-7890', 'Địa chỉ của Khách Hàng Bốn','khachhang4@gmail.com', MD5('matkhaukh4'));
#insert into KHACH_HANG (KH_MAKH, KH_TENKH, KH_SDT, KH_DIACHI, KH_EMAIL, KH_MATKHAU,KH_TRANGTHAI) values 
#('KH5','Khách Hàng Năm', '523-456-7890', 'Địa chỉ của Khách Hàng Năm','khachhang5@student.ctu.edu.com', MD5('matkhaukh5'),'Inactive');
#truncate khach_hang;
#drop table khach_hang;
##################################
create table DIA_CHI(
	count int invisible,
    DC_MADC varchar(20) primary key  ,
	constraint DC_MADC_format check (regexp_like(DC_MADC,'^DC[0-9]{1,18}$')),
    KH_MAKH varchar(20),
    DC_TENDUONG varchar(32),
    DC_TENPHUONG varchar(32),
    DC_TENQUANHUYEN varchar(32),
    DC_SONHA varchar(10)
);
drop procedure if exists THEM_DIA_CHI;
DELIMITER |
create procedure THEM_DIA_CHI(
   KH_MAKH varchar(20),
   DC_NGUOINHAN varchar(32),
   DC_SDTNHAN char(12),
   DC_TENDUONG varchar(15),
   DC_TENPHUONG varchar(15),
   DC_TENQUANHUYEN varchar(15),
   DC_SONHA varchar(5)
    )
 begin
  	DECLARE countvar int;
	IF(EXISTS(SELECT count FROM DIA_CHI ORDER BY count DESC LIMIT 1 )) THEN
    SET countvar= ((SELECT count FROM DIA_CHI ORDER BY count DESC LIMIT 1) + 1) ;
	ELSE SET countvar= 1 ;
    END IF;
    insert into DIA_CHI(count,DC_MADC, KH_MAKH , DC_NGUOINHAN, DC_SDTNHAN, DC_TENDUONG, DC_TENPHUONG, DC_TENQUANHUYEN, DC_SONHA) values 
    (countvar, concat('DC',countvar), concat('KH',KH_MAKH) , DC_NGUOINHAN, DC_SDTNHAN, DC_TENDUONG, DC_TENPHUONG, DC_TENQUANHUYEN, DC_SONHA);
end |
DELIMITER ;
#select * from DIA_CHI;
#call THEM_DIA_CHI (1,'Đường abc','Phường xzy','Quận dfy','36C');
call THEM_DIA_CHI (1,'Đường abc','Phường xzy','Quận dfy','36C');
#call THEM_DIA_CHI (2,'Đường ewas','Phường rwa','Quận asx','52F');
##################################
create table NHAN_VIEN_PHU_TRACH(
	count int invisible,
	NVPT_MANV varchar(10) primary key, constraint NVPT_MANV_format check (regexp_like(NVPT_MANV,'^NV[0-9]{1,8}' )),
    NVPT_TENNV varchar(32) not null,
	NVPT_SDT  char(12) unique not null, 
    constraint NVPT_SDT_format check (regexp_like(NVPT_SDT,'^[0-9]{3}-[0-9]{3}-[0-9]{4}$' )), #123-456-7890 format 
    NVPT_MATKHAU char(40) #^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,32}$,
);
drop procedure if exists THEM_NHAN_VIEN_PHU_TRACH;
DELIMITER |
create procedure THEM_NHAN_VIEN_PHU_TRACH(
	NVPT_TENNV varchar(32),
    NVPT_SDT char(12),
    NVPT_MATKHAU varchar(32)
    )
 begin
 	DECLARE countvar int;
	IF(EXISTS(SELECT count FROM NHAN_VIEN_PHU_TRACH ORDER BY count DESC LIMIT 1 )) THEN
    SET countvar= ((SELECT count FROM NHAN_VIEN_PHU_TRACH ORDER BY count DESC LIMIT 1) + 1) ;
	ELSE SET countvar= 1 ;
    END IF;
 
    insert into NHAN_VIEN_PHU_TRACH (count,NVPT_MANV, NVPT_TENNV , NVPT_SDT, NVPT_MATKHAU) values 
    ( countvar, concat('NV',countvar),NVPT_TENNV, NVPT_SDT, sha(NVPT_MATKHAU) );
end |
DELIMITER ;

#call THEM_NHAN_VIEN_PHU_TRACH ('Nhân Viên Một','987-654-3210','1234567a') ;
#call THEM_NHAN_VIEN_PHU_TRACH ('Nhân Viên Hai','887-654-3210','matkhaunv2') ;
#call THEM_NHAN_VIEN_PHU_TRACH ('Nhân Viên Ba','787-654-3210','matkhaunv3') ;
#call THEM_NHAN_VIEN_PHU_TRACH ('Nhân Viên Bốn','687-654-3210','123456789122345678922222222222kw') ;

#truncate NHAN_VIEN_PHU_TRACH;
#drop table NHAN_VIEN_PHU_TRACH;
#select * from NHAN_VIEN_PHU_TRACH;
#insert into NHAN_VIEN_PHU_TRACH (NVPT_MANV, NVPT_TENNV, NVPT_SDT, NVPT_MATKHAU) values ('NV1','Nhân Viên Một', '987-654-3210', MD5('matkhaunv1'));
#insert into NHAN_VIEN_PHU_TRACH (NVPT_MANV, NVPT_TENNV, NVPT_SDT, NVPT_MATKHAU) values ('NV2','Nhân Viên Hai', '887-654-3210', MD5('matkhaunv2'));
#insert into NHAN_VIEN_PHU_TRACH (NVPT_MANV, NVPT_TENNV, NVPT_SDT, NVPT_MATKHAU) values ('NV3','Nhân Viên Ba', '787-654-3210', MD5('matkhaunv3'));
#insert into NHAN_VIEN_PHU_TRACH (NVPT_MANV, NVPT_TENNV, NVPT_SDT, NVPT_MATKHAU) values ('NV4','Nhân Viên Bốn', '687-654-3210', MD5('matkhaunv4'));
#insert into NHAN_VIEN_PHU_TRACH (NVPT_MANV, NVPT_TENNV, NVPT_SDT, NVPT_MATKHAU) values ('NV5','Nhân Viên Năm', '587-654-3210', MD5('matkhaunv5'));

##################################

create table DON_DAT_MON(
	count int invisible,
    DDM_MADON varchar(21) primary key constraint MADON_format check (regexp_like(DDM_MADON,'(^DDM[0-9]{1,18}$)' )),
	KH_MAKH varchar(20),
	constraint KH_DATMON FOREIGN KEY (KH_MAKH)  REFERENCES KHACH_HANG(KH_MAKH),
	NVPT_MANV varchar(10),
	constraint NVPT_DDM FOREIGN KEY (NVPT_MANV)  REFERENCES NHAN_VIEN_PHU_TRACH(NVPT_MANV),
    DDM_NGAYGIO timestamp default CURRENT_TIMESTAMP,
    DDM_TONGTIEN int not null ,
    DDM_TRANGTHAI varchar(30) default 'Chờ xác nhận'
);
#select * from DON_DAT_MON;
#insert into DON_DAT_MON  (DDM_MADON, KH_MAKH, NVPT_MANV, DDM_TONGTIEN) values ('DDM1','KH1','NV5','500000');
#insert into DON_DAT_MON  (DDM_MADON, KH_MAKH, NVPT_MANV,DDM_NGAYGIO, DDM_TONGTIEN) values ('DDM6','KH1','NV5','08-09 5:25:04','500000');
#truncate DON_DAT_MON;
drop procedure if exists THEM_DON_DAT_MON;
DELIMITER |
create procedure THEM_DON_DAT_MON(
    KH_MAKH varchar(18),
    NVPT_MANV varchar(8),
	DDM_TONGTIEN int
    )
 begin
  	DECLARE countvar int;
	IF(EXISTS(SELECT count FROM DON_DAT_MON ORDER BY count DESC LIMIT 1 )) THEN
    SET countvar= ((SELECT count FROM DON_DAT_MON ORDER BY count DESC LIMIT 1) + 1) ;
	ELSE SET countvar= 1 ;
    END IF;
    insert into DON_DAT_MON (count, DDM_MADON, KH_MAKH, NVPT_MANV, DDM_TONGTIEN) 
    values (countvar, concat('DDM',countvar), concat('KH',KH_MAKH), concat('NV',NVPT_MANV), DDM_TONGTIEN);
end |
DELIMITER ;
#select * from Nhan_vien_phu_trach;
#select * from DON_DAT_MON;
#select * from KHACH_HANG;
#call THEM_DON_DAT_MON(1,1,200000);
#call THEM_DON_DAT_MON(1,1,200000);
#call THEM_DON_DAT_MON(1,1,200000);
#call THEM_DON_DAT_MON(2,4,200000);
#call THEM_DON_DAT_MON(3,3,200000);
#call THEM_DON_DAT_MON(4,3,200000);
#truncate don_dat_mon;
drop procedure if exists THEM_DON_DAT_MON_DD;#day du
DELIMITER |
create procedure THEM_DON_DAT_MON_DD(
    KH_MAKH varchar(18),
    NVPT_MANV varchar(8),
    DDM_NGAYGIO timestamp,
	DDM_TONGTIEN int,
	DDM_TRANGTHAI varchar(30)
    )
 begin
  	DECLARE countvar int;
	IF(EXISTS(SELECT count FROM DON_DAT_MON ORDER BY count DESC LIMIT 1 )) THEN
    SET countvar= ((SELECT count FROM DON_DAT_MON ORDER BY count DESC LIMIT 1) + 1) ;
	ELSE SET countvar= 1 ;
    END IF;
    insert into DON_DAT_MON (count, DDM_MADON, KH_MAKH, NVPT_MANV, DDM_NGAYGIO, DDM_TONGTIEN, DDM_TRANGTHAI) 
    values (countvar, concat('DDM',countvar), concat('KH',KH_MAKH), concat('NV',NVPT_MANV), DDM_NGAYGIO, DDM_TONGTIEN, DDM_TRANGTHAI);
end |
DELIMITER ;

#truncate DON_DAT_MON;
#call THEM_DON_DAT_MON_DD (4,4,'2019-9-8 10:00:01',123456,'Đã hoàn thành');
#call THEM_DON_DAT_MON_DD (2,4,'2012-9-8 10:00:01',1233156,'Đang vận chuyển');
#call THEM_DON_DAT_MON_DD (4,4,'2015-9-8 10:00:01',1234556,'Đã hủy');
#select * from DON_DAT_MON;
#drop table DON_DAT_MON;
##################################
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
--
drop procedure if exists THEM_BINH_LUAN;
DELIMITER |
create procedure THEM_BINH_LUAN(
	MA_MAMON varchar(8), 
    KH_MAKH varchar(18),
	BL_NOIDUNG varchar(255)
    )
 begin
  	DECLARE countvar int;
	IF(EXISTS(SELECT count FROM BINH_LUAN ORDER BY count DESC LIMIT 1 )) THEN
    SET countvar= ((SELECT count FROM BINH_LUAN ORDER BY count DESC LIMIT 1) + 1) ;
	ELSE SET countvar= 1 ;
    END IF;
    insert into BINH_LUAN (count, BL_MABL, MA_MAMON, KH_MAKH, BL_NOIDUNG) 
    values (countvar, concat('BL',countvar), concat('MA',MA_MAMON), concat('KH',KH_MAKH), BL_NOIDUNG);
end |
DELIMITER ;
#call THEM_BINH_LUAN(1,5,'Bình luận của món ăn MA1 của khách hàng KH5 asdasdasdasdasdsa');
#call THEM_BINH_LUAN(5,4,'Bình luận của món ăn thứ 2 asdasdasdasdasdsa');
#select * from BINH_LUAN;
##################################
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
drop procedure if exists THEM_TRA_LOI_BL;
DELIMITER |
create procedure THEM_TRA_LOI_BL(
	BL_MABL varchar(20),
	NVPT_MANV varchar(8),
	TLBL_NOIDUNG varchar(255)
    )
 begin
  	DECLARE countvar int;
	IF(EXISTS(SELECT count FROM TRA_LOI_BL ORDER BY count DESC LIMIT 1 )) THEN
    SET countvar= ((SELECT count FROM TRA_LOI_BL ORDER BY count DESC LIMIT 1) + 1) ;
	ELSE SET countvar= 1 ;
    END IF;

    insert into TRA_LOI_BL (count, TLBL_MATLBL, BL_MABL, NVPT_MANV, TLBL_NOIDUNG) 
    values (countvar, concat('TLBL',countvar), concat('BL',BL_MABL), concat('NV',NVPT_MANV), TLBL_NOIDUNG);
end |
DELIMITER ;
#call THEM_TRA_LOI_BL(5,4,'Bình luận của món ăn thứ 5 của nhân viên 4');
#call THEM_TRA_LOI_BL(2,3,'Bình luận của món ăn thứ 2 của nhân viên 3');
#call THEM_TRA_LOI_BL(1,4,'Bình luận của món ăn thứ 1 của nhân viên 4');
#call THEM_TRA_LOI_BL(1,1,'Bình luận của món ăn thứ 1 của nhân viên 1');
#call THEM_TRA_LOI_BL(1,1,'Bình luận của món ăn thứ 1 của nhân viên 1');
#truncate tra_loi_BL;
#select * from TRA_LOI_BL;
##################################
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
drop procedure if exists THEM_DANH_GIA;
DELIMITER |
create procedure THEM_DANH_GIA(
	MA_MAMON varchar(8), 
    KH_MAKH varchar(18),
	DG_DIEMDG tinyint
    )
 begin
  	DECLARE countvar int;
	IF(EXISTS(SELECT count FROM DANH_GIA ORDER BY count DESC LIMIT 1 )) THEN
    SET countvar= ((SELECT count FROM DANH_GIA ORDER BY count DESC LIMIT 1) + 1) ;
	ELSE SET countvar= 1 ;
    END IF;

    insert into DANH_GIA (count, DG_MADG, MA_MAMON, KH_MAKH, DG_DIEMDG) 
    values (countvar, concat('DG',countvar), concat('MA',MA_MAMON), concat('KH',KH_MAKH), DG_DIEMDG);
end |
DELIMITER ;
#call THEM_DANH_GIA(1,2,4);
drop procedure if exists TIM_MON_AN_THEO_TK;
DELIMITER |
create procedure TIM_MON_AN_THEO_TK(
	MA_TENMONN varchar(50)
    )
 begin
	select MA_TENMON, DG_DIEMDG, CTMA_MUCGIA from MON_AN ma left join DANH_GIA dg on ma.MA_MAMON = dg.MA_MAMON left join CHI_TIET_MON_AN ct on ma.MA_MAMON = ct.MA_MAMON 
    where MA_TENMON like CONCAT('%', MA_TENMONN , '%')
    ;
end |
DELIMITER ;
call TIM_MON_AN_THEO_TK("Cá"); #theo từ khóa. sử dụng like %T_K%
use nien_luan;





