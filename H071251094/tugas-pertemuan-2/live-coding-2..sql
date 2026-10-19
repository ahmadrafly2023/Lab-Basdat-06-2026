SELECT DISTINCT
	status AS "status pesanan"
from ClassicModels.Orders
where status != 'cancelled'
order by status desc
limit 3 offset 1;