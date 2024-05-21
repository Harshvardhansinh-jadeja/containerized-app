aws ecr get-login-password --region $1 --profile $2 | docker login --username AWS --password-stdin $3.dkr.ecr.$1.amazonaws.com
# docker build -t $4 ../code
docker build -t $4 ../auth
docker tag $4:latest $5
docker push $5