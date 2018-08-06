docker build -t next-test .
docker run -it -p 3000:80 --rm --name next-test next-test
docker stop next-test
curl -f http://localhost/ || exit 1


aws s3 cp source.zip s3://s3-benefit-web-upload/






-----------------------------------------------------------------------

An error occurred (AccessDeniedException) when calling the GetAuthorizationToken operation: User: arn:aws:sts::255775243622:assumed-role/code-build-ClosetBuild6-service-role/AWSCodeBuild-f40f8745-c2ea-466b-802a-21a41b74754a is not authorized to perform: ecr:GetAuthorizationToken on resource: *

[Container] 2018/08/06 13:08:44 Command did not exit successfully $(aws ecr get-login --no-include-email --region $AWS_DEFAULT_REGION) exit status 255
[Container] 2018/08/06 13:08:44 Phase complete: PRE_BUILD Success: false
[Container] 2018/08/06 13:08:44 Phase context status code: COMMAND_EXECUTION_ERROR Message: Error while executing command: $(aws ecr get-login --no-include-email --region $AWS_DEFAULT_REGION). Reason: exit status 255

위의 오류시 하단의 Role을 CodeBuild Role에 추가한다.


AmazonEC2ContainerRegistryFullAccess