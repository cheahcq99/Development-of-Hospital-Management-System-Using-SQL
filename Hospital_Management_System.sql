-- Group Assignment (Hospital Management System)

DROP TABLE department CASCADE CONSTRAINTS;
DROP TABLE employee CASCADE CONSTRAINTS;
DROP TABLE nurse CASCADE CONSTRAINTS;
DROP TABLE doctor CASCADE CONSTRAINTS;
DROP TABLE billing_info CASCADE CONSTRAINTS; 
DROP TABLE Patient CASCADE CONSTRAINTS; 
DROP TABLE appointment CASCADE CONSTRAINTS; 
DROP TABLE Ward CASCADE CONSTRAINTS; 
DROP TABLE bed CASCADE CONSTRAINTS; 
DROP TABLE CheckInOut CASCADE CONSTRAINTS; 
DROP TABLE facilities CASCADE CONSTRAINTS; 
DROP TABLE services CASCADE CONSTRAINTS; 
DROP TABLE service_info CASCADE CONSTRAINTS; 
DROP TABLE treatment_record CASCADE CONSTRAINTS; 
DROP TABLE appoint_info CASCADE CONSTRAINTS; 

-- Creating table and declaring variable 
-- department table 
CREATE TABLE department
(dept_ID NUMBER(3),
dept_name VARCHAR2(25),
dept_desc VARCHAR2(250),
CONSTRAINT department_dept_ID_pk PRIMARY KEY (dept_ID));

--employee table
CREATE TABLE employee
(emp_ID VARCHAR2(4),
emp_first VARCHAR2(15),
emp_last VARCHAR2(30),
emp_email VARCHAR2(35),
contact_num NUMBER(13),
status VARCHAR2(15),
dept_ID NUMBER(3),
CONSTRAINT employee_emp_ID_pk PRIMARY KEY (emp_ID),
CONSTRAINT employee_dept_ID_fk FOREIGN KEY (dept_ID) REFERENCES department(dept_ID)
);

-- nurse table
CREATE TABLE nurse
(nurse_ID VARCHAR2(4),
emp_ID VARCHAR2(4),
CONSTRAINT nurse_nurse_ID_pk PRIMARY KEY (nurse_ID),
CONSTRAINT nurse_emp_ID_fk FOREIGN KEY (emp_ID) REFERENCES employee(emp_ID)
);

--doctor table
CREATE TABLE doctor
(doc_ID VARCHAR2(4),
emp_ID VARCHAR2(4),
CONSTRAINT doctor_doc_ID_pk PRIMARY KEY (doc_ID),
CONSTRAINT doctor_emp_ID_fk FOREIGN KEY (emp_ID) REFERENCES employee(emp_ID)
);

--billing_info table
CREATE TABLE billing_info
(
 bill_ID VARCHAR2(4),
 bill_Date VARCHAR2(10),
 issued_emp_id VARCHAR2(6),
 payment_Type VARCHAR2(30),
 payment_Amount VARCHAR2(30),
 CONSTRAINT billing_info_bill_ID_pk PRIMARY KEY (bill_ID),
 CONSTRAINT billing_info_issued_emp_id_fk FOREIGN KEY (issued_emp_id) REFERENCES nurse(nurse_ID)
);

--patient table
CREATE TABLE Patient
(patient_ID VARCHAR2(10), 
Patient_name VARCHAR2(50), 
Patient_Info VARCHAR2(30), 
Patient_contact VARCHAR2(13), 
Patient_gender VARCHAR2(8), 
Patient_addr_houseNo VARCHAR2(50),
adder_street VARCHAR2(30),
adder_city VARCHAR2(30),
adder_state VARCHAR2(30),
Patient_status VARCHAR2(30),
CONSTRAINT Patient_patient_ID_pk PRIMARY KEY (patient_ID)
);

