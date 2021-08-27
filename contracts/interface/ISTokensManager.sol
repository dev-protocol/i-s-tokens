// SPDX-License-Identifier: MPL-2.0
pragma solidity >=0.5.17;
pragma experimental ABIEncoderV2;

interface ISTokensManager {
	/*
	 * @dev Struct to declares a staking position.
	 * @param owner The address of the owner of the new staking position
	 * @param property The address of the Property as the staking destination
	 * @param amount The amount of the new staking position
	 * @param price The latest unit price of the cumulative staking reward
	 * @param cumulativeReward The cumulative withdrawn reward amount
	 * @param pendingReward The pending withdrawal reward amount amount
	 */
	struct StakingPosition {
		address property;
		uint256 amount;
		uint256 price;
		uint256 cumulativeReward;
		uint256 pendingReward;
	}

	/*
	 * @dev Struct to declares mint parameters.
	 * @param owner The address of the owner of the new staking position
	 * @param property The address of the Property as the staking destination
	 * @param amount The amount of the new staking position
	 * @param price The latest unit price of the cumulative staking reward
	 * This value should be equal to the 3rd return value of the Lockup.calculateCumulativeRewardPrices
	 */
	struct MintParams {
		address owner;
		address property;
		uint256 amount;
		uint256 price;
	}

	/*
	 * @dev Struct to declares update parameters.
	 * @param tokenId The ID of the staking position
	 * @param amount The new staking amount
	 * @param price The latest unit price of the cumulative staking reward
	 * This value equals the 3rd return value of the Lockup.calculateCumulativeRewardPrices
	 * @param cumulativeReward The cumulative withdrawn reward amount
	 * @param pendingReward The pending withdrawal reward amount amount
	 */
	struct UpdateParams {
		uint256 tokenId;
		uint256 amount;
		uint256 price;
		uint256 cumulativeReward;
		uint256 pendingReward;
	}
	/*
	 * @dev perform the initial setup
	 * @param _config AddressConfig
	 */
	function initialize(address _config) external;

	/*
	 * @dev Creates the new staking position for the caller.
	 * Mint must be called from the Lockup contract.
	 * @param _params MintParams
	 * @return tokenId The ID of the created new staking position
	 * @return position The StakingPosition of the new staking position
	 */
	function mint(MintParams calldata _params)
		external
		returns (uint256, StakingPosition memory);

	/*
	 * @dev Updates the existing staking position.
	 * Update must be called from the Lockup contract.
	 * @param _params UpdateParams
	 * @return position The StakingPosition of the updated staking position
	 */
	function update(UpdateParams calldata _params)
		external
		returns (StakingPosition memory);

	/*
	 * @dev Gets the existing staking position.
	 * @param _tokenId The ID of the staking position
	 * @return position The results of StakingPosition
	 */
	function positions(uint256 _tokenId)
		external
		view
		returns (StakingPosition memory);
}
