#1. Loại món ăn
drop procedure if exists THEM_LOAI_MON_AN;
DELIMITER |
create procedure THEM_LOAI_MON_AN(
    LMA_TENLOAII varchar(15),
	LMA_MOTAA tinytext
    )
 begin
	DECLARE countvar int;
	IF(EXISTS(SELECT count FROM loai_mon_an ORDER BY count DESC LIMIT 1 )) THEN
    SET countvar= ((SELECT count FROM loai_mon_an ORDER BY count DESC LIMIT 1) + 1) ;
	ELSE SET countvar= 1 ;
    END IF;
    insert into LOAI_MON_AN (count, LMA_MALOAI, LMA_TENLOAI,LMA_MOTA) values 
    (countvar, concat('LMA',countvar), LMA_TENLOAII, LMA_MOTAA);
end |
DELIMITER ;
##

drop procedure if exists CAP_NHAT_LOAI_MON_AN;
DELIMITER |
create procedure CAP_NHAT_LOAI_MON_AN(
	LMA_MALOAII varchar(11),
    LMA_TENLOAII varchar(15),
    LMA_MOTAA tinytext
    )
 begin
	update LOAI_MON_AN set LMA_TENLOAI= LMA_TENLOAII, LMA_MOTA = LMA_MOTAA
    where LMA_MALOAI = LMA_MALOAII;
end |
DELIMITER ;
##

drop procedure if exists TIM_LOAI_MON_AN_THEO_TU_KHOA;
DELIMITER |
create procedure TIM_LOAI_MON_AN_THEO_TU_KHOA(
	LMA_TENLOAII varchar(50)
    )
 begin
	select * from LOAI_MON_AN  
    where LMA_TENLOAI like CONCAT('%', LMA_TENLOAII , '%')	order by  CAST(SUBSTRING(LMA_MALOAI, 4) AS UNSIGNED);
end |	
DELIMITER ;
##

drop procedure if exists XOA_LOAI_MON_AN;
DELIMITER |
create procedure XOA_LOAI_MON_AN(
	LMA_MALOAII varchar(50)
    )
 begin
	DELETE FROM LOAI_MON_AN WHERE LMA_MALOAI = LMA_MALOAII;
end |	
DELIMITER ;
####################################################################################################################################
#2. Món ăn
drop procedure if exists THEM_MON_AN;
DELIMITER |
create procedure THEM_MON_AN(
    LMA_MALOAII varchar(11),
	MA_TENMONN varchar(40), 
	MA_MOTAA text
    )
 begin
 	DECLARE countvar int;
	IF(EXISTS(SELECT count FROM mon_an ORDER BY count DESC LIMIT 1 )) THEN
    SET countvar= ((SELECT count FROM mon_an ORDER BY count DESC LIMIT 1) + 1) ;
	ELSE SET countvar= 1 ;
    END IF;
    insert into MON_AN (count,MA_MAMON, LMA_MALOAI,MA_TENMON, MA_MOTA) values 
    (countvar,concat('MA',countvar), LMA_MALOAII , MA_TENMONN, MA_MOTAA);
end |
DELIMITER ;
###
drop procedure if exists CAP_NHAT_MON_AN;
DELIMITER |
create procedure CAP_NHAT_MON_AN(
	MA_MAMONN varchar(10),
	MA_TENMONN varchar(11),
    MA_MOTAA text
    )
 begin
	update MON_AN set MA_TENMON= MA_TENMONN, MA_MOTA = MA_MOTAA
    where MA_MAMON = MA_MAMONN;
end |
DELIMITER ;
##
drop procedure if exists XOA_MON_AN;
DELIMITER |
create procedure XOA_MON_AN(
	MA_MAMONN varchar(10)
    )
 begin
	DELETE FROM MON_AN WHERE MA_MAMON = MA_MAMONN;
end |	
DELIMITER ;

####################################################################################################################################
#3. Chi tiết món ăn

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
    set mamon_var = MA_MAMON;
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
###

drop procedure if exists CAP_NHAT_CHI_TIET_MON_AN;
DELIMITER |
create procedure CAP_NHAT_CHI_TIET_MON_AN(
	CTMA_MACTT varchar(20),
    CTMA_MUCGIAA int,
    CTMA_KHAUPHANN tinyint
    )
 begin
	update CHI_TIET_MON_AN set CTMA_MUCGIA= CTMA_MUCGIAA, CTMA_KHAUPHAN = CTMA_KHAUPHANN
    where CTMA_MACT = CTMA_MACTT;
end |
DELIMITER ;
##

drop procedure if exists XOA_CHI_TIET_MON_AN;
DELIMITER |
create procedure XOA_CHI_TIET_MON_AN(
	CTMA_MACTT varchar(20)
    )
 begin
	DELETE FROM CHI_TIET_MON_AN WHERE CTMA_MACT = CTMA_MACTT;
