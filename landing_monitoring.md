### Fish Landing Monitoring Mobile App Documentation

#### Introduction

The Fish Landing Monitoring Mobile App is developed to assist fishermen in capturing and reporting landing data effectively.
This app allows users to log various details such as species caught, landing and capture sites, vessel and gear used, total weight, 
sold weight, and pricing in Kenyan Shillings (KES). Built using **AppSheet**, the data is stored in a **Microsoft SQL Azure** 
database and visualized with **Power BI** for improved resource management and transparency.

---

#### Table of Contents

1. [Features](#features)
2. [Technology Stack](#technology-stack)
3. [Business Process](#business-process)
4. [User Guide](#user-guide)
5. [Data Structure](#data-structure)
6. [Reporting and Visualization](#reporting-and-visualization)
7. [Deployment](#deployment)
8. [Contact Information](#contact-information)

---

#### Features

- **Catch Logging:** Fishermen can log details of fish caught, including species, capture site, and methods used.
- **Landing Site Information:** Records data on landing sites and associated Beach Management Units (BMUs).
- **Weight and Pricing:** Input total weight, sold weight, and pricing for fish in KES.
- **Data Verification:** Submitted data is verified by Bahari Hai Fisheries Program staff for accuracy.
- **Data Analysis:** Enables deeper insights into fishing trends, species health, and economic factors.

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
     - Fish species caught
     - Capture site (GPS location)
     - Landing site
     - Beach Management Unit (BMU)
     - Vessel and gear used
     - Total weight (in kilograms) and sold weight
     - Price per kilogram (KES)

3. **Data Submission:** Fishermen submit the data for review. 

4. **Data Verification:**
   - Bahari Hai Fisheries Program staff verify the submitted data for accuracy and completeness.
   - Any discrepancies are flagged, and fishermen may be contacted for clarification.

5. **Data Storage:** Once verified, the data is stored in a **Microsoft SQL Azure** database for secure and efficient access.

6. **Data Analysis:** The collected data can be accessed and analyzed using **Power BI** for insights related to fishing practices and trends.

---

#### User Guide

1. **Creating an Account:**
   - Download the app from the device’s app store.
   - Register an account using your email and a secure password.

2. **Navigating the Interface:**
   - **Home Screen:** Offers options for data logging, reports, and user settings.
   - **Log Catch:** Select this option to enter fish catch details.

3. **Logging Data:**
   - Complete the required fields including species, capture site, weight, and price.
   - Submit the entry for verification.

4. **Receiving Feedback:**
   - Stay updated on the status of your submission through notifications regarding verification results.

---

#### Data Structure

##### Database Tables

| Table Name           | Description                                               |
|----------------------|-----------------------------------------------------------|
| FishCatches          | Records details of fish caught including species, weights, and prices. |
| LandingSites         | Stores information about landing sites and associated BMUs. |
| CaptureSites         | Maintains records of locations where fish were captured. |
| VesselsAndGear       | Captures data regarding vessels and gear utilized in fishing. |
| PriceInfo            | Contains price data for fish per species.                |

##### Entity-Relationship Diagram (ERD)

For a visual representation of the database structure, refer to the [Entity-Relationship Diagram (ERD)](ERD/fish_landing_monitoring_erd.md).

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
4. Publish the application for participating fishermen to access.

---
