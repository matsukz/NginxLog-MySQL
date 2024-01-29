CREATE TABLE `nginx_access_log` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `time` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
    `remote_addr` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
    `country` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
    `status` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
    PRIMARY KEY (`id`) 
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;