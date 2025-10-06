### Catch Data verification points
This README provides steps for managing SQL Server users and verifying landing monitoring/catch data integrity.
### Overall Data Integrity Rules
- **Sites & Parties:** No duplicates, wrong names, or misspellings  
- **Catch Records:** Unique, complete, and consistent  
- **Weights & Hours:** No missing, zero, or ambiguous values  
- **Methods & Vessels:** No duplicates or null values  

All queries should ideally return **zero results**.

---

### How to Use This Guide

1. Open **SQL Server Management Studio (SSMS)** or **Azure Data Studio**.  
2. Connect to the target SQL Server instance.  
3. Copy-paste and run the queries in the order provided.  
4. Each verification query should return **zero rows** if data is clean.  
5. Investigate and fix any rows that appear in query results.  
6. Use these checks periodically to maintain **high-quality fisheries data**.

### Party Names (parties_list)
```sql
SELECT party_name, COUNT(*) AS counts 
FROM party 
GROUP BY party_name 
HAVING COUNT(*) > 1;
```

Check with concatenated fields:
```sql
SELECT CONCAT(party_type_id, ':', party_name, ':', site_id) AS mergedColumns 
INTO #temp_v1 
FROM party;

SELECT COUNT(*) AS occurrence, mergedColumns
FROM #temp_v1
GROUP BY mergedColumns
HAVING COUNT(*) > 1;
```

### Duplicate Areas
```sql
SELECT area_name, COUNT(*) AS occurrence
FROM area
GROUP BY area_name
HAVING COUNT(*) > 1;
```

### Duplicate Sites
```sql
SELECT CONCAT(site_name, ':', area_id) AS mergedColumns 
INTO #temp_v2
FROM site;

SELECT COUNT(*) AS occurrence, mergedColumns
FROM #temp_v2
GROUP BY mergedColumns
HAVING COUNT(*) > 1;
```

### Fisher Names
Prevent duplicates and ensure correct spelling.  
(Use similar queries as above with fisher identifiers.)

> **Note:** All parties (people, groups, organizations) are linked to a **site** for disambiguation.

### Submission Date
```sql
SELECT * 
FROM fish_catch_view
WHERE date_time_landed > GETDATE();
```

### Duplicate Catch Records
```sql
SELECT a.* 
FROM fish_catch_view a
JOIN (
    SELECT date_time_landed, fisher_name_id, local_name, [individual_wght(kg)], COUNT(*) AS counts
    FROM fish_catch_view
    GROUP BY date_time_landed, fisher_name_id, local_name, [individual_wght(kg)]
    HAVING COUNT(*) > 1
) b ON a.date_time_landed = b.date_time_landed
   AND a.fisher_name_id = b.fisher_name_id
   AND a.local_name = b.local_name
   AND a.[individual_wght(kg)] = b.[individual_wght(kg)]
ORDER BY a.date_time_landed, fisher_name_id;
```
### Duplicate Species Records
```sql
select label_name, common_english,scientific_family,scientific_species, COUNT(label_name) as lbl_no
from catch
group by label_name,common_english,scientific_family,scientific_species
having count(*)>1
```

### Outliers in Weight
```sql
SELECT * 
FROM fish_catch_view
WHERE ([total_weight(kgs)] = 0 OR [total_weight(kgs)] IS NULL);
```

### Missing Values
```sql
SELECT * 
FROM fish_catch_view
WHERE (count_of_individuals_per_species IS NULL 
       OR [individual_wght(kg)] IS NULL 
       OR local_name IS NULL)
  AND date_time_landed > '2025-04-25 10:00:00.000'
ORDER BY date_time_landed DESC;
```

### Vessel Check
```sql
SELECT * 
FROM fish_catch_view_v1
WHERE [vessel type] IS NULL
ORDER BY [vessel type] ASC;
```

### Fishing Hours
Ensure **fishing_hours** are not null or ambiguous.  
(Use manual or rule-based checks depending on schema.)

### Capture Method
```sql
SELECT capture_method_name, COUNT(*) AS counts
FROM capture_method
GROUP BY capture_method_name
HAVING COUNT(*) > 1;
```

---
