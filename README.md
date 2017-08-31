# ipify.sh

> Unofficial client library for [ipify](https://www.ipify.org): A Simple IP Address API.

# Features

* Testing **Internet Connection** first
* Return the **Public IP** address in the following formats
  * **text**
    * e.g. `98.207.254.136`
  * **json**
    * e.g. `{"ip":"98.207.254.136"}`
  * **jsonp**
    * e.g. `callback({"ip":"98.207.254.136"});`
  * **jsonp**
    * e.g. `getip({"ip":"98.207.254.136"});`

# Getting Started

```bash
$ wget https://github.com/xtonousou/ipify.sh/blob/master/ipify.sh
$ source ipify.sh
$ get_ip -h
```

# Usage

```bash
COMMAND            TYPE  OUTPUT
ipify -h, --help   text  This help message
ipify -t, --text   text  98.207.254.136
ipify -j, --json   json  {"ip":"98.207.254.136"}
ipify -J, --jsonp  jsonp callback({"ip":"98.207.254.136"});
ipify -G, --get-ip jsonp getip({"ip":"98.207.254.136"});
```

You can source the script to anywhere and use its function to get the Public IP.
Put the following line at the beginning of your script. Of course replace the path with the right one first.

```bash
source /path/to/ipify.sh
```

# More Like This

* [ship](https://github.com/xtonousou/ship) - A simple, handy network addressing multitool with plenty of features 

# License

MIT © [Sotirios M. Roussis (xtonousou)](https://xtonousou.github.io)
