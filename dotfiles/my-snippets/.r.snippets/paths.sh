#!/bin/bash
export MANPATH=/usr/local/texlive/2022/texmf-dist/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2022/texmf-dist/doc/info:$INFOPATH
# export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))

# export LD_LIBRARY_PATH=/opt/oracle/instantclient_21_9:/usr/local/lib:$LD_LIBRARY_PATH
export ORA_SDTZ=UTC
export ORACLE_HOME=/opt/oracle/instantclient_21_9