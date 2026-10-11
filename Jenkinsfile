pipeline {
    agent any

    parameters {
        string(name: 'BUCKET_NAMES', defaultValue: 'bucket1,bucket2', description: 'Comma-separated list of GCS buckets')
        choice(name: 'STORAGE_CLASS', choices: ['STANDARD','NEARLINE','COLDLINE','ARCHIVE'], description: 'GCS storage class')
    }

    environment {
        PROJECT_ID = "project-135912bf-7758-481f-965"
        REGION     = "us-central1"
       
    }

    stages {
        stage('Prepare tfvars') {
            steps {
                sh '''
                cat > terraform.tfvars <<EOF
                project_id    = "${PROJECT_ID}"
                region        = "${REGION}"
                bucket_names  = "${BUCKET_NAMES}"
                storage_class = "${STORAGE_CLASS}"
                EOF
                '''
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
