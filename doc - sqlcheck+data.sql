
#1. Loại món ăn
###call THEM_LOAI_MON_AN ('Tên','Mô tả');
call THEM_LOAI_MON_AN ('Đồ chiên','Các loại đồ chiên ít đầu mỡ, bảo đảm sức khỏe người dùng');
call THEM_LOAI_MON_AN ('Lẩu','Lẩu nóng các loại cho nhiều người ăn');
call THEM_LOAI_MON_AN ('Đồ chay','Đồ chay 100% được chế biến riêng biệc');
call THEM_LOAI_MON_AN ('Nước ngọt','Các loại nước uống giải khác có gas');
call THEM_LOAI_MON_AN ('Món tráng miệng','Các loại đồ ăn tráng miệng như bánh flan, yaourt');
select * from LOAI_MON_AN;
#SET FOREIGN_KEY_CHECKS = 0;
#truncate loai_mon_an;
#SET FOREIGN_KEY_CHECKS = 1;
###call CAP_NHAT_LOAI_MON_AN('Mã loại','Tên loại','Mô tả')
call CAP_NHAT_LOAI_MON_AN ('LMA5','Tráng miệng','Các loại đồ ăn như bánh flan, yaourt');
### call TIM_LOAI_MON_AN_THEO_TU_KHOA('Tên')
call TIM_LOAI_MON_AN_THEO_TU_KHOA('');
select * from mon_an;
###call XOA_LOAI_MON_AN('Mã loại ')
call XOA_LOAI_MON_AN ('LMA6');
####################################################################################################################################
#2. Món ăn
### call THEM_MON_AN ('Mã loại','Tên món','Mô tả')
select * from Mon_an;
/*SET FOREIGN_KEY_CHECKS = 0;
truncate Mon_an;
SET FOREIGN_KEY_CHECKS = 1;*/
###Call THEM_MON_AN('Mã Loại món ăn','Tên món ăn','Mô tả')
call THEM_MON_AN ('LMA1','Gà chiên','Nguyên liệu chính là những miếng thịt gà đã được lăn bột rồi chiên trên chảo, chiên ngập dầu kèm nước sốt, giòm rụm ngon ngất ngây');
call THEM_MON_AN ('LMA2','Lẩu thái','Lẩu thái luôn là một lựa chọn hoàn hảo vào mỗi dịp cuối tuần hay mỗi khi nhà có tiệc, có khách. Nồi nước lẩu Thái khi hoàn thành sẽ có màu đỏ vô cùng đẹp mắt của gấc, thơm nức mùi chanh, sả, riềng vị hòa cùng vị ngọt tự nhiên từ nước hầm xương gà, tất cả vô cùng hài hòa, đậm vị.');
call THEM_MON_AN ('LMA2','Lẩu bò','Lẩu bò thập cẩm khi hoàn thành thơm lừng mùi sả, ăn vào có vị ấm của gừng, cảm nhận được độ ngọt thịt và xương bò, dai dai của nạm bò, ăn kèm bò viên, đậu hũ, mướp, rau xanh,... thì chỉ có đúng bài. Làm một chén lẩu bò thập cẩm vào thời tiết se lạnh như hiện nay thì không còn gì tuyệt vời hơn.');
call THEM_MON_AN ('LMA2','Lẩu mắm','Lẩu mắm cá linh đậm vị quê nhà với hương thơm đặc trưng của mắm cá linh, một mùi thơm thu hút không lẫn đi đâu được. Vị đậm đà của mắm, của gia vị ăn kèm rau và bún thì lại vô cùng hòa quyện.');
call THEM_MON_AN ('LMA3','Canh chay','Các món canh chay thơm ngon, hấp dẫn phải kể đến như món canh chua chay đơn giản với vị chua của me và từng miếng đậu hũ trắng béo mềm.');
call THEM_MON_AN ('LMA3','Salad chay','Salad chay là món khai vị hoàn hảo cho mọi bữa ăn, bên cạnh vị thơm ngon, món salad còn rất bổ dưỡng và cung cấp thêm nhiều chất xơ cần thiết cho cơ thể. Thường nhắc tới rau trong món chay, người ta sẽ nghĩ đến nấm, tuy nhiên, salad chay sẽ giúp bạn có thêm nhiều lựa chọn về rau xanh.');
call THEM_MON_AN ('LMA4','Sting','Nước ngọt giải khát Sting');
call THEM_MON_AN ('LMA4','Xá xị','Nước ngọt giải khát Xá xị');
call THEM_MON_AN ('LMA1','Cá diêu hồng chiên xù','Cá diêu hồng chiên xù có lớp vỏ vàng giòn rụm, cắn vào có vị béo thơm, thịt cá thì mềm ngọt nước. Khi ăn dùng kèm với rau xà lách tươi mát và tương ớt cay cay thì ngon hết sẩy.');
call THEM_MON_AN ('LMA3','Kho quẹt chay','Món kho quẹt là món ăn dù món mặn hay chay đều rất bắt cơm bởi hương vị đậm đà, hấp dẫn mà nó mang lại. Không kém cạnh gì kho quẹt trong bữa ăn mặn, món kho quẹt chay được làm từ đậu phộng cũng khiến bạn mê mẩn không thôi.');
call THEM_MON_AN ('LMA5','Món xóa','Món ăn để xóa');
###call CAP_NHAT_MON_AN('Mã món ăn','Tên món ăn','Mô tả');
call CAP_NHAT_MON_AN('MA1','Gà rán','Nguyên liệu chính là những miếng thịt gà đã được lăn bột rồi chiên trên chảo, chiên ngập dầu kèm nước sốt, giòm rụm ngon ngất ngây');
###call XOA_MON_AN('Mã món ăn')
call XOA_MON_AN('MA11');
####################################################################################################################################
#3. Chi tiết món ăn\
###call THEM_CHI_TIET_MON_AN('Mã món ăn','Giá tiền','Khẩu phần')
call THEM_CHI_TIET_MON_AN('MA1','18000','1');
call THEM_CHI_TIET_MON_AN('MA2','30000','1');
call THEM_CHI_TIET_MON_AN('MA2','50000','5');
call THEM_CHI_TIET_MON_AN('MA2','80000','4');
call THEM_CHI_TIET_MON_AN('MA3','30000','1');
call THEM_CHI_TIET_MON_AN('MA3','50000','2');
call THEM_CHI_TIET_MON_AN('MA3','80000','4');
call THEM_CHI_TIET_MON_AN('MA4','45000','2');
call THEM_CHI_TIET_MON_AN('MA5','15000','1');
call THEM_CHI_TIET_MON_AN('MA6','12000','1');
call THEM_CHI_TIET_MON_AN('MA7','10000','1');
call THEM_CHI_TIET_MON_AN('MA8','10000','1');
call THEM_CHI_TIET_MON_AN('MA9','25000','1');
call THEM_CHI_TIET_MON_AN('MA10','20000','1');
###call CAP_NHAT_CHI_TIET_MON_AN('Mã chi tiết','Mức giá','Khẩu phần')
call CAP_NHAT_CHI_TIET_MON_AN('CTMA2_2','70000','3');
#select * from chi_tiet_mon_an;
###call XOA_CHI_TIET_MON_AN('Mã chi tiết');
call XOA_CHI_TIET_MON_AN('CTMA2_2');
####################################################################################################################################
#4. Ảnh món ăn
###THEM_ANH_MON_AN('Đường dẫn url','Mã món','Tiêu đề')
call THEM_ANH_MON_AN('Anhmonan1.com','MA1','Ảnh 1 của món ăn một');
call THEM_ANH_MON_AN('Anhmonan2.com','MA1','Ảnh 2 của món ăn một');
#select * from ANH_MON_AN;
###call CAP_NHAT_ANH_MON_AN('Đường dẫn url','Tiêu đề');
call CAP_NHAT_ANH_MON_AN('Anhmonan1.com','Ảnh a của món ăn một');
###call XOA_ANH_MON_AN('Đường dẫn url')
call XOA_ANH_MON_AN('Anhmonan1.com');
####################################################################################################################################
#5. Khách Hàng
#call THEM_KHACH_HANG('Tên Khách hàng','Số điện thoại','Mật khẩu') 
call THEM_KHACH_HANG('Nguyễn Văn Toàn','0123435792','vantoan');
call THEM_KHACH_HANG('Trần Quốc Huy','0822352457','quochuy');
call THEM_KHACH_HANG('Trịnh Hoàng Hà','0932548527','hoangha'); 
call THEM_KHACH_HANG('Nguyễn Khách Vy','0437124562','khanhvy'); 
call THEM_KHACH_HANG('Lê Hồng Loan','0835432475','hongloan'); 
call THEM_KHACH_HANG('Nguyễn Vững Trãi','0123443728','vungtrai'); 
call THEM_KHACH_HANG('Trần Văn Tuấn','0258782945','vantuan'); 
call THEM_KHACH_HANG('Nguyên Lê Tuấn Anh','0465138427','tuananh'); 
call THEM_KHACH_HANG('Hồng Hà Văn Ngân Vy','0823233222','nganvy'); 
call THEM_KHACH_HANG('Nguyễn Tuấn Tú','0918258372','tuantu'); 
call THEM_KHACH_HANG('Nguyễn Tuấn Tú','0283453735','tuantu'); 
#select * from khach_hang;
#SET FOREIGN_KEY_CHECKS = 0;
#truncate khach_hang;
#SET FOREIGN_KEY_CHECKS = 1;
## call DONG_BANG_KHACH_HANG('Mã khách hàng'); 
call DONG_BANG_KHACH_HANG('KH7');
###Trả về 0 nếu sai sdt, trả về 2 nếu sai mật khẩu, trả về 3 nếu tài trạng thái khác 1, trả về 1 nếu đăng nhập thành công
call dang_nhap("0823233222","nganvy");
select dang_nhap("0123443728",'vungtrai');
###
###call CAP_NHAT_KHACH_HANG ('Mã Khách Hàng','Số điện thoại','Tên khách Hàng','Email')
call CAP_NHAT_KHACH_HANG ('KH1','0123435792','Nguyễn Văn Toàn 2','vantoan2@gmail.com');
call CAP_NHAT_KHACH_HANG ('KH2','0822352457','Trần Quốc Huy','quochuy@gmail.com');
call CAP_NHAT_KHACH_HANG ('KH4','0437124562','Nguyễn Khách Vy','khanhvy@gmail.com');
call CAP_NHAT_KHACH_HANG ('KH5','0835432475','Lê Hồng Loan','hongloan@gmail.com');
###call CAP_NHAT_MAT_KHAU_KH('Mã khách hàng', 'Mật khẩu cũ','Mật khẩu mới'); return 1 if success, 0 if not
call CAP_NHAT_MAT_KHAU_KH('KH2', 'quochuy','quochuymoi');
#select * from khach_hang;
call TIM_KHACH_HANG_THEO_TEN('Huy');
call TIM_KHACH_HANG_THEO_SDT('75');
call TIM_KHACH_HANG_THEO_MAKH('KH4');
####################################################################################################################################
#6. Địa chỉ
###call THEM_DIA_CHI('Mã khách hàng','Tên người nhận','Số điện thoải','Phường xã','Quận huyện','Địa chỉ cụ thể','Mặc định')
call THEM_DIA_CHI('KH1','Nguyễn Văn Toàn','0123435792','Phường Xuân Khách','Quận Nính Kiều','Số nhà 15 Đối diện tiệm uốn tóc',1, @addressid);
call THEM_DIA_CHI('KH1','Trịnh Hồng Tú','0125123123','Phường An Hòa','Quận Bình Thuỷ','Số nhà 525 gần quán coffe',1, @addressid);
call THEM_DIA_CHI('KH2','Trần Quốc Huy','0822352457','Phường Thới Long','Quận Ô Môn','Gần dốc cầu ủy ban, nhà có bàng xăng',1, @addressid);
call THEM_DIA_CHI('KH6','Nguyễn Vững Trãi','0123443728','Phường Xuân Khách','Quận Nính Kiều','Nhà 112 kế quán cà phê Bình Minh',1, @addressid);
call THEM_DIA_CHI('KH4','Nguyễn Khách Vy','0437124562','Phường Ba Láng','Quận Cái Răng','Cửa hàng vật liệu xây dựng Ba Láng',1, @addressid);
call THEM_DIA_CHI('KH8','Nguyên Lê Tuấn Anh','0123435792','Xã Vĩnh Bình','Huyện Vĩnh Thạnh','Đối diện điện máy xanh 3',1, @addressid);
#select * from khach_hang kh left join dia_chi dc on kh.kh_makh = dc.kh_makh;
#call CAP_NHAT_DIA_CHI('DC1','Nguyễn Văn Toàn 3','0123435792' ,'Phường Xuân Khách 3','Quận Nính Kiều 3','Số nhà 3');
#select * from dia_chi;
#call XOA_DIA_CHI('Mã địa chỉ');
#call XOA_DIA_CHI('DC1');
select * from dia_chi;
#call DAT_DIA_CHI_MAC_DINH('Mã địa chỉ');
call DAT_DIA_CHI_MAC_DINH('DC8');
#TIM_DIA_CHI_THEO_MAKH('Mã khách hàng')
call TIM_DIA_CHI_THEO_MAKH('KH2');
####################################################################################################################################
#7. Nhân viên

