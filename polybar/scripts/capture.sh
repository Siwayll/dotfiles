#!/bin/sh

case $1 in 
  load)
    case `amixer get 'Capture',0 | grep -c "\[off\]"` in
      0)
        printf "on "
        ;;
      1)
        printf "off"
        ;;
    esac
    ;;
esac
