./prysmctl testnet generate-genesis --fork=bellatrix --num-validators=64 --output-ssz=genesis.ssz --chain-config-file=config.yml  --geth-genesis-json-in=genesis.json --geth-genesis-json-out=genesis.json

./geth --datadir=gethdata init genesis.json
./geth --datadir=gethdata account import secret.json

