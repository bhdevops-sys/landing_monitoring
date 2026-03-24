#### Landing_monioring Data Dictionary
This catalog describes the structure, meaning, and rules of data in a the BH landing_monitoring(f_stock) database. It's relevance is in ensuring that data is comprehended, managed, and used consistently across the organization. It improves data clarity, quality, consistency, collaboration, and analysis, thus remaining essential for managing datasets and information systems within Bahari Hai.

---

#### f_stock
| Field Name | SQL Type | Length | Nullable | Example Value | Allowed Values / Format | Description |
|------------|----------|--------|----------|---------------|--------------------------|-------------|
| f_stock_id | varchar | 8 | No | FS0001 | Alphanumeric, unique | Unique fisheries record ID |
| submission_date | datetime | — | No | 2025-03-10 15:00:00 | YYYY-MM-DD HH:MM:SS | Date/time data was submitted |
| cluster_id | varchar | 8 | Yes | CL001 | FK reference | Cluster/group identifier |
| vessel_id | varchar | 8 | Yes | V001 | FK reference | Vessel identifier |
| capture_site | varchar | 8 | Yes | SITE01 | FK reference | Fishing/capture site |
| landing_site | varchar | 8 | No | LS001 | FK reference | Landing site |
| location | nvarchar | 100 | No | -3.123,40.123 | "lat,lon" decimal format | Geographic coordinates |
| wgt_kg | float | — | No | 25.5 | Numeric ≥ 0 | Total catch weight (kg) |
| collector_id | varchar | 20 | Yes | COL001 | FK reference | Data collector ID |
| crew_size | int | — | Yes | 3 | Integer ≥ 0 | Number of crew members |
| fishing_start_time | datetime | — | Yes | 2025-03-10 08:00:00 | YYYY-MM-DD HH:MM:SS | Start of fishing activity |
| fishing_stop_time | datetime | — | Yes | 2025-03-10 14:00:00 | YYYY-MM-DD HH:MM:SS | End of fishing activity |
| recorded_share_id | varchar | 8 | Yes | RS01 | FK reference | Share category ID |
| sold_catch_cost | decimal | — | Yes | 5000 | Numeric ≥ 0 | Sale value of catch |
| reason_catch_unsold_id | varchar | 8 | Yes | RC01 | FK reference | Reason catch was unsold |
| BMU_id | varchar | 8 | Yes | BMU01 | FK reference | Beach Management Unit ID |
| gear_id | int | — | Yes | 2 | FK reference | Fishing gear type |
| fisher_id | varchar | 8 | Yes | F001 | FK reference | Fisher identifier |
| gear_size | decimal | — | Yes | 50 | Numeric ≥ 0 | Size of fishing gear |

---

#### fishing_gear
| Field Name | SQL Type | Length | Nullable | Example Value | Allowed Values / Format | Description |
|------------|----------|--------|----------|---------------|--------------------------|-------------|
| fishin_gear_id | varchar | 8 | No | FG001 | Alphanumeric, unique | Unique fishing gear record ID |
| f_stock | varchar | 8 | No | FS0001 | FK reference | Fisheries stock reference |
| gear_id | varchar | 8 | No | G001 | FK reference | Gear type identifier |
| size | varchar | 8 | Yes | Medium | Free text / categorical | Gear size |

---

#### capture_method
| Field Name | SQL Type | Length | Nullable | Example Value | Allowed Values / Format | Description |
|------------|----------|--------|----------|---------------|--------------------------|-------------|
| capture_method_id | int | — | No | 1 | Integer, unique | Unique identifier for capture method |
| capture_method_name | varchar | 30 | No | Net Capture | Predefined categories | Capture method name |
| capture_method_explanation | varchar | 200 | Yes | Captured using gillnet | Free text | Explanation of capture method |

---

#### f_stock_catch
| Field Name | SQL Type | Length | Nullable | Example Value | Allowed Values / Format | Description |
|------------|----------|--------|----------|---------------|--------------------------|-------------|
| f_catch_stock_id | varchar | 8 | No | FCS001 | Alphanumeric, unique | Unique fisheries catch-stock ID |
| f_stock_id | varchar | 8 | No | FS0001 | FK reference | Fisheries stock ID |
| catch_id | varchar | 8 | No | C001 | FK reference | Catch species ID |
| num_species | int | — | Yes | 10 | Integer ≥ 0 | Number of individuals |
| wgt | float | — | Yes | 25.5 | Numeric ≥ 0 | Weight of catch (kg) |
| photo_if_new | varchar | 250 | Yes | fish.jpg | File path / URL | Photo if species is new |

---

#### catch
| Field Name | SQL Type | Length | Nullable | Example Value | Allowed Values / Format | Description |
|------------|----------|--------|----------|---------------|--------------------------|-------------|
| catch_id | varchar | 8 | No | C001 | Alphanumeric, unique | Unique catch/species ID |
| label_name | nvarchar | 200 | Yes | Snapper | Free text | Label/market name |
| local_name | nvarchar | 200 | No | Changu | Free text | Local species name |
| common_english | nvarchar | 100 | Yes | Red Snapper | Free text | Common English name |
| scientific_family | nvarchar | 100 | Yes | Lutjanidae | Scientific naming | Family name |
| scientific_species | nvarchar | 100 | Yes | Lutjanus spp. | Scientific naming | Species name |