--appointment table
CREATE TABLE appointment
(
appt_ID VARCHAR2(4),
patient_ID VARCHAR2(12),
appt_date VARCHAR2(25),
appt_time VARCHAR2(25),
CONSTRAINT appointment_appt_ID_pk PRIMARY KEY (appt_ID),
CONSTRAINT appointment_patient_ID_fk FOREIGN KEY (patient_ID) REFERENCES patient(patient_ID)  
);

--ward table
CREATE TABLE Ward
(Ward_ID VARCHAR2(4),
Ward_type VARCHAR2(30),
CONSTRAINT Ward_Ward_ID_pk PRIMARY KEY (Ward_ID)
);

--bed table
CREATE TABLE Bed
(
Bed_ID VARCHAR2(5),
Bed_name VARCHAR2(50),
Ward_ID VARCHAR2(4),
CONSTRAINT Bed_Bed_ID_pk PRIMARY KEY (Bed_ID),
CONSTRAINT Bed_Ward_ID_fk FOREIGN KEY (Ward_ID) 
REFERENCES Ward(Ward_ID)
);

--checkinout table
CREATE TABLE CheckInOut
(Check_ID VARCHAR2(30),         
Bed_ID VARCHAR2(30),
startDate DATE,
endDate DATE,
startTime TIMESTAMP,
endTime TIMESTAMP,
CONSTRAINT CheckInOut_Check_ID_pk PRIMARY KEY (Check_ID),
CONSTRAINT CheckInOut_Bed_ID_fk FOREIGN KEY (Bed_ID) REFERENCES Bed(Bed_ID)
);

--facilities table
CREATE TABLE Facilities
(
Fac_ID VARCHAR2(4),
Fac_name VARCHAR2(50),
Fac_use VARCHAR2(200),
CONSTRAINT Facilities_Fac_ID_pk PRIMARY KEY (Fac_ID)
);

--services table
CREATE TABLE Services
(
Services_ID VARCHAR2(4),
Services_name VARCHAR2(50),
Services_desc VARCHAR2(250),
CONSTRAINT Services_Services_ID_pk PRIMARY KEY (Services_ID)
);

--treatment_record table
CREATE TABLE treatment_record
(
treat_ID VARCHAR2(4),
Check_ID VARCHAR2(30),
nurse_ID VARCHAR2(4),
CONSTRAINT treatment_record_treat_ID_pk PRIMARY KEY (treat_ID),
CONSTRAINT treatment_record_Check_ID_fk FOREIGN KEY (Check_ID) REFERENCES CheckInOut(Check_ID),
CONSTRAINT treatment_record_nurse_ID_fk FOREIGN KEY (nurse_ID) REFERENCES nurse(nurse_ID)
);

--services_info table
CREATE TABLE Service_Info
(
Serviceinfo_ID VARCHAR2(5),
Services_ID VARCHAR2(4),
treat_ID VARCHAR2(4),
Service_date DATE,
Fac_ID VARCHAR2(4),
CONSTRAINT Service_info_Serviceinfo_ID_pk PRIMARY KEY (Serviceinfo_ID),
CONSTRAINT Service_Info_Fac_ID_fk FOREIGN KEY (Fac_ID) 
REFERENCES Facilities(Fac_ID),
CONSTRAINT Service_Info_Services_ID_fk FOREIGN KEY (Services_ID) 
REFERENCES Services(Services_ID),
CONSTRAINT Service_Info_treat_ID_fk FOREIGN KEY (treat_ID) 
REFERENCES treatment_record(treat_ID)
);
 
--appoint_info table
CREATE TABLE appoint_info 
(
apptInfo_ID VARCHAR2(5),
bill_ID VARCHAR2(4),
treat_ID VARCHAR2(4),
appt_ID VARCHAR2(4),
CONSTRAINT appoint_info_apptInfo_ID_pk PRIMARY KEY (apptInfo_ID),
CONSTRAINT appoint_info_bill_ID_fk FOREIGN KEY (bill_ID) REFERENCES billing_info (bill_ID),
CONSTRAINT appoint_info_treat_ID_fk FOREIGN KEY (treat_ID) REFERENCES treatment_record(treat_ID) 
);


