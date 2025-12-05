----Display the 5 most expensive products
select product_name, category, price
from products
order by price desc
limit 5

----Total spent by each client
select c.customer_id, c.first_name, c.last_name, sum(o.total_price) as total_spent
from customers as c
left join orders as o on c.customer_id=o.customer_id
group by c.customer_id

----Display for order 10: products, quantity, price. 
select oi.order_id, oi.quantity, oi.price_at_purchase, p.product_name
from order_items oi 
join products p on oi.product_id=p.product_id
where oi.order_id=10

----Number of orders per day 
select order_date, count(*) as nmbr_of_order
from orders
group by order_date
order by order_date

----Top 5 best-selling products
select p.product_name, sum(oi.quantity) as total_sold
from products p
join order_items oi on p.product_id=oi.product_id
group by p.product_name
order by total_sold
LIMIT 5;

----The best customers (largest total spent)
select c.customer_id, c.first_name, c.last_name, sum(o.total_price) as total_spent
from customers c
join orders o on c.customer_id=o.customer_id
group by c.customer_id 
order by total_spent desc

----Products with an average rating < 3
select product_name, average_rating
from (
	  select p.product_name, avg(r.rating) as average_rating 
	  from products p
	  join reviews r on p.product_id=r.product_id
	  group by p.product_id)
where average_rating<3
------or used having
select p.product_name, AVG(r.rating) AS avg_rating
from reviews r
join products p ON r.product_id = p.product_id
group by p.product_id
having AVG(r.rating) < 3;

----average delivery time
select avg(delivery_date-shipment_date) as avg_delivery_date
from shipments
where delivery_date is not null

----Total sales by supplier
select s.supplier_name, sum(oi.quantity*oi.price_at_purchase) as supplier_revenue
from suppliers s 
join products p on s.supplier_id= p.supplier_id
join order_items oi on oi.product_id=p.product_id
group by s.supplier_id

----Find customers who have never left a review
select c.customer_id, c.first_name, c.last_name
from customers c
left join reviews r on c.customer_id=r.customer_id
where review_id is null

----Orders delivered more than 7 days late
select shipment_id, shipment_date, delivery_date
from shipments
where (delivery_date-shipment_date)>7

----Revenue by category
select p.category, sum(oi.quantity*oi.price_at_purchase) as revenue
from products p
join order_items oi on oi.product_id=p.product_id
group by category
order by revenue desc

----monthly income
select 
	  extract(month from o.order_date) as month,
	  extract(year from o.order_date) as year,
	  sum(oi.quantity*oi.price_at_purchase) as revenue
from orders o
join order_items oi on o.order_id=oi.order_id
group by month, year
order by year,month asc

----Products never ordered
select p.product_id, p.product_name 
from products p
left join order_items oi on p.product_id=oi.product_id 
where oi.order_item_id is null

----Most profitable supplier
select s.supplier_id, s.supplier_name, sum(oi.quantity*oi.price_at_purchase) as revenue
from suppliers s
join products p on p.supplier_id=s.supplier_id
join order_items oi on oi.product_id=p.product_id
group by s.supplier_id
order by revenue desc
limit 1

----top 5 customers
select c.first_name, c.last_name, sum(o.total_price) as total_price  
from customers c
join orders o on c.customer_id=o.customer_id
group by c.first_name, c.last_name
order by total_price 
limit 5

----revune per month
select 
	 extract(month from order_date) as month,
	 sum(total_price) as total_price 
from orders
group by month
order by month

----avg rating product
select p.product_name, avg(r.rating) as avg_rating
from products p 
join reviews r on p.product_id=r.product_id
group by p.product_name 
order by avg_rating

----Best-selling category
select p.category, sum(oi.quantity) as sum_quantity
from products p
join order_items oi on p.product_id=oi.product_id
group by category
order by sum_quantity desc

-----Overall delivery rate
SELECT 
    ROUND(
        (SUM(CASE WHEN s.shipment_status = 'Delivered' THEN 1 ELSE 0 END)::numeric 
        / COUNT(o.order_id)) * 100, 2
    ) AS delivery_rate_percentage
FROM orders o
LEFT JOIN shipments s ON o.order_id = s.order_id;







