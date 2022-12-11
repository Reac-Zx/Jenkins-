echo " "
echo "L'installation de Jenkins va démarrer ..."
echo " "
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt install openjdk-11-jre -y
java -version
sudo apt-get install jenkins -y
sudo apt update -y
echo " "
echo "Installation terminée"
echo " "
echo "Le mot de passe administrateur de Jenkins est :"
/var/lib/jenkins/secrets/initialAdminPassword
mdp=$(cat /var/lib/jenkins/secrets/initialAdminPassword)
echo " "
wget http://localhost:8080/login?from=%2F//jnlpJars/jenkins-cli.jar
java -jar jenkins-cli.jar -s http://10.60.104.175:8080/ -auth admin:$mdp install-plugin pipeline-utility-steps
java -jar jenkins-cli.jar -s http://10.60.104.175:8080/ -auth admin:$mdp safe-restart
