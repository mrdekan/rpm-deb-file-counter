#!/bin/bash

files_cnt=$(find /etc -type f | wc -l)
echo "Files count in /etc: $files_cnt"