#call THEM_NHAN_VIEN_PHU_TRACH('Tên Nhân Viên','Số điện thoại','Mật khẩu')
call THEM_NHAN_VIEN_PHU_TRACH('Trịnh Nhật Tân','0822322075','nhattan');
call THEM_NHAN_VIEN_PHU_TRACH('Minh Kha','0126344123','minhkha');
call THEM_NHAN_VIEN_PHU_TRACH('Vũ','0432112331','vu');

#use test2;
#truncate table NHAN_VIEN_PHU_TRACH;

select * from nhan_vien_phu_trach;
#call CAP_NHAT_NHAN_VIEN('Mã nhân viên','Tên nhân viên','Số điện thoại')
call CAP_NHAT_NHAN_VIEN('NV1','Trịnh Nhật Tân 1','0822322072');
#call CAP_NHAT_MAT_KHAU('Mã nhân viên','Tên nhân viên','Số điện thoại')
call CAP_NHAT_MAT_KHAU_NHAN_VIEN('NV1','nhattan','nhattan1');
call TIM_NHAN_VIEN_THEO_SDT('082');
call DANG_NHAP_NHAN_VIEN('0822322072','nhattan1');

###call THEM_BINH_LUAN('Mã món','Mã khách hàng','Nội dung')
call THEM_BINH_LUAN('MA1','KH1','Gà ngon, sẽ ủng hộ thêm');
call THEM_TRA_LOI_BL('BL1','NV1','Cảm ơn quý khách đã ủng hộ');
call THEM_BINH_LUAN('MA1','KH2','Gà quá mặn');
call THEM_TRA_LOI_BL('BL2','NV1','Chúng tôi xin ghi nhận góp ý, cảm ơn quý khách đã ủng hộ');
call THEM_BINH_LUAN('MA1','KH3','Có bán mang về không ạ?');
call THEM_TRA_LOI_BL('BL3','NV1','Có thưa quý khách');
call THEM_BINH_LUAN('MA1','KH1','còn bán không shop?');
#call THEM_TRA_LOI_BL('BL1','NV1','Cảm ơn quý khách đã ủng hộ');
call THEM_TRA_LOI_BL('BL4','NV1','Còn ạ');
###call THEM_TRA_LOI_BL('Mã bình luận','Mã nhân viên','Nội dung')
###call THEM_DANH_GIA('Mã món','Mã khách hàng','Điểm đánh giá')
call THEM_DANH_GIA('MA1','KH1',5);
call THEM_DANH_GIA('MA1','KH2',3);

