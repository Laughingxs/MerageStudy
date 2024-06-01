#!/bin/bash

# 定义目录变量
DIRECTORY="../../../"

# 定义命令变量
CLEAN_COMMAND="make clean && make"
# 切换到指定目录
cd $DIRECTORY

# 执行定义的命令
$CLEAN_COMMAND
