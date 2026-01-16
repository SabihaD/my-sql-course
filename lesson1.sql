SELECT
    PatientId
    , AdmittedDate
    , DischargeDate
   , DATEADD (WEEK, -2, AdmittedDate) AS reminderdate
   , DATEADD (month, 3, DischargeDate) as appointmentdate
   ,DATEDIFF(DAY, AdmittedDate, DischargeDate) AS lengthofstay
    , Hospital
    , Ward
FROM PatientStay
WHERE Hospital NOT IN ('Kingston', 'PRUH')
ORDER BY AdmittedDate ASC, DischargeDate DESC, PatientId DESC

SELECT top 3
   Hospital
   ,Ward
   ,COUNT(*) as numPatients
   ,SUM(Tariff) AS Totaltariff
   ,AVG(Tariff) as AVGTariff
   FROM patientstay
   GROUP BY Hospital, Ward
   ORDER BY Totaltariff DESC

SELECT
  ps.AdmittedDate
  ,ps.PatientId
  ,ps. Hospital
  from PatientStay ps

  SELECT 
  ps.PatientId
  ,ps.AdmittedDate
  ,ps.Hospital
  ,h.Hospital
  ,h.hospitaltype
FROM PatientStay ps full join DimHospitalBad h on ps.Hospital = h.Hospital

SELECT
ps.PatientId
, ps.Ethnicity 
, ISNULL(ps.Ethnicity,'-missing-') AS ethisnull
, COALESCE(ps.ethnicity, '-missing-') as ethisnull2
from PatientStay ps



--
--AND AdmittedDate BETWEEN '2024-02-26' AND '2024-02-28'
--AND WARD LIKE 'D%'
--and WARD in ('DAY SURGERY','GENERAL SURGERY')