--inserting department data
INSERT INTO DEPARTMENT (DEPT_ID, DEPT_NAME, DEPT_DESC) 
VALUES (1, 'oncology', 'The Oncology department provides treatments, including radiotherapy and chemotherapy, for cancerous tumors and blood disorders.');
INSERT INTO DEPARTMENT (DEPT_ID, DEPT_NAME, DEPT_DESC) 
VALUES (2, 'neurosurgical', 'A medical specialty dealing with disorders of the nervous system including their coverings, blood vessels, and all effector tissue. Includes the brain, spinal cord, and spinal cord injuries (SCI).');
INSERT INTO DEPARTMENT (DEPT_ID, DEPT_NAME, DEPT_DESC) 
VALUES (3, 'cardiac cartelization', 'Provides medical care to patients who have problems with their heart or circulation.');
INSERT INTO DEPARTMENT (DEPT_ID, DEPT_NAME, DEPT_DESC) 
VALUES (4, 'admission', 'At the Admitting Department, the patient will be required to provide personal information and sign consent forms before being taken to the hospital unit or ward. ');
INSERT INTO DEPARTMENT (DEPT_ID, DEPT_NAME, DEPT_DESC) 
VALUES (5, 'finance department', 'Performs all works related to budget and ideal use of the items of such budget. Also, it prepares payrolls and monthly wages, and concludes contracts of operation and maintenance and purchases. ');
INSERT INTO DEPARTMENT (DEPT_ID, DEPT_NAME, DEPT_DESC) 
VALUES (6, 'Gastroenterology', 'This department investigates and treats digestive and upper and lower gastrointestinal diseases.');
INSERT INTO DEPARTMENT (DEPT_ID, DEPT_NAME, DEPT_DESC) 
VALUES (7, 'Haematology', 'These hospital services work with the laboratory. In addition doctors treat blood diseases and malignancies related to the blood.');
INSERT INTO DEPARTMENT (DEPT_ID, DEPT_NAME, DEPT_DESC) 
VALUES (8, 'Intensive Care Unit (ICU)', 'A special department of a hospital that provides intensive treatment medicine and caters to patients with severe and life-threatening illnesses and injuries, which require constant, close monitoring and support from specialist.');
INSERT INTO DEPARTMENT (DEPT_ID, DEPT_NAME, DEPT_DESC) 
VALUES (9, 'Orthopaedics', 'Treats conditions related to the musculoskeletal system, including joints, ligaments, bones, muscles, tendons and nerves.');
INSERT INTO DEPARTMENT (DEPT_ID, DEPT_NAME, DEPT_DESC) 
VALUES (10, 'Urology', 'The urology department is run by consultant urology surgeons and investigates areas linked to kidney and bladder conditions.');

