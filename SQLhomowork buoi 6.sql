SELECT TOP 10 PERCENT
   tra.transaction_id,
   SUM(tra.charged_amount) AS total_amount
FROM
   dbo.fact_transaction_2019 AS tra
LEFT JOIN
   dbo.dim_scenario AS sce ON tra.scenario_id = sce.scenario_id
LEFT JOIN
   dbo.dim_status AS sta ON sta.status_id = tra.status_id
WHERE
   MONTH(tra.transaction_time) = 2 AND
   sta.status_description <> 'success'
GROUP BY
   tra.transaction_id
ORDER BY
   total_amount DESC;
