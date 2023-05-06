pipeline {
  agent any
  //environment {
    //AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
    //AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    //AWS_DEFAULT_REGION    = 'us-east-1'
  //}

  stages {
    stage('Authenticate with AWS') {
      steps {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          accessKeyVariable: 'AWS_ACCESS_KEY_ID',
          secretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
          credentialsId: 'AWS_Credentials'
        ]]) {
          sh 'export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID'
          sh 'export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY'
          sh 'terraform init'
          sh 'terraform plan -out=tfplan'
          //sh 'terraform apply --auto-approve tfplan'
          sh 'terraform destroy --auto-approve'
          sh 'echo "Successfully authenticated with AWS"'
        }
      }
    }
    
    stage('Build Image') {
      steps {
         sh 'echo "Successfully Built Image"'
      }
    }
    
    stage('Push Image') {
      steps {
        //sh 'cd Terraform'
         sh 'echo "Successfully Pushed Image to repo"'
      }
    }
    
    stage('Pull Image and Deploy') {
      steps {
        //sh 'cd Terraform'
         sh 'echo "Successfully Pulled Image and Deployed to Infrasture"'
      }
    }
  }
}
