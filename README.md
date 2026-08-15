# i-s-tokens

Solidity interfaces for the Dev Protocol s-tokens family.

## About

This repository publishes the Solidity interface contracts used by Dev Protocol
s-tokens consumers. It was originally generated from the
[`template-repos-ts-sol`](https://github.com/dev-protocol/template-repos-ts-sol)
template and the README title was never updated — this commit aligns the
README with the repository's actual purpose.

The published interfaces live in `contracts/interfaces/`:

- `ISTokensManager.sol`
- `ISTokensManagerStruct.sol`
- `ISTokensManagerV2.sol`
- `ITokenURIDescriptor.sol`

## Installation

```bash
yarn
```

## Available Scripts

- `yarn generate` — compile the Solidity contracts
- `yarn lint` — run Solhint and Prettier

## License

[MPL-2.0](https://github.com/dev-protocol/i-s-tokens/blob/main/LICENSE)
