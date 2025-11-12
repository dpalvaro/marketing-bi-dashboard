-- sql/01_create_schema.sql

-- 1. Tabla de Campañas
-- Almacena información general sobre cada campaña de marketing.
CREATE TABLE Campaigns (
    CampaignID INT PRIMARY KEY IDENTITY(1,1),
    CampaignName VARCHAR(255) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    Budget DECIMAL(18, 2)
);

-- 2. Tabla de Gasto Diario
-- Registra cuánto se gasta por campaña cada día.
CREATE TABLE DailySpend (
    SpendID INT PRIMARY KEY IDENTITY(1,1),
    CampaignID INT FOREIGN KEY REFERENCES Campaigns(CampaignID),
    Spend_Date DATE NOT NULL,
    AmountSpent DECIMAL(18, 2) NOT NULL
);

-- 3. Tabla de Leads
-- Registra cada lead generado, de dónde vino y si se convirtió en cliente.
CREATE TABLE Leads (
    LeadID INT PRIMARY KEY IDENTITY(1,1),
    CampaignID INT FOREIGN KEY REFERENCES Campaigns(CampaignID),
    Lead_Date DATE NOT NULL,
    Source VARCHAR(100), -- Ej: 'Google Ads', 'Facebook', 'Organic'
    Converted BIT NOT NULL DEFAULT 0 -- 0 = No, 1 = Sí (Convertido en cliente)
);