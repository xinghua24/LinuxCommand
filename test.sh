#!/bin/bash
input="ABC.DEF"
echo $input | sed "s|\.|\.\.\.|g"
