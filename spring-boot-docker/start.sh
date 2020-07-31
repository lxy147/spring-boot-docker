appName="spring-boot-docker"
word="1"
echo "$word"
word=`docker ps -a -q --no-trunc --filter name=^/"$appName"$`
echo "$word"
if [ -z "$word" ];
then
    echo "��ǰ�����ڸ�������ֱ�ӽ��������ò���-------------------------------------"
elif [ -n "$word" ];
then
    echo "��ǰ�Ѵ���������ֹͣ���Ƴ�������-------------------------------------"
    /usr/bin/docker stop "$word"
    /usr/bin/docker rm "$word"
elif [ "$word" == "1" ];
then
    echo "��ѯ����Ϣ����ִ��Ĭ�ϲ���-------------------------------------"
    /usr/bin/docker stop "$word"
    /usr/bin/docker rm "$word"
fi
/usr/apache-maven/apache-maven-3.6.3/mvn clean package -P spring-boot docker:build
/usr/bin/docker run -p 8070:8070 -d --name "$appName" "$appName":latest
