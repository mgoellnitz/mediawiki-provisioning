#
# Very simple script to derive virtual host setup from default site.
#
#!/bin/bash
SITENAME=${1:-{{ site_name }}}
SITEFQDN=${2:-{{ site_domain }}}
BASE=/etc/apache2/sites-available

cp $BASE/000-default.conf $BASE/${SITENAME}.conf
sed -i -e "s/\(VirtualHost\ \).:/\1${SITEFQDN}:/g" $BASE/${SITENAME}.conf
sed -i -e "s/\(DocumentRoot..var.www.\)html/\1${SITENAME}/g" $BASE/${SITENAME}.conf
sed -i -e "s/error.log/${SITENAME}-error.log/g" $BASE/${SITENAME}.conf
sed -i -e "s/access.log/${SITENAME}-access.log/g" $BASE/${SITENAME}.conf

cp $BASE/default-ssl.conf $BASE/${SITENAME}-ssl.conf
sed -i -e "s/_default_:/${SITEFQDN}:/g" $BASE/${SITENAME}-ssl.conf
sed -i -e "s/\(DocumentRoot..var.www.\)html/\1${SITENAME}/g" $BASE/${SITENAME}-ssl.conf
sed -i -e "s/error.log/${SITENAME}-ssl-error.log/g" $BASE/${SITENAME}-ssl.conf
sed -i -e "s/access.log/${SITENAME}-ssl-access.log/g" $BASE/${SITENAME}-ssl.conf

sed -i -e "s/ssl.certs.ssl.cert.snakeoil/letsencrypt\/live\/${SITEFQDN}\/fullchain/g" $BASE/${SITENAME}-ssl.conf
sed -i -e "s/ssl.private.ssl.cert.snakeoil.key/letsencrypt\/live\/${SITEFQDN}\/privkey.pem/g" $BASE/${SITENAME}-ssl.conf
