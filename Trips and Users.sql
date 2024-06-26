select t.request_at as Day,
round(sum(case when status = 'cancelled_by_client' or status = 'cancelled_by_driver' then 1 else 0 end)/count(*),2) 'Cancellation Rate'
from trips t join users u on t.id = u.users_id 
where client_id in (select users_id from users where banned = "No") and
driver_id in (select users_id from users where banned = "No")
and (t.request_at between '2013-10-01' and '2013-10-03')
group by 1

# select request_at "Day",
# round((sum(case when status = 'cancelled_by_driver' 
# or status = 'cancelled_by_client' then 1 else 0 end)/count(*)),2) 'Cancellation Rate'
# from Trips
# where client_id in (select users_id from Users where role = 'client' and banned ='No') 
# and 
# driver_id in (select users_id from Users where role = 'driver' and banned ='No') 
# and 
# request_at between '2013-10-01' and '2013-10-03'
# group by 1