end |	
DELIMITER ;

drop procedure if exists TIM_MON_AN_THEO_TK;
DELIMITER |
create procedure TIM_MON_AN_THEO_TK(
	MA_TENMONN varchar(50)
    )
begin
	SELECT * , AVG(DG_DIEMDG) DANH_GIA FROM mon_an ma 
	JOIN loai_mon_an lma ON ma.LMA_MALOAI = lma.LMA_MALOAI 
	JOIN chi_tiet_mon_an ctma ON ma.MA_MAMON=ctma.MA_MAMON 
	JOIN anh_mon_an ama ON ma.MA_MAMON=ama.MA_MAMON 
	JOIN danh_gia dg ON ma.MA_MAMON=dg.MA_MAMON
	where MA_TENMON like CONCAT('%', MA_TENMONN , '%')
	GROUP BY ma.MA_MAMON, CTMA_MACT, AMA_URL;
end |
DELIMITER ;


####################################################################################################################################
#4. Ảnh món ăn
drop procedure if exists THEM_ANH_MON_AN;
DELIMITER |
create procedure THEM_ANH_MON_AN(
    AMA_URL varchar(150),
	MA_MAMON varchar(10) ,
	AMA_TIEU_DE varchar(50)
    )
 begin
    insert into ANH_MON_AN(AMA_URL, MA_MAMON , AMA_TIEU_DE) values 
    (AMA_URL,concat(MA_MAMON), AMA_TIEU_DE);
end |
DELIMITER ;

drop procedure if exists CAP_NHAT_ANH_MON_AN;
DELIMITER |
create procedure CAP_NHAT_ANH_MON_AN(
	AMA_URLL varchar(150),
	AMA_TIEU_DEE varchar(50)
    )
 begin
	SET SQL_SAFE_UPDATES = 0;
	update ANH_MON_AN set AMA_TIEU_DE = AMA_TIEU_DEE
    where AMA_URL = AMA_URLL;
    SET SQL_SAFE_UPDATES = 1;
end |
DELIMITER ;
##

drop procedure if exists XOA_ANH_MON_AN;
DELIMITER |
create procedure XOA_ANH_MON_AN(
	AMA_URLL varchar(20)
    )
 begin
	SET SQL_SAFE_UPDATES = 0;
	DELETE FROM ANH_MON_AN WHERE AMA_URL = AMA_URLL;
	SET SQL_SAFE_UPDATES = 1;
end |	
DELIMITER ;

####################################################################################################################################
#5. Khách Hàng

drop procedure if exists THEM_KHACH_HANG;
DELIMITER |
create procedure THEM_KHACH_HANG(
	KH_TENKH varchar(32),
    KH_SDT char(10),
    KH_MATKHAU varchar(32)
    )
 begin
 	DECLARE countvar int;
	IF(EXISTS(SELECT count FROM KHACH_HANG ORDER BY count DESC LIMIT 1 )) THEN
    SET countvar= ((SELECT count FROM KHACH_HANG ORDER BY count DESC LIMIT 1) + 1) ;
	ELSE SET countvar= 1 ;
    END IF;
    insert into KHACH_HANG (count,KH_MAKH, KH_TENKH , KH_SDT, KH_MATKHAU) values 
    ( countvar, concat('KH',countvar),KH_TENKH, KH_SDT, sha(KH_MATKHAU) );
end |
DELIMITER ;
###
drop procedure if exists CAP_NHAT_KHACH_HANG;
DELIMITER |
create procedure CAP_NHAT_KHACH_HANG(
	KH_MAKHH varchar(20),
    KH_SDTT char(10),
    KH_TENKHH varchar(32),
    KH_EMAILL varchar(50)
    )
 begin
	update KHACH_HANG set KH_SDT= KH_SDTT, KH_TENKH = KH_TENKHH, KH_EMAIL = KH_EMAILL
    where KH_MAKH = KH_MAKHH;
end |
DELIMITER ;
###
drop procedure if exists DONG_BANG_KHACH_HANG;
DELIMITER |
create procedure DONG_BANG_KHACH_HANG(
	KH_MAKHH varchar(20)
    )
 begin
	update KHACH_HANG set KH_TRANGTHAI = 0
    where KH_MAKH = KH_MAKHH;
