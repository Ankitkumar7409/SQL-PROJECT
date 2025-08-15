create database OnlineBookStore;
use OnlineBookStore;
select * from books;
select * from customers;
select * from orders;
-- 1) Retrieve all books in the "fiction" genre:
select * from books where genre = "fiction";

-- 2) Find books published after the year 1950:
select * from books where published_year > 1950;

-- 3) List all the customers from Canada:
select * from customers where country = "Canada";

-- 4) Show orders placed in november 2023:
select * from orders where Order_Date between "2023-11-1" and "2023-11-30";

-- 5)Retrieve the total stock of books available:
select sum(stock) as total_stock from books; 

-- 6) Find the details of the most expensive book:
select * from books order by price desc limit 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:
select * from orders where quantity>1;

-- 8) Retrieve all orders where the total amount exceeds $20:
select * from orders where total_amount >20; 

-- 9) List all genres available in the book table:
select distinct genre from books;

-- 10) Find the book with the lowest stock:
select * from books order by stock asc limit 5;

-- 11) Calculate the total revenue genrated from all orders:
SELECT 
    SUM(total_amount) AS revenue
FROM
    Orders;
    
-- Advance Questions:
-- 1) Retrieve the total number of books sold for each genre: 
select b.genre , sum(o.quantity) as total_qty_sold from orders as o 
join books as b on b.book_id = o.book_id
group by b.genre;

-- 2) find the average price of books in the "fantasy" genre:
select avg(price) from books  where genre = "fantasy";

-- 3) List customers who have placed at least 2 orders:
select o.customer_id , c.name , count(o.order_id) as order_count from orders as o
join customers as c on o.customer_id = c.customer_id
group by customer_id , c.name
having count(order_id)>=2;

-- 4) Find the most frequently ordered book:
select o.book_id , b.title , count(O.order_id) as order_count from orders as o join books as b
on o.book_id = b.book_id
group by o.book_id , b.title
order by order_count desc limit 1;

-- 5( Show the top 3 most expensive books of "Fantasy" genre:
select title, price  from books where genre = "Fantasy" order by price desc limit 3;

-- 6) Retrieve the total quantity of books sold by each author:
select b.author , sum(o.quantity) as total_quantity from books as b join orders as o 
on b.book_id = o.book_id
group by author;

-- 7) list the city where customers who spent over $30 are located:
select distinct c.city , o.total_amount from customers as c join orders as o 
on c.customer_id = o.customer_id
where o.total_amount >30;

-- 8) Find the customers who spent the most on orders:
select c.name , sum(o.total_amount) as total_amount from customers as c join orders as o
on c.customer_id = o.customer_id
group by name
order by total_amount desc;
