create database Project;
use Project;


(Game _System_Database)
--Account_Table
CREATE TABLE Account (
    AcctName VARCHAR(50) PRIMARY KEY,
    Password VARCHAR(50),
    LastSignedOn DATETIME,
    SbscrbrName VARCHAR(100),  
    SbscrbrAddress VARCHAR(255),
    SbscrbrEmail VARCHAR(100),
    SbscrbrPhone VARCHAR(15),
    AcctCreatedOn DATETIME
);

--character_Table
CREATE TABLE GameCharacter (
    CharName VARCHAR(50) PRIMARY KEY,
    Level INT,
    ExpPoints INT,
    Type VARCHAR(50),
    LastPlayed DATETIME,
    CreatedOn DATETIME,
    MaxHitPoints INT,
    MaxMana INT,
    CurrHitPoints INT,
    CurrMana INT,
    AcctName VARCHAR(50),  -- Foreign key to Account
    FOREIGN KEY (AcctName) REFERENCES Account(AcctName)
);
--region_Table
CREATE TABLE Region (
    RegionName VARCHAR(50) PRIMARY KEY,
    Climate VARCHAR(50),
    Precipitation VARCHAR(50),
    Foliage VARCHAR(50)
);

--Creep_Table:
CREATE TABLE Creep (
    CreepName VARCHAR(50) PRIMARY KEY,
    HitPoints INT,
    Mana INT,
    Attack INT
);

--Item _Table
CREATE TABLE Item (
    ItemName VARCHAR(50) PRIMARY KEY,
    ItemType VARCHAR(50),
    ItemDamage INT
);

--ItemInstantiationTable(_WithforeignkeytoItem)
CREATE TABLE ItemInstantiation (
    IDNum INT PRIMARY KEY,
    Modifier VARCHAR(50),
    WhenCreated DATETIME,
    ItemName VARCHAR(50),  -- Foreign key to Item
    FOREIGN KEY (ItemName) REFERENCES Item(ItemName)
);

--CreepInstantiationTable:
CREATE TABLE CreepInstantiation (
    IDNum INT PRIMARY KEY
);





--(Hospital Management_System)
--PatientTable:
CREATE TABLE Patient (
    P_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    DOB DATE,
    MobNo VARCHAR(15),
    Age INT,
    Gender VARCHAR(10)
);

--DoctorTable
CREATE TABLE Doctor (
    MobNo VARCHAR(15) PRIMARY KEY,
    Name VARCHAR(100),
    State VARCHAR(50),
    City VARCHAR(50),
    PinNo VARCHAR(10),
    Dept VARCHAR(50)
);

--NurseTable:
CREATE TABLE Nurse (
    MobNo VARCHAR(15) PRIMARY KEY,
    Name VARCHAR(100),
    State VARCHAR(50),
    City VARCHAR(50),
    PinNo VARCHAR(10),
    Qualification VARCHAR(50)
);
--EmployeeTable
CREATE TABLE Employee (
    E_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    State VARCHAR(50),
    City VARCHAR(50),
    PinNo VARCHAR(10),
    Sex VARCHAR(10),
    Salary DECIMAL(10, 2)
);

--BillsTable(_Foreignkeyto Patient):
CREATE TABLE Bills (
    B_ID INT PRIMARY KEY,
    Amount DECIMAL(10, 2),
    P_ID INT,  -- Foreign key to Patient
    FOREIGN KEY (P_ID) REFERENCES Patient(P_ID)
);

--TestReportTable(_Foreignkeyto Patient):
CREATE TABLE TestReport (
    P_ID INT,  -- Foreign key to Patient
    Result VARCHAR(255),
    TestType VARCHAR(50),
    FOREIGN KEY (P_ID) REFERENCES Patient(P_ID)
);

--RoomsTable:
CREATE TABLE Rooms (
    R_ID INT PRIMARY KEY,
    Type VARCHAR(50),
    Capacity INT,
    Availability BOOLEAN
);