end |
DELIMITER ;
###
drop procedure if exists CAP_NHAT_MAT_KHAU_KH;
DELIMITER |
create procedure CAP_NHAT_MAT_KHAU_KH(
	KH_MAKHH varchar(20),
    KH_MATKHAU_CU varchar(32),
	KH_MATKHAU_MOI char(40)
    )
 begin
	declare ktmk int;
    declare mkc varchar(40);
    select KH_MATKHAU into mkc from KHACH_HANG where KH_MAKH = KH_MAKHH;
    set ktmk = 0;
    if sha(KH_MATKHAU_CU) = mkc then set ktmk =1;
    end if;
    if ktmk =1 then	update KHACH_HANG set  KH_MATKHAU = sha(KH_MATKHAU_MOI)
    where KH_MAKH = KH_MAKHH;
    end if;
    select ktmk;
end |
DELIMITER ;

drop procedure if exists TIM_KHACH_HANG_THEO_TEN;
DELIMITER |
create procedure TIM_KHACH_HANG_THEO_TEN(
	KH_TENKHH varchar(50)
    )
 begin
	select * from KHACH_HANG
    where KH_TENKH like CONCAT('%', KH_TENKHH , '%')	
    ;
end |
DELIMITER ;

#call TIM_KHACH_HANG_THEO_TEN("khach_hang 1");
#####
drop procedure if exists TIM_KHACH_HANG_THEO_SDT;
DELIMITER |
create procedure TIM_KHACH_HANG_THEO_SDT(
	KH_SDTT char(10)
    )
 begin
	select * from KHACH_HANG 
    where KH_SDT like CONCAT('%', KH_SDTT , '%')	
    ;
end |
DELIMITER ;
#call TIM_KHACH_HANG_THEO_SDT("123");

drop procedure if exists TIM_KHACH_HANG_THEO_MAKH;
DELIMITER |
create procedure TIM_KHACH_HANG_THEO_MAKH(
	KH_MAKHH varchar(20)
    )
 begin
	select * from KHACH_HANG 
    where KH_MAKH like CONCAT('%', KH_MAKHH , '%')	
    ;
end |
DELIMITER ;

drop function if exists DANG_NHAP;
DELIMITER |
create function DANG_NHAP(
    SDTT char(12),
    PASSWORDD varchar(32)
    )
 returns int
 DETERMINISTIC
 begin
  	declare result int;
    set result =0;
    if EXISTS (SELECT KH_SDT FROM KHACH_HANG where KH_SDT = SDTT)
    then set result = 2;
    end if;
    if result = 2 and EXISTS (SELECT KH_MATKHAU FROM KHACH_HANG where sha(PASSWORDD) = KH_MATKHAU   )
	then set result = 3;
	end if;
	if result = 3 and (SELECT KH_TRANGTHAI FROM KHACH_HANG where KH_SDT = SDTT) = 1
	then set result = 1;
	end if;
    return result;
end |
DELIMITER ;

drop procedure if exists DANG_NHAP;
DELIMITER |
create procedure DANG_NHAP(
    SDTT char(12),
    PASSWORDD varchar(32)
    )
 begin
  	declare result int;
    set result =0;
    if EXISTS (SELECT KH_SDT FROM KHACH_HANG where KH_SDT = SDTT)
    then set result = 2;
    end if;
    if result = 2 and EXISTS (SELECT KH_MATKHAU FROM KHACH_HANG where sha(PASSWORDD) = KH_MATKHAU   )
	then set result =3;
    end if;
	if result = 3 and (SELECT KH_TRANGTHAI FROM KHACH_HANG where KH_SDT = SDTT) = 1
	then set result = 1;
	end if;
    if result = 1 
    then call TIM_KHACH_HANG_THEO_SDT(SDTT);
	end if;
    if result =2 or result =0 or result = 3 
    then select result;
    end if;
end |
DELIMITER ;
####################################################################################################################################
#6. Địa chỉ

drop procedure if exists THEM_DIA_CHI;
DELIMITER |
CREATE PROCEDURE THEM_DIA_CHI(
   KH_MAKHH varchar(20),
   DC_NGUOINHANN varchar(32),
   DC_SDTNHANN char(10),
   DC_TENPHUONGG varchar(32),
   DC_TENQUANHUYENN varchar(32),
   DC_DIA_CHI_CU_THEE varchar(50),
   DC_isDefaultt int,
   OUT AddressId varchar(20)
    )
begin
  	DECLARE countvar int;
	IF(EXISTS(SELECT count FROM DIA_CHI ORDER BY count DESC LIMIT 1 )) THEN
    SET countvar= ((SELECT count FROM DIA_CHI ORDER BY count DESC LIMIT 1) + 1) ;
	ELSE SET countvar= 1 ;
    END IF;
    IF(DC_isDefaultt=true)
		THEN UPDATE dia_chi SET DC_isDefault = 0 WHERE (KH_MAKH = KH_MAKHH);
	END IF;
    insert into DIA_CHI(count,DC_MADC, KH_MAKH , DC_NGUOINHAN, DC_SDTNHAN, DC_TENPHUONG, DC_TENQUANHUYEN, DC_DIA_CHI_CU_THE, DC_isDefault) values 
    (countvar, concat('DC',countvar), KH_MAKHH , DC_NGUOINHANN, DC_SDTNHANN, DC_TENPHUONGG, DC_TENQUANHUYENN, DC_DIA_CHI_CU_THEE, DC_isDefaultt);
	SET @AddressId=concat('DC',countvar);
    SELECT @AddressId;
