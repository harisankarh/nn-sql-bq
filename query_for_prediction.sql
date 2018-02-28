SELECT
  (SUM(CASE
        WHEN y_hat = y THEN 1
        ELSE 0 END)/COUNT(1))*100.0 AS accuracy_perc
FROM (
  SELECT
    *,
    (CASE
        WHEN scores_0 > scores_1 THEN 0
        ELSE 1 END) AS y_hat
  FROM (
    SELECT
      *,
      ((d0*w2_00 + d1*w2_10) + b2_0) AS scores_0,
      ((d0*w2_01 + d1*w2_11) + b2_1) AS scores_1
    FROM (
      SELECT
        *,
        (CASE
            WHEN ((x1*w_00 + x2*w_10) + b_0) > 0.0 THEN ((x1*w_00 + x2*w_10) + b_0)
            ELSE 0.0 END) AS d0,
        (CASE
            WHEN ((x1*w_01 + x2*w_11) + b_0) > 0.0 THEN ((x1*w_01 + x2*w_11) + b_1)
            ELSE 0.0 END) AS d1
      FROM ( (
          SELECT
            *
          FROM
            `example_project.example_dataset.example_table_agg` )))))
