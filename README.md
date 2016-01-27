An Alpine Linux based tiny docker image, is intended to be used as
minimal (old style) CGI server.

This is useful for simple CGI scripts and CGI applications such as
doing web scraping, requesing to some Web APIs, etc.

This image is based on Alpine Linux 3.3 and contains following packages.
Image size is only 10 MB.

- [mini_httpd](http://acme.com/software/mini_httpd/) [(man
page)](http://manpages.ubuntu.com/manpages/oneiric/man8/mini-httpd.8.html)
- bash
- curl

## Build

```
$ sudo docker build .
```

## Usage

```
# Run 
$ sudo docker run --rm -t -v /var/www/html:/var/www/localhost/htdocs
-p 80:80 dseg/mini_httpd-cgi
```

Copy a sample cgi script to the document root dir.

```
cd /var/www/html
curl
'https://aur.archlinux.org/cgit/aur.git/plain/sample.cgi?h=mini_httpd' -o sample.cgi
chmod 755 sample.cgi

# test
./sample.cgi
```

Then access to the http://server/index.html, http://server/sample.cgi
using browser.
