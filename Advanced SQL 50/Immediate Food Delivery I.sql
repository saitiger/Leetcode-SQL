select round((case when order_date = customer_pref_delivery_date then 1 else 0 end)/
(select count(*) from Delivery),2)
from 
Delivery 
