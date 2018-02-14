function cd2 () {
  dirname=`dirname $1`
  cd $dirname
}

function ls2 () {
  ls `dirname $1` $2
}
