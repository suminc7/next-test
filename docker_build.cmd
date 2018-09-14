docker build -t next-test .
docker run -it -p 3000:3000 --rm --name next-test next-test
docker stop next-test
curl -f http://localhost/ || exit 1


aws s3 cp source.zip s3://s3-benefit-web-upload/


d-TSITN472T


wget https://aws-codedeploy-us-east-2.s3.amazonaws.com/latest/install

---------------

aws deploy push --application-name Closet \
      --s3-location s3://closet-codedeploy/closet-web.zip \
      --ignore-hidden-files \
      --source . \
      --region ap-northeast-2

aws deploy create-deployment \
  --application-name Closet \
  --s3-location bucket=closet-codedeploy,key=closet-web.zip,bundleType=zip \
  --deployment-group-name ClosetWebGroup \
  --region ap-northeast-2

  --------------------------
  aws deploy create-deployment
  --application-name closet-web
  --s3-location bucket=closet-codedeploy,key=closet-web.zip,bundleType=zip
  --deployment-group-name <deployment-group-name>
  --deployment-config-name <deployment-config-name>
  --description <description>

-----------------------------------------------------------------------

An error occurred (AccessDeniedException) when calling the GetAuthorizationToken operation: User: arn:aws:sts::255775243622:assumed-role/code-build-ClosetBuild6-service-role/AWSCodeBuild-f40f8745-c2ea-466b-802a-21a41b74754a is not authorized to perform: ecr:GetAuthorizationToken on resource: *

[Container] 2018/08/06 13:08:44 Command did not exit successfully $(aws ecr get-login --no-include-email --region $AWS_DEFAULT_REGION) exit status 255
[Container] 2018/08/06 13:08:44 Phase complete: PRE_BUILD Success: false
[Container] 2018/08/06 13:08:44 Phase context status code: COMMAND_EXECUTION_ERROR Message: Error while executing command: $(aws ecr get-login --no-include-email --region $AWS_DEFAULT_REGION). Reason: exit status 255

위의 오류시 하단의 Role을 CodeBuild Role에 추가한다.


AmazonEC2ContainerRegistryFullAccess


-----------------------------------------------


aws codedeploy 배포 실패 오류


The overall deployment failed because too many individual instances failed deployment, too few healthy instances are available for deployment,
or some instances in your deployment group are experiencing problems. (Error code: HEALTH_CONSTRAINTS)


cd /var/log/aws/codedeploy-agent/codedeploy-agent.log 로 오류 확인


Version file found in /opt/codedeploy-agent/.version with agent version OFFICIAL_1.0-1.1518_rpm.
2018-08-09 01:31:59 ERROR [codedeploy-agent(7547)]: InstanceAgent::Plugins::CodeDeployPlugin::CommandPoller:
Missing credentials - please check if this instance was started with an IAM instance profile

인스턴스 생성시 IAM 선택