--inserting employee table data
INSERT INTO employee VALUES ('e001', 'Alexander', 'David', 'david_alex@gmail.com', TO_NUMBER('0186789922','0999999999'), 'On duty', 1);
INSERT INTO employee VALUES ('e002', 'Russell', 'Houle' , 'Russellhoule89@yahoo.com' , TO_NUMBER('0172278562', '0999999999'), 'On duty', 5);
INSERT INTO employee VALUES ('e003', 'Moira', 'Mallin', 'Moira_Mallin@gmail.com', TO_NUMBER('0125263596', '0999999999'), 'On duty', 2);
INSERT INTO employee VALUES ('e004', 'Ross', 'Norris', 'RossNorris89@hotmail.com', TO_NUMBER('0128975422', '0999999999'), 'On duty', 1);
INSERT INTO employee VALUES ('e005', 'Dale','Rice', 'DaleRice@gmail.com', TO_NUMBER('0111258599', '0999999999'), 'On duty', 3);
INSERT INTO employee VALUES ('e006', 'Bob', 'Salvage', 'BobSalvage@outlook.com', TO_NUMBER('0149876352', '0999999999'), 'On duty', 4);
INSERT INTO employee VALUES ('e007','Eufemia', 'Lombardi', 'EufeLombardi@yahoo.com', TO_NUMBER('0198762233', '0999999999'), 'On duty', 6);
INSERT INTO employee VALUES ('e008','Doriano', 'Esposito', 'DorianEsposito@gamil.com', TO_NUMBER('0158532647', '0999999999'), 'Leave' ,7);
INSERT INTO employee VALUES ('e009', 'Ciro', 'Rizzo', 'CiroRizzo@hotmail.com', TO_NUMBER('0165234789','0999999999'), 'On duty', 5);
INSERT INTO employee VALUES ('e010', 'Jerome', 'Sims', 'JeromeSims@hotmail.com', TO_NUMBER('0169587423', '0999999999'), 'On duty', 8);
INSERT INTO employee VALUES ('e011', 'Miranda', 'Conner', 'MirConner2@gmail.com', TO_NUMBER('0195641233', '0999999999'), 'On duty', 10);
INSERT INTO employee VALUES ('e012', 'Larry', 'Turner', 'LarTurner@yahoo.com', TO_NUMBER('0152578952', '0999999999'), 'On duty', 6);
INSERT INTO employee VALUES ('e013', 'Pearl', 'Reid', 'PearlReid45@gmail.com', TO_NUMBER('0154789966','0999999999'),  'On duty', 8);
INSERT INTO employee VALUES ('e014', 'Vivian', 'Walton', 'VivianWalton@hotmail.com', TO_NUMBER('0102336597','0999999999'), 'Leave', 4);
INSERT INTO employee VALUES ('e015', 'Janice', 'Strickland', 'JanStrickland@gmail.com', TO_NUMBER('0105478995', '0999999999'), 'On duty', 2);
INSERT INTO employee VALUES ('e016', 'Goodwin', 'Fuller', 'GoodwinFuller@gmail.com', TO_NUMBER('0135269877', '0999999999'), 'Leave', 10);

--inserting nurse table data
INSERT INTO nurse VALUES ('N001', 'e002');
INSERT INTO nurse VALUES ('N002', 'e016');
INSERT INTO nurse VALUES ('N003', 'e014');
INSERT INTO nurse VALUES ('N004', 'e008');
INSERT INTO nurse VALUES ('N005', 'e006');
INSERT INTO nurse VALUES ('N006', 'e013');

--inserting doctor table data
INSERT INTO doctor VALUES ('D001', 'e001');
INSERT INTO doctor VALUES ('D002', 'e004');
INSERT INTO doctor VALUES ('D003', 'e003');
INSERT INTO doctor VALUES ('D004', 'e015');
INSERT INTO doctor VALUES ('D005', 'e011');
INSERT INTO doctor VALUES ('D006', 'e012');
INSERT INTO doctor VALUES ('D007', 'e010');
INSERT INTO doctor VALUES ('D008', 'e009');
INSERT INTO doctor VALUES ('D009', 'e005');

--inserting billing info table data
INSERT INTO billing_info (bill_ID, bill_Date, issued_emp_id, payment_Type, payment_Amount)
VALUES ('B001', '2021-03-01', 'N001', 'Credit Card', 'RM234.56');
INSERT INTO billing_info (bill_ID, bill_Date, issued_emp_id, payment_Type, payment_Amount)
VALUES ('B002', '2021-02-12', 'N002', 'Bank Transfer', 'RM847.50');
INSERT INTO billing_info (bill_ID, bill_Date, issued_emp_id, payment_Type, payment_Amount)
VALUES ('B003', '2021-02-11', 'N003', 'Debit Card', 'RM2453.10');
INSERT INTO billing_info (bill_ID, bill_Date, issued_emp_id, payment_Type, payment_Amount)
VALUES ('B004', '2021-01-13', 'N004', 'Online Banking', 'RM989.80');
INSERT INTO billing_info (bill_ID, bill_Date, issued_emp_id, payment_Type, payment_Amount)
VALUES ('B005', '2021-02-11', 'N005', 'Cash', 'RM3899.00');
INSERT INTO billing_info (bill_ID, bill_Date, issued_emp_id, payment_Type, payment_Amount)
VALUES ('B006', '2021-03-12', 'N006', 'Credit Card', 'RM745.50');

