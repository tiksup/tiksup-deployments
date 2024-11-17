#Creacion o manejo de variables de  entorno en cluster

kubectl create secret generic mysql-secret --from-literal=mysql-root-password=rootpassword --from-literal=mysql 
-user=join --from-literal=mysql-password=johnpassword

kubectl get secrets

