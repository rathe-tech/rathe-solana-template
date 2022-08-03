set shell := ["zsh", "-cu"]

OWNER_KEYPAIR_PATH := "keys/owner.json"
PROGRAM_KEYPAIR_PATH := "keys/program.json"
PROGRAM_MANIFEST_PATH := "program/Cargo.toml"
PROGRAM_BIN_PATH := "./target/deploy/program.so"
CLIENT_PACKAGE_NAME := "client"

default:
    @just -l

keys-generate:
    @solana-keygen new --no-bip39-passphrase -o {{OWNER_KEYPAIR_PATH}}
    @solana-keygen new --no-bip39-passphrase -o {{PROGRAM_KEYPAIR_PATH}}

keys-print:
    @echo "OWNER PUBKEY:"
    @solana-keygen pubkey {{OWNER_KEYPAIR_PATH}}

    @echo "PROGRAM PUBKEY:"
    @solana-keygen pubkey {{PROGRAM_KEYPAIR_PATH}}

airdrop:
    @solana airdrop 2 {{OWNER_KEYPAIR_PATH}} -u devnet

program-build:
    @cargo build-bpf --manifest-path {{PROGRAM_MANIFEST_PATH}}

program-test:
    @cargo test-bpf --manifest-path {{PROGRAM_MANIFEST_PATH}}

program-deploy:
    @solana program deploy \
        --keypair {{OWNER_KEYPAIR_PATH}} \
        --program-id {{PROGRAM_KEYPAIR_PATH}} \
        --url devnet \
        --output json \
        --verbose \
        {{PROGRAM_BIN_PATH}}

client-build:
    @cargo build -p {{CLIENT_PACKAGE_NAME}}

client-run:
    @cargo run -p {{CLIENT_PACKAGE_NAME}}

clippy:
    @cargo clippy

fmt:
    @cargo fmt