--insert for patient data
INSERT INTO patient
            (patient_id,
             patient_name,
             patient_info,
             patient_contact,
             patient_gender,
             patient_addr_houseno,
             adder_street,
             adder_city,
             adder_state,
             patient_status)
VALUES      ('p001',
             'Albend',
             'diabestes',
             '012-565693',
             'male',
             'J3164',
             'Jalan_maju',
             'Ipoh',
             'Perak',
             'observation');
 
 
 INSERT INTO patient
            (patient_id,
             patient_name,
             patient_info,
             patient_contact,
             patient_gender,
             patient_addr_houseno,
             adder_street,
             adder_city,
             adder_state,
             patient_status)
VALUES      ('p002',
             'Chong_Kim_Huat',
             'fever',
             '017-898911',
             'male',
             'J1279',
             'Jalan_maju',
             'Ipoh',
             'Perak',
             'observation');
 
INSERT INTO patient
            (patient_id,
             patient_name,
             patient_info,
             patient_contact,
             patient_gender,
             patient_addr_houseno,
             adder_street,
             adder_city,
             adder_state,
             patient_status)
VALUES      ('p003',
             'Raymond',
             'food_poisoning',
             '017-565311',
             'male',
             'A5566',
             'Jalan_gembira',
             'Tapah',
             'Perak',
             'observation');
 
INSERT INTO patient
            (patient_id,
             patient_name,
             patient_info,
             patient_contact,
             patient_gender,
             patient_addr_houseno,
             adder_street,
             adder_city,
             adder_state,
             patient_status)
VALUES      ('p004',
             'Lim_Loh_Teh',
             'food_poisoning',
             '012-631597',
             'male',
             'A1237',
             'Jalan_gembira',
             'Kudat',
             'Sabah',
             'observation');
 
INSERT INTO patient
            (patient_id,
             patient_name,
             patient_info,
             patient_contact,
             patient_gender,
             patient_addr_houseno,
             adder_street,
             adder_city,
             adder_state,
             patient_status)
VALUES      ('p005',
             'Cosmo',
             'diabetes',
             '011-889613',
             'male',
             'B7893',
             'Jalan_kati',
             'Papar',
             'Sabah',
             'observation');
 
INSERT INTO patient
            (patient_id,
             patient_name,
             patient_info,
             patient_contact,
             patient_gender,
             patient_addr_houseno,
             adder_street,
             adder_city,
             adder_state,
             patient_status)
VALUES      ('p006',
             'Wanda',
             'food_poisoning',
             '016-753159',
             'female',
             'J7369',
             'Jalan_maju', 
             'Ipoh',
             'Perak',
             'critical');
 
INSERT INTO patient
            (patient_id,
             patient_name,
             patient_info,
             patient_contact,
             patient_gender,
             patient_addr_houseno,
             adder_street,
             adder_city,
             adder_state,
             patient_status)
VALUES      ('p007',
             'Eliga',
             'diabetes',
             '017-354129',
             'female',
             'J4521',
             'Jalan_maju',
             'Ipoh',
             'Perak',
             'observation');
 
INSERT INTO patient
            (patient_id,
             patient_name,
             patient_info,
             patient_contact,
             patient_gender,
             patient_addr_houseno,
             adder_street,
             adder_city,
             adder_state,
             patient_status)
VALUES      ('p008',
             'Hannah',
             'accident',
             '017-852349',
             'female',
             'J1279',
             'Jalan_gembira',
             'Kudat',
             'Sabah',
             'critical');

