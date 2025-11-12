# marketing-bi-dashboard
This is a personal project consisting on a Business Intelligence Dashboard. The goal is to get experience on the following technology and aptitudes: Tableau, SQL Server and Data Analytics. 


📊 Marketing KPIs BI Dashboard
This project is an end-to-end Business Intelligence dashboard designed for tracking and analyzing marketing Key Performance Indicators (KPIs).

The objective is to transform raw campaign data, stored in a SQL Server database, into an interactive and actionable Tableau dashboard that allows a marketing team to make data-driven decisions.

This project was developed as part of my Computer Science Engineering portfolio.

🔗 Interactive Dashboard (Tableau Public Link)
[TABLEAU PUBLIC LINK - PENDING]

Note: The final dashboard will be published here once the Tableau student license is activated.

📸 Dashboard Sneak Peek (Pending)
(Screenshots of your final dashboard will go here)

🛠️ Tech Stack
This project uses a modern data stack, covering everything from data storage to visualization.

Visualization:

Tableau Desktop: Used for dashboard design and live data connection.

Database:

Microsoft SQL Server: (Specifically, the mcr.microsoft.com/azure-sql-edge image for Mac ARM64 compatibility).

Docker: To run the SQL server in a local container.

Analysis & Scripting:

SQL (T-SQL): For schema creation, mock data insertion, and creating a View to pre-calculate KPIs (CPL, CPA, Conversion Rate).

Tooling (Workflow):

Azure Data Studio: As the SQL client for macOS.

Git & GitHub: For version control, using a feature-branch-based workflow (GitFlow).

🚀 How to Run Locally
Follow these steps to get the entire project running on your local machine.

1. Prerequisites
Ensure you have the following software installed:

Git

Docker Desktop

Azure Data Studio (or any SQL client)

Tableau Desktop (the key we are waiting for!)

2. Clone the Repository
Open your terminal and clone this project:

Bash

git clone https://github.com/YOUR_USERNAME/marketing-bi-dashboard.git
cd marketing-bi-dashboard
3. Start the Database (Docker)
The SQL Server instance runs inside a Docker container. Make sure Docker Desktop is open and running.

Then, run the following command in your terminal to start the sql_server_project container (using the password ProjectSql-2025!):

Bash

# This command uses the azure-sql-edge image, compatible with Apple Silicon (M1/M2/M3)
# We use single quotes for the password to avoid terminal errors (dquote>)

docker run -e "ACCEPT_EULA=Y" -e 'SA_PASSWORD=ProjectSql-2025!' -p 1433:1433 --name sql_server_project -d mcr.microsoft.com/azure-sql-edge
You can verify it's running in the Docker Desktop app (it should have a green "running" icon).

4. Run the SQL Scripts
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

5. Visualize in Tableau
Open the Marketing_Dashboard.twb file (we haven't created this yet) with Tableau Desktop.

Tableau will detect the data connection. If it asks for credentials, use the same ones from Step 4.

The dashboard should load with all the data!