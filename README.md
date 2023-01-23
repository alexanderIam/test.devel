Подготовка окружения: Ubuntu Linux версии 2.20
    1.   Установим far manager командой в терминале sudo apt install mc вводим пароль
    2.   Установка сервера Mariadb командой sudo apt install mariadb-server подверждаем установку доп пакетов
    3.   Проверка устанвокой командой sudo  mysql после этого попадем в Режим терминала mysql
    4.   Установка апач командой sudo apt install apache2 подверждаем установку доп пакетов
    5.   Проверка установки- открываем браузер и вводим localhost откроется страница апача
    6.   Установка интерпретаора php 
    8.   Обновляем локальный список пакетов sudo apt update
    9.   Установим php версии 7.4 
    10.  Команда sudo apt install php7.4
    11.  Установим доп модули sudo apt install php7.4-curl php7.4-xdebug php7.4-mysql php7.4-soap php7.4-zip php7.4-gd
    12.  Проверка устанвоки php -v покажет версию
    13.  Настройки виртуальных хостов:
            1. Команад sudo mc
            2. Переходим в /etc/apache2/envars отредактируем файл с переменными нажимаем F4 выбираем редактор mcedit
            3. Изменяем директиву export APACHE_RUN_USER = имя пользователя (к примеру alexey)
            4. Изменяем директиву export APACHE_RUN_GROUP = имя пользователя (к примеру alexey)
            5. Сохраняем и выходим
    14. Отрываем sites-available
            1. Копируем 000-default.conf в туже директорию под именем test.devel.conf
            2. Открываем test.devel.conf
                1. Раскомментируем и пропишем ServerName test.devel
                2. DocumentRoot /home/[имя пользователя]/public_html/test.devel
                3. Поменяем лог файлы ErrorLog ${APACHE_LOG_DIR}/test.devel.error.log
                4. Поменяем лог файлы CustomLog ${APACHE_LOG_DIR}/test.devel.access.log combined
                5. Сохраняем и выходим
            3. Копируем test.devel.conf в туже директорию под именем admin.devel.conf
                1. Раскомментируем и пропишем ServerName admin.devel
                2. DocumentRoot /home/[имя пользователя]/public_html/admin.devel
                3. Поменяем лог файлы ErrorLog ${APACHE_LOG_DIR}/admin.devel.error.log
                4. Поменяем лог файлы CustomLog ${APACHE_LOG_DIR}/admin.devel.access.log combined
                5. Сохраняем и выходим
    15. Отключим виртаульные хост по умолчанию
        1. Команда sudo a2issite 000-default
    16. Включим созданные виртуальные хосты
        1. Команда sudo a2ensite site.devel
        2. Команда sudo a2ensite admin.devel
    17. Открываем /etc/apache2/apache2.conf
        1. Поменять директорию с Directory /var/www на Directory /home/[имя пользователя]/public_html
            1. Поменять директиву на AllowOverride All
    28. Перезапустим апач
        1. Команда sudo systemctl reload apache2 если нет ошибок, значит все ок
    19. В файле etc/hosts пропишем адреса наших хостов
        1. 127.0.0.1 site.devel admin.devel
        2. Сохраняем и выходим
    20. Идем в браузере набираем сайт test.devel и потом admin.devel
        1. если будет ошибка доступа то ничего страшного
    21. команда mc
        1. создадим директорию public_html в ~/
        2. В ~/public_html создадим директорию test.devel и admin.devel
        3. Для проверки создать файл в admin.devel
            1. Команда touch index.php
            2. Добавим в файл <?php 
                                phpinfo();
            3. Сохраняем и выходим
    22. Идем в браузере набираем сайт admin.devel должна вывестись информации о php
    23. Установка phpmyadmin
            1. Скачать дистрибьютив phpmyadmin www.phpmyadmin.net
            2. Распаковать содержимое в нашу директорию admin.devel
                1. Команда unzip [имя архива phpmyadmin]
                2. Скопировать файлы в admin.devel
    24. Создать пользователя в базе данных
            1. sudo mysql
            2. CREATE USER '{имя пользователя]'@'localhost' IDENTIFIED BY '[пароль ]';
            3. GARNT ALL PRIVILEGES ON *.* TO '[имя поьзователя]'@'localhost';
            4. FLUSH PRIVILEGES;
            5. exit
    25. Создадим базу данных для магазина cscart
        1.Заходим под именем нашего пользователя
            1. mysql -u alexandr -p
            2. Вводим пароль techsim
            3. Создаем базу данных
                1. CREATE database cscart;
                2. exit  
    26. Устанвока CScart
        1. Скачать cscart ultimate ru 4.15.2
        2. Распаковать в test.devel
        3. В браузере перейти на страницу test.devel
        4. Нажать install
        5. Установить недостающие библиотеку указанные в списке
            1. Команад sudo apt install php7.4-xml по такому принципу установить др недостающие библиотеки
            2. Утсановить сервис rewrite для апач Командой sudo a2enmod rewrite 
            2. Перезагрузить апач
                1. sudo systemctl restart apache2
        6.  Обновить страницу
        7.  Впишем в поля конфигурации сервера cscart нашу базу данных Mysql, имя пользовтаеля Mysql и пароль Mysql
        8.  Эмаил адрес админа и пароль
        9.  Нажать установить
        10. Активировать если есть лицензионный ключ
    27. Загрузить все файлы с https://github.com/alexanderIam/test.devel/tree/SCHOOL-385 в корень локальной папки test.devel
    28. Перезапустить апач
    29. Читать функциональную часть
            
Функциональная часть:
    Описание функциональной части находится в jira в каждой задаче в поле instruction.