call TIM_MON_AN_THEO_TK('Gà rán');
call TIM_BL_TLBL_THEO_MA_MON_AN('MA1');
call TIM_BL_TLBL_THEO_MA_KH('KH1');
call TIM_DG_THEO_MA_MON_AN('MA1');
call TIM_DG_THEO_MA_KH('KH1');
call XOA_TRA_LOI_BL_THEO_MATLBL('TLBL1');
call XOA_BINH_LUAN_THEO_MABL_MAKH('BL4','KH1');

###

select * from chi_tiet_gio_mon_an;

#call THEM_GIO_MON_AN_MOI('KH1');
call CAP_NHAT_GIO_MON_AN('KH1','CTMA2_1','2');
call CAP_NHAT_GIO_MON_AN('KH1','CTMA2_3','3');
call CAP_NHAT_GIO_MON_AN('KH1','CTMA1_1','1');
call CAP_NHAT_GIO_MON_AN('KH2','CTMA2_1','2');
call TIM_GIO_THEO_KH('KH1');

###call THEM_DON_DAT_MON('Mã khách hàng','Giá tiền')
call THEM_DON_DAT_MON('KH1','300000');
###call THEM_CHI_TIET_DON_DAT_MON('Mã đơn','Mã chi tiết món ăn','số lượng');
call THEM_CHI_TIET_DON_DAT_MON('DDM1','CTMA2_1','2');
call THEM_CHI_TIET_DON_DAT_MON('DDM1','CTMA2_3','3');
call THEM_CHI_TIET_DON_DAT_MON('DDM1','CTMA1_1','1');
##
call THEM_DON_DAT_MON('KH4','500000');
call THEM_CHI_TIET_DON_DAT_MON('DDM2','CTMA1_1','1');
call THEM_CHI_TIET_DON_DAT_MON('DDM2','CTMA2_1','1');
call THEM_CHI_TIET_DON_DAT_MON('DDM2','CTMA4_1','5');

