# logs-filter
Performs search by date and keyword in the same time against several log files.

## Usage
```bash
lgfilter init
lgfilter search [-v] [-c number_lines_around] [-l number_lines_limit] "[year] day/month hour[:minutes:seconds]" ["keywords"]
```

## Examples
```bash
lgfilter search "2008 03/03 09:58:14" "error"
```

## Config file structure
It can be generated through lgfilter init command  

```yaml
logs:
  specific_name_x:
    path: /somewhere/logs/a-file-name.log
    # lower case for letter, upper case for number
    date_format: "ddd mmm DD HH:II:SS"
  specific_name_xxx:
    path: /somewhereelse/logs/a-file-name.log
    # lower case for letter, upper case for number
    date_format: "DD/mmm/YYYY:HH:II:SS"
```

## Install

### On debian's like systems
```bash
wget --no-check-certificate https://github.com/korby/logs-filter/blob/master/lgfilter.deb?raw=true -O lgfilter.deb
dpkg -i lgfilter.deb
```

### On Macosx and other unix systems
```bash
git clone git@github.com:korby/logs-filter.git
cd logs-filter
ln -s /usr/bin/lgfilter `pwd`/lgfilter.sh
```
If you have bash_completion installed on your system :
```bash
cp debian_package/etc/bash_completion.d/lgfilter /my/system/path/to/etc/bash_completion.d/
source /my/system/path/to/etc/bash_completion.d/lgfilter
```

## For developers
Useful .git/hooks/pre-commit to add:
```bash
./build.sh
git add lgfilter.deb
```
