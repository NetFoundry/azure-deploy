wget https://netfoundry.jfrog.io/artifactory/ziti-release/ziti-tunnel/amd64/linux/0.18.0/ziti-tunnel.tar.gz 
wget https://netfoundry.jfrog.io/artifactory/ziti-release/ziti-router/amd64/linux/0.18.0/ziti-router.tar.gz 
tar -xvzf ziti-router.tar.gz -C /opt/netfoundry/ziti/ziti-router/
sudo tar -xvzf ziti-tunnel.tar.gz -C /opt/netfoundry/ziti/ziti-tunnel/
sudo systemctl restart ziti-router
sudo systemctl restart ziti-tunnel
rm *.tar.gz
systemctl status ziti-router
systemctl status ziti-router
