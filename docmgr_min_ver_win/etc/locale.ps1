$dirprj=Split-Path -Parent $dircrr
$dirtop=Split-Path -Parent $dirprj
$dirlib=$dirtop+'/xoxxox'
$dirbin=$dirlib+'/docmgr_min/bin'

$env:path=$env:path+";$dirbin"
