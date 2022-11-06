select `users`.`id` as `user_id`, `users`.`name` as `user_name`, `tickets`.`seat_number` 
from `users` inner join `tickets` on `users`.`id`=`tickets`.`user` 
where `tickets`.`train`=11 order by `tickets`.`seat_number` asc;

select `users`.`id` as `user_id`, `users`.`name` as `user_name`, Count(`users`.`id`) as `trains_count`, Sum(`trains`.`distance`) as `total_distance`
from `users` inner join `tickets` on `users`.`id`=`tickets`.`user` inner join `trains` on `trains`.`id`=`tickets`.`train`
group by `user_id` order by `total_distance` desc limit 0, 6;

select `trains`.`id` as `id`, `types`.`name` as `type`, `source`.`name` as `src_stn`, `destination`.`name` as `dst_stn`, Timediff(`trains`.`arrival`, `trains`.`departure`) as `travel_time`
from `trains` inner join `types` on `trains`.`type`=`types`.`id` inner join `stations` as `source` on `source`.`id`=`trains`.`source` inner join `stations` as `destination` on `destination`.`id`=`trains`.`destination`
order by `travel_time` desc limit 0,6;

select `types`.`name` as `type`, `source`.`name` as `src_stn`, `destination`.`name` as `dst_stn`, `trains`.`departure` as `departure`, `trains`.`arrival` as `arrival`, Round(`types`.`fare_rate`*`trains`.`distance`*0.001, -2) as `fare`
from `types` inner join `trains` on `trains`.`type`=`types`.`id` inner join `stations` as `source` on `source`.`id`=`trains`.`source` inner join `stations` as `destination` on `destination`.`id`=`trains`.`destination`
order by `trains`.`departure` asc;

select `trains`.`id` as `id`, 
`types`.`name` as `type`, 
`source`.`name` as `src_stn`, 
`destination`.`name` as `dst_stn`, 
Count(`tickets`.`user`) as `occupied`,
`types`.`max_seats` as `maximum`
from `trains` inner join `types` on `trains`.`type`=`types`.`id` 
inner join `stations` as `source` on `source`.`id`=`trains`.`source` 
inner join `stations` as `destination` on `destination`.`id`=`trains`.`destination`
inner join `tickets` on `tickets`.`train`=`trains`.`id`
group by `trains`.`id` order by `trains`.`id` asc;

select `trains`.`id` as `id`, 
`types`.`name` as `type`, 
`source`.`name` as `src_stn`, 
`destination`.`name` as `dst_stn`, 
Count(`tickets`.`user`) as `occupied`,
`types`.`max_seats` as `maximum`
from `trains` inner join `types` on `trains`.`type`=`types`.`id` 
inner join `stations` as `source` on `source`.`id`=`trains`.`source` 
inner join `stations` as `destination` on `destination`.`id`=`trains`.`destination`
left join `tickets` on `tickets`.`train`=`trains`.`id`
group by `trains`.`id` order by `trains`.`id` asc;
