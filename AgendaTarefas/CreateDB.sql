create table `usuarios`(
`id` int(11) not null auto_increment,
`nome` varchar(200) not null,
`telefone` varchar(200) not null,
`email` varchar(200) not null,
`senha` varchar(200) not null,
primary key (id)
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_general_ci;

create table `tarefas`(
`id` int(11) not null auto_increment,
`titulo` varchar(200) not null,
`descricao` varchar(200) not null,
`data_criacao` varchar(200) not null,
`data_conclusao` varchar(200) not null,
`status` varchar(200) not null,
`id_usuario` int(11) not null,
primary key (id)
)engine=InnoDB default charset=utf8mb4 collate=utf8mb4_general_ci;

select * from usuarios;
select * from tarefas;