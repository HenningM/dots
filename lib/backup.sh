backupPath="$PWD/backup"
dateStr=`date +%d%m%Y-%H%M%S`

curBackup="$backupPath/$dateStr/"
mkdir -p $curBackup

backup_file() {
    if [ -e "$1" ]; then
        echo -n "Backing up $1..."
        mv "$1" $curBackup
        echo "OK"
    fi
}
