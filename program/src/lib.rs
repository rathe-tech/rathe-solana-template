use solana_program::pubkey::Pubkey;

pub mod error;
pub mod instruction;
pub mod processor;
pub mod state;

#[cfg(not(feature = "no-entrypoint"))]
pub mod entrypoint;

// TODO: Setup program id
//solana_program::declare_id!("PROGRAM ID AS BASE58 STRING");
