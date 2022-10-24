#!/bin/bash
echo "-----------------------------------------------------------------------------"
curl -s https://raw.githubusercontent.com/ArtemAhr/tools/main/logo.sh | bash
echo "-----------------------------------------------------------------------------"
echo "-----------------------------------------------------------------------------"
echo "Хомʼяк встановлює софт"
echo "-----------------------------------------------------------------------------"
sudo apt install make clang pkg-config libssl-dev libclang-dev build-essential git curl ntp jq llvm tmux htop screen unzip cmake -y
curl -s https://raw.githubusercontent.com/ArtemAhr/tools/main/rust.sh | bash &>/dev/null
source $HOME/.cargo/env
source $HOME/.profile
source $HOME/.bashrc
sleep 1
echo "Хомʼяк клонує репозиторій та починає білд"
echo "-----------------------------------------------------------------------------"
git clone https://github.com/kuraassh/manta-rs.git
cd manta-rs
cargo run --release --package manta-trusted-setup --all-features --bin groth16_phase2_client register
echo "Хомʼяк завершив білд, переходимо до ініціалізації ключів"
echo "-----------------------------------------------------------------------------"
