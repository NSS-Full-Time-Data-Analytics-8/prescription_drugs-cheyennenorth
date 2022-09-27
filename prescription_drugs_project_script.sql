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
SELECT DISTINCT(prescriber.specialty_description), prescription.total_claim_count 
FROM prescriber
LEFT JOIN prescription USING(npi)
WHERE prescription.total_claim_count IS NOT NULL
GROUP BY prescriber.specialty_description, prescription.total_claim_count
ORDER BY prescription.total_claim_count DESC;

--Question 2 AGAIN :(
SELECT DISTINCT(prescriber.specialty_description) AS special_script, prescription.total_claim_count AS total_claim
FROM prescriber 
LEFT JOIN prescription USING(npi)


