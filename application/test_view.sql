SELECT DISTINCT(date_field)
    ,IFNULL(`t_absen_datang`.absen_date_time,0) as datang
    ,IFNULL(`t_absen_pulang`.absen_date_time,0) as pulang
    ,IFNULL(`t_absen_datang`.absen_date,0)
    ,`t_absen_datang`.absen_user_id as uid_datang
    ,`t_absen_datang`.absen_status as status_datang
    ,`t_absen_pulang`.absen_user_id as uid_pulang
    ,`t_absen_pulang`.absen_status as status_pulang
    FROM 
    (SELECT date_field
        FROM
        (
            SELECT
                MAKEDATE(2025,1) +
                INTERVAL ('4'-1) MONTH +
                INTERVAL daynum DAY date_field
            FROM
            (
                SELECT t*10+u daynum
                FROM
                    (SELECT 0 t UNION SELECT 1 UNION SELECT 2 UNION SELECT 3) A,
                    (SELECT 0 u UNION SELECT 1 UNION SELECT 2 UNION SELECT 3
                    UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7
                    UNION SELECT 8 UNION SELECT 9) B
                ORDER BY daynum
            ) AA
        ) AAA
        WHERE MONTH(date_field) = '4') AS tbday
        LEFT JOIN 
        (SELECT absen_date_time,absen_date,absen_user_id,absen_status FROM t_absen) as t_absen_datang 
        ON tbday.date_field = t_absen_datang.absen_date 
        LEFT JOIN 
        (SELECT absen_date_time,absen_date,absen_user_id,absen_status FROM t_absen_out) as t_absen_pulang 
        ON tbday.date_field = t_absen_pulang.absen_date 
        GROUP BY date_field;