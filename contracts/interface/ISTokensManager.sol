// SPDX-License-Identifier: MPL-2.0
pragma solidity >=0.5.17;

interface ISTokensManager {
	/*
	 * @dev perform the initial setup
	 * @param _config AddressConfig
	 */
	function initialize(address _config) external;

	/*
	 * @dev Creates the new staking position for the caller.
	 * Mint must be called from the Lockup contract.
	 * @param _owner The address of the owner of the new staking position
	 * @param _property The address of the Property as the staking destination
	 * @param _amount The amount of the new staking position
	 * @param _price The latest unit price of the cumulative staking reward
	 * @return tikenId_ The ID of the created new staking position
	 */
	function mint(
		address _owner,
		address _property,
		uint256 _amount,
		uint256 _price
	) external returns (uint256 tikenId_);

	/*
	 * @dev Updates the existing staking position.
	 * Update must be called from the Lockup contract.
	 * @param _tikenId The ID of the staking position
	 * @param _amount The new staking amount
	 * @param _price The latest unit price of the cumulative staking reward
	 * This value equals the 3rd return value of the Lockup.calculateCumulativeRewardPrices
	 * @param _cumulativeReward The cumulative withdrawn reward amount
	 * @param _pendingReward The pending withdrawal reward amount amount
	 * @return bool On success, true will be returned
	 */
	function update(
		uint256 _tikenId,
		uint256 _amount,
		uint256 _price,
		uint256 _cumulativeReward,
		uint256 _pendingReward
	) external returns (bool);

	/*
	 * @dev Gets the existing staking position.
	 * @param _tokenId The ID of the staking position
	 * @return property_ The address of the Property as the staking destination
	 * @return amount_ The amount of the new staking position
	 * @return price_ The latest unit price of the cumulative staking reward
	 * @return cumulativeReward_ The cumulative withdrawn reward amount
	 * @return pendingReward_ The pending withdrawal reward amount amount
	 */
	function positions(uint256 _tokenId)
		external
		view
		returns (
			address property_,
			uint256 amount_,
			uint256 price_,
			uint256 cumulativeReward_,
			uint256 pendingReward_
		);
}
