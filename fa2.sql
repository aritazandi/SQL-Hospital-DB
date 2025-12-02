-- Chief table
CREATE TABLE Chief (
    chief_id INT PRIMARY KEY,
    codemeli VARCHAR(10) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    tel VARCHAR(11)
);
-- Hospital table
CREATE TABLE Hospital (
    hos_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    chief_id INT
    FOREIGN KEY (chief_id) REFERENCES Chief(chief_id)
);

-- Laboratory table
CREATE TABLE Laboratory (
    lab_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    tel VARCHAR(11),
    hos_id INT,
    FOREIGN KEY (hos_id) REFERENCES Hospital(hos_id)
);

-- Pharmacy table
CREATE TABLE Pharmacy (
    pharmacy_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    tel VARCHAR(11),
    hos_id INT,
    FOREIGN KEY (hos_id) REFERENCES Hospital(hos_id)
);

-- Department table
CREATE TABLE Department (
    dep_id INT PRIMARY KEY,
    dep_name VARCHAR(100) NOT NULL,
    tel VARCHAR(11),
    hos_id INT,
    chief_id INT,
    FOREIGN KEY (hos_id) REFERENCES Hospital(hos_id),
    FOREIGN KEY (chief_id) REFERENCES Chief(chief_id)
);

-- Personnel table
CREATE TABLE Personnel (
    personnel_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    codemeli VARCHAR(10) UNIQUE NOT NULL,
    sen INT,
    ex VARCHAR(100),
    tel VARCHAR(11),
    tarikhtavalod Date,
    dep_id INT,
    hos_id INT,
    FOREIGN KEY (dep_id) REFERENCES Department(dep_id),
    FOREIGN KEY (hos_id) REFERENCES Hospital(hos_id)
);

-- Doctor table
CREATE TABLE Doctor (
    doc_id INT PRIMARY KEY,
    codemeli VARCHAR(10) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    sen INT,
    saatshift INT,
    tel VARCHAR(11),
    dep_id INT,
    hos_id INT,
    FOREIGN KEY (dep_id) REFERENCES Department(dep_id),
    FOREIGN KEY (hos_id) REFERENCES Hospital(hos_id)
);

-- Nurse table
CREATE TABLE Nurse (
    nurse_id INT PRIMARY KEY,
    codemeli VARCHAR(10) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    ex VARCHAR(100),
    sen INT,
    saatshift INT,
    tel VARCHAR(11),
    dep_id INT,
    hos_id INT,
    FOREIGN KEY (dep_id) REFERENCES Department(dep_id),
    FOREIGN KEY (hos_id) REFERENCES Hospital(hos_id)
);

-- Patient table
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    codemeli VARCHAR(10) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    ex VARCHAR(100),
    sen INT,
    tarikh_tavalod DATE,
    tel VARCHAR(11),
    hos_id INT,
    FOREIGN KEY (hos_id) REFERENCES Hospital(hos_id)
);

