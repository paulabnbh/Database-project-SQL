-- 1) average rental duration per film
select title, avg(rental_duration) as avg_rental_duration from film
group by title
;

-- 2) Number of actors in every movie.
select title, count(actors.full_name) as avg_num_actors from film
left join film_actor on film.film_id = film_actor.film_id
left join actors on film_actor.actor_id = actors.actor_id

group by title
;

-- 3) Most frequent category
select category.category, count(film.category_id) as num_movies from category
left join film on category.category_id = film.category_id
group by category
limit 1
;

-- 4) Top 3 longest movies
select title, length from film
order by length desc
limit 3
;

-- 5) Show the movie with the most expensive replacement cost
select title, replacement_cost from film
order by replacement_cost desc
limit 1
;

-- 6) Category per movie
select title, category from film
left join category on film.category_id = category.category_id
;

-- 7) Language per movie
select title, language from film
left join language on film.language_id = language.language_id
;

-- 8) Movie and description
select title, description from film
;

-- 9) Top 5 actors with the highest number of movies
select full_name, count(film_actor.film_id) as number_films from actors
left join film_actor on actors.actor_id = film_actor.actor_id

group by full_name
order by number_films desc
limit 5
;

-- 10) Top 3 categories with the highest number of films.
select category.category, count(film.category_id) as number_films from category
left join film on category.category_id = film.category_id

group by category
order by number_films desc
limit 3