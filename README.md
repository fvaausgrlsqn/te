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

---

#### Donations accepted:
`0x035ba77B912EA3eA5a05c07601242fDB28229d81` (WEB)
