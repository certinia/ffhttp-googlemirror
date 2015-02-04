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
 * ffhttp_GoogleMirrorLocations
 *
 * Class to encapsulate all the Google Mirror Locations API calls.
 * https://developers.google.com/glass/v1/reference/#Locations
 */
public with sharing class ffhttp_GoogleMirrorLocations extends ffhttp_GoogleMirrorResource
{
	/**
	 * Constructor
	 *
	 * @param service The ffhttp_GoogleMirror service.
	 * @return Access to the Locations API calls.
	 */
	public ffhttp_GoogleMirrorLocations(ffhttp_GoogleMirror service) 
	{
		super(service);
	}
	
	/*********************************************************************************************************
	 * Requests
	 *********************************************************************************************************/
	
	/**
     * Gets a single location by ID.
     *
     * @param locationId The ID of the location or 'latest' for the last known location.
     * @return the request
     */
	public GetRequest getRequest(String locationId)
	{
		return new GetRequest(this, locationId);
	}
	
	/**
     * Retrieves a list of locations for the user. 
     *
     * @return the request
     */
	public ListRequest listRequest() 
	{
		return new ListRequest(this);
	}

	/*********************************************************************************************************
	 * API Callout Inner Classes
	 *********************************************************************************************************/
	
	public class GetRequest extends GoogleMirrorRequest
	{
		GetRequest(ffhttp_GoogleMirrorLocations locations, String locationId) 
		{
			super(locations, METADATA_ENDPOINT, ENDPOINT_LOCATIONS + locationId, REQUEST_METHOD_GET, null, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleMirrorModelLocation.class));
		}
	}
	
	public class ListRequest extends GoogleMirrorRequest
	{
		ListRequest(ffhttp_GoogleMirrorLocations locations)
		{
			super(locations, METADATA_ENDPOINT, ENDPOINT_LOCATIONS, REQUEST_METHOD_GET, null,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleMirrorModelLocation.ItemList.class));
		}
	}
}
