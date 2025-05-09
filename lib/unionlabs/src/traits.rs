use core::fmt::Debug;

use serde::{Deserialize, Serialize};

/// Trait alias for traits commonly used together throughout this crate.
// TODO: Add `Eq`
pub trait Member = Debug
    + Clone
    + PartialEq
    + Serialize
    + for<'de> Deserialize<'de>
    + Send
    + Sync
    + Unpin
    + 'static;
