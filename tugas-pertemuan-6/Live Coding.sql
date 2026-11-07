SET search_path TO classicmodels;

-- Live coding


SELECT 
	p.nomor_pelanggan,
	p.nama_pelanggan,
	p.kota,
	p.total_pesanan,
	CASE
		WHEN p.total_pesanan > 5 THEN 'Pelanggan Loyal'
		WHEN p.total_pesanan BETWEEN 2 AND 5 THEN 'Prelanggan Aktif'
		WHEN p.total_pesanan = 1 THEN 'Pelanggan Baru'
		ELSE 'Pelanggan Aktif'
	END AS Status_loyalitas
FROM (
	SELECT 
		c.customernumber AS nomor_pelanggan,
		c.customername AS nama_pelanggan,
		c.city AS Kota,
		(
			SELECT COUNT(*) FROM orders o
			WHERE o.customerNumber = c.customerNumber
		)AS total_pesanan 
	FROM customers AS c
) AS p
ORDER BY 
	p.total_pesanan DESC,
	p.nama_pelanggan ASC;




-- 2
SELECT
	e.employeeNumber AS nomor_karyawan,
	CONCAT(e.firstName, ' ', e.lastName) AS nama_lengkap,
	e.email,
	e.officeCode AS kode_kantor
FROM employees e
WHERE e.jobtitle = 'Sales Rep' AND NOT EXISTS(
	SELECT 1 
	FROM customers c
	JOIN orders o
		ON c.customerNumber = o.customerNumber
	WHERE e.employeeNumber = c.salesrepemployeenumber
	AND o.status = 'Shipped' 
)
ORDER BY e.employeeNumber ASC;



-- 3
SELECT 
	p.productCode,
	p.productName,
	p.productLine,
	p.buyPrice 
FROM products p
WHERE p.productLine = 'Classic Cars' AND p.buyPrice  > ALL(
		SELECT buyPrice
		FROM products
		WHERE productLine = 'Vintage Cars'
)
ORDER BY buyPrice ASC;


-- 4
SELECT
    t.customernumber,
    t.customername,

    ROUND(t.total_belanja, 2) AS total_belanja

FROM (
    SELECT
        c.customernumber,
        c.customername,

        COALESCE(
            SUM(od.quantityordered * od.priceeach),
            0
        ) AS total_belanja

    FROM classicmodels.customers AS c

    LEFT JOIN classicmodels.orders AS o
        ON o.customernumber = c.customernumber

    LEFT JOIN classicmodels.orderdetails AS od
        ON od.ordernumber = o.ordernumber

    GROUP BY
        c.customernumber,
        c.customername

) AS t

WHERE t.total_belanja > (

    SELECT AVG(a.total_belanja)

    FROM (
        SELECT
            c2.customernumber,

            COALESCE(
                SUM(od2.quantityordered * od2.priceeach),
                0
            ) AS total_belanja

        FROM classicmodels.customers AS c2

        LEFT JOIN classicmodels.orders AS o2
            ON o2.customernumber = c2.customernumber

        LEFT JOIN classicmodels.orderdetails AS od2
            ON od2.ordernumber = o2.ordernumber

        GROUP BY c2.customernumber

    ) AS a

)

ORDER BY t.total_belanja DESC;




-- 5
BEGIN;

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

UPDATE classicmodels.customers
SET creditlimit = COALESCE(creditlimit, 0) + 10000
WHERE customernumber = 103;

SAVEPOINT sp_update_kredit;

UPDATE classicmodels.customers
SET city = 'Surabaya'
WHERE customernumber = 103;

ROLLBACK TO SAVEPOINT sp_update_kredit;

COMMIT;




-- 6
CREATE TABLE kurir (

    id_kurir SERIAL PRIMARY KEY,

    nama_kurir VARCHAR(50) NOT NULL,

    no_telepon VARCHAR(20) NOT NULL UNIQUE,

    status_aktif BOOLEAN DEFAULT TRUE

);

CREATE TABLE pengiriman (

    id_pengiriman SERIAL PRIMARY KEY,

    nomor_resi VARCHAR(30) NOT NULL UNIQUE,

    id_kurir INTEGER,

    tanggal_kirim TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    ongkos_kirim NUMERIC(12,2) NOT NULL,

    status_pengiriman VARCHAR(20)
        DEFAULT 'Dalam Perjalanan',

    CONSTRAINT chk_pengiriman_ongkos
        CHECK (ongkos_kirim > 0),

    CONSTRAINT fk_pengiriman_kurir
        FOREIGN KEY (id_kurir)
        REFERENCES kurir(id_kurir)

);


CREATE INDEX idx_pengiriman_kurir
ON pengiriman USING btree (id_kurir);

	
CREATE INDEX idx_pengiriman_status
ON pengiriman USING btree (status_pengiriman);


DROP INDEX IF EXISTS idx_pengiriman_status;




