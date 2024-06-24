-- Write a query to get data having length of Rna structures more than 12 with them being added after 2008

SELECT *
FROM rna
WHERE len > 12 AND timestamp > '2008-12-31'
LIMIT 5;

-- How many pre computed RNA are present that are still active and got their last release update before 2022

SELECT count(*)
FROM rnc_rna_precomputed
WHERE is_active = 'true' AND update_date < '2022-01-01';

-- How many total pre computed RNA records for snoRNA and tRNA were recorded in 2011, 2016, 2014, and 2020 

SELECT count(rrp.id)
FROM rnacen.rnc_rna_precomputed rrp
WHERE rrp.rna_type IN ('snoRNA' , 'tRNA')
AND EXTRACT (YEAR FROM rrp.update_date) IN (2011,2014,2016,2020)

-- Can you give me the names of all databases built for RNA with minimum length other than 100, 200, 300, 400, and 15

SELECT display_name
FROM rnc_database
WHERE min_length NOT IN (100, 200, 300, 400, 15);


-- Can you get complete 500 records of sequences for active regions and name your column as myregions in which you are 
-- getting the region name column vakue. Then tell me what different chromosomes with exon_count we have for regions 
-- including center, east and north using the name you set for your column

SELECT region_name AS myregions FROM rnc_sequence_regions
WHERE region_name IS NOT NULL LIMIT 500;
SELECT DISTINCT chromosome, exon_count FROM
rnc_sequence_regions WHERE region_name IN ('center', 'east', 'north')
LIMIT 1000


