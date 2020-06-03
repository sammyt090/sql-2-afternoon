-- PART ONE
-- 1.
select * from invoice i
join invoice_line il on il.invoice_id = i.invoice_id
where il.unit_price > 0.99;

-- 2.
select i.invoice_date, c.first_name, c.last_name, i.total
from invoice i
join customer c on i.customer_id = c.customer_id;

-- 3.
select c.first_name, c.last_name, e.first_name, e.last_name
from customer c
join employee e on c.support_rep_id = e.employee_id;

-- 4.

select al.title, ar.name
from album al
join artist ar on al.artist_id = ar.artist_id;

-- 5.

select pt.track_id
from playlist_track pt
join playlist p on p.playlist_id = pt.playlist_id
where p.name = 'Music';

-- 6.

select t.name
from track t
join playlist_track pt on pt.track_id = t.track_id
where pt.playlist_id = 5;

-- 7.

select t.name, p.name
from track t
join playlist_track pt on t.track_id = pt.track_id
join playlist p on pt.playlist_id = p.playlist_id;

-- 8.

select t.name, a.title
from track t
join album a on t.album_id = a.album_id
join genre g on g.genre_id = t.genre_id
where g.name = 'Alternative & Punk';
-- PART TWO

--1.
select * from invoice
where invoice_id in (select invoice_id from invoice_line
                       where unit_price > 0.99);

-- 2.

select * from playlist_track
where playlist_id in (select playlist_id from playlist
                      where name = 'Music');

-- 3.

select name from track
where track_id in (select track_id 
                   from playlist_track
                   where playlist_id =5);

-- 4.

select * from track
where genre_id in
(select genre_id 
from genre
where name = 'Comedy');

-- 5.

select * from track
where album_id in 
(select album_id from album
 where title = 'Fireball');

--  6.

select * from track
where album_id in
(select album_id from album
where artist_id in (select artist_id 
from artist
where name = 'Queen'))


-- PART THREE

-- 1.
select * from customer
where fax is not null

update customer
set fax = null
where fax is not null

-- 2.

select * from customer 
where company is null

update customer
set company = 'Self'
where company is null

-- 3.

update customer
set last_name = 'Thompson'
where first_name = 'Julia'
and last_name = 'Barnett';

-- 4.

update customer
set support_rep_id = 4
where email = 'luisrojas@yahoo.cl';

-- 5.

update track
set composer = 'The darkness around us'
where genre_id = 
(select genre_id 
 from genre
 where name = 'metal') 
 and composer is null


--  PART FOUR

-- 1.
 
 select count(track_id) , g.name
 from track t
 join genre g on t.genre_id = g.genre_id
 group by g.name

--  2.

select count(*), g.name
from track t
join genre g on g.genre_id = t.genre_id
where g.name = 'Pop' or g.name = 'Rock'
group by g.name;

-- 3.

select ar.name, count(*)
from album al
join artist ar on ar.artist_id = al.artist_id
group by ar.name;


-- PART FIVE

-- 1. 

select distinct composer
from track;

-- 2.

select distinct billing_postal_code
from invoice;

-- 3.

select distinct company
from customer;


-- PART SIX

-- 1.

select * from practice_delete
where type = 'bronze'

delete from practice_delete
where type = 'bronze'


-- 2.

select * from practice_delete
where type = 'silver'

delete from practice_delete
where type = 'silver'


-- 3.

select * from practice_delete
where value = 150

delete from practice_delete
where value = 150


-- PART SEVEN

create table users(
  user_id serial primary key,
  name text,
  email varChar(200));
  
  create table products(
    products_id serial primary key,
    name text,
    price float
  	);
  
  create table orders(
    orders_id serial primary key,
    products_id int references products(products_id)
  );
  

  
  insert into users (name, email)
  values ('steve', 'steve@gmail.com'),
  ('Jeff', 'jeff@gmail.com'),
  ('Timmy', 'timmy@gmail.com');
  
  insert into products (name, price)
  values ('Mallkin' , 35),
  ('soap', 50),
  ('wood', 60);
  
  insert into orders (products_id)
  values (1),
  (2),
  (3);

 select * from products
  order by products_id asc
  limit 1 ;


  select * from orders

  select products.name, sum(price) from products
  join users on products.proudcts_id = user.products_id
  group by products.name;


alter table users
add orders_id int references orders(orders_id); 
  
   
  