# marketing-bi-dashboard
This is a personal project consisting on a Business Intelligence Dashboard. The goal is to get experience on the following technology and aptitudes: Tableau, SQL Server and Data Analytics. 


# 📊 Marketing KPIs BI Dashboard

This project is an end-to-end Business Intelligence dashboard designed for tracking and analyzing marketing Key Performance Indicators (KPIs).

The objective is to transform raw campaign data, stored in a SQL Server database, into an interactive and actionable Tableau dashboard that allows a marketing team to make data-driven decisions.

This project was developed as part of my Computer Science Engineering portfolio.

### 🔗 Interactive Dashboard (Tableau Public Link)

> **[TABLEAU PUBLIC LINK - PENDING]**
>
> *Note: The final dashboard will be published here after construction.*

### 📸 Dashboard Sneak Peek (Pending)

*(Screenshots of the final dashboard will go here)*

---

## 🛠️ Tech Stack

This project uses a modern data stack, covering everything from data storage to visualization.

* **Visualization:**
    * **Tableau Public Desktop:** Used for dashboard design and visualization of static data extracts.

* **Database (Backend & ETL):**
    * **Microsoft SQL Server:** (Specifically, the `mcr.microsoft.com/azure-sql-edge` image for Mac ARM64 compatibility).
    * **Docker:** To run the SQL server in a local container.

* **Analysis & Scripting:**
    * **SQL (T-SQL):** For schema creation, data insertion, and creating a **View** to pre-calculate KPIs (CPL, CPA, Conversion Rate). The final view is then exported for Tableau.

* **Tooling (Workflow):**
    * **Azure Data Studio:** As the SQL client for macOS and for exporting the final data.
    * **Git & GitHub:** For version control, using a feature-branch-based workflow.

---

## 🚀 How to Run Locally

Follow these steps to get the entire project running on your local machine.

### 1. Prerequisites

Ensure you have the following software installed:
* [Git](https://git-scm.com/downloads)
* [Docker Desktop](https://www.docker.com/products/docker-desktop/)
* [Azure Data Studio](https://learn.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio)
* [Tableau Public Desktop](https://public.tableau.com/en-us/s/download)

### 2. Clone the Repository
Open your terminal and clone this project:

Bash

git clone https://github.com/YOUR_USERNAME/marketing-bi-dashboard.git
cd marketing-bi-dashboard
### 3. Start the Database (Docker)
The SQL Server instance runs inside a Docker container. Make sure Docker Desktop is open and running.

Then, run the following command in your terminal to start the sql_server_project container (using the password ProjectSql-2025!):

Bash

# This command uses the azure-sql-edge image, compatible with Apple Silicon (M1/M2/M3)
# We use single quotes for the password to avoid terminal errors (dquote>)

docker run -e "ACCEPT_EULA=Y" -e 'SA_PASSWORD=ProjectSql-2025!' -p 1433:1433 --name sql_server_project -d mcr.microsoft.com/azure-sql-edge
You can verify it's running in the Docker Desktop app (it should have a green "running" icon).

### 4. Run the SQL Scripts ("Backend")
Now, let's create the database and populate it with data.

Open Azure Data Studio.

Connect to your local server using these credentials:

Server: localhost

Authentication: SQL Login

User: sa

Password: ProjectSql-2025!

Once connected, run the following scripts from the sql/ folder in order:

sql/01_create_database.sql - (Creates the MarketingDashboard DB)

Important! Change your connection to point to the new MarketingDashboard database.

sql/02_create_schema.sql - (Creates the Campaigns, DailySpend, and Leads tables)

sql/03_insert_mock_data.sql - (Inserts the sample data)

sql/04_create_kpi_view.sql - (Creates the v_Marketing_KPIs view that calculates everything)

(Optional) Verify everything is working by running: SELECT * FROM v_Marketing_KPIs;

### 5. Export Data for Tableau (The "Bridge")
Tableau Public cannot connect to SQL Server directly. We must export our pre-calculated data.

In Azure Data Studio, after running SELECT * FROM v_Marketing_KPIs;, look at the results panel.

Click the "Save as Excel" icon on the far right of the results toolbar.

Save this file in the root of your project folder as tableau_data_source.xlsx.

(Self-note: This file is already included in the .gitignore and will not be committed to the repo, as it's a data file).


### 6. Visualize in Tableau Public
Open the Tableau Public Desktop application.

On the "Connect" panel, click on "Microsoft Excel".

Select the tableau_data_source.xlsx file you just saved.

Tableau will load the data. Now you can drag, drop, and build your dashboard using the pre-calculated KPIs.
