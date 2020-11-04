THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export THISDIR
export PROJECTROOT=$THISDIR/../
echo "LOGING: rstudio"
if [ $# -gt 0 ]
    then
        if [ "$1" = "admin" ]
            then
                IMAGE="happyregistry.azurecr.io/methods/wes/somnibus"
                VERSION="4.0.2"
                echo "PASSWORD: somnibus"
                docker pull $IMAGE:$VERSION
                docker run --rm -e ROOT=TRUE -e PASSWORD=somnibus -p 8787:8787 -v $PROJECTROOT:/home/rstudio/somnibus $IMAGE:$VERSION
        fi
else
   IMAGE="somnibus"
   VERSION="4.0.2"
   echo "NO PASSWORD NEEDED"
   docker run --rm -e DISABLE_AUTH=true -p 8787:8787 -v $PROJECTROOT:/home/rstudio/somnibus $IMAGE:$VERSION
fi
echo "enter localhost:8787 in your browser"
echo "and load somnibus.Rproj"