1. LOAI_MON_AN 
- LMA_MALOAI varchar (10) -> varchar 11, id = LMA + 8 number '^LMA[0-9]{1,8}$'
- LMA_TENLOAI nullable -> (unique_not in pd) not null
- LMA_MOTA varchar(15) ->tinytext (for storing larger string data) max 255
procedure
----THEM_LOAI_MON_AN(LMA_TENLOAI,LMA_MOTA)
----ex: call THEM_LOAI_MON_AN('Món nướng','Đây là mô tả của món nướng'); *LMA prefix by default using procedure

-------------------------------------------------------------------------------------------------
2.MON_AN
- MA_MAMON id = MA + 8 number '^MA[0-9]{1,8}$' 
- MA_TENMON nullable -> (unique_not in pd) not null
- LMA_MOTA varchar(300)->tinytext 

procedure
THEM_MON_AN ( LMA_MALOAI,MA_TENMON, LMA_MOTA)
ex: call THEM_MON_AN('1','Gà nướng', 'Đây là mô tả của món gà nướng');*MA prefix by default using procedure
-------------------------------------------------------------------------------------------------
3. CHI_TIET_MON_AN 
- CTMA_MACT varchar (10) -> varchar (20), id = CTMA + number_numer, first  number is MA_MAMON index, second number is CTMA_MACT index '^CTMA[0-9]{1,8}_[0-9]{1,8}$' 
- CTMA_MUCGIA long int nullable -> int not null 
- CTMA_KHAUPHAN  int -> tinyint default 1/TMA_PHANLOAI varchar(30) nullable
/*function
check if there's already a MAMON inside the table, to support the THEM_CHI_TIET_MON_AN procedure cuz select not working right inside it
procedure*/
CTMA_MACT will be auto generate from MA_MAMON with CTMA1_1 format, first number is MA_MAMON index, second number is CTMA_MACT 
THEM_CHI_TIET_MON_AN(MA_MAMON, CTMA_MUCGIA, CTMA_KHAUPHAN

call THEM_CHI_TIET_MON_AN(1,'40000',1); CTMA1_1 
call THEM_CHI_TIET_MON_AN(1,'50000',2);	CTMA1_2
call THEM_CHI_TIET_MON_AN(2,'60000',1); CTMA2_1
call THEM_CHI_TIET_MON_AN(2,'45000',2); CTMA2_2
call THEM_CHI_TIET_MON_AN(3,'30000',1); CTMA3_1
call THEM_CHI_TIET_MON_AN(1,'6000',3);  CTMA1_3
-------------------------------------------------------------------------------------------------
4. ANH_MON_AN
AMA_URL long varchar -> varchar(255)
AMA_MOTA varchar(50) -> AMA_TIEUDE varchar (50)

procedure
THEM_ANH_MON_AN(AMA_URL, MA_MAMON , AMA_TIEU_DE)
ex: call THEM_ANH_MON_AN ('urlanhmonan1.com/etc','1','Đây là ảnh của món gà chiên');
-------------------------------------------------------------------------------------------------
5. KHACH_HANG
KH_MAKH varchar(100) -> varchar (20),  ^KH[0-9]{1,8}$
KH_TENKH nullable -> not null,
KH_SDT nullable char(10) -> char(12) unique not null, 
KH_EMAIL varchar(15) -> varchar(50) unique, 

KH_MATKHAU tex #-> char(32), MD5 hash #^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,32}$,
		   char(40), sha() hash
KH_TRANGTHAI bool -> tinyint

procedure
THEM_KHACH_HANG (KH_TENKH , KH_SDT, KH_EMAIL, KH_MATKHAU)  #KH_MATKHAU no longer than 32 or shorter than 8 and has to have a letter
ex:call THEM_KHACH_HANG ('Khách Hàng Một', '123-456-7890', 'khachang1@gmail.com', 'matkhaukh1');
   call THEM_KHACH_HANG ('Khách Hàng Hai', '223-456-7890', 'khachang2@gmail.com', 'matkhaukh2');
-------------------------------------------------------------------------------------------------
6. DIA_CHI
SDT ->11
DC_MADC -> 20
prodedure 
THEM_DIA_CHI(KH_MAKH , DC_NGUOINHAN, DC_SDTNHAN, DC_TENDUONG, DC_TENPHUONG, DC_TENQUANHUYEN, DC_SONHA)
ex: call THEM_DIA_CHI ('1','Người Nhận Một','123-123-1234','Đường abc','Phường xzy','Quận dfy','36C');

7. NHAN_VIEN_PHU_TRACH
all column to not nullable
NVPT_SDT char (10) -> char(12)
NVPT_MATKHAU varchar(32) -> char (40) - 32 for md5 40 for sha()
procedure THEM_NHAN_VIEN_PHU_TRACH ('NVPT_TENNV','NVPT_SDT','NVPT_MATKHAU')# NVPT_MATKHAU no longer than 32 or shorter than 8 and has to have a letter
ex: call THEM_NHAN_VIEN_PHU_TRACH ('Nhân Viên Một','987-654-3210','1234567a') ;
    call THEM_NHAN_VIEN_PHU_TRACH ('Nhân Viên Hai','887-654-3210','matkhaunv2') ;

8.TRA_LOI_BL
	TLBL_MATLBL varchar(10) -> varchar(24), (^TLBL[0-9]{1,20}$)
	NVPT_REPLYBL -> NVPT_TLBL
#MA_KH? MAMON?	
	BL_REPLY -> THUOC_BINHLUAN
	TLBL_NOIDUNG  varchar(100)-> varchar(255)
	TLBL_THOIGIAN timestamp default CURRENT_TIMESTAMP
procedure THEM_TRA_LOI_BL (BL_MABL, NVPT_MANV, TLBL_NOIDUNG)
ex: call THEM_TRA_LOI_BL(1,4,'Bình luận của món ăn thứ 1 của nhân viên 4');
    call THEM_TRA_LOI_BL(1,1,'Bình luận của món ăn thứ 1 của nhân viên 1');
19.DANH_GIA
	KH_MAKH -> unique;
	DG_MADG varchar(10) -> varchar(20)
	DG_DIEMDG int -> tinyint 	constraint sosaolonhon0behon5 check (DG_DIEMDG <=5 and DG_DIEMDG >=0),
	TLBL_THOIGIAN timestamp default CURRENT_TIMESTAMP
constraint : 
'create unique index kh_dg_1lan ON DANH_GIA (MA_MAMON,KH_MAKH);'
procedure THEM_DANH_GIA (MA_MAMON,KH_MAKH,DG_DIEMDG);
call THEM_DANH_GIA(1,2,4);
call THEM_DANH_GIA(2,2,2);

10. TIM_MON_AN_THEO_TK
 procedure TIM_MON_AN_THEO_TK(MA_TENMONN varchar(50)
call TIM_MON_AN_THEO_TK("Gà"); #theo từ khóa. sử dụng like %T_K%




