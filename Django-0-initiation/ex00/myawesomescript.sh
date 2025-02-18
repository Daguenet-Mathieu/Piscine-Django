#!/bin/sh

error="wrong url"

curl_data=$(curl -s "$1")

if [ $? -ne 0 ]; then
    grep w <<END
$error
END
    exit 1
fi

res=$(grep -i "title" <<END
$curl_data
END
)

if [ $? -eq 0 ]; then
    grep w <<END
$error
END
    exit 1
fi

grep -o 'href="[^"]*"' <<END | cut -d '"' -f 2
$curl_data
END