--inserting appointment table data
INSERT INTO appointment (appt_ID, patient_ID, appt_date, appt_time)
VALUES ('A001', 'p001', '2021-01-02', '08:45:12');
INSERT INTO appointment (appt_ID, patient_ID, appt_date, appt_time)
VALUES ('A002', 'p002', '2021-01-03', '12:50:11');
INSERT INTO appointment (appt_ID, patient_ID, appt_date, appt_time)
VALUES ('A003', 'p003', '2021-01-08', '01:34:12');
INSERT INTO appointment (appt_ID, patient_ID, appt_date, appt_time)
VALUES ('A004', 'p004', '2021-01-12', '13:40:20');
INSERT INTO appointment (appt_ID, patient_ID, appt_date, appt_time)
VALUES ('A005', 'p005', '2021-01-13', '10:30:20');
INSERT INTO appointment (appt_ID, patient_ID, appt_date, appt_time)
VALUES ('A006', 'p006', '2021-02-19', '10:40:21');
INSERT INTO appointment (appt_ID, patient_ID, appt_date, appt_time)
VALUES ('A007', 'p007', '2021-03-12', '09:20:23');
INSERT INTO appointment (appt_ID, patient_ID, appt_date, appt_time)
VALUES ('A008', 'p008', '2021-02-12', '08:50:50');

--insert for ward table
INSERT INTO Ward (Ward_ID, Ward_type)
VALUES('W001','single.bed');
INSERT INTO Ward (Ward_ID, Ward_type)
VALUES('W002','four.bed');
INSERT INTO Ward (Ward_ID, Ward_type)
VALUES('W003','single.bed');
INSERT INTO Ward (Ward_ID, Ward_type)
VALUES('W004','four.bed');
INSERT INTO Ward (Ward_ID, Ward_type)
VALUES('W005','single.bed');
INSERT INTO Ward (Ward_ID, Ward_type)
VALUES('W006','single.bed');
INSERT INTO Ward (Ward_ID, Ward_type)
VALUES('W007','four.bed');
INSERT INTO Ward (Ward_ID, Ward_type)
VALUES('W008','single.bed');

--inserting Bed table data
INSERT INTO Bed VALUES ('Bd001','ICU Bed','W001');
INSERT INTO Bed VALUES ('Bd002','ICU Bed','W002');
INSERT INTO Bed VALUES ('Bd003','ICU Bed','W003');
INSERT INTO Bed VALUES ('Bd004','Specialist Bed','W004');
INSERT INTO Bed VALUES ('Bd005','Specialist Bed','W005');
INSERT INTO Bed VALUES ('Bd006','Normal Bed','W006');
INSERT INTO Bed VALUES ('Bd007','Normal Bed','W007');
INSERT INTO Bed VALUES ('Bd008','Normal Bed','W008');

--insert for checkinout table
           
INSERT INTO CheckInOut
            (Check_ID, Bed_ID, startDate, endDate, startTime, endTime)
VALUES      ('Cp001',
             'Bd001',
             TO_DATE('2020-09-15', 'YYYY-MM-DD'),
             TO_DATE('2020-10-15', 'YYYY-MM-DD'),
             TO_DATE('08:45 AM','HH:MI AM'),
             TO_DATE('08:45 PM','HH:MI PM'));
 
 
INSERT INTO CheckInOut
            (Check_ID, Bed_ID, startDate, endDate, startTime, endTime)
VALUES      ('Cp002',
             'Bd002',
             TO_DATE('2020-09-15', 'YYYY-MM-DD'),
             TO_DATE('2020-10-15', 'YYYY-MM-DD'),
             TO_DATE('09:45 AM','HH:MI AM'),
             TO_DATE('04:45 PM','HH:MI PM'));
 
INSERT INTO CheckInOut
            (Check_ID, Bed_ID, startDate, endDate, startTime, endTime)
VALUES      ('Cp003',
             'Bd003',
             TO_DATE('2020-09-20', 'YYYY-MM-DD'),
             TO_DATE('2020-10-20', 'YYYY-MM-DD'),
             TO_DATE('10:45 AM','HH:MI AM'),
             TO_DATE('06:45 PM','HH:MI PM'));
 
INSERT INTO CheckInOut
            (Check_ID, Bed_ID, startDate, endDate, startTime, endTime)
