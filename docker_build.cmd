docker build -t next-test .
docker run -it -p 3000:80 --rm --name next-test next-test
docker stop next-test
curl -f http://localhost/ || exit 1