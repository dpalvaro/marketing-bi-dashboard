-- sql/03_create_kpi_view.sql
-- Esta VISTA (VIEW) consolida todos nuestros datos y calcula los KPIs por campaña.
-- Tableau se conectará directamente a esta vista.

CREATE VIEW v_Marketing_KPIs
AS
SELECT
    -- Información de la Campaña
    c.CampaignID,
    c.CampaignName,
    c.Budget,
    
    -- Agregados de Gasto
    ISNULL(SUM(ds.AmountSpent), 0) AS TotalSpent,
    
    -- Agregados de Leads
    ISNULL(COUNT(l.LeadID), 0) AS TotalLeads,
    
    -- Agregados de Conversiones
    ISNULL(SUM(CAST(l.Converted AS INT)), 0) AS TotalConversions,
    
    -- KPIs Calculados
    
    -- Costo Por Lead (CPL): Gasto Total / Total Leads
    -- Usamos NULLIF para evitar la división por cero
    CASE 
        WHEN ISNULL(COUNT(l.LeadID), 0) = 0 THEN 0
        ELSE ISNULL(SUM(ds.AmountSpent), 0) / NULLIF(COUNT(l.LeadID), 0)
    END AS CPL,
    
    -- Costo Por Adquisición (CPA): Gasto Total / Total Conversiones
    CASE 
        WHEN ISNULL(SUM(CAST(l.Converted AS INT)), 0) = 0 THEN 0
        ELSE ISNULL(SUM(ds.AmountSpent), 0) / NULLIF(SUM(CAST(l.Converted AS INT)), 0)
    END AS CPA,
    
    -- Tasa de Conversión (Conversion Rate): (Total Conversiones / Total Leads) * 100
    CASE 
        WHEN ISNULL(COUNT(l.LeadID), 0) = 0 THEN 0
        ELSE (CAST(ISNULL(SUM(CAST(l.Converted AS INT)), 0) AS FLOAT) / NULLIF(COUNT(l.LeadID), 0)) * 100
    END AS ConversionRate_Percent

FROM 
    Campaigns c
LEFT JOIN 
    DailySpend ds ON c.CampaignID = ds.CampaignID
LEFT JOIN 
    Leads l ON c.CampaignID = l.CampaignID
GROUP BY
    c.CampaignID, c.CampaignName, c.Budget;
GO