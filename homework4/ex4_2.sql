drop table users;
drop table channels;
drop table chats;
drop table follows;
drop table blocks;

create table `users` (

    `id` int not null auto_increment,
    `user_id` varchar(20),
    `user_pw` varchar(20),
    `user_name` varchar(20) not null unique,
    `profile_img` varchar(200),
    `profile_msg` varchar(200),
    `is_resigned` tinyint default 0,
    `sign_up_date` date,
    primary key(`id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table `channels` (

    `id` int not null auto_increment,
    `name` varchar(20) not null unique,
    `creator` varchar(20) not null,
    `link` varchar(200),
    `max_users` int,
    `is_resigned` tinyint default 0,
    `creation_date` date,
    primary key(`id`),
    foreign key(`creator`) references `users`(`user_name`) on delete cascade

) ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table `chats` (

    `id` int not null auto_increment,
    `talks` varchar(200),
    `channel` varchar(20) not null,
    `creation_date` date,
    primary key(`id`),
    foreign key(`channel`) references `channels`(`name`) on delete cascade

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table `follows` (

    `id` int not null auto_increment,
    `follower` varchar(20) not null,
    `followee` varchar(20) not null,
    `date` date,
    primary key(`id`),
    foreign key(`follower`) references `users`(`user_name`) on delete cascade,
    foreign key(`followee`) references `users`(`user_name`) on delete cascade

) ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table `blocks` (

    `id` int not null auto_increment,
    `bans` varchar(20) not null,
    `banned` varchar(20) not null,
    `date` date,
    primary key(`id`),
    foreign key(`bans`) references `users`(`user_name`) on delete cascade,
    foreign key(`banned`) references `users`(`user_name`) on delete cascade

) ENGINE=InnoDB DEFAULT CHARSET=utf8;