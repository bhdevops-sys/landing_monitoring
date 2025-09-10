SELECT fs.f_stock_id, submission_date AS date_time_landed, p3.party_name AS 'Data Collector Name', 'Bahari Hai Conservation' AS organization, p2.party_name AS admin3, admin_2, admin_1, admin_0 AS Country, 
                  p.party_name AS fisher_name_id, sex_name AS fisher_gender, crew_size, vessel_name, capture_method_name AS fishing_gear_type, gear_size, st.site_name AS capture_site, s.site_name AS landing_site, fishing_hours,
                      (SELECT stuff
                                             ((SELECT ', ' + local_name
                                               FROM      (SELECT local_name
                                                                  FROM      catch c LEFT JOIN
                                                                                    f_stock_catch fc ON fc.catch_id = c.catch_id
                                                                  WHERE   fs.f_stock_id = fc.f_stock_id) s
                                               ORDER BY local_name FOR xml path('')), 1, 2, '')) AS local_name,
                      (SELECT stuff
                                             ((SELECT ', ' + label_name
                                               FROM      (SELECT label_name
                                                                  FROM      catch c LEFT JOIN
                                                                                    f_stock_catch fc ON fc.catch_id = c.catch_id
                                                                  WHERE   fs.f_stock_id = fc.f_stock_id) s
                                               ORDER BY label_name FOR xml path('')), 1, 2, '')) AS label_name,
                      (SELECT stuff
                                             ((SELECT ', ' + scientific_species
                                               FROM      (SELECT scientific_species
                                                                  FROM      catch c LEFT JOIN
                                                                                    f_stock_catch fc ON fc.catch_id = c.catch_id
                                                                  WHERE   fs.f_stock_id = fc.f_stock_id) s
                                               ORDER BY scientific_species FOR xml path('')), 1, 2, '')) AS scientific_species,
                      (SELECT stuff
                                             ((SELECT '; ' + cast(wgt AS varchar(max)) AS [text()]
                                               FROM      f_stock_catch fsc
                                               WHERE   fs.f_stock_id = fsc.f_stock_id FOR XML PATH('')), 1, 2, '')) AS [individual_wght(kg)],
                      (SELECT STUFF
                                             ((SELECT '; ' + CAST(num_species AS VARCHAR)
                                               FROM      f_stock_catch fsc1
                                               WHERE   fs.f_stock_id = fsc1.f_stock_id FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)'), 1, 2, '')) AS [number_of_caught_species], wgt_kg AS 'total_weight(kgs)', recorded_share_name,
                                             (SELECT stuff
                                                                    ((SELECT ', ' + category_name
                                                                      FROM      (SELECT DISTINCT category_name
                                                                                         FROM      buyer_category bc LEFT JOIN
                                                                                                           f_stock_buyer fsb ON fsb.buyer_category_id = bc.buyer_category_id
                                                                                         WHERE   fs.f_stock_id = fsb.f_stock_id) s
                                                                      ORDER BY category_name FOR xml path('')), 1, 2, '')) AS buyer_type, sold_catch_cost AS 'sold_catch_cost(kes)', reason_name AS 'reason_catch_unsold'
                       FROM      f_stock fs LEFT JOIN
                                         f_gear_exchange ge ON ge.gear_exchange_id = fs.cluster_id LEFT JOIN
                                         party p2 ON fs.BMU_id = p2.party_id LEFT JOIN
                                         party p3 ON fs.collector_id = p3.party_id LEFT JOIN
                                         site s ON s.site_id = fs.landing_site LEFT JOIN
                                         site st ON st.site_id = fs.capture_site LEFT JOIN
                                         vessel v ON v.vessel_id = fs.vessel_id LEFT JOIN
                                         party p ON fs.fisher_id = p.party_id LEFT JOIN
                                         sex sx ON p.sex_id = sx.sex_id LEFT JOIN
                                         capture_method cm ON fs.gear_id = cm.capture_method_id LEFT JOIN
                                         reason_catch_unsold rcu ON fs.reason_catch_unsold_id = rcu.reason_catch_unsold_id LEFT JOIN
                                         recorded_share rs ON fs.recorded_share_id = rs.recorded_share_id LEFT JOIN
                                         area ar ON ar.area_id = s.area_id LEFT JOIN
                                             (SELECT f_stock_id, SUM(wgt) AS total_weight
                                              FROM      f_stock_catch
                                              GROUP BY f_stock_id) s_ttw ON s_ttw.f_stock_id = fs.f_stock_id LEFT JOIN
                                             (SELECT f_stock_id, fishing_start_time, fishing_stop_time, DATEDIFF(HOUR, fishing_start_time, fishing_stop_time) AS fishing_hours
                                              FROM      f_stock) f_hrs ON f_hrs.f_stock_id = fs.f_stock_id