-- Care table
CREATE TABLE Care (
    patient_id INT,
    nurse_id INT,
    azta_key VARCHAR(100),
    PRIMARY KEY (patient_id, nurse_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (nurse_id) REFERENCES Nurse(nurse_id)
);

-- Medicine table
CREATE TABLE Medicine (
    daro_id INT PRIMARY KEY,
    geymat DECIMAL(10,2),
    tarikh_tolid DATE,
    tarikh_engheza DATE,
    pharmacy_id INT,
    doc_id INT,
    FOREIGN KEY (pharmacy_id) REFERENCES Pharmacy(pharmacy_id),
    FOREIGN KEY (doc_id) REFERENCES Doctor(doc_id)
);

-- UseBy table
CREATE TABLE UseBy (
    daro_id INT,
    patient_id INT,
    PRIMARY KEY (daro_id, patient_id),
    FOREIGN KEY (daro_id) REFERENCES Medicine(daro_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

-- Basdari table
CREATE TABLE Basdari (
    patient_id INT,
    dep_id INT,
    tedad_dafe_bastari INT,
    modat_bastari INT,
    PRIMARY KEY (patient_id, dep_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (dep_id) REFERENCES Department(dep_id)
);



-- Examples (by arita zandi)

--------------------------------------------------------------------------------
-- 1) Chief
--------------------------------------------------------------------------------
INSERT INTO Chief (chief_id, codemeli, name, tel)
VALUES
(1, '1111111111', 'Alireza', '09111111111'),
(2, '2222222222', 'Babak', '09222222222'),
(3, '3333333333', 'Narges', '09333333333'),
(4, '4444444444', 'Mahdi', '09444444444'),
(5, '5555555555', 'Zahra', '09555555555'),
(6, '6666666666', 'Kazem', '09666666666'),
(7, '7777777777', 'Fatemeh', '09777777777'),
(8, '8888888888', 'Soheila', '09888888888'),
(9, '9999999999', 'Amir', '09999999999'),
(10, '1010101010', 'Parvaneh', '09100000000');

--------------------------------------------------------------------------------
-- 2) Hospital
--------------------------------------------------------------------------------
INSERT INTO Hospital (hos_id, name, chief_id)
VALUES
(1, 'ShafaHospital', 1),
(2, 'RaziHospital', 2),
(3, 'ArameshHospital', 3),
(4, 'HedayatHospital', 4),
(5, 'MehrHospital', 5),
(6, 'MiladHospital', 6),
(7, 'PasteurHospital', 7),
(8, 'ParsHospital', 8),
(9, 'ImamHospital', 9),
(10, 'NoorHospital', 10);

--------------------------------------------------------------------------------
-- 3) Laboratory
--------------------------------------------------------------------------------
INSERT INTO Laboratory (lab_id, name, tel, hos_id)
VALUES
(1, 'LabShafa', '02111111111', 1),
(2, 'LabRazi', '02122222222', 2),
(3, 'LabAramesh', '02133333333', 3),
(4, 'LabHedayat', '02144444444', 4),
(5, 'LabMehr', '02155555555', 5),
(6, 'LabMilad', '02166666666', 6),
(7, 'LabPasteur', '02177777777', 7),
(8, 'LabPars', '02188888888', 8),
(9, 'LabImam', '02199999999', 9),
(10, 'LabNoor', '02100000000', 10);

--------------------------------------------------------------------------------
-- 4) Pharmacy
--------------------------------------------------------------------------------
INSERT INTO Pharmacy (pharmacy_id, name, tel, hos_id)
VALUES
(1, 'PharmacyShafa', '03111111111', 1),
(2, 'PharmacyRazi', '03122222222', 2),
(3, 'PharmacyAramesh', '03133333333', 3),
(4, 'PharmacyHedayat', '03144444444', 4),
(5, 'PharmacyMehr', '03155555555', 5),
(6, 'PharmacyMilad', '03166666666', 6),
(7, 'PharmacyPasteur', '03177777777', 7),
(8, 'PharmacyPars', '03188888888', 8),
(9, 'PharmacyImam', '03199999999', 9),
(10, 'PharmacyNoor', '03100000000', 10);

--------------------------------------------------------------------------------
-- 5) Department
--------------------------------------------------------------------------------
INSERT INTO Department (dep_id, dep_name, tel, hos_id, chief_id)
VALUES
(1, 'DepAzmayeshgah', '04111111111', 1, 1),
(2, 'DepEmergency', '04122222222', 2, 2),
(3, 'DepMadarVaKoodak', '04133333333', 3, 3),
(4, 'DepJarahi', '04144444444', 4, 4),
(5, 'DepAtfal', '04155555555', 5, 5),
(6, 'DepGhalb', '04166666666', 6, 6),
(7, 'DepMaghzVaAsab', '04177777777', 7, 7),
(8, 'DepPostEsterari', '04188888888', 8, 8),
(9, 'DepZanan', '04199999999', 9, 9),
(10, 'DepOrtopedi', '04100000000', 10, 10);

