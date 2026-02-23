IMAGE_TAG=$1

ACTIVE=$(docker ps --format "{{.Names}}" | grep app-blue)

if [ "$ACTIVE" ]; then
    NEW=green
    OLD=blue
else
    NEW=blue
    OLD=green
fi

docker rm -f app-$NEW || true

docker run -d --name app-$NEW -p 3000:3000 cicd-app:$IMAGE_TAG

sleep 10

curl -f http://localhost:3000 || exit 1

docker rm -f app-$OLD || true
