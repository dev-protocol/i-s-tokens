/* eslint-disable @typescript-eslint/naming-convention */
import '@nomiclabs/hardhat-ethers'
import '@nomiclabs/hardhat-waffle'
import { HardhatUserConfig } from 'hardhat/config'

const config: HardhatUserConfig = {
	solidity: {
		compilers: [
			{
				version: '0.8.7',
				settings: {
					optimizer: {
						enabled: true,
						runs: 1000,
					},
				},
			},
		],
		overrides: {
			'contracts/interface/ISTokensManager.sol': {
				version: '0.5.17',
			},
		},
	},
}

export default config
