WITH CatchData AS (
    SELECT 
        fc.f_stock_id,
        c.catch_id,
        c.local_name,
        c.label_name,
        c.scientific_species,
        CAST(fc.wgt AS varchar(max)) AS wgt,
        CAST(fc.num_species AS varchar(max)) AS num_species
    FROM catch c
    INNER JOIN f_stock_catch fc ON fc.catch_id = c.catch_id
)

SELECT fs.f_stock_id, submission_date AS 'date_time_landed', p3.party_id AS 'Data Collector id', 'Bahari Hai Conservation' AS organization, p2.party_name AS admin3, admin_2, admin_1, admin_0 AS Country, 
                  fs.fishing_start_time AS 'TIme start fishing', fs.fishing_stop_time AS 'TIme end fishing', p.party_id AS fisher_id, crew_size, vessel_name AS 'Vessel type', capture_method_name AS 'Gear type', st.site_name AS 'Fishing ground', 
                  s.site_name AS 'landing site',
                  
				  (SELECT STUFF((
        SELECT ', ' + local_name
        FROM CatchData cd
        WHERE cd.f_stock_id = fs.f_stock_id
        ORDER BY cd.catch_id
        FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '')) AS 'Species landed (Local name)',

    (SELECT STUFF((
        SELECT ', ' + label_name
        FROM CatchData cd
        WHERE cd.f_stock_id = fs.f_stock_id
        ORDER BY cd.catch_id
        FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '')) AS 'Species landed (Common english name)',

    (SELECT STUFF((
        SELECT ', ' + scientific_species
        FROM CatchData cd
        WHERE cd.f_stock_id = fs.f_stock_id
        ORDER BY cd.catch_id
        FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '')) AS 'Species landed (Scientific name/family name)',

    (SELECT STUFF((
        SELECT '; ' + wgt
        FROM CatchData cd
        WHERE cd.f_stock_id = fs.f_stock_id
        ORDER BY cd.catch_id
        FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '')) AS [Total weight per species landed(kg)],

    (SELECT STUFF((
        SELECT '; ' + num_species
        FROM CatchData cd
        WHERE cd.f_stock_id = fs.f_stock_id
        ORDER BY cd.catch_id
        FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '')) AS 'Number of individuals per species landed ',
					  
	
	wgt_kg AS 'Total weight landed(kgs)', 
											   recorded_share_name,
                                             (SELECT stuff
                                                                    ((SELECT ', ' + category_name
                                                                      FROM      (SELECT DISTINCT category_name
                                                                                         FROM      buyer_category bc LEFT JOIN
                                                                                                           f_stock_buyer fsb ON fsb.buyer_category_id = bc.buyer_category_id
                                                                                         WHERE   fs.f_stock_id = fsb.f_stock_id) s
                                                                      ORDER BY category_name FOR xml path('')), 1, 2, '')) AS 'Fish trader', recorded_share_name AS 'Catch sold', reason_name AS 'Reason for not being sold'
                       FROM      f_stock fs LEFT JOIN
                                         f_gear_exchange ge ON ge.gear_exchange_id = fs.cluster_id LEFT JOIN
                                         party p2 ON fs.BMU_id = p2.party_id LEFT JOIN
                                         party p3 ON fs.collector_id = p3.party_id LEFT JOIN
                                         site s ON s.site_id = fs.landing_site LEFT JOIN
                                         site st ON st.site_id = fs.capture_site LEFT JOIN
                                         vessel v ON v.vessel_id = fs.vessel_id LEFT JOIN
                                         party p ON fs.fisher_id = p.party_id LEFT JOIN
                                         capture_method cm ON fs.gear_id = cm.capture_method_id LEFT JOIN
                                         reason_catch_unsold rcu ON fs.reason_catch_unsold_id = rcu.reason_catch_unsold_id LEFT JOIN
                                         recorded_share rs ON fs.recorded_share_id = rs.recorded_share_id LEFT JOIN
                                         area ar ON ar.area_id = s.area_id LEFT JOIN
                                             (SELECT f_stock_id, SUM(wgt) AS total_weight
                                              FROM      f_stock_catch
                                              GROUP BY f_stock_id) s_ttw ON s_ttw.f_stock_id = fs.f_stock_id
