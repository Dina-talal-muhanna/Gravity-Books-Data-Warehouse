# 📚 Gravity Books — Data Warehouse & ETL Pipeline

A fully implemented **Data Warehouse** and **ETL pipeline** for the Gravity Books dataset, built using **SQL Server**, **SSIS**, and **Power BI**.

---

## 🏗️ Architecture Overview

The project follows a **Star Schema** design, loading data from the OLTP source (`gravity_books`) into a dedicated DWH (`GravityBooks_DWH`) using SSIS ETL packages.

### Dimension Tables
| Table | Description |
|---|---|
| `Dim_Customer` | Customer details |
| `Dim_Address` | Address info |
| `Dim_Customer_Address` | Customer ↔ Address mapping |
| `Dim_Book` | Book details (title, ISBN, language, publisher) |
| `Dim_Author` | Author details |
| `Dim_Book_Author` | Book ↔ Author mapping |
| `Dim_Order_Line` | Order line items |
| `Dim_Order_History` | Order history with status & date |
| `Dim_Order_History_Status` | Status lookup |
| `Dim_Shipping_Method` | Shipping methods |

### Fact Table
| Table | Description |
|---|---|
| `Fact_Sales` | Central fact table with Price, Quantity, and all dimension keys |

---

## ⚙️ ETL Pipeline (SSIS)

Built with **SQL Server Integration Services (SSIS)** — 11 packages orchestrated via a **Master ETL package**.

**Transformations used:**
- `Data Conversion` — for data type alignment
- `Lookup` — for resolving surrogate keys from dimension tables
- `OLE DB Source / Destination` — for SQL Server connectivity

**Packages:**
```
├── Load_Dim_Address.dtsx
├── Load_Dim_Author.dtsx
├── Load_Dim_Book.dtsx
├── Load_Dim_Book_Author.dtsx
├── Load_Dim_Customer.dtsx
├── Load_Dim_Customer_Address.dtsx
├── Load_Dim_Order_History.dtsx
├── Load_Dim_Order_History_Status.dtsx
├── Load_Dim_Order_Line.dtsx
├── Load_Dim_Shipping_Method.dtsx
├── Load_Fact_Sales.dtsx
└── Master_ETL_Process.dtsx
```

---

## ✅ Data Validation

Post-load validation confirmed full data integrity:

| Check | Source | DWH |
|---|---|---|
| Total Orders | 15,400 | 15,400 ✅ |
| Total Revenue | 154,326.69 | 154,326.69 ✅ |
| Null Keys | — | 0 ✅ |

---

## 📊 Power BI Dashboard

An interactive dashboard built on top of the DWH with the following KPIs:

- 💰 **Total Revenue:** 154.33K
- 📦 **Total Orders:** 15K
- 📚 **Total Quantity:** 15K
- 💵 **Average Book Price:** 10.02

**Visuals include:**
- Revenue by Book Title
- Orders by Shipping Method
- Orders by Language
- Orders by Status
- Revenue Trend by Year & Shipping Method
- Country & Status slicers

---

## 🛠️ Tech Stack

![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
![SSIS](https://img.shields.io/badge/SSIS-ETL-blue?style=for-the-badge)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)

---

## 📁 Repository Structure

```
├── SSIS/               # SSIS packages (.dtsx)
├── SQL/                # DWH schema creation scripts
├── Dashboard/          # Power BI .pbix file
└── Screenshots/        # SSIS & Dashboard screenshots
```