---

#### f_gear_exchange
| Field Name | SQL Type | Length | Nullable | Example Value | Allowed Values / Format | Description |
|------------|----------|--------|----------|---------------|--------------------------|-------------|
| gear_exchange_id | varchar | 8 | No | GE001 | Alphanumeric, unique | Unique gear exchange ID |
| date_time | datetime | — | Yes | 2025-03-01 09:00:00 | YYYY-MM-DD HH:MM:SS | Date and time of exchange |
| fisher_group_id | varchar | 20 | No | FGROUP01 | FK reference | Fisher group ID |
| bmu_id | varchar | 8 | No | BMU01 | FK reference | Beach Management Unit ID |

---

#### f_group_member
| Field Name | SQL Type | Length | Nullable | Example Value | Allowed Values / Format | Description |
|------------|----------|--------|----------|---------------|--------------------------|-------------|
| f_group_member_id | varchar | 8 | No | MEM001 | Alphanumeric, unique | Group member ID |
| gear_exchange_id | varchar | 8 | No | GE001 | FK reference | Gear exchange ID |
| party_id | varchar | 8 | No | P001 | FK reference | Participant/party ID |

---

#### vessel
| Field Name | SQL Type | Length | Nullable | Example Value | Allowed Values / Format | Description |
|------------|----------|--------|----------|---------------|--------------------------|-------------|
| vessel_id | varchar | 8 | No | V001 | Alphanumeric, unique | Unique vessel ID |
| vessel_name | nvarchar | 100 | No | Bahari Star | Free text | Name of vessel |

---

#### reason_catch_unsold
| Field Name | SQL Type | Length | Nullable | Example Value | Allowed Values / Format | Description |
|------------|----------|--------|----------|---------------|--------------------------|-------------|
| reason_catch_unsold_id | int | — | No | 1 | Integer, unique | Unique reason ID |
| reason_name | varchar | 100 | Yes | Low Demand | Predefined / free text | Reason in English |
| reason_swahili | varchar | 100 | Yes | Mahitaji kidogo | Free text | Reason in Swahili |

---

#### recorded_share
| Field Name | SQL Type | Length | Nullable | Example Value | Allowed Values / Format | Description |
|------------|----------|--------|----------|---------------|--------------------------|-------------|
| recorded_share_id | int | — | No | 1 | Integer, unique | Unique share ID |
| recorded_share_name | varchar | 50 | Yes | Owner Share | Predefined / free text | Share category (English) |
| recorded_share_swahili | varchar | 50 | Yes | Sehemu ya Mmiliki | Free text | Share category (Swahili) |

---

#### party
| Field Name | SQL Type | Length / Precision | Nullable | Example Value | Allowed Values / Format | Description |
|------------|----------|-------------------|----------|---------------|------------------------|-------------|
| party_id | varchar | 8 | No | RPT001 | Alphanumeric | Unique ID for each party (person,group or organization) |
| party_type_id | int | 10 | No | 1 | Integer (FK) | Reference to party_type (lookup table) |
| party_name | varchar | 200 | No | Kalume Karisa | Text | Full name of party, group or organization |
| party_telephone_1 | varchar | 20 | Yes | +254701234567 | Text / Numeric | Primary contact number |
| party_telephone_2 | varchar | 20 | Yes | +254712345678 | Text / Numeric | Secondary contact number |
| party_email | varchar | 50 | Yes | karisa@baharihai.org | Email format | Email address |
| site_id | varchar | 8 | No | S001 | Alphanumeric (FK) | Reference to site |
| sex_id | varchar | 8 | Yes | Male | Alphanumeric (FK) | Reference to sex (`sex_id`) |
| organization_id | varchar | 8 | Yes | baharihai | Alphanumeric (FK)| Reference to party (`party_id`) |

---

#### party_type
| Field Name          | SQL Type | Length / Precision | Nullable | Example Value        | Allowed Values / Format | Description                                      |
|---------------------|----------|-------------------|----------|---------------------|------------------------|--------------------------------------------------|
| party_type_id       | int      | 10                | No       | 4                   | Integer (0-10)         | Unique identifier for the party type.            |
| party_type_name     | varchar  | 20                | Yes      | Organization          | String (max 20 chars)  | Name of the party type in English.                |
| party_type_swahili  | varchar  | 100               | Yes      | Shirika  | String (max 100 chars) | Name of the party type in Swahili.                |

---

#### sex
| Field Name | SQL Type | Length / Precision | Nullable | Example Value | Allowed Values / Format | Description |
|------------|----------|-------------------|----------|---------------|------------------------|-------------|
| sex_id | int | 10 | No | 1 | Integer (Primary Key) | Unique ID for sex |
| sex_name | varchar | 20 | No | Male | Text | Name of sex in English |
| sex_name_swahili | varchar | 100 | Yes | Mwanaume | Text | Name of sex in Swahili (optional) |

---

