FROM openjdk
ADD jarstaging/com/valaxy/demo-workshop/2.1.3/demo-workshop-2.1.3.jar mtech.jar
ENTRYPOINT ["java", "-jar", "mtech.jar"]
