# Desplegar con zappa usando github actions

## Crear usuarios y asignar permisos en AWS
1. Crear grupo de usuarios  
   1.1 - Iniciar session en [AWS](https://console.aws.amazon.com)  
   1.2 - Crear un grupo de usuarios "LambdaUsers" en [IAM > Grupos de usuarios](https://console.aws.amazon.com/iamv2/home#/groups) 
   1.3 - Editar el grupo de usuarios "LambdaUsers".
   1.4 Crear una politica de seguridad "ZappaLambda" con el siguiente JSON:
   ```json 
   {
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "ZappaLambda",
			"Effect": "Allow",
			"Action": [
                "lambda:*",
				"s3:PutObject",
				"s3:GetObject",
   				"s3:CreateBucket",
				"s3:ListBucket",
                "events:*",
				"cloudformation:*",
				"iam:CreateRole",
                "iam:PutRolePolicy",
                "iam:GetRole",
                "iam:PassRole",
                "apigateway:*"
			],
			"Resource": "*"
		}
	]
   }
   ```
   Nota: Si falta algun permiso leer bien la salida de error del zappa y agregarlo, si el Resource se quiere acotar se le puede poner el namespace de la app creada por zappa.
2. Crear un usuario  
   2.1 - Crear un usuario "myapi" en [IAM > Usuarios](https://console.aws.amazon.com/iamv2/home#/users).  
   2.2 - Asignarle el grupo de usuarios "LambdaUsers".  
   2.3 - Crear una "Claves de acceso" de tipo "Interfaz de línea de comandos (CLI)".  
   2.4 - Ir al proyecto de github en Settings > Secrets and variables > Actions y agregar dos secret.  
   AWS_ACCESS_KEY: Clave de acceso de AWS  
   AWS_SECRET_KEY: Clave de acceso secreta de AWS  