--------------------------------------------------------------------------------
-- 6) Personnel (first record name is "ahmad")
--------------------------------------------------------------------------------
INSERT INTO Personnel (personnel_id, name, codemeli, sen, ex, tel, tarikhtavalod, dep_id, hos_id)
VALUES
(1, 'ahmad', '2000000001', 35, 'tajrobe5sale', '05111111111', '1990-05-20', 1, 1),
(2, 'mohammad', '2000000002', 40, 'tajrobe10sale', '05122222222', '1985-07-10', 2, 2),
(3, 'soheil', '2000000003', 33, 'tajrobe3sale', '05133333333', '1992-09-12', 3, 3),
(4, 'zahra', '2000000004', 31, 'tajrobe2sale', '05144444444', '1994-12-01', 4, 4),
(5, 'fatemeh', '2000000005', 36, 'tajrobe6sale', '05155555555', '1989-03-15', 5, 5),
(6, 'amin', '2000000006', 34, 'tajrobe4sale', '05166666666', '1991-08-21', 6, 6),
(7, 'rezvan', '2000000007', 37, 'tajrobe7sale', '05177777777', '1988-11-11', 7, 7),
(8, 'majid', '2000000008', 38, 'tajrobe8sale', '05188888888', '1987-10-10', 8, 8),
(9, 'abolfazl', '2000000009', 45, 'tajrobe15sale', '05199999999', '1980-01-22', 9, 9),
(10, 'shima', '2000000010', 32, 'tajrobe3sale', '05100000000', '1993-04-04', 10, 10);

--------------------------------------------------------------------------------
-- 7) Doctor
--------------------------------------------------------------------------------
INSERT INTO Doctor (doc_id, codemeli, name, sen, saatshift, tel, dep_id, hos_id)
VALUES
(1, '3000000001', 'DrHossein', 45, 8, '06111111111', 1, 1),
(2, '3000000002', 'DrMaryam', 38, 12, '06122222222', 2, 2),
(3, '3000000003', 'DrJavad', 50, 10, '06133333333', 3, 3),
(4, '3000000004', 'DrMehdi', 42, 8, '06144444444', 4, 4),
(5, '3000000005', 'DrSimin', 37, 6, '06155555555', 5, 5),
(6, '3000000006', 'DrNima', 41, 9, '06166666666', 6, 6),
(7, '3000000007', 'DrSamira', 36, 12, '06177777777', 7, 7),
(8, '3000000008', 'DrNazanin', 39, 8, '06188888888', 8, 8),
(9, '3000000009', 'DrFarhad', 49, 10, '06199999999', 9, 9),
(10, '3000000010', 'DrReza', 44, 6, '06100000000', 10, 10);

--------------------------------------------------------------------------------
-- 8) Nurse
--------------------------------------------------------------------------------
INSERT INTO Nurse (nurse_id, codemeli, name, ex, sen, saatshift, tel, dep_id, hos_id)
VALUES
(1, '4000000001', 'NurseHoma', 'tajrobe5sale', 29, 8, '07111111111', 1, 1),
(2, '4000000002', 'NurseFariba', 'tajrobe7sale', 34, 10, '07122222222', 2, 2),
(3, '4000000003', 'NurseLeila', 'tajrobe4sale', 27, 8, '07133333333', 3, 3),
(4, '4000000004', 'NurseHassan', 'tajrobe3sale', 32, 12, '07144444444', 4, 4),
(5, '4000000005', 'NurseAtefeh', 'tajrobe2sale', 26, 8, '07155555555', 5, 5),
(6, '4000000006', 'NurseVahid', 'tajrobe6sale', 35, 10, '07166666666', 6, 6),
(7, '4000000007', 'NurseRozita', 'tajrobe9sale', 37, 12, '07177777777', 7, 7),
(8, '4000000008', 'NurseNasim', 'tajrobe3sale', 25, 8, '07188888888', 8, 8),
(9, '4000000009', 'NurseAmirreza', 'tajrobe5sale', 30, 10, '07199999999', 9, 9),
(10, '4000000010', 'NurseParisa', 'tajrobe4sale', 29, 8, '07100000000', 10, 10);

