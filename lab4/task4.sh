#!/bin/bash

nice -n 7 ./first.sh&
nice -n 0 ./second.sh&