call THEM_DON_DAT_MON('KH6','500000');
call THEM_CHI_TIET_DON_DAT_MON('DDM3','CTMA1_1','1');
call THEM_CHI_TIET_DON_DAT_MON('DDM3','CTMA2_1','1');
call THEM_CHI_TIET_DON_DAT_MON('DDM3','CTMA4_1','5');
call NHAN_VIEN_XAC_NHAN_DON_DAT_MON('NV1','DDM4');

call TIM_DON_DAT_MON_THEO_MADON('DDM1');
call TIM_DON_DAT_MON_THEO_MAKH('KH1');
call NHAN_VIEN_XAC_NHAN_DON_DAT_MON('NV1','DDM1');
call NHAN_VIEN_HUY_DON_DAT_MON('NV2','DDM1');
call KHACH_HANG_HUY_DON_DAT_MON('KH1','DDM1');


select * from DON_DAT_TIEC;
call THEM_DON_DAT_TIEC('KH1','Loại tiệc mẫu 1','Phường Xuân Khánh Quận Nình Kiều, Nhà 456','2022-07-10 21:00:00','20','1200000');
call THEM_DON_DAT_TIEC('KH2','Loại tiệc mẫu 1','Phường Xuân Khánh Quận Nình Kiều, Nhà 4125','2022-01-10 21:00:00','20','2460000');
call THEM_CHI_TIET_DON_DAT_TIEC('DDT2','CTMA1_1');
call THEM_CHI_TIET_DON_DAT_TIEC('DDT2','CTMA2_1');
call THEM_CHI_TIET_DON_DAT_TIEC('DDT2','CTMA4_1');
call TIM_DON_DAT_TIEC_THEO_MADON('DDT1');
call TIM_DON_DAT_TIEC_THEO_MAKH('KH2');
call NHAN_VIEN_XAC_NHAN_DON_DAT_TIEC('NV1','DDT1');
call NHAN_VIEN_HUY_DON_DAT_TIEC('NV2','DDT1');
call KHACH_HANG_HUY_DON_DAT_TIEC('KH2','DDT2');