end |
DELIMITER ;
#select * from dia_chi;
#call them_khach_hang("KH1",'1234567890','mk1');
drop procedure if exists CAP_NHAT_DIA_CHI;
DELIMITER |
create procedure CAP_NHAT_DIA_CHI(
   DC_MADCC varchar(20),
   DC_NGUOINHANN varchar(32),
   DC_SDTNHANN char(10),
   DC_TENPHUONGG varchar(32),
   DC_TENQUANHUYENN varchar(32),
   DC_DIA_CHI_CU_THEE varchar(50)
    )
 begin
	update DIA_CHI set DC_NGUOINHAN = DC_NGUOINHANN, DC_SDTNHAN = DC_SDTNHANN, DC_TENPHUONG = DC_TENPHUONGG, 
    DC_TENQUANHUYEN = DC_TENQUANHUYENN, DC_DIA_CHI_CU_THE = DC_DIA_CHI_CU_THEE
    where DC_MADC = DC_MADCC;
end |
DELIMITER ;



drop procedure if exists XOA_DIA_CHI;
DELIMITER |
create procedure XOA_DIA_CHI(
   DC_MADCC varchar(20)
    )
 begin
	delete from DIA_CHI where  DC_MADC = DC_MADCC;
end |
DELIMITER ;

drop procedure if exists DAT_DIA_CHI_MAC_DINH;
DELIMITER |
create procedure DAT_DIA_CHI_MAC_DINH(
   DC_MADCC varchar(20)
    )
 begin
	declare tempvar varchar(20) ;
	select KH_MAKH from dia_chi where DC_MADC = 'DC8' limit 1 into tempvar;
	update dia_chi SET DC_isDefault = 0 WHERE KH_MAKH = tempvar ;
	update DIA_CHI set DC_isDefault = 1
    where DC_MADC = DC_MADCC;
end |
DELIMITER ;

drop procedure if exists TIM_DIA_CHI_THEO_MAKH;
DELIMITER |
create procedure TIM_DIA_CHI_THEO_MAKH(
	KH_MAKHH varchar(20)
    )
 begin
	select * from DIA_CHI 
    where KH_MAKH like CONCAT('%', KH_MAKHH , '%')	
    ;
end |
DELIMITER ;

####################################################################################################################################
#7. Nhân Viên



