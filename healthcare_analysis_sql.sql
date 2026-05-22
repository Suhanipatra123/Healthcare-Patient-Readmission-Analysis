-- =========================================
-- Project Title:Patient Readmission and Hospital Performance Analysis using SQL
-- =========================================
-- DATABASE
create database healthcare_sql_project;
use healthcare_sql_project;

-- =========================================
-- VERIFY DATA
-- =========================================

SELECT * FROM cleaned_hospital_data;
SELECT * FROM cleaned_hospital_data LIMIT 5;

-- =========================================
-- 1. PATIENT ANALYSIS
-- =========================================

-- Total Patients
SELECT COUNT(*) AS total_patients
FROM cleaned_hospital_data;

-- Gender Distribution
SELECT Gender, COUNT(*) AS total
FROM cleaned_hospital_data
GROUP BY Gender;

-- Average Age
SELECT AVG(Age) AS avg_age
FROM cleaned_hospital_data;

-- =========================================
-- 2. DISEASE ANALYSIS
-- =========================================

-- Most Common Diseases
SELECT Disease, COUNT(*) AS total_cases
FROM cleaned_hospital_data
GROUP BY Disease
ORDER BY total_cases DESC;

-- =========================================
-- 3. TREATMENT COST ANALYSIS
-- =========================================

-- Average Treatment Cost
SELECT AVG(TreatmentCost) AS avg_cost
FROM cleaned_hospital_data;

-- Highest Treatment Cost
SELECT MAX(TreatmentCost) AS highest_cost
FROM cleaned_hospital_data;

-- =========================================
-- 4. LENGTH OF STAY ANALYSIS
-- =========================================

-- Average Length of Stay
SELECT AVG(LengthOfStay) AS avg_stay
FROM cleaned_hospital_data;

-- =========================================
-- 5. READMISSION ANALYSIS
-- =========================================

-- Readmission Count
SELECT Readmitted, COUNT(*) AS total
FROM cleaned_hospital_data
GROUP BY Readmitted;

-- =========================================
-- ADVANCED SQL CONCEPTS
-- =========================================

-- Window Function
SELECT PatientID, Disease, TreatmentCost,
RANK() OVER (ORDER BY TreatmentCost DESC) AS cost_rank
FROM cleaned_hospital_data;

-- CASE Statement
SELECT PatientID, TreatmentCost,
CASE
    WHEN TreatmentCost > 40000 THEN 'High Cost'
    WHEN TreatmentCost BETWEEN 20000 AND 40000 THEN 'Medium Cost'
    ELSE 'Low Cost'
END AS cost_category
FROM cleaned_hospital_data;

-- VIEW
CREATE VIEW high_cost_patients AS
SELECT PatientID, Disease, TreatmentCost
FROM cleaned_hospital_data
WHERE TreatmentCost > 40000;

SELECT * FROM high_cost_patients;

-- =============================================================
-- END OF SCRIPT
-- =============================================================

-- =========================================
-- CONCLUSION
-- =========================================

-- This project demonstrates SQL skills including filtering,
-- aggregation, grouping, window functions, views, and CASE statements.
-- The analysis helps identify important healthcare trends and patient insights.