--RecordsTable:
CREATE TABLE Records (
    RecordNo INT PRIMARY KEY,
    AppNo VARCHAR(50)
);

--Patient-Doctor Relationship (Many_to_Manyjointable):
CREATE TABLE Patient_Doctor (
    P_ID INT,  -- Foreign key to Patient
    MobNo VARCHAR(15),  -- Foreign key to Doctor
    FOREIGN KEY (P_ID) REFERENCES Patient(P_ID),
    FOREIGN KEY (MobNo) REFERENCES Doctor(MobNo),
    PRIMARY KEY (P_ID, MobNo)
);




--Hotel Management_System ER Diagram
--Hoteltable
CREATE TABLE Hotel (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100)
);

--Roomstable
CREATE TABLE Room (
    R_ID INT PRIMARY KEY,
    H_ID INT,
    FOREIGN KEY (H_ID) REFERENCES Hotel(ID)
);
--Customer_table
CREATE TABLE Customer (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Mobile VARCHAR(15),
    Address VARCHAR(255)
);

--Payment_table
CREATE TABLE Payment (
    P_ID INT PRIMARY KEY,
    P_Method VARCHAR(50),
    Amount DECIMAL(10, 2)
);

--Reserve relationship(_between Rooms_and Customer)
CREATE TABLE Reserve (
    Room_ID INT,
    Customer_ID INT,
    FOREIGN KEY (Room_ID) REFERENCES Rooms(R_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(ID),
    PRIMARY KEY (Room_ID, Customer_ID)
);

--Pay relationship (_between Customer_and Payment)
CREATE TABLE Pay (
    Customer_ID INT,
    Payment_ID INT,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(ID),
    FOREIGN KEY (Payment_ID) REFERENCES Payment(P_ID),
    PRIMARY KEY (Customer_ID, Payment_ID)
);




Airline Reservation_System ER Diagram
--Flight_table
CREATE TABLE Flight (
    FlightID INT PRIMARY KEY,
    FlightNumber VARCHAR(50),
    DepartureDateTime DATETIME,
    ArrivalDateTime DATETIME,
    DestinationAirportCode VARCHAR(10),
    AvailableSeats INT
);

--Passenger_table
CREATE TABLE Passenger (
    PassengerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(100),
    PassportNumber VARCHAR(50)
);

--Booking_table
CREATE TABLE Booking (
    BookingID INT PRIMARY KEY,
    PassengerID INT,
    FlightID INT,
    FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID),
    FOREIGN KEY (FlightID) REFERENCES Flight(FlightID)
);

--Payment_table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    PaymentMethod VARCHAR(50),
    Amount DECIMAL(10, 2),
    TransactionDateTime DATETIME,
    PaymentStatus VARCHAR(20)
);

--Airport_table
CREATE TABLE Airport (
    AirportCode VARCHAR(10) PRIMARY KEY,
    AirportName VARCHAR(100),
    Location VARCHAR(100),
    Facilities VARCHAR(255)
);

--Airline_table
CREATE TABLE Airline (
    AirlineID INT PRIMARY KEY,
    AirlineName VARCHAR(100),
    ContactNumber VARCHAR(15),
    OperatingRegion VARCHAR(50)
);

--Relationship_between Booking_and Payment
CREATE TABLE BookingPayments (
    BookingID INT,
    PaymentID INT,
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID),
    FOREIGN KEY (PaymentID) REFERENCES Payments(PaymentID),
    PRIMARY KEY (BookingID, PaymentID)
);
--Relationship_between Airport_and Flight
CREATE TABLE FlightAirport (
    FlightID INT,
    AirportCode VARCHAR(10),
    FOREIGN KEY (FlightID) REFERENCES Flight(FlightID),
    FOREIGN KEY (AirportCode) REFERENCES Airport(AirportCode),
    PRIMARY KEY (FlightID, AirportCode)
);
