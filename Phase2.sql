-- 1. Tạo cơ sở dữ liệu BrightHub
CREATE DATABASE BrightHub CHAR SET utf8mb4;

USE BrightHub;

-- Tạo bảng User
CREATE TABLE User (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE NOT NULL,
    -- Lưu mật khẩu đã mã hóa bằng bcrypt
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    CreatedAt DATETIME,
    UpdateAT DATETIME
);

-- Tạo bảng home
CREATE TABLE Home (
    HomeID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    HomeName VARCHAR(100) NOT NULL,
    CreatedAt DATETIME,
    UpdateAT DATETIME,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Tạo bảng phòng
CREATE TABLE Room (
    RoomID INT AUTO_INCREMENT PRIMARY KEY,
    HomeID INT,
    RoomName VARCHAR(100) NOT NULL,
    CreatedAt DATETIME,
    UpdateAT DATETIME,
    FOREIGN KEY (HomeID) REFERENCES Home(HomeID)
);

-- Tạo bảng đèn
CREATE TABLE Light (
    LightID INT AUTO_INCREMENT PRIMARY KEY,
    RoomID INT,
    LightName VARCHAR(100) NOT NULL,
    Color VARCHAR(50),
    Brightness INT,
    Status ENUM('on', 'off') DEFAULT 'off',
    CreatedAt DATETIME,
    UpdateAT DATETIME,
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);

-- Tạo bảng lịch sử trạng thái đèn
CREATE TABLE LightHistory (
    HistoryID INT AUTO_INCREMENT PRIMARY KEY,
    LightID INT,
    Status ENUM('on', 'off') DEFAULT 'off',
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (LightID) REFERENCES Light(LightID)
);
