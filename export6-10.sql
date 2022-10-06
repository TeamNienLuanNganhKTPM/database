-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: export1
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `anh_mon_an`
--

DROP TABLE IF EXISTS `anh_mon_an`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anh_mon_an` (
  `AMA_URL` varchar(150) DEFAULT NULL,
  `MA_MAMON` varchar(10) DEFAULT NULL,
  `AMA_TIEU_DE` varchar(50) DEFAULT NULL,
  KEY `ANH_MINH_HOA` (`MA_MAMON`),
  CONSTRAINT `ANH_MINH_HOA` FOREIGN KEY (`MA_MAMON`) REFERENCES `mon_an` (`MA_MAMON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anh_mon_an`
--

LOCK TABLES `anh_mon_an` WRITE;
/*!40000 ALTER TABLE `anh_mon_an` DISABLE KEYS */;
/*!40000 ALTER TABLE `anh_mon_an` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `binh_luan`
--

DROP TABLE IF EXISTS `binh_luan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `binh_luan` (
  `count` int DEFAULT NULL /*!80023 INVISIBLE */,
  `BL_MABL` varchar(20) NOT NULL,
  `MA_MAMON` varchar(10) DEFAULT NULL,
  `KH_MAKH` varchar(20) DEFAULT NULL,
  `BL_NOIDUNG` varchar(255) NOT NULL,
  `BL_THOIGIANBL` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BL_MABL`),
  KEY `BL_MONAN` (`MA_MAMON`),
  KEY `KH_BL` (`KH_MAKH`),
  CONSTRAINT `BL_MONAN` FOREIGN KEY (`MA_MAMON`) REFERENCES `mon_an` (`MA_MAMON`),
  CONSTRAINT `KH_BL` FOREIGN KEY (`KH_MAKH`) REFERENCES `khach_hang` (`KH_MAKH`),
  CONSTRAINT `BL_MABL_format` CHECK (regexp_like(`BL_MABL`,_utf8mb4'(^BL[0-9]{1,18}$)'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `binh_luan`
--

LOCK TABLES `binh_luan` WRITE;
/*!40000 ALTER TABLE `binh_luan` DISABLE KEYS */;
/*!40000 ALTER TABLE `binh_luan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chi_tiet_don_dat_mon`
--

DROP TABLE IF EXISTS `chi_tiet_don_dat_mon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chi_tiet_don_dat_mon` (
  `DDM_MADON` varchar(11) NOT NULL,
  `CTMA_MACT` varchar(20) NOT NULL,
  `CTD_SOLUONG` smallint DEFAULT '1',
  PRIMARY KEY (`DDM_MADON`,`CTMA_MACT`),
  KEY `CHUA_MON_AN` (`CTMA_MACT`),
  CONSTRAINT `CHUA_MON_AN` FOREIGN KEY (`CTMA_MACT`) REFERENCES `chi_tiet_mon_an` (`CTMA_MACT`),
  CONSTRAINT `THUOC_DON` FOREIGN KEY (`DDM_MADON`) REFERENCES `don_dat_mon` (`DDM_MADON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_don_dat_mon`
--

LOCK TABLES `chi_tiet_don_dat_mon` WRITE;
/*!40000 ALTER TABLE `chi_tiet_don_dat_mon` DISABLE KEYS */;
/*!40000 ALTER TABLE `chi_tiet_don_dat_mon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chi_tiet_don_dat_tiec`
--

DROP TABLE IF EXISTS `chi_tiet_don_dat_tiec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chi_tiet_don_dat_tiec` (
  `DDT_MADON` varchar(11) NOT NULL,
  `CTMA_MACT` varchar(20) NOT NULL,
  PRIMARY KEY (`DDT_MADON`,`CTMA_MACT`),
  KEY `DDT_CHUA_MON_AN` (`CTMA_MACT`),
  CONSTRAINT `DDT_CHUA_MON_AN` FOREIGN KEY (`CTMA_MACT`) REFERENCES `chi_tiet_mon_an` (`CTMA_MACT`),
  CONSTRAINT `THUOC_DON_DAT_TIEC` FOREIGN KEY (`DDT_MADON`) REFERENCES `don_dat_tiec` (`DDT_MADON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_don_dat_tiec`
--

LOCK TABLES `chi_tiet_don_dat_tiec` WRITE;
/*!40000 ALTER TABLE `chi_tiet_don_dat_tiec` DISABLE KEYS */;
/*!40000 ALTER TABLE `chi_tiet_don_dat_tiec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chi_tiet_gio_mon_an`
--

DROP TABLE IF EXISTS `chi_tiet_gio_mon_an`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chi_tiet_gio_mon_an` (
  `KH_MAKH` varchar(20) DEFAULT NULL,
  `CTMA_MACT` varchar(20) DEFAULT NULL,
  `CTGMA_SOLUONG` smallint DEFAULT NULL,
  KEY `GIO_CUA_KH` (`KH_MAKH`),
  KEY `GIO_CHUA_MON_AN` (`CTMA_MACT`),
  CONSTRAINT `GIO_CHUA_MON_AN` FOREIGN KEY (`CTMA_MACT`) REFERENCES `chi_tiet_mon_an` (`CTMA_MACT`),
  CONSTRAINT `GIO_CUA_KH` FOREIGN KEY (`KH_MAKH`) REFERENCES `khach_hang` (`KH_MAKH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_gio_mon_an`
--

LOCK TABLES `chi_tiet_gio_mon_an` WRITE;
/*!40000 ALTER TABLE `chi_tiet_gio_mon_an` DISABLE KEYS */;
/*!40000 ALTER TABLE `chi_tiet_gio_mon_an` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chi_tiet_mon_an`
--

DROP TABLE IF EXISTS `chi_tiet_mon_an`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chi_tiet_mon_an` (
  `MA_MAMON` varchar(10) DEFAULT NULL,
  `CTMA_MACT` varchar(20) NOT NULL,
  `CTMA_MUCGIA` int NOT NULL,
  `CTMA_KHAUPHAN` tinyint DEFAULT '1',
  PRIMARY KEY (`CTMA_MACT`),
  KEY `CT_MONAN` (`MA_MAMON`),
  CONSTRAINT `CT_MONAN` FOREIGN KEY (`MA_MAMON`) REFERENCES `mon_an` (`MA_MAMON`),
  CONSTRAINT `CTMA_MACT_format` CHECK (regexp_like(`CTMA_MACT`,_utf8mb4'^CTMA[0-9]{1,8}_[0-9]{1,18}$')),
  CONSTRAINT `MAMON_check` CHECK (regexp_like(regexp_substr(`CTMA_MACT`,_utf8mb4'(?<=CTMA)[0-9]{1,8}'),regexp_substr(`MA_MAMON`,_utf8mb4'(?<=MA)[0-9]{1,8}')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_mon_an`
--

LOCK TABLES `chi_tiet_mon_an` WRITE;
/*!40000 ALTER TABLE `chi_tiet_mon_an` DISABLE KEYS */;
/*!40000 ALTER TABLE `chi_tiet_mon_an` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danh_gia`
--

DROP TABLE IF EXISTS `danh_gia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `danh_gia` (
  `count` int DEFAULT NULL /*!80023 INVISIBLE */,
  `DG_MADG` varchar(20) NOT NULL,
  `MA_MAMON` varchar(10) DEFAULT NULL,
  `KH_MAKH` varchar(20) DEFAULT NULL,
  `DG_DIEMDG` tinyint DEFAULT NULL,
  `DG_THOIGIANDG` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DG_MADG`),
  UNIQUE KEY `kh_dg_1lan` (`MA_MAMON`,`KH_MAKH`),
  KEY `KH_DG` (`KH_MAKH`),
  CONSTRAINT `DG_MONAN` FOREIGN KEY (`MA_MAMON`) REFERENCES `mon_an` (`MA_MAMON`),
  CONSTRAINT `KH_DG` FOREIGN KEY (`KH_MAKH`) REFERENCES `khach_hang` (`KH_MAKH`),
  CONSTRAINT `DG_MADG_format` CHECK (regexp_like(`DG_MADG`,_utf8mb4'(^DG[0-9]{1,18}$)')),
  CONSTRAINT `sosaolonhon0behon5` CHECK (((`DG_DIEMDG` <= 5) and (`DG_DIEMDG` >= 0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danh_gia`
--

LOCK TABLES `danh_gia` WRITE;
/*!40000 ALTER TABLE `danh_gia` DISABLE KEYS */;
/*!40000 ALTER TABLE `danh_gia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dia_chi`
--

DROP TABLE IF EXISTS `dia_chi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dia_chi` (
  `count` int DEFAULT NULL /*!80023 INVISIBLE */,
  `DC_MADC` varchar(20) NOT NULL,
  `KH_MAKH` varchar(20) DEFAULT NULL,
  `DC_NGUOINHAN` varchar(32) DEFAULT NULL,
  `DC_SDTNHAN` char(10) DEFAULT NULL,
  `DC_TENPHUONG` varchar(32) DEFAULT NULL,
  `DC_TENQUANHUYEN` varchar(32) DEFAULT NULL,
  `DC_DIA_CHI_CU_THE` varchar(50) DEFAULT NULL,
  `DC_isDefault` smallint DEFAULT NULL,
  PRIMARY KEY (`DC_MADC`),
  KEY `DC_KH` (`KH_MAKH`),
  CONSTRAINT `DC_KH` FOREIGN KEY (`KH_MAKH`) REFERENCES `khach_hang` (`KH_MAKH`),
  CONSTRAINT `DC_MADC_format` CHECK (regexp_like(`DC_MADC`,_utf8mb4'^DC[0-9]{1,18}$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dia_chi`
--

LOCK TABLES `dia_chi` WRITE;
/*!40000 ALTER TABLE `dia_chi` DISABLE KEYS */;
/*!40000 ALTER TABLE `dia_chi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `don_dat_mon`
--

DROP TABLE IF EXISTS `don_dat_mon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `don_dat_mon` (
  `count` int DEFAULT NULL /*!80023 INVISIBLE */,
  `DDM_MADON` varchar(21) NOT NULL,
  `KH_MAKH` varchar(20) DEFAULT NULL,
  `NVPT_MANV` varchar(10) DEFAULT 'NV0',
  `DDM_NGAYGIO` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DDM_TONGTIEN` int NOT NULL,
  `DDM_TRANGTHAI` varchar(30) DEFAULT 'Chờ xác nhận',
  PRIMARY KEY (`DDM_MADON`),
  KEY `KH_DATMON` (`KH_MAKH`),
  KEY `NVPT_DDM` (`NVPT_MANV`),
  CONSTRAINT `KH_DATMON` FOREIGN KEY (`KH_MAKH`) REFERENCES `khach_hang` (`KH_MAKH`),
  CONSTRAINT `NVPT_DDM` FOREIGN KEY (`NVPT_MANV`) REFERENCES `nhan_vien_phu_trach` (`NVPT_MANV`),
  CONSTRAINT `MADON_format` CHECK (regexp_like(`DDM_MADON`,_utf8mb4'(^DDM[0-9]{1,18}$)'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `don_dat_mon`
--

LOCK TABLES `don_dat_mon` WRITE;
/*!40000 ALTER TABLE `don_dat_mon` DISABLE KEYS */;
/*!40000 ALTER TABLE `don_dat_mon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `don_dat_tiec`
--

DROP TABLE IF EXISTS `don_dat_tiec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `don_dat_tiec` (
  `count` int DEFAULT NULL /*!80023 INVISIBLE */,
  `DDT_MADON` varchar(21) NOT NULL,
  `KH_MAKH` varchar(20) DEFAULT NULL,
  `NVPT_MANV` varchar(10) DEFAULT 'NV0',
  `DDT_NGAYGIO` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DDT_LOAITIEC` varchar(20) DEFAULT NULL,
  `DDT_DIADIEM` varchar(255) DEFAULT NULL,
  `DDT_NGAYGIODAI` timestamp NULL DEFAULT NULL,
  `DDT_SOBANTIEC` smallint DEFAULT NULL,
  `DDT_TONGTIEN` int NOT NULL,
  `DDT_TRANGTHAI` varchar(30) DEFAULT 'Chờ xác nhận',
  PRIMARY KEY (`DDT_MADON`),
  KEY `KH_DATTIEC` (`KH_MAKH`),
  KEY `NVPT_DDT` (`NVPT_MANV`),
  CONSTRAINT `KH_DATTIEC` FOREIGN KEY (`KH_MAKH`) REFERENCES `khach_hang` (`KH_MAKH`),
  CONSTRAINT `NVPT_DDT` FOREIGN KEY (`NVPT_MANV`) REFERENCES `nhan_vien_phu_trach` (`NVPT_MANV`),
  CONSTRAINT `MADONTIEC_format` CHECK (regexp_like(`DDT_MADON`,_utf8mb4'(^DDT[0-9]{1,18}$)'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `don_dat_tiec`
--

LOCK TABLES `don_dat_tiec` WRITE;
/*!40000 ALTER TABLE `don_dat_tiec` DISABLE KEYS */;
/*!40000 ALTER TABLE `don_dat_tiec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoa_don`
--

DROP TABLE IF EXISTS `hoa_don`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoa_don` (
  `count` int DEFAULT NULL /*!80023 INVISIBLE */,
  `HD_MAHD` varchar(20) NOT NULL,
  `DDM_MADON` varchar(21) DEFAULT NULL,
  `DDT_MADON` varchar(21) DEFAULT NULL,
  `HD_THOI_DIEM_THANH_TOAN` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`HD_MAHD`),
  KEY `HD_THUOC_DON_DM` (`DDM_MADON`),
  KEY `HD_THUOC_DON_DT` (`DDT_MADON`),
  CONSTRAINT `HD_THUOC_DON_DM` FOREIGN KEY (`DDM_MADON`) REFERENCES `don_dat_mon` (`DDM_MADON`),
  CONSTRAINT `HD_THUOC_DON_DT` FOREIGN KEY (`DDT_MADON`) REFERENCES `don_dat_tiec` (`DDT_MADON`),
  CONSTRAINT `HD_FORMAT` CHECK (regexp_like(`HD_MAHD`,_utf8mb4'^HD[0-9]{1,18}'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoa_don`
--

LOCK TABLES `hoa_don` WRITE;
/*!40000 ALTER TABLE `hoa_don` DISABLE KEYS */;
/*!40000 ALTER TABLE `hoa_don` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khach_hang`
--

DROP TABLE IF EXISTS `khach_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khach_hang` (
  `count` int DEFAULT NULL /*!80023 INVISIBLE */,
  `KH_MAKH` varchar(20) NOT NULL,
  `KH_TENKH` varchar(32) NOT NULL,
  `KH_SDT` char(10) NOT NULL,
  `KH_EMAIL` varchar(50) DEFAULT NULL,
  `KH_MATKHAU` char(40) DEFAULT NULL,
  `KH_TRANGTHAI` tinyint DEFAULT '1',
  PRIMARY KEY (`KH_MAKH`),
  UNIQUE KEY `KH_SDT` (`KH_SDT`),
  UNIQUE KEY `KH_EMAIL` (`KH_EMAIL`),
  CONSTRAINT `KH_EMAIL_format` CHECK (regexp_like(`KH_EMAIL`,_utf8mb4'^[^@]+@[^@]+.[^@]{2,}$')),
  CONSTRAINT `KH_MAKH_format` CHECK (regexp_like(`KH_MAKH`,_utf8mb4'^KH[0-9]{1,18}$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khach_hang`
--

LOCK TABLES `khach_hang` WRITE;
/*!40000 ALTER TABLE `khach_hang` DISABLE KEYS */;
/*!40000 ALTER TABLE `khach_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loai_mon_an`
--

DROP TABLE IF EXISTS `loai_mon_an`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loai_mon_an` (
  `count` int DEFAULT NULL /*!80023 INVISIBLE */,
  `LMA_MALOAI` varchar(11) NOT NULL,
  `LMA_TENLOAI` varchar(15) NOT NULL,
  `LMA_MOTA` tinytext,
  PRIMARY KEY (`LMA_MALOAI`),
  UNIQUE KEY `LMA_TENLOAI` (`LMA_TENLOAI`),
  CONSTRAINT `LMA_MALOAI_format` CHECK (regexp_like(`LMA_MALOAI`,_utf8mb4'^LMA[0-9]{1,8}$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_mon_an`
--

LOCK TABLES `loai_mon_an` WRITE;
/*!40000 ALTER TABLE `loai_mon_an` DISABLE KEYS */;
/*!40000 ALTER TABLE `loai_mon_an` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mon_an`
--

DROP TABLE IF EXISTS `mon_an`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mon_an` (
  `count` int DEFAULT NULL /*!80023 INVISIBLE */,
  `MA_MAMON` varchar(10) NOT NULL,
  `LMA_MALOAI` varchar(11) DEFAULT NULL,
  `MA_TENMON` varchar(40) NOT NULL,
  `MA_MOTA` text,
  PRIMARY KEY (`MA_MAMON`),
  UNIQUE KEY `MA_TENMON` (`MA_TENMON`),
  KEY `MA_LMA` (`LMA_MALOAI`),
  CONSTRAINT `MA_LMA` FOREIGN KEY (`LMA_MALOAI`) REFERENCES `loai_mon_an` (`LMA_MALOAI`),
  CONSTRAINT `MA_MAMON_format` CHECK (regexp_like(`MA_MAMON`,_utf8mb4'^MA[0-9]{1,8}$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mon_an`
--

LOCK TABLES `mon_an` WRITE;
/*!40000 ALTER TABLE `mon_an` DISABLE KEYS */;
/*!40000 ALTER TABLE `mon_an` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhan_vien_phu_trach`
--

DROP TABLE IF EXISTS `nhan_vien_phu_trach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhan_vien_phu_trach` (
  `count` int DEFAULT NULL /*!80023 INVISIBLE */,
  `NVPT_MANV` varchar(10) NOT NULL,
  `NVPT_TENNV` varchar(32) NOT NULL,
  `NVPT_SDT` char(10) NOT NULL,
  `NVPT_MATKHAU` char(40) DEFAULT NULL,
  PRIMARY KEY (`NVPT_MANV`),
  UNIQUE KEY `NVPT_SDT` (`NVPT_SDT`),
  CONSTRAINT `NVPT_MANV_format` CHECK (regexp_like(`NVPT_MANV`,_utf8mb4'^NV[0-9]{1,8}'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhan_vien_phu_trach`
--

LOCK TABLES `nhan_vien_phu_trach` WRITE;
/*!40000 ALTER TABLE `nhan_vien_phu_trach` DISABLE KEYS */;
INSERT INTO `nhan_vien_phu_trach` (`count`, `NVPT_MANV`, `NVPT_TENNV`, `NVPT_SDT`, `NVPT_MATKHAU`) VALUES (0,'NV0','Nhân Viên Giả','0000000000','538da17c8ed06685a7d38056cb23c9aad3003a49');
/*!40000 ALTER TABLE `nhan_vien_phu_trach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tra_loi_bl`
--

DROP TABLE IF EXISTS `tra_loi_bl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tra_loi_bl` (
  `count` int DEFAULT NULL /*!80023 INVISIBLE */,
  `TLBL_MATLBL` varchar(24) NOT NULL,
  `BL_MABL` varchar(20) DEFAULT NULL,
  `NVPT_MANV` varchar(10) DEFAULT NULL,
  `TLBL_NOIDUNG` varchar(255) DEFAULT NULL,
  `TLBL_THOIGIAN` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`TLBL_MATLBL`),
  KEY `THUOC_BINH_LUAN` (`BL_MABL`),
  KEY `NVPT_TLBL` (`NVPT_MANV`),
  CONSTRAINT `NVPT_TLBL` FOREIGN KEY (`NVPT_MANV`) REFERENCES `nhan_vien_phu_trach` (`NVPT_MANV`),
  CONSTRAINT `THUOC_BINH_LUAN` FOREIGN KEY (`BL_MABL`) REFERENCES `binh_luan` (`BL_MABL`),
  CONSTRAINT `TLBL_MATLBL_format` CHECK (regexp_like(`TLBL_MATLBL`,_utf8mb4'(^TLBL[0-9]{1,20}$)'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tra_loi_bl`
--

LOCK TABLES `tra_loi_bl` WRITE;
/*!40000 ALTER TABLE `tra_loi_bl` DISABLE KEYS */;
/*!40000 ALTER TABLE `tra_loi_bl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'export1'
--

--
-- Dumping routines for database 'export1'
--
/*!50003 DROP FUNCTION IF EXISTS `DANG_NHAP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `DANG_NHAP`(
    SDTT char(12),
    PASSWORDD varchar(32)
    ) RETURNS int
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ktma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ktma`(
    MA_MAMONN varchar(10)) RETURNS int
    DETERMINISTIC
begin
  	declare countvar varchar(20);
    declare mamon_var varchar(10);
    return EXISTS (SELECT MA_MAMON FROM CHI_TIET_MON_AN where MA_MAMON = MA_MAMONN  LIMIT 1);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CAP_NHAT_ANH_MON_AN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CAP_NHAT_ANH_MON_AN`(
	AMA_URLL varchar(150),
	AMA_TIEU_DEE varchar(50)
    )
begin
	SET SQL_SAFE_UPDATES = 0;
	update ANH_MON_AN set AMA_TIEU_DE = AMA_TIEU_DEE
    where AMA_URL = AMA_URLL;
    SET SQL_SAFE_UPDATES = 1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CAP_NHAT_CHI_TIET_MON_AN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CAP_NHAT_CHI_TIET_MON_AN`(
	CTMA_MACTT varchar(20),
    CTMA_MUCGIAA int,
    CTMA_KHAUPHANN tinyint
    )
begin
	update CHI_TIET_MON_AN set CTMA_MUCGIA= CTMA_MUCGIAA, CTMA_KHAUPHAN = CTMA_KHAUPHANN
    where CTMA_MACT = CTMA_MACTT;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CAP_NHAT_DIA_CHI` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CAP_NHAT_DIA_CHI`(
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CAP_NHAT_GIO_MON_AN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CAP_NHAT_GIO_MON_AN`(
    KH_MAKHH varchar(20),
    CTMA_MACTT varchar(20),
    CTGMA_SOLUONGG smallint
    )
begin
/*	if not exists (select KH_MAKH from CHI_TIET_GIO_MON_AN where KH_MAKH = KH_MAKHH)
    then call THEM_GIO_MON_AN_MOI(KH_MAKHH);
    end if;*/
    insert into CHI_TIET_GIO_MON_AN (KH_MAKH,CTMA_MACT,CTGMA_SOLUONG) values(KH_MAKHH, CTMA_MACTT, CTGMA_SOLUONGG);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CAP_NHAT_KHACH_HANG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CAP_NHAT_KHACH_HANG`(
	KH_MAKHH varchar(20),
    KH_SDTT char(10),
    KH_TENKHH varchar(32),
    KH_EMAILL varchar(50)
    )
begin
	update KHACH_HANG set KH_SDT= KH_SDTT, KH_TENKH = KH_TENKHH, KH_EMAIL = KH_EMAILL
    where KH_MAKH = KH_MAKHH;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CAP_NHAT_LOAI_MON_AN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CAP_NHAT_LOAI_MON_AN`(
	LMA_MALOAII varchar(11),
    LMA_TENLOAII varchar(15),
    LMA_MOTAA tinytext
    )
begin
	update LOAI_MON_AN set LMA_TENLOAI= LMA_TENLOAII, LMA_MOTA = LMA_MOTAA
    where LMA_MALOAI = LMA_MALOAII;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CAP_NHAT_MAT_KHAU_KH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CAP_NHAT_MAT_KHAU_KH`(
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CAP_NHAT_MAT_KHAU_NHAN_VIEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CAP_NHAT_MAT_KHAU_NHAN_VIEN`(
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CAP_NHAT_MON_AN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CAP_NHAT_MON_AN`(
	MA_MAMONN varchar(10),
	MA_TENMONN varchar(11),
    MA_MOTAA text
    )
begin
	update MON_AN set MA_TENMON= MA_TENMONN, MA_MOTA = MA_MOTAA
    where MA_MAMON = MA_MAMONN;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CAP_NHAT_NHAN_VIEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CAP_NHAT_NHAN_VIEN`(
	NVPT_MANVV varchar(10),
    NVPT_TENNVV varchar(32),
	NVPT_SDTT char(10)
    )
begin
	update NHAN_VIEN_PHU_TRACH set NVPT_SDT= NVPT_SDTT, NVPT_TENNV = NVPT_TENNVV
    where NVPT_MANV = NVPT_MANVV;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DANG_NHAP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DANG_NHAP`(
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DANG_NHAP_NHAN_VIEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DANG_NHAP_NHAN_VIEN`(
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DAT_DIA_CHI_MAC_DINH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DAT_DIA_CHI_MAC_DINH`(
   DC_MADCC varchar(20)
    )
begin
	declare tempvar varchar(20) ;
	select KH_MAKH from dia_chi where DC_MADC = 'DC8' limit 1 into tempvar;
	update dia_chi SET DC_isDefault = 0 WHERE KH_MAKH = tempvar ;
	update DIA_CHI set DC_isDefault = 1
    where DC_MADC = DC_MADCC;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DONG_BANG_KHACH_HANG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DONG_BANG_KHACH_HANG`(
	KH_MAKHH varchar(20)
    )
begin
	update KHACH_HANG set KH_TRANGTHAI = 0
    where KH_MAKH = KH_MAKHH;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `KHACH_HANG_HUY_DON_DAT_MON` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `KHACH_HANG_HUY_DON_DAT_MON`(
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `KHACH_HANG_HUY_DON_DAT_TIEC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `KHACH_HANG_HUY_DON_DAT_TIEC`(
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LAP_HOA_DON_DAT_MON` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LAP_HOA_DON_DAT_MON`(
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LAP_HOA_DON_DAT_TIEC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LAP_HOA_DON_DAT_TIEC`(
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NHAN_VIEN_HUY_DON_DAT_MON` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `NHAN_VIEN_HUY_DON_DAT_MON`(
    NVPT_MANVV varchar(10),
    DDM_MADONN varchar(21)
    )
begin
	update DON_DAT_MON SET NVPT_MANV = NVPT_MANVV,  DDM_TRANGTHAI = 'Đã hủy bởi nhân viên' where DDM_MADON = DDM_MADONN;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NHAN_VIEN_HUY_DON_DAT_TIEC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `NHAN_VIEN_HUY_DON_DAT_TIEC`(
    NVPT_MANVV varchar(10),
    DDT_MADONN varchar(21)
    )
begin
	update DON_DAT_TIEC SET NVPT_MANV = NVPT_MANVV,  DDT_TRANGTHAI = 'Đã hủy bởi nhân viên' where DDT_MADON = DDT_MADONN;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NHAN_VIEN_XAC_NHAN_DON_DAT_MON` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `NHAN_VIEN_XAC_NHAN_DON_DAT_MON`(
    NVPT_MANVV varchar(10),
    DDM_MADONN varchar(21)
    )
begin
	update DON_DAT_MON SET NVPT_MANV = NVPT_MANVV,  DDM_TRANGTHAI = 'Đang thực hiện' where DDM_MADON = DDM_MADONN;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NHAN_VIEN_XAC_NHAN_DON_DAT_TIEC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `NHAN_VIEN_XAC_NHAN_DON_DAT_TIEC`(
    NVPT_MANVV varchar(10),
    DDT_MADONN varchar(21)
    )
begin
	update DON_DAT_TIEC SET NVPT_MANV = NVPT_MANVV,  DDT_TRANGTHAI = 'Đang thực hiện' where DDT_MADON = DDT_MADONN;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `THANH_TOAN_HOA_DON` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `THANH_TOAN_HOA_DON`(
    HD_MAHDD varchar(20)
    )
begin
	UPDATE HOA_DON set HD_THOI_DIEM_THANH_TOAN = now()
    where HD_MAHD = HD_MAHDD;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `THEM_ANH_MON_AN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `THEM_ANH_MON_AN`(
    AMA_URL varchar(150),
	MA_MAMON varchar(10) ,
	AMA_TIEU_DE varchar(50)
    )
begin
    insert into ANH_MON_AN(AMA_URL, MA_MAMON , AMA_TIEU_DE) values 
    (AMA_URL,concat(MA_MAMON), AMA_TIEU_DE);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `THEM_BINH_LUAN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `THEM_BINH_LUAN`(
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `THEM_CHI_TIET_DON_DAT_MON` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `THEM_CHI_TIET_DON_DAT_MON`(
	DDM_MADONN varchar(21),
    CTMA_MACTT varchar(20),
    CTD_SOLUONGG smallint
    )
begin
    insert into CHI_TIET_DON_DAT_MON (DDM_MADON, CTMA_MACT, CTD_SOLUONG)
    values (DDM_MADONN, CTMA_MACTT,CTD_SOLUONGG);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `THEM_CHI_TIET_DON_DAT_TIEC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `THEM_CHI_TIET_DON_DAT_TIEC`(
	DDT_MADONN varchar(21),
    CTMA_MACTT varchar(20)
    )
begin
    insert into CHI_TIET_DON_DAT_TIEC (DDT_MADON, CTMA_MACT)
    values (DDT_MADONN, CTMA_MACTT);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `THEM_CHI_TIET_MON_AN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `THEM_CHI_TIET_MON_AN`(
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `THEM_DANH_GIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `THEM_DANH_GIA`(
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `THEM_DIA_CHI` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `THEM_DIA_CHI`(
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `THEM_DON_DAT_MON` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `THEM_DON_DAT_MON`(
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `THEM_DON_DAT_TIEC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `THEM_DON_DAT_TIEC`(
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `THEM_KHACH_HANG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `THEM_KHACH_HANG`(
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `THEM_LOAI_MON_AN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `THEM_LOAI_MON_AN`(
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `THEM_MON_AN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `THEM_MON_AN`(
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `THEM_NHAN_VIEN_PHU_TRACH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `THEM_NHAN_VIEN_PHU_TRACH`(
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `THEM_TRA_LOI_BL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `THEM_TRA_LOI_BL`(
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TIM_BL_TLBL_THEO_MA_KH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TIM_BL_TLBL_THEO_MA_KH`(
	KH_MAKHH varchar(20)
    )
begin
	select * from binh_luan bl left join tra_loi_bl tl on bl.bl_mabl = tl.bl_mabl
    where KH_MAKH like CONCAT('%', KH_MAKHH , '%')	
    ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TIM_BL_TLBL_THEO_MA_MON_AN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TIM_BL_TLBL_THEO_MA_MON_AN`(
	MA_MAMONN varchar(10)
    )
begin
	select * from binh_luan bl left join tra_loi_bl tl on bl.bl_mabl = tl.bl_mabl
    where MA_MAMON like CONCAT('%', MA_MAMONN , '%')	
    ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TIM_DG_THEO_MA_KH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TIM_DG_THEO_MA_KH`(
	KH_MAKHH varchar(20)
    )
begin
	select * from danh_gia
    where KH_MAKH like CONCAT('%', KH_MAKHH , '%')	
    ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TIM_DG_THEO_MA_MON_AN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TIM_DG_THEO_MA_MON_AN`(
	MA_MAMONN varchar(10)
    )
begin
	select * from danh_gia
    where MA_MAMON like CONCAT('%', MA_MAMONN , '%')	
    ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TIM_DIA_CHI_THEO_MAKH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TIM_DIA_CHI_THEO_MAKH`(
	KH_MAKHH varchar(20)
    )
begin
	select * from DIA_CHI 
    where KH_MAKH like CONCAT('%', KH_MAKHH , '%')	
    ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TIM_DON_DAT_MON_THEO_MADON` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TIM_DON_DAT_MON_THEO_MADON`(
	DDM_MADONN varchar(21)
    )
begin
	select * from don_dat_mon ddm left join CHI_TIET_DON_DAT_MON ctd on ddm.ddm_madon = ctd.ddm_madon
    where ddm.DDM_MADON = DDM_MADONN;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TIM_DON_DAT_MON_THEO_MAKH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TIM_DON_DAT_MON_THEO_MAKH`(
    KH_MAKHH varchar(28)
    )
begin
	select * from don_dat_mon ddm left join CHI_TIET_DON_DAT_MON ctd on ddm.ddm_madon = ctd.ddm_madon
    where KH_MAKH = KH_MAKHH;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TIM_DON_DAT_TIEC_THEO_MADON` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TIM_DON_DAT_TIEC_THEO_MADON`(
	DDT_MADONN varchar(21)
    )
begin
	select * from don_dat_tiec ddt left join CHI_TIET_DON_DAT_tiec ctd on ddt.ddt_madon = ctd.ddt_madon
    where ddt.DDT_MADON = DDT_MADONN;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TIM_DON_DAT_TIEC_THEO_MAKH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TIM_DON_DAT_TIEC_THEO_MAKH`(
    KH_MAKHH varchar(28)
    )
begin
	select * from don_dat_tiec ddt left join CHI_TIET_DON_DAT_tiec ctd on ddt.ddt_madon = ctd.ddt_madon
    where KH_MAKH = KH_MAKHH;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TIM_GIO_THEO_KH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TIM_GIO_THEO_KH`(
	KH_MAKHH varchar(20)
    )
begin
	select * from CHI_TIET_GIO_MON_AN
    where KH_MAKH like CONCAT('%', KH_MAKHH , '%');
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TIM_HOA_DON_THEO_MAHD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TIM_HOA_DON_THEO_MAHD`(
	HD_MAHDD varchar(20)
    )
begin
	select * from HOA_DON 
    where HD_MAHD = HD_MAHDD;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TIM_KHACH_HANG_THEO_MAKH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TIM_KHACH_HANG_THEO_MAKH`(
	KH_MAKHH varchar(20)
    )
begin
	select * from KHACH_HANG 
    where KH_MAKH like CONCAT('%', KH_MAKHH , '%')	
    ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TIM_KHACH_HANG_THEO_SDT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TIM_KHACH_HANG_THEO_SDT`(
	KH_SDTT char(10)
    )
begin
	select * from KHACH_HANG 
    where KH_SDT like CONCAT('%', KH_SDTT , '%')	
    ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TIM_KHACH_HANG_THEO_TEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TIM_KHACH_HANG_THEO_TEN`(
	KH_TENKHH varchar(50)
    )
begin
	select * from KHACH_HANG
    where KH_TENKH like CONCAT('%', KH_TENKHH , '%')	
    ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TIM_LOAI_MON_AN_THEO_TU_KHOA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TIM_LOAI_MON_AN_THEO_TU_KHOA`(
	LMA_TENLOAII varchar(50)
    )
begin
	select * from LOAI_MON_AN  
    where LMA_TENLOAI like CONCAT('%', LMA_TENLOAII , '%')	order by  CAST(SUBSTRING(LMA_MALOAI, 4) AS UNSIGNED);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TIM_NHAN_VIEN_THEO_SDT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TIM_NHAN_VIEN_THEO_SDT`(
	NV_SDTT char(10)
    )
begin
	select * from NHAN_VIEN_PHU_TRACH 
    where NVPT_SDT like CONCAT('%', NV_SDTT , '%')	
    ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `XOA_ANH_MON_AN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `XOA_ANH_MON_AN`(
	AMA_URLL varchar(20)
    )
begin
	SET SQL_SAFE_UPDATES = 0;
	DELETE FROM ANH_MON_AN WHERE AMA_URL = AMA_URLL;
	SET SQL_SAFE_UPDATES = 1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `XOA_BINH_LUAN_THEO_MABL_MAKH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `XOA_BINH_LUAN_THEO_MABL_MAKH`(
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `XOA_CHI_TIET_MON_AN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `XOA_CHI_TIET_MON_AN`(
	CTMA_MACTT varchar(20)
    )
begin
	DELETE FROM CHI_TIET_MON_AN WHERE CTMA_MACT = CTMA_MACTT;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `XOA_DIA_CHI` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `XOA_DIA_CHI`(
   DC_MADCC varchar(20)
    )
begin
	delete from DIA_CHI where  DC_MADC = DC_MADCC;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `XOA_LOAI_MON_AN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `XOA_LOAI_MON_AN`(
	LMA_MALOAII varchar(50)
    )
begin
	DELETE FROM LOAI_MON_AN WHERE LMA_MALOAI = LMA_MALOAII;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `XOA_MON_AN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `XOA_MON_AN`(
	MA_MAMONN varchar(10)
    )
begin
	DELETE FROM MON_AN WHERE MA_MAMON = MA_MAMONN;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `XOA_TRA_LOI_BL_THEO_MABL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `XOA_TRA_LOI_BL_THEO_MABL`(
	BL_MABLL varchar(20)
    )
begin
	DELETE FROM TRA_LOI_BL WHERE BL_MABL = BL_MABLL;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `XOA_TRA_LOI_BL_THEO_MATLBL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `XOA_TRA_LOI_BL_THEO_MATLBL`(
	TLBL_MATLBLL varchar(24)
    )
begin
	DELETE FROM TRA_LOI_BL WHERE TLBL_MATLBL = TLBL_MATLBLL;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-06 14:34:27