--------------------------------------------------------------------------------
-- 9) Patient
--------------------------------------------------------------------------------
INSERT INTO Patient (patient_id, codemeli, name, ex, sen, tarikh_tavalod, tel, hos_id)
VALUES
(1, '5000000001', 'Mojtaba', 'qalb', 45, '1980-01-01', '08111111111', 1),
(2, '5000000002', 'Shirin', 'ortopedi', 30, '1995-02-10', '08122222222', 2),
(3, '5000000003', 'Nima', 'zanan', 40, '1985-03-15', '08133333333', 3),
(4, '5000000004', 'Sara', 'maghz', 35, '1990-04-20', '08144444444', 4),
(5, '5000000005', 'Mahsa', 'asab', 33, '1992-05-25', '08155555555', 5),
(6, '5000000006', 'Farid', 'jarahi', 51, '1974-06-30', '08166666666', 6),
(7, '5000000007', 'Leili', 'orthopedic', 38, '1987-07-07', '08177777777', 7),
(8, '5000000008', 'Alireza', 'emergency', 34, '1991-08-08', '08188888888', 8),
(9, '5000000009', 'Asal', 'zahraane', 32, '1993-09-09', '08199999999', 9),
(10, '5000000010', 'Bahram', 'aramesh', 57, '1968-10-10', '08100000000', 10);

--------------------------------------------------------------------------------
-- 10) Care
--------------------------------------------------------------------------------
INSERT INTO Care (patient_id, nurse_id, azta_key)
VALUES
(1, 1, 'NegahdariFesharKhon'),
(2, 2, 'NegahdariZakhm'),
(3, 3, 'NegahdariGhalb'),
(4, 4, 'NegahdariBakhshJarahi'),
(5, 5, 'NegahdariZanan'),
(6, 6, 'NegahdariOrtopedi'),
(7, 7, 'NegahdariAtfal'),
(8, 8, 'NegahdariPostEm'),
(9, 9, 'NegahdariBastari'),
(10, 10, 'NegahdariKol');

--------------------------------------------------------------------------------
-- 11) Medicine
--------------------------------------------------------------------------------
INSERT INTO Medicine (daro_id, geymat, tarikh_tolid, tarikh_engheza, pharmacy_id, doc_id)
VALUES
(1, 15000.50, '2023-01-01', '2024-01-01', 1, 1),
(2, 12000.99, '2022-05-10', '2024-05-10', 2, 2),
(3, 7500.00, '2023-03-15', '2025-03-15', 3, 3),
(4, 5000.75, '2023-04-20', '2025-04-20', 4, 4),
(5, 22000.00, '2022-06-01', '2024-06-01', 5, 5),
(6, 18000.25, '2023-02-02', '2025-02-02', 6, 6),
(7, 3000.99, '2023-05-05', '2026-05-05', 7, 7),
(8, 4500.10, '2023-07-07', '2024-07-07', 8, 8),
(9, 9900.00, '2023-09-09', '2025-09-09', 9, 9),
(10, 15999.50, '2023-10-10', '2025-10-10', 10, 10);

--------------------------------------------------------------------------------
-- 12) UseBy
--------------------------------------------------------------------------------
INSERT INTO UseBy (daro_id, patient_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

--------------------------------------------------------------------------------
-- 13) Basdari
--------------------------------------------------------------------------------
INSERT INTO Basdari (patient_id, dep_id, tedad_dafe_bastari, modat_bastari)
VALUES
(1, 1, 2, 5),
(2, 2, 1, 3),
(3, 3, 3, 10),
(4, 4, 2, 7),
(5, 5, 1, 2),
(6, 6, 4, 15),
(7, 7, 2, 6),
(8, 8, 3, 9),
(9, 9, 1, 3),
(10, 10, 2, 8);
