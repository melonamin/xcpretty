# xcpretty in Docker

## Motivation

Have you seen this on macOS?

```shell
➜  ~ gem install xcpretty
ERROR:  While executing gem ... (Gem::FilePermissionError)
    You don't have write permissions for the /Library/Ruby/Gems/2.3.0 directory.
➜  ~
```

You don't want to use sudo and you don't want to deal with Ruby environments management? 

## Solution

Get the docker image(Alpine + Ruby, nothing more):

```shell
docker pull melonamin/xcpretty
```

Run it like this:

```shell
➜  ~ docker run -it --rm  melonamin/xcpretty
[!] Usage: xcodebuild [options] | xcpretty
    -t, --test                       Use RSpec style output
    -s, --simple                     Use simple output (default)
    -k, --knock                      Use knock output
        --tap                        Use TAP output
    -f, --formatter PATH             Use formatter returned from evaluating the specified Ruby file
    -c, --[no-]color                 Use colorized output. Default is auto
        --[no-]utf                   Use unicode characters in output. Default is auto.
    -r, --report FORMAT or PATH      Run FORMAT or PATH reporter
                                       Choices: junit, html, json-compilation-database
    -o, --output PATH                Write report output to PATH
        --screenshots                Collect screenshots in the HTML report
    -h, --help                       Show this message
    -v, --version                    Show version
```

or better download a "shortcut":

```bash 
curl -o /usr/local/bin/xcpretty https://raw.githubusercontent.com/melonamin/xcpretty/master/xcpretty
```

or create it yourself:
```bash
echo "#/bin/bash
if [ -t 0 ]; then
    docker run -it --rm  melonamin/xcpretty
else
    docker run -i --rm  melonamin/xcpretty
fi" > /usr/local/bin/xcpretty
```

Don't foreget to set the execution flag:

```bash
chmod +x /usr/local/bin/xcpretty
```

Now you can use xcpretty like you normal do:
```bash
➜  ~ xcodebuild [flags] | xcpretty
#
# OR
# 
➜  ~ set -o pipefail && xcodebuild [flags] | xcpretty
```