# Rathe template for Solana projects

This repo contains a template project for writing a Solana based program and its client in Rust.

## Content
* [Prerequisites](#prerequisites)
* [Get started](#get-started)
* [Project Structure](#project-structure)
* [License](#license)

## Prerequisites
* Rust SDK - https://www.rust-lang.org/tools/install
* Solana Tool Suite - https://docs.solana.com/cli/install-solana-cli-tools
* Editor (one of these):
  * Jetbrains CLion + Rust plugin
  * VSCode + Rust Analyzer plugin
* Just command runner - https://github.com/casey/just

## Get started
* Clone the repo and open it on your IDE or text editor
* Generate development key pairs via `jest keys-generate`
* Run `jest keys-show` and setup the program ID in the `program/src/lib.rs` here:
  ```rust
  // TODO: Setup program id
  // solana_program::declare_id!("PROGRAM ID AS BASE58 STRING");
  ```
* Run `jest program-build` to build the Solana program
* Run `jest client-build` to build the client
* To deploy the program on the blockchain for the first time:
    * Run `jest airdrop` to fund the program owner with some amount of SOL
    * Run `jest program-deploy` to deploy the program on the blockchain
* Run `jest client-run` to run the client

## Project structure
* `client` - client application to call the Solana program from the client side
* `program` - solana program to run on the Solana blockchain
* `justfile` - script commands to build, test and deploy the applications

## License
MIT © [Rathe Technologies and its contributors](https://github.com/rathe-tech)