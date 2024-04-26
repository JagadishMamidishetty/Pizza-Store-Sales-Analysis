-- calculate the percentage contribution of each pizza type to total revenue


SELECT pizza_types.category, 
       round((sum(orders_details.quantity * pizzas.price) /(SELECT 
    ROUND(SUM(orders_details.quantity * pizzas.price),
            2) AS total_revenue
FROM
    orders_details
        JOIN
    pizzas ON pizzas.pizza_id = orders_details.pizza_id)) *100,2) as revenue
FROM pizza_types 
JOIN pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
JOIN orders_details ON orders_details.pizza_id = pizzas.pizza_id
group by pizza_types.category
order by revenue desc ;