#### site
| Field Name | SQL Type | Length / Precision | Nullable | Example Value | Allowed Values / Format | Description |
|------------|----------|-------------------|----------|---------------|------------------------|-------------|
| site_id | varchar | 8 | No | S001 | Alphanumeric | Unique ID for the site |
| site_name | varchar | 50 | No | Diani Beach | Text | Name of the site |
| area_id | int | 10 | No | 1 | Integer (FK) | Reference to area (lookup table) |
| foraging_ground_id | int | 10 | Yes | 5 | Integer (FK) | Reference to foraging_ground (lookup table)|
| is_capture_site | bit | 1 | Yes | 1 | 0 / 1 | Flag if site is used for turtle capture |
| is_landing_site | bit | 1 | Yes | 0 | 0 / 1 | Flag if site is used for turtle/fish landing |
| is_nesting_site | bit | 1 | Yes | 1 | 0 / 1 | Flag if site is used for turtle nesting |
| is_release_site | bit | 1 | Yes | 0 | 0 / 1 | Flag if site is used for turtle release |
| is_plot | bit | 1 | Yes | 0 | 0 / 1 | Flag if site is a beach plot |
| is_hotel | bit | 1 | Yes | 1 | 0 / 1 | Flag if site is part of a hotel property |
| is_private | bit | 1 | Yes | 0 | 0 / 1 | Flag if site is privately owned |

---

#### area
| Field Name | SQL Type | Length / Precision | Nullable | Example Value | Allowed Values / Format | Description |
|------------|----------|-------------------|----------|---------------|------------------------|-------------|
| area_id | int | 10 | No | 1 | Integer (Primary Key) | Unique ID for each area/region |
| area_name | varchar | 20 | No | Lamu County | Text | Name of the area |
| admin_2 | varchar | 20 | Yes | Malindi | Text | Lower administrative unit (sub-county) |
| admin_1 | varchar | 20 | Yes | Kilifi | Text | Mid-level administrative unit (county) |
| admin_0 | varchar | 20 | Yes | Kenya | Text | top-level administrative unit (Country)|

---

#### fish_catch_view
| Field Name | SQL Type | Length | Nullable | Example Value | Allowed Values / Format | Description |
|------------|----------|--------|----------|---------------|--------------------------|-------------|
| f_stock_id | varchar | 8 | No | FS0001 | Alphanumeric, unique | Unique fisheries record ID |
| date_time_landed | datetime | — | No | 2025-03-10 14:30:00 | YYYY-MM-DD HH:MM:SS | Date and time of landing |
| Data Collector Name | varchar | 200 | Yes | Jane Doe | Free text | Name of data collector |
| organization | varchar | 23 | No | KMFRI | Predefined org names | Organization collecting data |
| admin3 | varchar | 200 | Yes | Watamu | Free text | Sub-county / locality |
| admin_2 | varchar | 20 | Yes | Kilifi North | Free text | County subdivision |
| admin_1 | varchar | 20 | Yes | Kilifi | Free text | County |
| Country | varchar | 20 | Yes | Kenya | Country names | Country |
| fisher_name_id | varchar | 200 | Yes | Fisher001 | Alphanumeric | Fisher identifier |
| fisher_gender | varchar | 20 | Yes | Male | Male, Female, Other | Gender of fisher |
| crew_size | int | — | Yes | 3 | Integer ≥ 0 | Number of crew members |
| vessel_name | nvarchar | 100 | Yes | Bahari Star | Free text | Vessel/boat name |
| fishing_gear_type | varchar | 30 | Yes | Gillnet | Predefined gear types | Type of fishing gear |
| gear_size | decimal | — | Yes | 50 | Numeric ≥ 0 | Size of gear |
| capture_site | varchar | 50 | Yes | Offshore Reef | Free text | Fishing location |
| landing_site | varchar | 50 | Yes | Watamu Beach | Free text | Landing site |
| fishing_hours | int | — | Yes | 6 | Integer ≥ 0 | Duration of fishing trip (hours) |
| local_name | ntext | — | Yes | Changu | Free text | Local fish species name |
| label_name | ntext | — | Yes | Snapper | Free text | Market/common name |
| scientific_species | ntext | — | Yes | Lutjanus spp. | Scientific naming format | Scientific species name |
| individual_wght(kg) | ntext | — | Yes | 2.5 | Numeric (kg) | Weight per individual |
| count_of_individuals_per_species | ntext | — | Yes | 10 | Integer ≥ 0 | Count per species |
| total_weight(kgs) | float | — | No | 25.5 | Numeric ≥ 0 | Total catch weight (kg) |
| recorded_share_name | varchar | 50 | Yes | Owner Share | Free text | Share category |
| CPUE_kg_per_crew_size_per_hour | float | — | Yes | 1.2 | Numeric ≥ 0 | Catch per unit effort |
| buyer_type | ntext | — | Yes | Local Trader | Free text | Type of buyer |
| sold_catch_cost(kes) | decimal | — | Yes | 5000 | Numeric ≥ 0 | Sale value in KES |
| reason_catch_unsold | varchar | 100 | Yes | Low demand | Free text | Reason catch not sold |

---