VALUES      ('Cp004',
             'Bd001',
             TO_DATE('2020-09-15', 'YYYY-MM-DD'),
             TO_DATE('2020-09-30', 'YYYY-MM-DD'),
             TO_DATE('08:45 AM','HH:MI AM'),
             TO_DATE('08:45 PM','HH:MI PM'));
 
INSERT INTO CheckInOut
            (Check_ID, Bed_ID, startDate, endDate, startTime, endTime)
VALUES      ('Cp005',
             'Bd005',
             TO_DATE('2020-09-26', 'YYYY-MM-DD'),
             TO_DATE('2020-10-05', 'YYYY-MM-DD'),
             TO_DATE('09:45 AM','HH:MI AM'),
             TO_DATE('09:35 PM','HH:MI PM'));
 
INSERT INTO CheckInOut
            (Check_ID, Bed_ID, startDate, endDate, startTime, endTime)
VALUES      ('Cp006',
             'Bd006',
             TO_DATE('2021-02-25', 'YYYY-MM-DD'),
             TO_DATE('2021-02-25', 'YYYY-MM-DD'),
             TO_DATE('09:45 AM','HH:MI AM'),
             TO_DATE('09:55 PM','HH:MI PM'));
 
INSERT INTO CheckInOut
            (Check_ID, Bed_ID, startDate, endDate, startTime, endTime)
VALUES      ('Cp007',
             'Bd007',
             TO_DATE('2021-03-11', 'YYYY-MM-DD'),
             TO_DATE('2021-04-03', 'YYYY-MM-DD'),
             TO_DATE('09:45 AM','HH:MI AM'),
             TO_DATE('11:35 PM','HH:MI PM'));
 
INSERT INTO CheckInOut
            (Check_ID, Bed_ID, startDate, endDate, startTime, endTime)
VALUES      ('Cp008',
             'Bd008',
             TO_DATE('2021-02-12', 'YYYY-MM-DD'),
             TO_DATE('2021-03-12', 'YYYY-MM-DD'),
             TO_DATE('10:50 AM','HH:MI AM'),
             TO_DATE('04:35 PM','HH:MI PM'));

--inserting Facilities table data
INSERT INTO Facilities VALUES ('F001','Blood Banks','To kept and contain blood securely');
INSERT INTO Facilities VALUES ('F002','Birth Centers','For childbirth that focuses on midwifery model');
INSERT INTO Facilities VALUES ('F003','Ambulatory Surgical Centers','Allow patients to receive certain surgical procedures outside hospital');
INSERT INTO Facilities VALUES ('F004','Clinics and Medical Offices','For diagnosis and treatment of outpatients');
INSERT INTO Facilities VALUES ('F005','Dialysis Centers','To filters and cleans the patient''s blood artificially');
INSERT INTO Facilities VALUES ('F006','Nursing Homes','For patients whose medical needs are to serious to manage at home');
INSERT INTO Facilities VALUES ('F007','Imaging and Radiology Centers','Offer diagnostic imaging services to patients');
INSERT INTO Facilities VALUES ('F008','Mental Health and Addiction Treatment Centers','Exist as a general institution for any mental health issue and are sometimes specialized');

--inserting Services table data
INSERT INTO Services VALUES ('S001','Diagnostic','Determine the cause of the illness or injury.');
INSERT INTO Services VALUES ('S002','General Surgery','Provides comprehensive, round-the-clock services for all general surgical procedures.');
INSERT INTO Services VALUES ('S003','Internal Medicine','Focuses on the diagnosis, treatment and prevention of a wide range of acute and chronic illnesses.');
INSERT INTO Services VALUES ('S004','Plastic Surgery','Focuses on the reconstruction of facial and body defects due to birth disorders, trauma, burns, and diseases.');
INSERT INTO Services VALUES ('S005','Radiology','Scanning images of the body with or without the use of radiation. Provide the patient and referring clinician with a quality diagnostic imaging service in a safe and friendly environment.');
INSERT INTO Services VALUES ('S006','Urology','Specializing in diseases and disorders of the human urinary tract, kidneys and the male reproductive organs.');
INSERT INTO Services VALUES ('S007','Pediatrics','Provides treatments and medical care for infants and children. Pediatricians are experienced and highly trained to provide our young patients with comprehensive care.');
INSERT INTO Services VALUES ('S008','Orthopedic','Provide treatment for all major and minor trauma and other orthopedic situations which include sports injuries and spinal surgeries.');

