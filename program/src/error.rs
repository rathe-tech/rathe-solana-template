use thiserror::Error;
use num_derive::FromPrimitive;
use solana_program::decode_error::DecodeError;
use solana_program::msg;
use solana_program::program_error::{PrintProgramError, ProgramError};

/// Custom error implements the num_traits::FromPrimitive trait
/// to participate in the PrintProgramError implementation.
#[derive(Clone, Error, Eq, PartialEq, Debug, FromPrimitive)]
pub enum CustomError {
    #[error("Unknown error")]
    Unknown,
}

/// Allow a CustomError object to be converted into a ProgramError one.
impl From<CustomError> for ProgramError {
    fn from(e: CustomError) -> Self {
        ProgramError::Custom(e as u32)
    }
}

/// Allow to print a CustomError object in a Solana program.
impl<T> DecodeError<T> for CustomError {
    fn type_of() -> &'static str {
        // Change to the actual type name
        "Custom Error"
    }
}

impl PrintProgramError for CustomError {
    fn print<E>(&self) {
        msg!(&self.to_string())
    }
}
