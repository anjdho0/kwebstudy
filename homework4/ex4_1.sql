drop table `student`;

create table `student` (
    `name` varchar(8) not null,
    `id` int not null,
    `year_of_addmission` date not null,
    `major` varchar(32) not null,
    `phone_number` varchar(11),
    `address` varchar(32),
    `accumulated_credits` int default 0,
    `average_grade` double default 0.0,
    `is_registered` tinyint
) ENGINE=InnoDB DEFAULT CHARSET=utf8;