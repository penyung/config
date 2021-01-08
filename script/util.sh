function cd2 () {
  if [ -d "$1" ]; then
    cd $1
  else
    dirname=`dirname $1`
    cd $dirname
  fi
}

function ls2 () {
  ls `dirname $1` $2
}
