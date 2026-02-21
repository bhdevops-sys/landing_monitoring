### Fish Landing Monitoring Mobile App Documentation

#### Introduction

The Fish Landing Monitoring Mobile App is designed to assist fishermen in capturing and reporting landing data effectively.
This app allows users to log various details such as species caught, landing and capture sites, vessel and type of  fishing gear used, 
individual and aggregated weight of species caught in Kilograms, and pricing in Kenyan Shillings (KES). Built using **AppSheet**, 
the data is stored in a **Microsoft SQL Azure** database and visualized in **Power BI** for improved resource management and transparency.

---

#### Table of Contents

1. [Features](#features)
2. [Technology Stack](#technology-stack)
3. [Business Process](#business-process)
4. [User Guide](#user-guide)
5. [Data Structure](#data-structure)
6. [Reporting and Visualization](#reporting-and-visualization)
7. [Deployment](#deployment)

---

#### Features

- **Catch Logging:** Fishermen can log details of fish caught, including species, capture site, and capture method used.
- **Landing Site Information:** Records data on landing site and associated Beach Management Units (BMUs).
- **Weight and Pricing:** Input individual and aggregated weight of species caught, sold catch weight in kg and price for sold fish in KES.
- **Data Verification:** Submitted data is verified by Bahari Hai Fisheries Program staff for accuracy.
- **Data Analysis:** Enables deeper insights into fishing trends, and species abundance.

---

#### Technology Stack

- **Frontend:** AppSheet
- **Backend:** Microsoft SQL Azure
- **Data Visualization:** Power BI

---

#### Business Process

The mobile app operates through a clear business process for efficient data collection and verification:

1. **User Registration:** Fishermen register in the AppSheet app, creating an account for data entry.
  
2. **Data Entry:**
   - Fishermen log the following details:
     - Fishing start datetime
     - Fishing stop datetime
     - Fish species caught
     - Capture site
     - Landing site
     - Beach Management Unit (BMU)
     - Vessel and gear used
     - indiviual caught species weight (in kilograms) and sold weight
     - Price per kilogram (KES) of sold catch

3. **Data Submission:** Fishermen submit the data for review. 

4. **Data Verification:**
   - Bahari Hai Fisheries Program staff verify the submitted data for accuracy and completeness.
   - Any discrepancies are flagged, and fishermen may be contacted for clarification.

5. **Data Storage:** Once verified, the data is stored in a **Microsoft SQL Azure** database for secure and efficient access.

6. **Data Analysis:** The collected data can be accessed and analyzed using **Power BI** for insights related to fishing practices and trends.

---

#### User Guide

1. **Creating an Account:**
   - Download the appsheet app from your device's app store;Google play, App store.
   - Create an account using your email and set a password (link to app will be shared to this account by app creator).

2. **Navigating the Interface:**
   - **Home Screen:** Offers options for data logging, reports, and user settings.
   - **Log Catch:** Select this option to enter fish catch details.

3. **Logging Data:**
   - Complete the required fields including species, capture site, weight, and price.
   - Submit the entry for verification.

4. **Viewing Reports:**
   - uon request a link will be shared to the reports section to visual analysis provided by Power BI.

---

#### Data Structure

##### Database Tables

| Table Name           | Description                                               |
|----------------------|-----------------------------------------------------------|
| f_stock          | Records details of fish caught including species, weights, and prices. |
| site         | Stores information about landing and capture sites and associated BMUs. |
| catch         | Maintains records of species;local,common,family and species name. |
| vessel       | Captures data regarding vessels utilized in fishing. |
| gear       | Captures data regarding fishing gear and gear size utilized in fishing. |
| party       | Captures data regarding parties including; fisheeman utilized in fishing. |
| f_stock_catch            | Contains details on species caught; species name, weight, number and photo if new. |

##### Entity-Relationship Diagram (ERD)

For a visual representation of the database structure, refer to the [ERD/fish_landing_monitoring_erd.md](https://github.com/bhdevops-sys/landing_monitoring/blob/main/ERD/landing_monitoring_erd.md).

---

#### Reporting and Visualization

With integration to **Power BI**, users can visualize:

- Trends in fish catch over time.
- Species distribution and health insights.
- Economic data related to fishing practices, including average selling prices.

---

#### Deployment

To deploy the Fish Landing Monitoring Mobile App, follow these steps:

1. Set up your **SQL Azure** database to support incoming data.
2. Configure the AppSheet application to connect to the database securely.
3. Test all functionalities thoroughly to ensure they are operating correctly.
4. Deploy/Publish the application for participating fishermen to access.

---
