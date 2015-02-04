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
 * ffhttp_GoogleMirrorSubscriptions
 *
 * Class to encapsulate all the Google Mirror Subscriptions API calls.
 * https://developers.google.com/glass/v1/reference/#Subscriptions
 */
public with sharing class ffhttp_GoogleMirrorSubscriptions extends ffhttp_GoogleMirrorResource
{
	/**
	 * Constructor
	 *
	 * @param service The ffhttp_GoogleMirror service.
	 * @return Access to the Subscriptions API calls.
	 */
	public ffhttp_GoogleMirrorSubscriptions(ffhttp_GoogleMirror service) 
	{
		super(service);
	}
	
	/*********************************************************************************************************
	 * Requests
	 *********************************************************************************************************/
	
	/**
     * Deletes a subscription.
     *
     * @param subscriptionId The ID of the subscription.
     * @return the request
     */
	public DeleteRequest deleteRequest(String subscriptionId) 
	{
		return new DeleteRequest(this, subscriptionId);
	}
	
	/**
     * Creates a new subscription.
     *
     * @param subscription the ffhttp_GoogleMirrorModelSubscription
     * @return the request
     */
	public InsertRequest insertRequest(ffhttp_GoogleMirrorModelSubscription subscription)
	{
		return new InsertRequest(this, subscription);
	}
	
	/**
     * Retrieves a list of subscriptions for the authenticated user and service.
     *
     * @return the request
     */
	public ListRequest listRequest() 
	{
		return new ListRequest(this);
	}
	
	/**
     * Updates an existing subscription in place. 
     *
     * @param subscription the ffhttp_GoogleMirrorModelSubscription
     * @return the request
     */
	public UpdateRequest updateRequest(ffhttp_GoogleMirrorModelSubscription subscription)
	{
		return new UpdateRequest(this, subscription);
	}

	/*********************************************************************************************************
	 * API Callout Inner Classes
	 *********************************************************************************************************/

	public class DeleteRequest extends GoogleMirrorRequest
	{
		DeleteRequest(ffhttp_GoogleMirrorSubscriptions subscriptions, String subscriptionId) 
		{
			super(subscriptions, METADATA_ENDPOINT, ENDPOINT_SUBSCRIPTIONS + subscriptionId, REQUEST_METHOD_DELETE, null, null);
		}
	}
	
	public class InsertRequest extends GoogleMirrorRequest
	{
		InsertRequest(ffhttp_GoogleMirrorSubscriptions subscriptions, ffhttp_GoogleMirrorModelSubscription subscription)
		{
			super(subscriptions, METADATA_ENDPOINT, ENDPOINT_SUBSCRIPTIONS, REQUEST_METHOD_POST, subscription,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleMirrorModelSubscription.class));
		}
	}
	
	public class ListRequest extends GoogleMirrorRequest
	{
		ListRequest(ffhttp_GoogleMirrorSubscriptions subscriptions)
		{
			super(subscriptions, METADATA_ENDPOINT, ENDPOINT_SUBSCRIPTIONS, REQUEST_METHOD_GET, null,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleMirrorModelSubscription.ItemList.class));
		}
	}
	
	public class UpdateRequest extends GoogleMirrorRequest
	{
		UpdateRequest(ffhttp_GoogleMirrorSubscriptions subscriptions, ffhttp_GoogleMirrorModelSubscription subscription)
		{
			super(subscriptions, METADATA_ENDPOINT, ENDPOINT_SUBSCRIPTIONS + subscription.getId(), REQUEST_METHOD_PUT, subscription,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleMirrorModelSubscription.class));
		}
	}
}
