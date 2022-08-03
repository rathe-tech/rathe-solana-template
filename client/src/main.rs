use solana_client::nonblocking::rpc_client::RpcClient;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error + Send + Sync>> {
    let url = String::from("https://api.devnet.solana.com");
    let client = RpcClient::new(url);

    let latest_blockhash = client.get_latest_blockhash().await?;
    println!("Latest blockhash: {}", latest_blockhash);

    Ok(())
}