call THEM_DON_DAT_TIEC('KH6','Loại tiệc mẫu 6','Phường Tân Phú, Nhà 125','2022-07-12 21:00:00','20','12435000');
call THEM_CHI_TIET_DON_DAT_TIEC('DDT3','CTMA1_1');
call THEM_CHI_TIET_DON_DAT_TIEC('DDT3','CTMA2_1');
call THEM_CHI_TIET_DON_DAT_TIEC('DDT3','CTMA4_1');
call NHAN_VIEN_XAC_NHAN_DON_DAT_TIEC('NV2','DDT3');

call TIM_DON_DAT_MON_THEO_MADON('DDM4');
select * from hoa_don;
CALL LAP_HOA_DON_DAT_MON('DDM4');
call TIM_DON_DAT_TIEC_THEO_MADON('DDT3');
select * from hoa_don;
CALL LAP_HOA_DON_DAT_TIEC('DDT3');
call THANH_TOAN_HOA_DON('HD2');
call TIM_HOA_DON_THEO_MAHD('HD2');






# on bl.MA_mamon = dg.ma_mamon ;
/*where ma_mamon = ma_mamonn;
select * from binh_luan bl  full outer join danh_gia dg on bl.MA_mamon = dg.ma_mamon;

SELECT *
FROM danh_gia
FULL OUTER JOIN binh_luan
ON danh_gia.column_name = table2.column_name
WHERE condition;

SET FOREIGN_KEY_CHECKS = 0;
truncate table binh_luan;
truncate table tra_loi_bl;
truncate table danh_gia;
SET FOREIGN_KEY_CHECKS = 1;
#select * from mon_an ma left join danh_gia dg on ma.ma_mamon = dg.ma_mamon left join 
#binh_luan bla on bla.ma_mamon = ma.ma_mamon left join tra_loi_bl tl on bla.bl_mabl = tl.bl_mabl;

#left join (select * from binh_luan bla left join tra_loi_bl tl on bla.bl_mabl = tl.bl_mabl) bl on bl.ma_mamon = ma.ma_mamon  ;


#select MA_MAMON,loai_mon_an.LMA_MALOAI, LMA_TENLOAI, LMA_MOTA, MA_TENMON,MA_MOTA from mon_an join loai_mon_an on mon_an.lma_maloai=loai_mon_an.lma_maloai order by  CAST(SUBSTRING(ma_mamon, 3) AS UNSIGNED) ;
#select * from mon_an join loai_mon_an on mon_an.lma_maloai=loai_mon_an.lma_maloai group by mon_an.ma_mamon order by  CAST(SUBSTRING(ma_mamon, 3) AS UNSIGNED) ;

#SET FOREIGN_KEY_CHECKS = 0;
#truncate loai_mon_an;
#SET FOREIGN_KEY_CHECKS = 1;

*/