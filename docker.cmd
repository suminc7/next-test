docker build -t next-test .
docker run -it -p 3000:3000 --rm --name next-test next-test