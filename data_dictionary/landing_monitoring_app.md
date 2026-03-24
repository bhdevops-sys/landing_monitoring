
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