--inserting treatment record table data
INSERT INTO treatment_record VALUES ('T001', 'Cp001', 'N001');
INSERT INTO treatment_record VALUES ('T002', 'Cp002', 'N002');
INSERT INTO treatment_record VALUES ('T003', 'Cp003', 'N003');
INSERT INTO treatment_record VALUES ('T004', 'Cp004', 'N004');
INSERT INTO treatment_record VALUES ('T005', 'Cp005', 'N005');
INSERT INTO treatment_record VALUES ('T006', 'Cp006', 'N006');

--inserting Service_Info table data
INSERT INTO Service_info (Serviceinfo_ID, Services_ID, treat_ID, Service_date, Fac_ID)
VALUES ('SI001','S001','T001',TO_DATE('2021-03-16', 'YYYY-MM-DD'),'F001');
INSERT INTO Service_info (Serviceinfo_ID, Services_ID, treat_ID, Service_date, Fac_ID)
VALUES ('SI002','S002','T002',TO_DATE('2021-01-23', 'YYYY-MM-DD'),'F002');
INSERT INTO Service_info (Serviceinfo_ID, Services_ID, treat_ID, Service_date, Fac_ID)
VALUES ('SI003','S003','T003',TO_DATE('2021-02-08', 'YYYY-MM-DD'),'F003');
INSERT INTO Service_info (Serviceinfo_ID, Services_ID, treat_ID, Service_date, Fac_ID)
VALUES ('SI004','S004','T004',TO_DATE('2021-03-16', 'YYYY-MM-DD'),'F004');
INSERT INTO Service_info (Serviceinfo_ID, Services_ID, treat_ID, Service_date, Fac_ID)
VALUES ('SI005','S005','T005',TO_DATE('2021-07-11', 'YYYY-MM-DD'),'F005');
INSERT INTO Service_info (Serviceinfo_ID, Services_ID, treat_ID, Service_date, Fac_ID)
VALUES ('SI006','S006','T006',TO_DATE('2021-09-27', 'YYYY-MM-DD'),'F006');
INSERT INTO Service_info (Serviceinfo_ID, Services_ID, treat_ID, Service_date, Fac_ID)
VALUES ('SI007','S007','T002',TO_DATE('2021-05-31', 'YYYY-MM-DD'),'F007');
INSERT INTO Service_info (Serviceinfo_ID, Services_ID, treat_ID, Service_date, Fac_ID)
VALUES ('SI008','S008','T003',TO_DATE('2021-06-20', 'YYYY-MM-DD'),'F008');

--inserting appointment info table data
INSERT INTO appoint_info (apptInfo_ID, bill_ID,treat_ID,appt_ID)
VALUES ('AI001', 'B001', 'T001', 'A001');
INSERT INTO appoint_info (apptInfo_ID, bill_ID,treat_ID,appt_ID)
VALUES ('AI002', 'B002', 'T002', 'A002');
INSERT INTO appoint_info (apptInfo_ID, bill_ID,treat_ID,appt_ID)
VALUES ('AI003', 'B003', 'T003', 'A003');
INSERT INTO appoint_info (apptInfo_ID, bill_ID,treat_ID,appt_ID)
VALUES ('AI004', 'B004', 'T004', 'A004');
INSERT INTO appoint_info (apptInfo_ID, bill_ID,treat_ID,appt_ID)
VALUES ('AI005', 'B005', 'T005', 'A005');
INSERT INTO appoint_info (apptInfo_ID, bill_ID,treat_ID,appt_ID)
VALUES ('AI006', 'B006', 'T006', 'A006');

COMMIT;