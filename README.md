# Домашнее задание к занятию "`10.6 «Disaster recovery»`" - `Дьяконов Алексей`

### Задание 1. В чем разница между  DRaaS, BaaS, Active-Active, Active-Passive.

1. `DRaaS (Disaster recovery as a service) - аварийное восстановление как услуга. Облачный сервис для постоянной репликации и восстановления данных.Основные отличия от BaaS - минимальное время восстановления RTO (Recovery Time Objective) и минимальные потери данных - RPO (Recovery Point Objective).`

2. `BaaS (Backup as a service) - резервное копирование как услуга. Фактически является облачным сервисом для резервных копий инфраструктуры.`

3. `Active-Active - вариант отказоустойчивого кластера, при котором все сервера являются master(то есть имеют праван на запись и чтение)`

4. `Active-Passive - вариант отказоустойчивого кластера, при котором есть сервера master(то есть имеют праван на запись и чтение) и slave, на которые идет репликация и имеющие право только на чтение.`

### Задание 2. 

` Так как в условиях  говорится что сеть критична к большим потокам данных, то варианты с DRaaS и кластером не подходят, так как будут нагружать сеть при постоянной репликации. Остаются варианты с BaaS  и отдельным сервером для бэкапов. Вариант с   Baas подходит при условии стабильного и высокоскоростного соединения с интернетом, а так же его резервирования(то есть иметь второго  провайдера). Здесь имеется большой плюс в виде географического распределения( т. е сервер BaaS  находится в другом месте). Мне все же ближе вариант со вторым сервером. Для бэкапов я бы использовал Bacula(простота настройки и управления). Так как системный диск сервера вряд ли будет изменяться часто, то для него будет достаточно полного бэкапа после настройки и отладки, а так же после установки обновлений.  Для дисков  с данными я бы сначала сделал полный бэкап(Понедельник 08.30), а в течении недели, каждый день в 18.05 делал бы инкрементные бэкапы(это уменьшит размеры, но уменьшит скорость восстановления). `


### Задание 3. R-sync

`Я исходил из того, что / - точка монтирования для системного диска, а /data - для диска с данными`

`Файл конфигурации`
-  [rsyncd.conf](./config/rsyncd.conf)

`Скрипт бэкапа системного диска`
-  [sys-full-bakcup.sh](./config/sys-full-bakcup.sh)

`Скрипт полного бэкапа диска с данными`
-  [data_backup_full.sh](./config/data_backup_full.sh)

`Скрипт инкрементного бэкапа диска с данными`
-  [data-inc-backup.sh](./config/data-inc-backup.sh)
