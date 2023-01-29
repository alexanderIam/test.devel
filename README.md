#### Подготовка окружения: Ubuntu Linux версии 22.04
* Установим far manager командой в терминале sudo apt install mc вводим пароль.
* Установка сервера Mariadb командой ___sudo apt install mariadb-server___, подверждаем установку доп пакетов.
* Проверка осуществляется командой ___sudo mysql___ после этого попадем в режим терминала mysql.
* Установить апач командой ___sudo apt install apache2___, подверждаем установку доп пакетов.
* Проверка установки - открываем браузер и вводим localhost, откроется страница апача.
* Установка интерпретатора php. 
* Обновляем локальный список пакетов командой sudo apt update
* Установка интерпретатора php 
    * Добавим репозиторий с разными версиями интерпретатора php ___sudo add-apt-repository ppa:ondrej/php___.
    * Обновляем локальный список пакетов ___sudo apt update___.

    * Установим php версии 7.4. 
    * Команда ___sudo apt install php7.4___.
    * Установим доп модули ___sudo apt install php7.4-curl php7.4-xdebug php7.4-mysql php7.4-soap php7.4-zip php7.4-gd___.
    * Проверка устанвоки командой ___php -v___ покажет версию.
* Настройки виртуальных хостов:
    * Команада ___sudo mc___.
    * Переходим в _/etc/apache2/envars_, отредактируем файл с переменными. Нажимаем F4 выбираем редактор mcedit.
    * Изменяем директиву export APACHE_RUN_USER = имя пользователя (к примеру alexey)
    * Изменяем директиву export APACHE_RUN_GROUP = имя пользователя (к примеру alexey)
    * Сохраняем и выходим.
    * Отрываем директорию _sites-available_.
        * Копируем _000-default.conf_ в туже директорию под именем _test.devel.conf_
        * Открываем _test.devel.conf_
        * Раскомментируем и пропишем _ServerName test.devel_.
        * _DocumentRoot /home/[имя пользователя]/public_html/test.devel_.
        * Поменяем лог файлы _ErrorLog ${APACHE_LOG_DIR}/test.devel.error.log_.
        * Поменяем лог файлы _CustomLog ${APACHE_LOG_DIR}/test.devel.access.log combined_.
        * Сохраняем и выходим.
    * Копируем _test.devel.conf_ в туже директорию под именем _admin.devel.conf_.
    * Раскомментируем и пропишем _ServerName admin.devel_.
    * _DocumentRoot /home/[имя пользователя]/public_html/admin.devel_.
    * Поменяем лог файлы _ErrorLog ${APACHE_LOG_DIR}/admin.devel.error.log_.
    * Поменяем лог файлы _CustomLog ${APACHE_LOG_DIR}/admin.devel.access.log combined_.
    * Сохраняем и выходим.
    * Отключим виртаульные хост по умолчанию.
        * Команда ___sudo a2issite 000-default___.
    * Включим созданные виртуальные хосты.
    * Команда sudo a2ensite test.devel.
    * Команда sudo a2ensite admin.devel.
    * Открываем /etc/apache2/apache2.conf.
    * Поменять директорию с Directory /var/www на Directory /home/[имя пользователя]/public_html.
    * Поменять директиву на AllowOverride All.
    * Перезапустим апач.
    * Команда sudo systemctl reload apache2 если нет ошибок, значит все ок.
    * В файле etc/hosts пропишем адреса наших хостов.
        * _127.0.0.1 test.devel admin.devel_.
        * Сохраняем и выходим.
    * Идем в браузере набираем сайт test.devel и потом admin.devel.
    * Если будет ошибка доступа то ничего страшного.
    * Команда ___mc___.
    * Создадим директорию _public_html_ в _~/_.
    * В _~/public_html_ создадим директорию _test.devel_ и _admin.devel_.
    * Для проверки создать файл в admin.devel.
        * Команда touch index.php.
        * Добавим в файл ___<?php 
                                phpinfo();___
        * Сохраняем и выходим.
    * Идем в браузере набираем сайт admin.devel должна вывестись информации о php.
* Установка phpmyadmin.
    * Скачать дистрибьютив phpmyadmin с _www.phpmyadmin.net_
    * Распаковать содержимое в нашу директорию _admin.devel_.
    * Команда ___unzip [имя архива phpmyadmin]___.
    * Скопировать файлы в _admin.devel_.
    * Создать пользователя в базе данных
        * Команда ___sudo mysql___.
        * ___CREATE USER '[имя пользователя]'@'localhost' IDENTIFIED BY '[пароль ]';___
        * ___GARNT ALL PRIVILEGES ON *.* TO '[имя поьзователя]'@'localhost';___
        * FLUSH PRIVILEGES;
        * ___exit;___
    * Создадим базу данных для магазина cscart
        * Заходим под именем нашего пользователя
        * ___mysql -u alexandr -p___
        * Вводим пароль ___techsim___
        * Создаем базу данных
            * ___CREATE database last_project;___
        * exit;  
* Устанвока CScart
    * Скачать cscart ultimate ru 4.15.2
    * Распаковать в _test.devel_
    * В браузере перейти на страницу http://test.devel
    * Нажать _install_
    * Установить недостающие библиотеку указанные в списке.
    * Команад ___sudo apt install php7.4-xml___, по такому принципу установить др недостающие библиотеки.
    * Утсановить сервис _rewrite_ для апач командой ___sudo a2enmod rewrite___
    * Перезагрузить апач
        * ___sudo systemctl restart apache2___
    * Обновить страницу.
    * Впишем в поля конфигурации сервера cscart нашу базу данных Mysql: _test.devel_, имя пользовтаеля: _alexandr_ и пароль Mysql: _techsim_.
    * вписать эмаил адрес админа и пароль.
    * Нажать установить.
    * Активировать если есть лицензионный ключ.
    * Загрузить все файлы с ветки SCHOOL-385 ([ссылка на репозиторий](https://github.com/alexanderIam/test.devel/tree/SCHOOL-385)) в нашу директорию test.devel
    * Перезапустить апач.
    * Читать функциональную часть.
    * Для тестирвоания использовался браузер Firefox Browser 109.0 (64-bit)
            
#### Функциональная часть:
* Описание функциональной части находится в jira в каждой задаче в поле instruction.
