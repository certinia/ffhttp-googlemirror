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
 * ffhttp_GoogleMirrorModelSetting
 *
 * An object that represents the meta data for a setting in Google Mirror.
 * https://developers.google.com/glass/v1/reference/settings
 */
public with sharing class ffhttp_GoogleMirrorModelSetting extends ffhttp_GoogleMirrorModelAbstractObject
{
	//Instance Variables
	private String id;		//The setting's ID. 
							//The following IDs are valid:
							//locale - The key to the user’s language/locale (BCP 47 identifier) that Glassware should use to render localized content.
							//timezone - The key to the user’s current time zone region as defined in the tz database. Example: America/Los_Angeles.
	private String value; 	//The setting value, as a string.

	/**
	 * Constructor
	 */
	public ffhttp_GoogleMirrorModelSetting()
	{
		super(KIND_MIRROR_SETTING);
	}
	
	/**
	 * Get/Sets
	 */
	public String getId()
	{
		return id;
	}
	public ffhttp_GoogleMirrorModelSetting setId(String id)
	{
		this.id = id;
		return this;
	}
	public String getValue()
	{
		return value;
	}
	public ffhttp_GoogleMirrorModelSetting setValue(String value)
	{
		this.value = value;
		return this;
	}
}
