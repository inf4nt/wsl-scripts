WORK_DIR="/opt"
MAVEN_VERSION="3.9.9"
MAVEN_ARCHIVE="/tmp/apache-maven-$MAVEN_VERSION.tar.gz"

MAVEN_HOME="$WORK_DIR/apache-maven-$MAVEN_VERSION"
MAVEN_DOWNLOAD_URL="https://dlcdn.apache.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz"

sudo apt update -y
sudo apt upgrade -y

sudo apt install curl -y

sudo curl -o $MAVEN_ARCHIVE $MAVEN_DOWNLOAD_URL

sudo tar -xzf $MAVEN_ARCHIVE -C $WORK_DIR

sudo rm $MAVEN_ARCHIVE

echo '# MAVEN2 VARIABLES' >> ~/.bashrc
echo M2_HOME=$MAVEN_HOME >> ~/.bashrc
echo 'PATH="$M2_HOME/bin:$PATH"' >> ~/.bashrc

echo export M2_HOME=$MAVEN_HOME >> ~/.bashrc
echo '# MAVEN2 VARIABLES END' >> ~/.bashrc
echo '' >> ~/.bashrc

echo $MAVEN_HOME/bin/mvn

sudo unlink /usr/bin/mvn
sudo ln -s $MAVEN_HOME/bin/mvn /usr/bin/mvn

mvn -v