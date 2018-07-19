# OVERVIEW
Before using the shell script, please check the web server user and replace it. See quick remark below to find.

Detail later on in this blog: http://ask.osify.com

# QUICK REMARK
``` 	
ps aux | egrep '(apache|httpd)'
```

find user that running the apache:

```
root@ubuntu-server:/opt/www/myweb# ps aux | egrep '(apache|httpd)'
daemon    3055  0.1  0.8 377988 33440 ?        S    03:08   0:06 /opt/lampstack/apache2/bin/httpd.bin -f /opt/lampstack/apache2/conf/httpd.conf
daemon   10913  0.0  0.7 377324 31304 ?        S    04:02   0:00 /opt/lampstack/apache2/bin/httpd.bin -f /opt/lampstack/apache2/conf/httpd.conf
root     11019  0.0  0.0  12948   968 pts/0    S+   04:22   0:00 grep -E (apache|httpd)
daemon   14244  0.0  0.9 378344 38476 ?        S    Jun05   0:11 /opt/lampstack/apache2/bin/httpd.bin -f /opt/lampstack/apache2/conf/httpd.conf
daemon   14245  0.0  0.9 378376 36648 ?        S    Jun05   0:10 /opt/lampstack/apache2/bin/httpd.bin -f /opt/lampstack/apache2/conf/httpd.conf
daemon   14995  0.0  0.9 378468 37156 ?        S    Jun05   0:10 /opt/lampstack/apache2/bin/httpd.bin -f /opt/lampstack/apache2/conf/httpd.conf
daemon   14996  0.0  0.8 378040 35672 ?        S    Jun05   0:09 /opt/lampstack/apache2/bin/httpd.bin -f /opt/lampstack/apache2/conf/httpd.conf
daemon   14998  0.0  0.9 377992 36564 ?        S    Jun05   0:09 /opt/lampstack/apache2/bin/httpd.bin -f /opt/lampstack/apache2/conf/httpd.conf
daemon   19249  0.1  0.8 378108 33644 ?        S    01:39   0:09 /opt/lampstack/apache2/bin/httpd.bin -f /opt/lampstack/apache2/conf/httpd.conf
daemon   19504  0.1  0.8 378168 35152 ?        S    02:42   0:09 /opt/lampstack/apache2/bin/httpd.bin -f /opt/lampstack/apache2/conf/httpd.conf
daemon   19535  0.1  0.8 378160 35292 ?        S    02:46   0:09 /opt/lampstack/apache2/bin/httpd.bin -f /opt/lampstack/apache2/conf/httpd.conf
root     20101  0.0  1.0 374696 42672 ?        Ss   May30   0:17 /opt/lampstack/apache2/bin/httpd.bin -f /opt/lampstack/apache2/conf/httpd.conf

```

As in above output, the apache running by *daemon* but most of the case, it should run by *www-data*

You can also use following command to find the correct user/group of apache:

```
egrep -iw --color=auto 'user|group' /path/to/httpd/conf
```

As above example, we can run as: *egrep -iw --color=auto 'user|group' /opt/lampstack/apache2/conf/httpd.conf*

And the output is:

```
# If you wish httpd to run as a different user or group, you must run
# User/Group: The name (or #number) of the user/group to run httpd as.
# It is usually good practice to create a dedicated user and group for
User daemon
Group daemon
    LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined
      LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %I %O" combinedio
# User home directories
# The following lines prevent .user.ini PHP settings files from being viewed by Web clients.
<Files ".user.ini">
```

Another way, you can also see via phpinfo(); on User/Group.
