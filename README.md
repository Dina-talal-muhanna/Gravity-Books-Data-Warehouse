# Gravity Books Data Warehouse

[cite_start]End-to-end Data Warehouse system designed for a bookstore to transform operational data into actionable insights[cite: 22, 23].

## 🛠 Tech Stack
- [cite_start]**SQL Server Integration Services (SSIS):** For ETL pipeline design[cite: 24, 31].
- [cite_start]**SQL Server:** Database management[cite: 24, 30].
- [cite_start]**Power BI:** Data visualization.

## 🏗 Project Architecture
[cite_start]The project utilizes a Star Schema dimensional model to support analytical reporting[cite: 23]. 
- **Control Flow:** Orchestrates the execution of multiple data packages.
- [cite_start]**Data Flow:** Handles data extraction, conversion, and loading into the warehouse[cite: 23, 31].

## 📊 Pipeline Visuals
*Examples of the implemented Data Flow tasks:*
![Fact Sales Pipeline](images/Fact_saLesS.png)
![Data Flow Process](images/Book-Author.png)
