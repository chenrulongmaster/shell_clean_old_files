#!/bin/bash 

keep_days=5
log_path=$1
date_time=$(date "+%F %T" )

file_name=$(find $log_path -type f -mtime +$keep_days )
file_num=$(find $log_path -type f -mtime +$keep_days | wc -l )

for file in $file_name
do
    rm -f $file
    if [ $? -eq 0 ]; then
        echo "$date_time 清理过期文件$file 成功" >> /tmp/$0.log
    else
        echo "$date_time 清理过期文件$file 失败" >> /tmp/$0.log
    fi
done