drop procedure if exists THEM_NHAN_VIEN_PHU_TRACH;
DELIMITER |
create procedure THEM_NHAN_VIEN_PHU_TRACH(
	NVPT_TENNV varchar(32),
    NVPT_SDT char(10),
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

drop procedure if exists CAP_NHAT_NHAN_VIEN;
DELIMITER |
create procedure CAP_NHAT_NHAN_VIEN(
	NVPT_MANVV varchar(10),
    NVPT_TENNVV varchar(32),
	NVPT_SDTT char(10)
    )
 begin
	update NHAN_VIEN_PHU_TRACH set NVPT_SDT= NVPT_SDTT, NVPT_TENNV = NVPT_TENNVV
    where NVPT_MANV = NVPT_MANVV;
end |
DELIMITER ;
###
drop procedure if exists CAP_NHAT_MAT_KHAU_NHAN_VIEN;
DELIMITER |
create procedure CAP_NHAT_MAT_KHAU_NHAN_VIEN(
	NVPT_MANVV varchar(10),
    NVPT_MATKHAU_CU varchar(32),
	NVPT_MATKHAU_MOI char(40)
    )
 begin
	declare ktmk int;
    declare mkc varchar(40);
    select NVPT_MATKHAU into mkc from NHAN_VIEN_PHU_TRACH where NVPT_MANV = NVPT_MANVV;
    set ktmk = 0;
    if sha(NVPT_MATKHAU_CU) = mkc then set ktmk =1;
    end if;
    if ktmk =1 then	update NHAN_VIEN_PHU_TRACH set  NVPT_MATKHAU = sha(NVPT_MATKHAU_MOI)
    where NVPT_MANV = NVPT_MANVV;
    end if;
    select ktmk;
end |
DELIMITER ;

drop procedure if exists TIM_NHAN_VIEN_THEO_SDT;
DELIMITER |
create procedure TIM_NHAN_VIEN_THEO_SDT(
	NV_SDTT char(10)
    )
 begin
	select * from NHAN_VIEN_PHU_TRACH 
    where NVPT_SDT like CONCAT('%', NV_SDTT , '%')	
    ;
end |
DELIMITER ;

drop procedure if exists DANG_NHAP_NHAN_VIEN;
DELIMITER |
create procedure DANG_NHAP_NHAN_VIEN(
    SDTT char(10),
    PASSWORDD varchar(32)
    )
 begin
  	declare result int;
    set result =0;
    if EXISTS (SELECT NVPT_SDT FROM NHAN_VIEN_PHU_TRACH where NVPT_SDT = SDTT)
    then set result = 2;
    end if;
    if result = 2 and EXISTS (SELECT NVPT_MATKHAU FROM NHAN_VIEN_PHU_TRACH where sha(PASSWORDD) = NVPT_MATKHAU   )
	then set result =1;
    end if;
    if result = 1 
    then call TIM_NHAN_VIEN_THEO_SDT(SDTT);
	end if;
    if result =2 or result =0
    then select result;
    end if;
end |
DELIMITER ;
####################################################################################################################################
#8,9,10. Bình luận, TL bình luận, đánh giá

###
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
    values (countvar, concat('BL',countvar),MA_MAMON, KH_MAKH, BL_NOIDUNG);
end |
DELIMITER ;
###
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
    values (countvar, concat('TLBL',countvar), BL_MABL, NVPT_MANV, TLBL_NOIDUNG);
end |
DELIMITER ;
###
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
    values (countvar, concat('DG',countvar), MA_MAMON, KH_MAKH, DG_DIEMDG);
end |
DELIMITER ;

drop procedure if exists TIM_BL_TLBL_THEO_MA_MON_AN;
DELIMITER |
create procedure TIM_BL_TLBL_THEO_MA_MON_AN(
	MA_MAMONN varchar(10)
    )
 begin
	select * from binh_luan bl left join tra_loi_bl tl on bl.bl_mabl = tl.bl_mabl
    where MA_MAMON like CONCAT('%', MA_MAMONN , '%')	
    ;
end |
DELIMITER ;

drop procedure if exists TIM_BL_TLBL_THEO_MA_KH;
DELIMITER |
create procedure TIM_BL_TLBL_THEO_MA_KH(
	KH_MAKHH varchar(20)
    )
 begin
	select * from binh_luan bl left join tra_loi_bl tl on bl.bl_mabl = tl.bl_mabl
    where KH_MAKH like CONCAT('%', KH_MAKHH , '%')	
    ;
end |
DELIMITER ;

drop procedure if exists TIM_DG_THEO_MA_MON_AN;
DELIMITER |
create procedure TIM_DG_THEO_MA_MON_AN(
	MA_MAMONN varchar(10)
    )
 begin
	select * from danh_gia
    where MA_MAMON like CONCAT('%', MA_MAMONN , '%')	
    ;
end |
DELIMITER ;
drop procedure if exists TIM_DG_THEO_MA_KH;
DELIMITER |
create procedure TIM_DG_THEO_MA_KH(
	KH_MAKHH varchar(20)
    )
 begin
	select * from danh_gia
    where KH_MAKH like CONCAT('%', KH_MAKHH , '%')	
    ;
end |
DELIMITER ;


drop procedure if exists XOA_TRA_LOI_BL_THEO_MATLBL;
DELIMITER |
create procedure XOA_TRA_LOI_BL_THEO_MATLBL(
	TLBL_MATLBLL varchar(24)
    )
 begin
	DELETE FROM TRA_LOI_BL WHERE TLBL_MATLBL = TLBL_MATLBLL;
end |	
DELIMITER ;

drop procedure if exists XOA_TRA_LOI_BL_THEO_MABL;
DELIMITER |
create procedure XOA_TRA_LOI_BL_THEO_MABL(
	BL_MABLL varchar(20)
    )
 begin
	DELETE FROM TRA_LOI_BL WHERE BL_MABL = BL_MABLL;
end |	
DELIMITER ;

drop procedure if exists XOA_BINH_LUAN_THEO_MABL_MAKH;
DELIMITER |
create procedure XOA_BINH_LUAN_THEO_MABL_MAKH(
	BL_MABLL varchar(20),
	KH_MAKHH varchar(20)
    )
 begin
    declare khvar varchar(20);
	select KH_MAKH FROM BINH_LUAN WHERE BL_MABL = BL_MABLL limit 1 into khvar;
	if khvar = KH_MAKHH then
    call XOA_TRA_LOI_BL_THEO_MABL(BL_MABLL);
	DELETE FROM BINH_LUAN WHERE BL_MABL = BL_MABLL;
    select 1;
    else select 0;
    end if;
end |	
DELIMITER ;
####################################################################################################################################
#11. Giỏ món ăn
/*drop procedure if exists THEM_GIO_MON_AN_MOI;
DELIMITER |
create procedure THEM_GIO_MON_AN_MOI(
    KH_MAKHH varchar(20)
    )
 begin
    insert into CHI_TIET_GIO_MON_AN (KH_MAKH,CTMA_MACT,CTGMA_SOLUONG ) 
    values (KH_MAKHH,null,null);
end |
DELIMITER ;
*/
#select * from chi_tiet_mon_an;
drop procedure if exists CAP_NHAT_GIO_MON_AN;
DELIMITER |
create procedure CAP_NHAT_GIO_MON_AN(
    KH_MAKHH varchar(20),
    CTMA_MACTT varchar(20),
    CTGMA_SOLUONGG smallint
    )
 begin
/*	if not exists (select KH_MAKH from CHI_TIET_GIO_MON_AN where KH_MAKH = KH_MAKHH)
    then call THEM_GIO_MON_AN_MOI(KH_MAKHH);
    end if;*/
    insert into CHI_TIET_GIO_MON_AN (KH_MAKH,CTMA_MACT,CTGMA_SOLUONG) values(KH_MAKHH, CTMA_MACTT, CTGMA_SOLUONGG);
end |
DELIMITER ;

drop procedure if exists TIM_GIO_THEO_KH;
DELIMITER |
create procedure TIM_GIO_THEO_KH(
	KH_MAKHH varchar(20)
    )
 begin
	select * from CHI_TIET_GIO_MON_AN
    where KH_MAKH like CONCAT('%', KH_MAKHH , '%');
end |
DELIMITER ;

####################################################################################################################################
#12,13. Đơn đặt món, chi tiết đơn đặt món
drop procedure if exists THEM_DON_DAT_MON;
DELIMITER |
create procedure THEM_DON_DAT_MON(
    KH_MAKHH varchar(28),
	DDM_TONGTIENN int
    )
 begin
  	DECLARE countvar int;
	IF(EXISTS(SELECT count FROM DON_DAT_MON ORDER BY count DESC LIMIT 1 )) THEN
    SET countvar= ((SELECT count FROM DON_DAT_MON ORDER BY count DESC LIMIT 1) + 1) ;
	ELSE SET countvar= 1 ;
    END IF;
    insert into DON_DAT_MON (count, DDM_MADON, KH_MAKH , DDM_TONGTIEN) 
    values (countvar, concat('DDM',countvar), KH_MAKHH , DDM_TONGTIENN);
	select concat('DDM',countvar);
end |
DELIMITER ;
drop procedure if exists THEM_CHI_TIET_DON_DAT_MON;
DELIMITER |
create procedure THEM_CHI_TIET_DON_DAT_MON(
	DDM_MADONN varchar(21),
    CTMA_MACTT varchar(20),
    CTD_SOLUONGG smallint
    )
 begin
    insert into CHI_TIET_DON_DAT_MON (DDM_MADON, CTMA_MACT, CTD_SOLUONG)
    values (DDM_MADONN, CTMA_MACTT,CTD_SOLUONGG);
end |
DELIMITER ;

drop procedure if exists TIM_DON_DAT_MON_THEO_MADON;
DELIMITER |
create procedure TIM_DON_DAT_MON_THEO_MADON(
	DDM_MADONN varchar(21)
    )
 begin
	select * from don_dat_mon ddm left join CHI_TIET_DON_DAT_MON ctd on ddm.ddm_madon = ctd.ddm_madon
    where ddm.DDM_MADON = DDM_MADONN;
end |
DELIMITER ;

drop procedure if exists TIM_DON_DAT_MON_THEO_MAKH;
DELIMITER |
create procedure TIM_DON_DAT_MON_THEO_MAKH(
    KH_MAKHH varchar(28)
    )
 begin
	select * from don_dat_mon ddm left join CHI_TIET_DON_DAT_MON ctd on ddm.ddm_madon = ctd.ddm_madon
    where KH_MAKH = KH_MAKHH;
end |
DELIMITER ;


drop procedure if exists NHAN_VIEN_XAC_NHAN_DON_DAT_MON;
DELIMITER |
create procedure NHAN_VIEN_XAC_NHAN_DON_DAT_MON(
    NVPT_MANVV varchar(10),
    DDM_MADONN varchar(21)
    )
 begin
	update DON_DAT_MON SET NVPT_MANV = NVPT_MANVV,  DDM_TRANGTHAI = 'Đang thực hiện' where DDM_MADON = DDM_MADONN;
end |
DELIMITER ;

drop procedure if exists NHAN_VIEN_HUY_DON_DAT_MON;
DELIMITER |
create procedure NHAN_VIEN_HUY_DON_DAT_MON(
    NVPT_MANVV varchar(10),
    DDM_MADONN varchar(21)
    )
 begin
	update DON_DAT_MON SET NVPT_MANV = NVPT_MANVV,  DDM_TRANGTHAI = 'Đã hủy bởi nhân viên' where DDM_MADON = DDM_MADONN;
end |
DELIMITER ;


drop procedure if exists KHACH_HANG_HUY_DON_DAT_MON;
DELIMITER |
create procedure KHACH_HANG_HUY_DON_DAT_MON(
    KH_MAKHH varchar(20),
    DDM_MADONN varchar(21)
    )
 begin
    declare khvar varchar(20);
	select KH_MAKH FROM DON_DAT_MON WHERE KH_MAKH = KH_MAKHH limit 1 into khvar;
	if khvar = KH_MAKHH and (select DDM_TRANGTHAI FROM DON_DAT_MON WHERE KH_MAKH = KH_MAKHH limit 1) = 'Chờ xác nhận'  then
    update DON_DAT_MON set DDM_TRANGTHAI = 'Đã hủy bởi Khách Hàng' WHERE KH_MAKH = KH_MAKHH;
    select 'Hủy thành công';
    else select 'Hủy không thành công';
    end if;
end |
DELIMITER ;

####################################################################################################################################
#14,15. Đơn tiệc
drop procedure if exists THEM_DON_DAT_TIEC;
DELIMITER |
create procedure THEM_DON_DAT_TIEC(
    KH_MAKH varchar(28),
    DDT_LOAITIEC varchar(25),
    DDT_DIADIEM varchar(255),
    DDT_NGAYGIODAII timestamp,
    DDT_SOBANTIEC smallint,
	DDT_TONGTIEN int
    )
 begin
  	DECLARE countvar int;
	IF(EXISTS(SELECT count FROM DON_DAT_TIEC ORDER BY count DESC LIMIT 1 )) THEN
    SET countvar= ((SELECT count FROM DON_DAT_TIEC ORDER BY count DESC LIMIT 1) + 1) ;
	ELSE SET countvar= 1 ;
    END IF;
    insert into DON_DAT_TIEC (count, DDT_MADON, KH_MAKH, DDT_LOAITIEC, DDT_DIADIEM, DDT_NGAYGIODAI, DDT_SOBANTIEC , DDT_TONGTIEN) 
    values (countvar, concat('DDT',countvar), KH_MAKH, DDT_LOAITIEC, DDT_DIADIEM, DDT_NGAYGIODAII, DDT_SOBANTIEC , DDT_TONGTIEN);
	select concat('DDT',countvar);
end |
DELIMITER ;

drop procedure if exists THEM_CHI_TIET_DON_DAT_TIEC;
DELIMITER |
create procedure THEM_CHI_TIET_DON_DAT_TIEC(
	DDT_MADONN varchar(21),
    CTMA_MACTT varchar(20)
    )
 begin
    insert into CHI_TIET_DON_DAT_TIEC (DDT_MADON, CTMA_MACT)
    values (DDT_MADONN, CTMA_MACTT);
end |
DELIMITER ;


drop procedure if exists TIM_DON_DAT_TIEC_THEO_MADON;
DELIMITER |
create procedure TIM_DON_DAT_TIEC_THEO_MADON(
	DDT_MADONN varchar(21)
    )
 begin
	select * from don_dat_tiec ddt left join CHI_TIET_DON_DAT_tiec ctd on ddt.ddt_madon = ctd.ddt_madon
    where ddt.DDT_MADON = DDT_MADONN;
end |
DELIMITER ;

drop procedure if exists TIM_DON_DAT_TIEC_THEO_MAKH;
DELIMITER |
create procedure TIM_DON_DAT_TIEC_THEO_MAKH(
    KH_MAKHH varchar(28)
    )
 begin
	select * from don_dat_tiec ddt left join CHI_TIET_DON_DAT_tiec ctd on ddt.ddt_madon = ctd.ddt_madon
    where KH_MAKH = KH_MAKHH;
end |
DELIMITER ;


drop procedure if exists NHAN_VIEN_XAC_NHAN_DON_DAT_TIEC;
DELIMITER |
create procedure NHAN_VIEN_XAC_NHAN_DON_DAT_TIEC(
    NVPT_MANVV varchar(10),
    DDT_MADONN varchar(21)
    )
 begin
	update DON_DAT_TIEC SET NVPT_MANV = NVPT_MANVV,  DDT_TRANGTHAI = 'Đang thực hiện' where DDT_MADON = DDT_MADONN;
end |
DELIMITER ;

drop procedure if exists NHAN_VIEN_HUY_DON_DAT_TIEC;
DELIMITER |
create procedure NHAN_VIEN_HUY_DON_DAT_TIEC(
    NVPT_MANVV varchar(10),
    DDT_MADONN varchar(21)
    )
 begin
	update DON_DAT_TIEC SET NVPT_MANV = NVPT_MANVV,  DDT_TRANGTHAI = 'Đã hủy bởi nhân viên' where DDT_MADON = DDT_MADONN;
end |
DELIMITER ;


drop procedure if exists KHACH_HANG_HUY_DON_DAT_TIEC;
DELIMITER |
create procedure KHACH_HANG_HUY_DON_DAT_TIEC(
    KH_MAKHH varchar(20),
    DDT_MADONN varchar(21)
    )
 begin
    declare khvar varchar(20);
	select KH_MAKH FROM DON_DAT_TIEC WHERE KH_MAKH = KH_MAKHH limit 1 into khvar;
	if khvar = KH_MAKHH and (select DDT_TRANGTHAI FROM DON_DAT_TIEC WHERE KH_MAKH = KH_MAKHH limit 1) = 'Chờ xác nhận'  then
    update DON_DAT_TIEC set DDT_TRANGTHAI = 'Đã hủy bởi khách hàng' WHERE KH_MAKH = KH_MAKHH;
    select 'Hủy thành công';
    else select 'Hủy không thành công';
    end if;
end |
DELIMITER ;


drop procedure if exists LAP_HOA_DON_DAT_MON;
DELIMITER |
create procedure LAP_HOA_DON_DAT_MON(
    DDM_MADONN varchar(21)
    )
 begin
  	DECLARE countvar int;
    if (select DDM_TRANGTHAI FROM DON_DAT_MON WHERE DDM_MADON = DDM_MADONN limit 1) = 'Đang thực hiện'
    then 
		update DON_DAT_MON set DDM_TRANGTHAI = 'Đã hoàn thành' WHERE DDM_MADON = DDM_MADONN;
		IF(EXISTS(SELECT count FROM HOA_DON ORDER BY count DESC LIMIT 1 )) THEN
			SET countvar= ((SELECT count FROM HOA_DON ORDER BY count DESC LIMIT 1) + 1) ;
			ELSE SET countvar= 1 ;
		END IF;
		insert into HOA_DON (count, HD_MAHD, DDM_MADON) 
		values (countvar, concat('HD',countvar), DDM_MADONN);
		select concat('Đã lập hóa đơn HD',countvar);
	else select ('Đơn phải ở trạng thái \'Đang thực hiện\'');
    end if;
end |
DELIMITER ;



drop procedure if exists LAP_HOA_DON_DAT_TIEC;
DELIMITER |
create procedure LAP_HOA_DON_DAT_TIEC(
    DDT_MADONN varchar(21)
    )
 begin
  	DECLARE countvar int;
    if (select DDT_TRANGTHAI FROM DON_DAT_TIEC WHERE DDT_MADON = DDT_MADONN limit 1) = 'Đang thực hiện'
    then 
		update DON_DAT_TIEC set DDT_TRANGTHAI = 'Đã hoàn thành' WHERE DDT_MADON = DDT_MADONN;
		IF(EXISTS(SELECT count FROM HOA_DON ORDER BY count DESC LIMIT 1 )) THEN
			SET countvar= ((SELECT count FROM HOA_DON ORDER BY count DESC LIMIT 1) + 1) ;
			ELSE SET countvar= 1 ;
		END IF;
		insert into HOA_DON (count, HD_MAHD, DDT_MADON) 
		values (countvar, concat('HD',countvar), DDT_MADONN);
		select concat('Đã lập hóa đơn HD',countvar);
	else select ('Đơn phải ở trạng thái \'Đang thực hiện\'');
    end if;
end |
DELIMITER ;



drop procedure if exists THANH_TOAN_HOA_DON;
DELIMITER |
create procedure THANH_TOAN_HOA_DON(
    HD_MAHDD varchar(20)
    )
 begin
	UPDATE HOA_DON set HD_THOI_DIEM_THANH_TOAN = now()
    where HD_MAHD = HD_MAHDD;
end |
DELIMITER ;




drop procedure if exists TIM_HOA_DON_THEO_MAHD;
DELIMITER |
create procedure TIM_HOA_DON_THEO_MAHD(
	HD_MAHDD varchar(20)
    )
 begin
	select * from HOA_DON 
    where HD_MAHD = HD_MAHDD;
end |
DELIMITER ;







/*SET FOREIGN_KEY_CHECKS = 0;
truncate don_dat_mon;
truncate chi_tiet_don_dat_mon;
SET FOREIGN_KEY_CHECKS = 1;

select * from don_dat_mon;
*/






