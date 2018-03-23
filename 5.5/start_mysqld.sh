#!/bin/sh
find /var/lib/mysql -type f -exec touch {} \;
/usr/bin/mysqld_safe
