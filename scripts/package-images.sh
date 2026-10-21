chart_name="$1"

project_path=./
images_directory="./${chart_name}_images"

images=$(helm template ./charts/${chart_name} | grep image: | cut -d ":" -f2,3 | sort | uniq | sed 's/"//g')

if [ ! -d "$images_directory" ]; then
    mkdir -p "$images_directory"
fi

array=(${images// / })
for i in "${array[@]}"; do
    echo "pull image from $i"
    docker pull $i --platform linux/amd64
    path=$(echo "$i" | perl -F/ -wane 'print $F[-1]')
    docker save $i -o $images_directory/${path//\:/-}.tar
done

tar -czvf $chart_name-linux-amd64-images.tar $images_directory/*
