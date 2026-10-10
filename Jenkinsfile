pipeline {
    agent any

    parameters {
        string(name: 'BUCKET_NAME', defaultValue: 'default-bucket', description: 'Name of the GCS bucket')
    }

    environment {
        PROJECT_ID    = "project-135912bf-7758-481f-965"
        REGION        = "us-central1"
        STORAGE_CLASS = "STANDARD"
    }

    stages {
        stage('Prepare tfvars') {
            steps {
                sh """
                echo "project_id    = \\"${PROJECT_ID}\\"" > terraform.tfvars
                echo "region        = \\"${REGION}\\"" >> terraform.tfvars
                echo "bucket_name   = \\"${BUCKET_NAME}\\"" >> terraform.tfvars
                echo "storage_class = \\"${STORAGE_CLASS}\\"" >> terraform.tfvars
                """
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -var-file=terraform.tfvars'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve -var-file=terraform.tfvars'
            }
        }
    }
}
