for f in *.txt; do mv "$f" "`echo $f | sed s/pro1/_key/`"; done