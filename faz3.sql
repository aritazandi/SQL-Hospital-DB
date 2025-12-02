--------------------------------------------------------------------------------
-- soal1
--------------------------------------------------------------------------------
-- Fix: Table name is "Personnel", column is "name"
UPDATE Personnel
SET name = 'ali'
WHERE name = 'ahmad'
  AND personnel_id = 1;


----------------------------------------------------------------
----------------
SELECT 
    f.name AS ForeignKeyName
FROM 
    sys.foreign_keys AS f
WHERE 
    OBJECT_NAME(f.parent_object_id) = 'Personnel';

--نشون میده فقط از این فارینگ کی میتونیم استفاده کنیم
-- soal2

ALTER TABLE Personnel
DROP CONSTRAINT FK_Personel_Departeman;  -- نام فعلی محدودیت
GO
--------------------------------------
ALTER TABLE Personnel
ADD CONSTRAINT FK_Personel_Departeman  -- نام جدید محدودیت
FOREIGN KEY (dep_id)
REFERENCES Department(dep_id)
ON UPDATE CASCADE
ON DELETE CASCADE;
GO

-- b:
UPDATE T2
SET ID = [new_value]
WHERE ID = [old_value];

-- c: changing the foreign key to NO ACTION
ALTER TABLE Personnel
DROP CONSTRAINT FK_Personel_Departeman; -- نام فعلی محدودیت
GO
-----------------------------------------
ALTER TABLE Personnel
ADD CONSTRAINT FK_Personel_Departeman  -- نام جدید محدودیت
FOREIGN KEY (dep_id) 
REFERENCES Department(dep_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
GO


--------------------------------------------------------------------------------
-- soal3
--------------------------------------------------------------------------------
-- Example: preventing "sen" (age) from being decreased in Patient table
CREATE TRIGGER PAT_AGE_TRIG
ON Patient
FOR UPDATE
AS
BEGIN
    -- Only check if "sen" was updated:
    IF UPDATE(sen)
    BEGIN
        IF EXISTS(
            SELECT 1
            FROM inserted i
            JOIN deleted d ON i.patient_id = d.patient_id
            WHERE i.sen < d.sen
        )
        BEGIN
            RAISERROR('Patient age cannot be decreased', 16, 1);
            ROLLBACK TRANSACTION;
        END
    END
END;
GO

-- Example: check phone number length on insert for Personnel
CREATE TRIGGER CHECK_PERSONNEL_PHONE
ON Personnel
FOR INSERT
AS
BEGIN
    IF EXISTS(
        SELECT 1
        FROM inserted
        WHERE tel IS NULL OR LEN(tel) <> 11
    )
    BEGIN
        RAISERROR('Phone number must be exactly 11 digits', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO


--------------------------------------------------------------------------------
-- soal4
--------------------------------------------------------------------------------
-- Create View for Personnel showing a computed age
CREATE VIEW v1 AS
SELECT
    personnel_id,
    name,
    codemeli,
    sen AS original_age,
    tarikhtavalod AS date_of_birth,
    DATEDIFF(YEAR, tarikhtavalod, GETDATE()) AS calculated_age,
    tel,
    dep_id,
    hos_id,
    ex
FROM Personnel;
GO

------



--------------------------------------------------------------------------------
-- سوالات بخش "بیمارستان"

-- 1)
--------------------------------------------------------------------------------
SELECT 
    p.patient_id,
    p.name,
    COUNT(b.patient_id) AS hospitalization_count,
    SUM(b.modat_bastari) AS total_hours,
    CASE 
        WHEN SUM(b.modat_bastari) > 168 THEN 'A'  -- More than 168 hours (7 days)
        WHEN SUM(b.modat_bastari) > 72  THEN 'B'  -- More than 72 hours (3 days)
        ELSE 'C'
    END AS rating
FROM Patient p
LEFT JOIN Basdari b 
    ON p.patient_id = b.patient_id
GROUP BY 
    p.patient_id, 
    p.name;


--------------------------------------------------------------------------------
-- 2)
--------------------------------------------------------------------------------
SELECT 
    d.dep_id,
    d.dep_name,
    COUNT(b.patient_id) AS total_patients,
    COUNT(n.nurse_id) AS total_nurses,
    AVG(n.saatshift)  AS avg_nurse_shift_hours,
    COUNT(doc.doc_id) AS total_doctors,
    AVG(doc.saatshift) AS avg_doctor_shift_hours
FROM Department d
    LEFT JOIN Basdari b ON b.dep_id = d.dep_id
    LEFT JOIN Nurse   n ON n.dep_id = d.dep_id
    LEFT JOIN Doctor doc ON doc.dep_id = d.dep_id
GROUP BY 
    d.dep_id,
    d.dep_name
ORDER BY 
    d.dep_id;


--------------------------------------------------------------------------------
-- 3)
--------------------------------------------------------------------------------
SELECT
    m.daro_id,
    m.geymat,
    COUNT(u.patient_id) AS total_consumers,
    -- If you want distinct doctors: COUNT(DISTINCT m.doc_id)
    COUNT(m.doc_id) AS total_prescribing_doctors
FROM Medicine m
LEFT JOIN UseBy u 
    ON u.daro_id = m.daro_id
GROUP BY
    m.daro_id,
    m.geymat,
    m.doc_id
ORDER BY
    total_consumers DESC;


--------------------------------------------------------------------------------
-- 4)
--------------------------------------------------------------------------------
ALTER TABLE Department
ADD PLess BIT 
    CONSTRAINT DF_Department_PLess
    DEFAULT (0);
GO

UPDATE Department
SET PLess = 1
WHERE dep_id IN (
    SELECT d.dep_id
    FROM Department d
    LEFT JOIN Basdari b ON b.dep_id = d.dep_id
    LEFT JOIN Nurse   n ON n.dep_id = d.dep_id
    GROUP BY d.dep_id
    HAVING 
       COUNT(n.nurse_id) < (COUNT(b.patient_id) / 3)
       OR AVG(n.saatshift) > 8
);
GO
