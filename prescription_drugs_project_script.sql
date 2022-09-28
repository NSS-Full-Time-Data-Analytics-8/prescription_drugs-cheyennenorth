--PROJECT 2: PRESCRIPTION DRUGS

--Question 1a.
SELECT npi, total_claim_count 
FROM prescriber INNER JOIN prescription USING(npi)
ORDER BY total_claim_count DESC;
--could also use LEFT JOIN with total_claim IS NOT NULL 

--b.
SELECT npi,prescriber.nppes_provider_first_name, prescriber.nppes_provider_last_org_name, specialty_description, total_claim_count
FROM prescriber 
INNER JOIN prescription USING(npi)
ORDER BY total_claim_count DESC;

--Question 2
SELECT prescriber.specialty_description, SUM(prescription.total_claim_count) 
FROM prescriber
LEFT JOIN prescription USING(npi)
WHERE prescription.total_claim_count IS NOT NULL
GROUP BY prescriber.specialty_description, prescription.total_claim_count
ORDER BY prescription.total_claim_count DESC;

--Question 2 AGAIN :(
 
 
--Question 3a.
SELECT generic_name,total_drug_cost
FROM drug
LEFT JOIN prescription USING(drug_name)
WHERE total_drug_cost IS NOT NULL 
ORDER BY total_drug_cost DESC;

--Question3b.
SELECT generic_name, ROUND((total_drug_cost/30), 2)
FROM drug
INNER JOIN prescription USING(drug_name)
ORDER BY total_drug_cost DESC;

--Question4a.
SELECT drug_name, CASE WHEN opioid_drug_flag = 'Y' THEN 'opiod'
				   WHEN antibiotic_drug_flag = 'Y' THEN 'antibiotic'
				   ELSE 'neither' END as drug_type
FROM drug;

--Question4b


SELECT drug_type, SUM(total_drug_cost) AS total_cost
FROM(
SELECT *, CASE WHEN opioid_drug_flag = 'Y' THEN 'opiod'
				   WHEN antibiotic_drug_flag = 'Y' THEN 'antibiotic'
				   ELSE 'neither' END as drug_type
FROM drug) AS drug_type_table
INNER JOIN prescription USING(drug_name)
GROUP BY drug_type;

--Question 5
SELECT COUNT(*)
FROM cbsa
INNER JOIN fips_county USING(fipscounty)
WHERE state = 'TN';

--Question 5b
SELECT cbsaname, SUM(population) AS pop_total
FROM cbsa
INNER JOIN population USING(fipscounty)
GROUP BY cbsaname 
ORDER BY pop_total;

--Question 5c
(SELECT *
FROM population 
LEFT JOIN cbsa USING(fipscounty)
WHERE cbsaname IS NULL)









