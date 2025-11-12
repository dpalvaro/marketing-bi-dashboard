-- sql/02_insert_mock_data.sql

-- Insertar Campañas de Ejemplo
INSERT INTO Campaigns (CampaignName, StartDate, EndDate, Budget)
VALUES
('Campaña Verano 2024 (Google)', '2024-06-01', '2024-08-31', 5000.00),
('Lanzamiento Producto X (Facebook)', '2024-07-15', '2024-08-15', 3500.00),
('Email Marketing Q3', '2024-07-01', '2024-09-30', 1500.00);

-- Insertar Gasto de Ejemplo (Simulado)
-- Campaña 1
INSERT INTO DailySpend (CampaignID, Spend_Date, AmountSpent)
VALUES
(1, '2024-07-20', 150.00), (1, '2024-07-21', 175.50), (1, '2024-07-22', 160.20);
-- Campaña 2
INSERT INTO DailySpend (CampaignID, Spend_Date, AmountSpent)
VALUES
(2, '2024-07-20', 200.00), (2, '2024-07-21', 210.00), (2, '2024-07-22', 190.75);
-- Campaña 3
INSERT INTO DailySpend (CampaignID, Spend_Date, AmountSpent)
VALUES
(3, '2024-07-20', 50.00), (3, '2024-07-21', 45.50), (3, '2024-07-22', 55.00);

-- Insertar Leads de Ejemplo
-- Campaña 1
INSERT INTO Leads (CampaignID, Lead_Date, Source, Converted)
VALUES
(1, '2024-07-21', 'Google Ads', 1), (1, '2024-07-21', 'Google Ads', 0), (1, '2024-07-22', 'Google Ads', 1);
-- Campaña 2
INSERT INTO Leads (CampaignID, Lead_Date, Source, Converted)
VALUES
(2, '2024-07-21', 'Facebook', 0), (2, '2024-07-22', 'Facebook', 0), (2, '2024-07-22', 'Facebook', 1);
-- Campaña 3
INSERT INTO Leads (CampaignID, Lead_Date, Source, Converted)
VALUES
(3, '2024-07-21', 'Email', 1), (3, '2024-07-22', 'Email', 1), (3, '2024-07-22', 'Email', 0);