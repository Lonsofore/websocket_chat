# websocket_chat

Chat on websockets.

From: https://github.com/antibi0tic/websocket_chat

Dockerizing, salting...


## Installation:

### Install salt on master
```
wget -O bootstrap_salt.sh https://bootstrap.saltstack.com
sudo sh bootstrap_salt.sh -M -N stable
sudo service salt-master restart
```

### Install salt on minion
```
wget -O bootstrap_salt.sh https://bootstrap.saltstack.com
sudo sh bootstrap_salt.sh -A <MASTER IP> stable
sudo service salt-minion restart
```

### Accept minion's key on master
```
sudo salt-key -A
```

### Download salt files from repo
```
sudo apt install git -y
git clone https://github.com/lonsofore/websocket_chat
sudo cp -r websocket_chat/salt /srv/
```

### Apply salt state to minion(s)
```
sudo salt '*' state.apply
```
