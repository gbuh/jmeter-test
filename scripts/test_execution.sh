# chmod +x jmeters
#!/bin/sh

sudo apt-get install apache2 -y;
sudo systemctl start apache2;
sudo systemctl enable apache2;

sudo mkdir -p /usr/lib/jmeter;
sudo rm -rf /tmp/*;
cd /tmp;

wget https://downloads.apache.org//jmeter/binaries/apache-jmeter-5.4.1.tgz;
tar -xvf ./*gz;
sudo mv /tmp/apache-jmeter-5.* /usr/lib/jmeter/;

sudo ln -s /usr/lib/jmeter/apache-maven-3.8.4/bin /usr/bin;

#test
jmeter -version;

# exit 0;

jmeter.sh -n -t Test1.jmx