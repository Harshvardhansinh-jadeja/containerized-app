from diagrams import Diagram,Cluster,Edge
from diagrams.aws.compute import EC2,EC2ContainerRegistry
from diagrams.aws.general import Users
from diagrams.aws.compute import ECS
from diagrams.aws.database import RDSInstance
from diagrams.aws.network import   ALB
from diagrams.aws.management import CloudwatchAlarm
from diagrams.aws.integration import SimpleNotificationServiceSnsEmailNotification


graph_attr = {
    "fontsize": "30",
    "bgcolor": "transparent",
    "pad": "1",
    "nodesep" : "1.5", 
    "ranksep":"1"
}

edge_attr = {
    "minlen": "2",
    "penwidth":"2.0",
    "concentrate": "true",
    "labeldistance" : "5.0"
}

with Diagram("Containerized Application",outformat="jpg",show=False,graph_attr=graph_attr,edge_attr=edge_attr):
   users=Users("End User") 
   ecr= EC2ContainerRegistry("ECR")
   cloudwatch= CloudwatchAlarm("5XX Error")
   cloudwatch>>SimpleNotificationServiceSnsEmailNotification("Email")

   with Cluster("VPC"):
      with Cluster("Public Subnet"):
       alb=ALB("ALB")
       bastion = EC2("Bastion Host")   

      with Cluster("Private Subnet"):
        rds = RDSInstance("Database")
        ecs= ECS("ECS", width="1.5",fontsize="15")   
              
        users>>alb>>ecs
        ecs-rds
        ecs<<ecr
        ecs>>cloudwatch
        bastion>>Edge(label="Private conn.")>>rds