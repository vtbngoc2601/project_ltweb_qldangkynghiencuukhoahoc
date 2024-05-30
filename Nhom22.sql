-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema qlnckh
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema qlnckh
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `qlnckh` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `qlnckh` ;

-- -----------------------------------------------------
-- Table `qlnckh`.`khoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlnckh`.`khoa` (
  `MaKhoa` VARCHAR(8) CHARACTER SET 'utf8mb3' NOT NULL,
  `TenKhoa` VARCHAR(45) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `TrangthaiHienThi` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`MaKhoa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `qlnckh`.`hoidong`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlnckh`.`hoidong` (
  `MaHD` VARCHAR(8) CHARACTER SET 'utf8mb3' NOT NULL,
  `TrangthaiHienThi` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`MaHD`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `qlnckh`.`hoidongduyetdecuong`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlnckh`.`hoidongduyetdecuong` (
  `MaDDC` VARCHAR(8) CHARACTER SET 'utf8mb3' NOT NULL,
  `MaHD` VARCHAR(8) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `TenHD` VARCHAR(200) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `MaKhoa` VARCHAR(6) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `SoLuongTV` INT NULL DEFAULT NULL,
  `TrangthaiHienThi` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`MaDDC`),
  INDEX `FK_Khoa_idx` (`MaKhoa` ASC) VISIBLE,
  INDEX `FK_MaHD_idx` (`MaHD` ASC) VISIBLE,
  CONSTRAINT `FK_Khoa_DDC`
    FOREIGN KEY (`MaKhoa`)
    REFERENCES `qlnckh`.`khoa` (`MaKhoa`),
  CONSTRAINT `FK_MaHD_duyetDC`
    FOREIGN KEY (`MaHD`)
    REFERENCES `qlnckh`.`hoidong` (`MaHD`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `qlnckh`.`taikhoan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlnckh`.`taikhoan` (
  `MaTK` VARCHAR(8) CHARACTER SET 'utf8mb3' NOT NULL,
  `TenDangNhap` VARCHAR(45) CHARACTER SET 'utf8mb3' NOT NULL,
  `Email` VARCHAR(50) CHARACTER SET 'utf8mb3' NOT NULL,
  `Password` VARCHAR(45) CHARACTER SET 'utf8mb3' NOT NULL,
  `HoTen` VARCHAR(45) CHARACTER SET 'utf8mb3' NOT NULL,
  `TenLoaiTK` VARCHAR(45) CHARACTER SET 'utf8mb3' NOT NULL,
  `TrangthaiHienThi` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`MaTK`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `qlnckh`.`giangvien`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlnckh`.`giangvien` (
  `MSGV` VARCHAR(8) CHARACTER SET 'utf8mb3' NOT NULL,
  `TenGV` VARCHAR(50) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `MaKhoa` VARCHAR(8) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `MaTK` VARCHAR(8) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `NgaySinh` DATETIME NULL DEFAULT NULL,
  `CCCD` INT NULL DEFAULT NULL,
  `MaHD` VARCHAR(8) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `TrangthaiHienThi` TINYINT(1) NULL DEFAULT NULL,
  `GioiTinh` VARCHAR(5) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `Sdt` VARCHAR(12) NULL DEFAULT NULL,
  PRIMARY KEY (`MSGV`),
  INDEX `FK_Khoa_idx` (`MaKhoa` ASC) VISIBLE,
  INDEX `FK_TaiKhoan_idx` (`MaTK` ASC) VISIBLE,
  INDEX `FK_MaHD_idx` (`MaHD` ASC) VISIBLE,
  CONSTRAINT `FK_Khoa_new`
    FOREIGN KEY (`MaKhoa`)
    REFERENCES `qlnckh`.`khoa` (`MaKhoa`),
  CONSTRAINT `FK_MaHD_hoidong`
    FOREIGN KEY (`MaHD`)
    REFERENCES `qlnckh`.`hoidong` (`MaHD`),
  CONSTRAINT `FK_TaiKhoan_new`
    FOREIGN KEY (`MaTK`)
    REFERENCES `qlnckh`.`taikhoan` (`MaTK`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `qlnckh`.`phienthoigian`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlnckh`.`phienthoigian` (
  `MaPhienTG` VARCHAR(8) NOT NULL,
  `NgayBatDau_DK` DATETIME NULL DEFAULT NULL,
  `NgayKetThuc_DK` DATETIME NULL DEFAULT NULL,
  `NgayBatDau_XD` DATETIME NULL DEFAULT NULL,
  `NgayKetThuc_XD` DATETIME NULL DEFAULT NULL,
  `NgayBatDau_NT` DATETIME NULL DEFAULT NULL,
  `NgayKetThuc_NT` DATETIME NULL DEFAULT NULL,
  `TrangthaiHienThi` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`MaPhienTG`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `qlnckh`.`trangthai`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlnckh`.`trangthai` (
  `MaTrangThai` VARCHAR(8) CHARACTER SET 'utf8mb3' NOT NULL,
  `TenTrangThai` VARCHAR(45) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `TrangthaiHienThi` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`MaTrangThai`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `qlnckh`.`detai`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlnckh`.`detai` (
  `MaDT` VARCHAR(8) CHARACTER SET 'utf8mb3' NOT NULL,
  `TenDeTai` LONGTEXT NULL DEFAULT NULL,
  `GhiChu` LONGTEXT NULL DEFAULT NULL,
  `MaNganh` VARCHAR(8) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `NgayThucHien` DATETIME NULL DEFAULT NULL,
  `NgayKetThuc` DATETIME NULL DEFAULT NULL,
  `KetQua` VARCHAR(255) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `LinkDeTai` LONGTEXT NULL DEFAULT NULL,
  `MaTrangThai` VARCHAR(8) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `MSGV` VARCHAR(8) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `MaHD` VARCHAR(8) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `TrangthaiHienThi` TINYINT(1) NULL DEFAULT NULL,
  `MaPhienTG` VARCHAR(8) NULL DEFAULT NULL,
  PRIMARY KEY (`MaDT`),
  INDEX `FK_TrangThaiDeTai_idx` (`MaTrangThai` ASC) VISIBLE,
  INDEX `FK_GiangVien_idx` (`MSGV` ASC) INVISIBLE,
  INDEX `FK_Phienthoigian` (`MaPhienTG` ASC) VISIBLE,
  CONSTRAINT `FK_GiangVien`
    FOREIGN KEY (`MSGV`)
    REFERENCES `qlnckh`.`giangvien` (`MSGV`),
  CONSTRAINT `FK_Phienthoigian`
    FOREIGN KEY (`MaPhienTG`)
    REFERENCES `qlnckh`.`phienthoigian` (`MaPhienTG`),
  CONSTRAINT `FK_TrangThaiDeTai`
    FOREIGN KEY (`MaTrangThai`)
    REFERENCES `qlnckh`.`trangthai` (`MaTrangThai`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `qlnckh`.`nhom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlnckh`.`nhom` (
  `MaNhom` VARCHAR(8) CHARACTER SET 'utf8mb3' NOT NULL,
  `TrangthaiHienThi` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`MaNhom`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `qlnckh`.`dangky`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlnckh`.`dangky` (
  `MaDK` VARCHAR(8) CHARACTER SET 'utf8mb3' NOT NULL,
  `MaDT` VARCHAR(8) CHARACTER SET 'utf8mb3' NOT NULL,
  `MaNhom` VARCHAR(8) CHARACTER SET 'utf8mb3' NOT NULL,
  `GhiChu` LONGTEXT NOT NULL,
  `MaHD` VARCHAR(8) CHARACTER SET 'utf8mb3' NOT NULL,
  `LinkDeCuong` VARCHAR(150) CHARACTER SET 'utf8mb3' NOT NULL,
  `TrangThai` VARCHAR(45) CHARACTER SET 'utf8mb3' NOT NULL,
  `MSGV` VARCHAR(8) CHARACTER SET 'utf8mb3' NOT NULL,
  `NgayDangKy` DATETIME NULL DEFAULT NULL,
  `TrangthaiHienThi` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`MaDK`),
  INDEX `FK_DeTai_idx` (`MaDT` ASC) VISIBLE,
  INDEX `FK_GVHuongDan_idx` (`MSGV` ASC) VISIBLE,
  INDEX `FK_Nhom_idx` (`MaNhom` ASC) VISIBLE,
  CONSTRAINT `FK_DeTai`
    FOREIGN KEY (`MaDT`)
    REFERENCES `qlnckh`.`detai` (`MaDT`),
  CONSTRAINT `FK_GVHuongDan`
    FOREIGN KEY (`MSGV`)
    REFERENCES `qlnckh`.`giangvien` (`MSGV`),
  CONSTRAINT `FK_Nhom`
    FOREIGN KEY (`MaNhom`)
    REFERENCES `qlnckh`.`nhom` (`MaNhom`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `qlnckh`.`bienbanchamdecuong`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlnckh`.`bienbanchamdecuong` (
  `MaChamDC` VARCHAR(8) CHARACTER SET 'utf8mb3' NOT NULL,
  `MaDDC` VARCHAR(8) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `MaDK` VARCHAR(8) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `XetDuyet` VARCHAR(255) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `LinkBB` VARCHAR(255) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `TrangthaiHienThi` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`MaChamDC`),
  INDEX `FK_HoiDongDDC_idx` (`MaDDC` ASC) VISIBLE,
  INDEX `FK_MaDK_idx` (`MaDK` ASC) VISIBLE,
  CONSTRAINT `FK_HoiDongDDC`
    FOREIGN KEY (`MaDDC`)
    REFERENCES `qlnckh`.`hoidongduyetdecuong` (`MaDDC`),
  CONSTRAINT `FK_MaDK`
    FOREIGN KEY (`MaDK`)
    REFERENCES `qlnckh`.`dangky` (`MaDK`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `qlnckh`.`hoidongnghiemthu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlnckh`.`hoidongnghiemthu` (
  `MaHDNT` VARCHAR(8) CHARACTER SET 'utf8mb3' NOT NULL,
  `MaHD` VARCHAR(8) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `ChuTichHD` VARCHAR(45) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `PhanBien1` VARCHAR(45) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `PhanBien2` VARCHAR(45) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `NgayNT` DATETIME NULL DEFAULT NULL,
  `MaKhoa` VARCHAR(8) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `TrangthaiHienThi` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`MaHDNT`),
  INDEX `FK_MaHD_idx` (`MaHD` ASC) VISIBLE,
  CONSTRAINT `FK_MaHD_nghiemthu`
    FOREIGN KEY (`MaHD`)
    REFERENCES `qlnckh`.`hoidong` (`MaHD`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `qlnckh`.`bienbannghiemthu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlnckh`.`bienbannghiemthu` (
  `MaChamNT` VARCHAR(8) NOT NULL,
  `MaHDNT` VARCHAR(8) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `MaDT` VARCHAR(8) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `Diem` INT NULL DEFAULT NULL,
  `NhanXet` MEDIUMTEXT NULL DEFAULT NULL,
  `LinkBB` LONGTEXT NULL DEFAULT NULL,
  `TrangthaiHienThi` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`MaChamNT`),
  INDEX `FK_HDNT_idx` (`MaHDNT` ASC) VISIBLE,
  INDEX `FK_DeTaiNT_idx` (`MaDT` ASC) VISIBLE,
  CONSTRAINT `FK_DeTaiNT`
    FOREIGN KEY (`MaDT`)
    REFERENCES `qlnckh`.`detai` (`MaDT`),
  CONSTRAINT `FK_HDNT`
    FOREIGN KEY (`MaHDNT`)
    REFERENCES `qlnckh`.`hoidongnghiemthu` (`MaHDNT`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `qlnckh`.`chitietyeucauhuydetai`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlnckh`.`chitietyeucauhuydetai` (
  `MaHuyDT` VARCHAR(8) CHARACTER SET 'utf8mb3' NOT NULL,
  `MaDT` VARCHAR(8) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `NgayYeuCau` DATETIME NULL DEFAULT NULL,
  `LyDo` LONGTEXT NULL DEFAULT NULL,
  `TrangthaiHienThi` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`MaHuyDT`),
  INDEX `FK_YCHuyDeTai_idx` (`MaDT` ASC) VISIBLE,
  CONSTRAINT `FK_YCHuyDeTai`
    FOREIGN KEY (`MaDT`)
    REFERENCES `qlnckh`.`detai` (`MaDT`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `qlnckh`.`nganh`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlnckh`.`nganh` (
  `MaNganh` VARCHAR(8) CHARACTER SET 'utf8mb3' NOT NULL,
  `MaKhoa` VARCHAR(8) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `TenNganh` VARCHAR(45) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `TrangthaiHienThi` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`MaNganh`),
  INDEX `FK_MaKhoa_idx` (`MaKhoa` ASC) VISIBLE,
  CONSTRAINT `FK_MaKhoa`
    FOREIGN KEY (`MaKhoa`)
    REFERENCES `qlnckh`.`khoa` (`MaKhoa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `qlnckh`.`quanlyhoidong`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlnckh`.`quanlyhoidong` (
  `MaNQL` VARCHAR(8) CHARACTER SET 'utf8mb3' NOT NULL,
  `HoTen` VARCHAR(45) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `NgaySinh` DATETIME NULL DEFAULT NULL,
  `MSGV` VARCHAR(8) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `MaTK` VARCHAR(8) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `TrangthaiHienThi` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`MaNQL`),
  INDEX `FK_MSGV_idx` (`MSGV` ASC) VISIBLE,
  INDEX `FK_MaTK_idx` (`MaTK` ASC) VISIBLE,
  CONSTRAINT `FK_MaTK`
    FOREIGN KEY (`MaTK`)
    REFERENCES `qlnckh`.`taikhoan` (`MaTK`),
  CONSTRAINT `FK_MSGV`
    FOREIGN KEY (`MSGV`)
    REFERENCES `qlnckh`.`giangvien` (`MSGV`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `qlnckh`.`sinhvien`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlnckh`.`sinhvien` (
  `MSSV` VARCHAR(8) CHARACTER SET 'utf8mb3' NOT NULL,
  `HoTen` VARCHAR(45) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `MaKhoa` VARCHAR(8) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `NgaySinh` DATETIME NULL DEFAULT NULL,
  `CCCD` INT NULL DEFAULT NULL,
  `STK` INT NULL DEFAULT NULL,
  `SDT` INT NULL DEFAULT NULL,
  `NienKhoa` VARCHAR(45) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `GioiTinh` VARCHAR(45) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `MaTK` VARCHAR(8) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `MaNhom` VARCHAR(8) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `TrangthaiHienThi` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`MSSV`),
  INDEX `FK_Khoa_idx` (`MaKhoa` ASC) VISIBLE,
  INDEX `FK_TaiKhoan_idx` (`MaTK` ASC) VISIBLE,
  INDEX `FK_MaNhom_idx` (`MaNhom` ASC) VISIBLE,
  CONSTRAINT `FK_Khoa`
    FOREIGN KEY (`MaKhoa`)
    REFERENCES `qlnckh`.`khoa` (`MaKhoa`),
  CONSTRAINT `FK_MaNhom`
    FOREIGN KEY (`MaNhom`)
    REFERENCES `qlnckh`.`nhom` (`MaNhom`),
  CONSTRAINT `FK_TaiKhoan`
    FOREIGN KEY (`MaTK`)
    REFERENCES `qlnckh`.`taikhoan` (`MaTK`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `qlnckh`.`thongbao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlnckh`.`thongbao` (
  `MaTB` VARCHAR(8) CHARACTER SET 'utf8mb3' NOT NULL,
  `TenThongBao` LONGTEXT NOT NULL,
  `NoiDungTB` LONGTEXT CHARACTER SET 'utf8mb3' NOT NULL,
  `NgayGui` DATETIME NOT NULL,
  `MaSoQL` VARCHAR(8) CHARACTER SET 'utf8mb3' NOT NULL,
  `MaTK` VARCHAR(8) CHARACTER SET 'utf8mb3' NOT NULL,
  `TrangthaiHienThi` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`MaTB`),
  INDEX `FK_NhanThongBao_idx` (`MaTK` ASC) VISIBLE,
  CONSTRAINT `FK_NhanThongBao`
    FOREIGN KEY (`MaTK`)
    REFERENCES `qlnckh`.`taikhoan` (`MaTK`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
