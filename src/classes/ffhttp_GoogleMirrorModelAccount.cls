/**
 * Copyright (c) 2014, FinancialForce.com, inc
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification, 
 *   are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice, 
 *      this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice, 
 *      this list of conditions and the following disclaimer in the documentation 
 *      and/or other materials provided with the distribution.
 * - Neither the name of the FinancialForce.com, inc nor the names of its contributors 
 *      may be used to endorse or promote products derived from this software without 
 *      specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
 *  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL 
 *  THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
 *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 *  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 *  OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 *  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**/

/**
 * ffhttp_GoogleMirrorModelAccount
 *
 * An object that represents the meta data for a user account in Google Mirror.
 * https://developers.google.com/glass/v1/reference/accounts#resource
 */
public with sharing class ffhttp_GoogleMirrorModelAccount extends ffhttp_AbstractJsonSerializable
{
	//Instance Variables
	private List<AuthToken> authTokens;
	private List<String> features;	
	private String password;
	private List<UserData> userData;
	
	//Strictly speaking the following variables are not part of the account model as represented on the Google website.
	//However as we pass this object to the accounts call, rather than having a separate object it makes sense to have
	//these variables here.
	private String accountName;		//The name of the account to be passed to the Android Account Manager.
	private String accountType;		//Account type to be passed to Android Account Manager.
	private String userToken;		//The ID for the user.
	
	/**
	 * Get/Sets
	 */
	public List<AuthToken> getAuthTokens() 
	{
		return authTokens;
	}
	public ffhttp_GoogleMirrorModelAccount setAuthTokens(List<AuthToken> authTokens) 
	{
		this.authTokens = authTokens;
		return this;
	}
	public List<String> getFeatures() 
	{
		return features;
	}
	public ffhttp_GoogleMirrorModelAccount setFeatures(List<String> features) 
	{
		this.features = features;
		return this;
	}
	public String getPassword() 
	{
		return password;
	}
	public ffhttp_GoogleMirrorModelAccount setPassword(String password) 
	{
		this.password = password;
		return this;
	}
	public List<UserData> getUserData() 
	{
		return userData;
	}
	public ffhttp_GoogleMirrorModelAccount setUserData(List<UserData> userData) 
	{
		this.userData = userData;
		return this;
	}
	public String getAccountName() 
	{
		return accountName;
	}
	public ffhttp_GoogleMirrorModelAccount setAccountName(String accountName) 
	{
		this.accountName = accountName;
		return this;
	}
	public String getAccountType() 
	{
		return accountType;
	}
	public ffhttp_GoogleMirrorModelAccount setAccountType(String accountType) 
	{
		this.accountType = accountType;
		return this;
	}
	public String getUserToken() 
	{
		return userToken;
	}
	public ffhttp_GoogleMirrorModelAccount setUserToken(String userToken) 
	{
		this.userToken = userToken;
		return this;
	}
	
	
	/**
	 * AuthToken
	 */
	public class AuthToken extends ffhttp_AbstractJsonSerializable
	{
		//Instance Variables
		private String authToken;
		private String type;
		
		/**
		 * Gets/Sets
		 */
		public String getAuthToken() 
		{
			return authToken;
		}
		public AuthToken setAuthToken(String authToken) 
		{
			this.authToken = authToken;
			return this;
		}
		public String getType() 
		{
			return type;
		}
		public AuthToken setType(String type) 
		{
			this.type = type;
			return this;
		}
	}
	
	/**
	 * UserData
	 */
	public class UserData extends ffhttp_AbstractJsonSerializable
	{
		//Instance Variables
		private String key;
		private String value;
		
		/**
		 * Gets/Sets
		 */
		public String getKey() 
		{
			return key;
		}
		public UserData setKey(String key) 
		{
			this.key = key;
			return this;
		}
		public String getValue() 
		{
			return value;
		}
		public UserData setValue(String value) 
		{
			this.value = value;
			return this;
		}
	}
}
