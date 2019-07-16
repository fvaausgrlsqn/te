# webchain-miner-dockerized
webchain-miner container for WebChain Network

## To build & run the miner:

### Option 1 (default mining fee of 5% - no need to edit `config.json`):

**Run these commands:**

```
git clone https://github.com/wattpool/webchain-miner-dockerized

cd webchain-miner-dockerized

docker build -f Dockerfile -t webchainminer .

docker run webchainminer -o webchain.wattpool.net:3333 -u WALLET -p x
```

---

### Option 2 (custom fee and worker details): 

**Run these commands:**
```
git clone https://github.com/wattpool/webchain-miner-dockerized

cd webchain-miner-dockerized

nano config.json
```
---
**Now follow these directions:**

1. Go to line 6 and you will see this:

> "donate-level": 1, // donate level, mininum 1%

Replace **1** with the donation level you would prefer


2. Go to line 21 and you will see this:

> "user": "0x035ba77B912EA3eA5a05c07601242fDB28229d81", // username for mining server

Replace **0x035ba77B912EA3eA5a05c07601242fDB28229d81** with **YOUR** address. **Do not remove the quotation marks**.


3. Go to line 26 and you will see this:

> "worker-id": "dockerized",

Replace **dockerized** with your rigs name. **Do not remove the quotation marks**.

**Now, run this command to build the webchain-miner container:**

```
docker build -f Dockerfile -t webchainminer .
```

**To start the miner, run:**

```
docker run webchainminer
```

## Running the miner container in the background:

1. Build the docker image for the miner using one of the methods described above.

2. Create a new container using the newly built docker image:

```
docker container create webchainminer
```

This command will output a long hash.

3. Start the new container referenced by the long hash from the previous step:

```
docker container start {that long hash}
```

* You can combine steps 2 & 3 into a single command:

```
docker container start `docker container create webchainminer`
```

* You can limit CPU usage by passing arguments to the `docker container create` command:

```
docker container start `docker container create --cpus=".7" webchainminer`
```

4. You can view the running container and see the newly assigned name with the command:

```
docker container ls
```

5. View container logs using that newly assigned name:

```
docker container logs -f that-container-name
```

## Running the miner container as a systemd service using the Makefile:

Assuming you have created a user `webchainminer` in group `webchainminer` and have cloned this repository in the `webchainminer` home user directory, the following service file will start the daemon automatically at system startup.

Adjust the percentage of CPU being allocated to the process by editing the file `cpus.txt`.  By default, this is set to 35% - feel free to change this value.

Enter the following into `/etc/systemd/system/webchainminer.service`:

```
[Unit]
Description=Webchain miner daemon service
After=network.target

[Service]
User=webchainminer
Group=webchainminer
Type=simple
Restart=always
RestartSec=90s
WorkingDirectory=/home/webchainminer/webchain-miner-dockerized
ExecStart=/usr/bin/make miner

[Install]
WantedBy=default.target
```

---

#### Donations accepted:
`0x035ba77B912EA3eA5a05c07601242fDB28229d81` (WEB)
