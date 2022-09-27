#them/sua/xoa diachi
#doi matkhau
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
    where KH_MAKH = concat('KH',KH_MAKHH);
end |
DELIMITER ;
#call CAP_NHAT_KHACH_HANG ('1','1234567899','KHang1','email@gmail.com');
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
#select * from khach_hang;
#call CAP_NHAT_MAT_KHAU_KH('KH1', 'MK5','MK1');
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
#call THEM_DIA_CHI(1,'duong abc','phuong xyz','quanacv','nha 4');
#select * from dia_chi;
#call them_khach_hang("KH1",'1234567890','mk1');
drop procedure if exists CAP_NHAT_DIA_CHI;
DELIMITER |
create procedure CAP_NHAT_DIA_CHI(
   KH_MAKHH varchar(20),
   DC_TENDUONGG varchar(15),
   DC_TENPHUONGG varchar(15),
   DC_TENQUANHUYENN varchar(15),
   DC_SONHAA varchar(5)
    )
 begin
	update DIA_CHI set DC_TENDUONG= DC_TENDUONGG, DC_TENPHUONG = DC_TENPHUONGG, DC_TENQUANHUYEN = DC_TENQUANHUYENN, DC_SONHA = DC_SONHAA
    where KH_MAKH = concat('KH',KH_MAKHH);
end |
DELIMITER ;
call TIM_KHACH_HANG_THEO_MAKH('1');
call CAP_NHAT_DIA_CHI(1,'duong a','phuong x','quan c','nha 1');
select * from dia_chi;

drop procedure if exists XOA_DIA_CHI;
DELIMITER |
create procedure XOA_DIA_CHI(
   KH_MAKHH varchar(20),
   DC_MADCC varchar(20)
    )
 begin
	delete from DIA_CHI where KH_MAKH = concat('KH',KH_MAKHH) and DC_MADC =concat('DC',DC_MADCC);
end |
DELIMITER ;

call XOA_DIA_CHI(1,1);





