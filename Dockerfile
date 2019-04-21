FROM bitnami/codeigniter

LABEL maintainer wwalien <wwalien@yahoo.com>
                                                                 

# Configure xdebugger (todo: configuration for ZendDebugger
RUN yes | echo "[xdebug]"                                                                               >  /opt/bitnami/php/etc/conf.d/xdebug.ini \
&& echo "zend_extension= zend_extension=/opt/bitnami/php/lib/php/extensions/xdebug.so"                  >> /opt/bitnami/php/etc/conf.d/xdebug.ini \
&& echo "xdebug.remote_enable = 1 ; Wont work without this option"                                      >> /opt/bitnami/php/etc/conf.d/xdebug.ini \
&& echo "xdebug.remote_host = 10.10.1.1 ; IP address of my host machine"                                >> /opt/bitnami/php/etc/conf.d/xdebug.ini \
&& echo "xdebug.remote_connect_back = 1"                                                                >> /opt/bitnami/php/etc/conf.d/xdebug.ini \
&& echo "xdebug.remote_port = 9000"                                                                     >> /opt/bitnami/php/etc/conf.d/xdebug.ini \
&& echo "xdebug.remote_autostart = 1 ; Important: automatically attempt to connect to debugging client" >> /opt/bitnami/php/etc/conf.d/xdebug.ini \
&& echo "xdebug.max_nesting_level = 512"                                                                >> /opt/bitnami/php/etc/conf.d/xdebug.ini

COPY *.so /opt/bitnami/php/lib/php/extensions/

# EXPOSE 8000
EXPOSE 9000 

WORKDIR /app
ENTRYPOINT [ "/app-entrypoint.sh" ]
CMD [ "php", "-S", "0.0.0.0:8000" ]

