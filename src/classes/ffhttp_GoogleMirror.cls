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
 * ffhttp_GoogleMirror
 *
 * The main GoogleMirror client class.
 *
 * This class contains the methods to access each of the Google Mirror API calls.
 * https://developers.google.com/glass/v1/reference/
 */
public with sharing class ffhttp_GoogleMirror extends ffhttp_Client.AbstractClient 
{
	/**
	 * Constructor.
	 *
     * @param credentials HTTP request credentials required for authentication.
     * @return The Google Mirror API HTTP client giving access to all API calls.
     */
	public ffhttp_GoogleMirror(ffhttp_Client.Credentials credentials) 
	{ 
		this.setCredentials(credentials);
	}
	
	/**
	 * An accessor for creating requests from the Accounts collection.
	 *
	 * @return The resources collection.
	 */
	public ffhttp_GoogleMirrorAccounts accounts()
	{
		return new ffhttp_GoogleMirrorAccounts(this);
	}
	
	/**
	 * An accessor for creating requests from the Contacts collection.
	 *
	 * @return The resources collection.
	 */
	public ffhttp_GoogleMirrorContacts contacts()
	{
		return new ffhttp_GoogleMirrorContacts(this);
	}
	
	/**
	 * An accessor for creating requests from the Locations collection.
	 *
	 * @return The resources collection.
	 */
	public ffhttp_GoogleMirrorLocations locations()
	{
		return new ffhttp_GoogleMirrorLocations(this);
	}
	
	/**
	 * An accessor for creating requests from the Settings collection.
	 *
	 * @return The resources collection.
	 */
	public ffhttp_GoogleMirrorSettings settings()
	{
		return new ffhttp_GoogleMirrorSettings(this);
	}
	
	/**
	 * An accessor for creating requests from the Subscriptions collection.
	 *
	 * @return The resources collection.
	 */
	public ffhttp_GoogleMirrorSubscriptions subscriptions()
	{
		return new ffhttp_GoogleMirrorSubscriptions(this);
	}
	
	/**
	 * An accessor for creating requests from the Timeline collection.
	 *
	 * @return The resources collection.
	 */
	public ffhttp_GoogleMirrorTimeline timeline()
	{
		return new ffhttp_GoogleMirrorTimeline(this);
	}
	
	/**
	 * An accessor for creating requests from the Timeline.Attachments collection.
	 *
	 * @return The resources collection.
	 */
	public ffhttp_GoogleMirrorTimelineAttachments timelineAttachments()
	{
		return new ffhttp_GoogleMirrorTimelineAttachments(this);
	}
}
