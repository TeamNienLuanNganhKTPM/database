drop procedure if exists THEM_LOAI_MON_AN;
DELIMITER |
create procedure THEM_LOAI_MON_AN(
    LMA_TENLOAI varchar(15),
	LMA_MOTA tinytext
    )
 begin
	DECLARE countvar int;
	IF(EXISTS(SELECT count FROM loai_mon_an ORDER BY count DESC LIMIT 1 )) THEN
    SET countvar= ((SELECT count FROM loai_mon_an ORDER BY count DESC LIMIT 1) + 1) ;
	ELSE SET countvar= 1 ;
    END IF;
    insert into LOAI_MON_AN (count, LMA_MALOAI, LMA_TENLOAI,LMA_MOTA) values 
    (countvar, concat('LMA',countvar), LMA_TENLOAI, LMA_MOTA);
end |
DELIMITER ;
##
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
##
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
#select * from chi_tiet_mon_an;
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
###
drop procedure if exists THEM_ANH_MON_AN;
DELIMITER |
create procedure THEM_ANH_MON_AN(
    AMA_URL varchar(150),
	MA_MAMON varchar(10) ,
	AMA_TIEU_DE varchar(50)
    )
 begin
    insert into ANH_MON_AN(AMA_URL, MA_MAMON , AMA_TIEU_DE) values 
    (AMA_URL,concat('MA',MA_MAMON), AMA_TIEU_DE);
end |
DELIMITER ;
###
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
drop procedure if exists THEM_DIA_CHI;
DELIMITER |
create procedure THEM_DIA_CHI(
   KH_MAKH varchar(20),
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
    insert into DIA_CHI(count,DC_MADC, KH_MAKH, DC_TENDUONG, DC_TENPHUONG, DC_TENQUANHUYEN, DC_SONHA) values 
    (countvar, concat('DC',countvar), concat('KH',KH_MAKH), DC_TENDUONG, DC_TENPHUONG, DC_TENQUANHUYEN, DC_SONHA);
end |
DELIMITER ;
##
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
    values (countvar, concat('BL',countvar), concat('MA',MA_MAMON), concat('KH',KH_MAKH), BL_NOIDUNG);
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
    values (countvar, concat('TLBL',countvar), concat('BL',BL_MABL), concat('NV',NVPT_MANV), TLBL_NOIDUNG);
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
    values (countvar, concat('DG',countvar), concat('MA',MA_MAMON), concat('KH',KH_MAKH), DG_DIEMDG);
end |
DELIMITER ;
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
drop procedure if exists TIM_KHACH_HANG_THEO_TEN;
DELIMITER |
create procedure TIM_KHACH_HANG_THEO_TEN(
	KH_TENKHH varchar(50)
    )
 begin
	select * from KHACH_HANG kh left join DIA_CHI dc on kh.KH_MAKH  = dc.KH_MAKH 
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
	select * from KHACH_HANG kh left join DIA_CHI dc on kh.KH_MAKH  = dc.KH_MAKH 
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
	select * from KHACH_HANG kh left join DIA_CHI dc on kh.KH_MAKH  = dc.KH_MAKH 
    where kh.KH_MAKH like CONCAT('%KH', KH_MAKHH , '%')	
    ;
end |
DELIMITER ;
#call TIM_KHACH_HANG_THEO_MAKH(1);
#select * from khach_hang;

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
	then set result = 1;
	end if;
    return result;
end |
DELIMITER ;
#select dang_nhap("2234567890","MK32");

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
	then set result =1; call TIM_KHACH_HANG_THEO_SDT(SDTT);
	end if;
    if result =2 or result =0 then select result;
    end if;
end |
DELIMITER ;
#call dang_nhap("1234567890","MK1");
#select dang_nhap("2234567890","MK2");
##
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
#call CAP_NHAT_KHACH_HANG ('KH1','1234567899','KHang1','email@gmail.com','matkhaumoi')
##
#select * from khach_hang;
##
drop procedure if exists TIM_LOAI_MON_AN_THEO_TEN;
DELIMITER |
create procedure TIM_LOAI_MON_AN_THEO_TEN(
	LMA_TENLOAII varchar(50)
    )
 begin
	select * from LOAI_MON_AN  
    where LMA_TENLOAI like CONCAT('%', LMA_TENLOAII , '%')	
    ;
end |
DELIMITER ;
#call TIM_LOAI_MON_AN_THEO_TEN('Nuong');
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



