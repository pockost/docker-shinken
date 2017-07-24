#!/bin/bash

ARGS=$@

rm -r /var/run/shinken/*.pid
$ARGS
