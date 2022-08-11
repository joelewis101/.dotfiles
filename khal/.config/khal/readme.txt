Couple of vdirsyncer issues

1) database is locked error
https://github.com/pimutils/vdirsyncer/issues/720

do ps -ef | grep vdir

then kill -9 {pid}

2) google token expires

delete ~/.config/vdirsyncer/token_file

will make it get another
