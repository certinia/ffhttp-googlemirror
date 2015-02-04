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
 * ffhttp_GoogleMirrorResource
 *
 * Abstract class to provide the base functionality for all Google Mirror API calls.
 * 
 * Google provides a set of resources that are all extended by this class.
 * See https://developers.google.com/glass/v1/reference/
 */
public abstract class ffhttp_GoogleMirrorResource 
{
	//Statics
	//OAuth Scopes
	public static final String SCOPE_GLASS_TIMELINE = 'https://www.googleapis.com/auth/glass.timeline';
	public static final String SCOPE_GLASS_LOCATION = 'https://www.googleapis.com/auth/glass.location';
	
	//Endpoints 
	public static final String UPLOAD_ENDPOINT = 'https://www.googleapis.com/upload/mirror/v1/';
	public static final String METADATA_ENDPOINT = 'https://www.googleapis.com/mirror/v1/';
		
	public static final String ENDPOINT_ACCOUNTS = 'accounts/';
	public static final String ENDPOINT_ATTACHMENTS = 'attachments/';
	public static final String ENDPOINT_CONTACTS = 'contacts/';
	public static final String ENDPOINT_LOCATIONS = 'locations/';
	public static final String ENDPOINT_SETTINGS = 'settings/';
	public static final String ENDPOINT_SUBSCRIPTIONS = 'subscriptions/';
	public static final String ENDPOINT_TIMELINE = 'timeline/';
	
	//Instance variables
	private ffhttp_GoogleMirror m_service;
	private ffhttp_GoogleMirrorModelTimeline m_timeline;
	
	/**
	 * Constructors
	 */
	public ffhttp_GoogleMirrorResource(ffhttp_GoogleMirror service) 
	{
		m_service = service;
	}
	
	public ffhttp_GoogleMirrorResource(ffhttp_GoogleMirror service, ffhttp_GoogleMirrorModelTimeline timeline) 
	{
		m_service = service;
		m_timeline = timeline;
	}
	
	public void validateTimeline() 
	{
		if (m_timeline == null) throw new ffhttp_SystemException(System.Label.ffhttp_gmirror_NullTimeline);
  		if (m_timeline.getId() == null) throw new ffhttp_SystemException(System.Label.ffhttp_gmirror_NullTimelineId);
	}
	
	/**
	 * Get/Sets
	 */
	public ffhttp_GoogleMirror getService() 
	{
		return m_service;
	}
	public ffhttp_GoogleMirrorResource setService(ffhttp_GoogleMirror service) 
	{
		m_service = service;
		return this;
	}
	public ffhttp_GoogleMirrorModelTimeline getTimeline() 
	{
		return m_timeline;
	}
	public ffhttp_GoogleMirrorResource setTimeline(ffhttp_GoogleMirrorModelTimeline timeline) 
	{
		m_timeline = timeline;
		return this;
	}
	
	/*********************************************************************************************************
	 * Abstract inner classes
	 *********************************************************************************************************/
	
	/**
	 * GoogleMirrorTimelineRequest
	 *
	 * Abstract class created for requests that involve a timeline e.g. all 'Timeline.Attachment' requests require this.
	 */
	public abstract class GoogleMirrorTimelineRequest extends GoogleMirrorRequest
	{
		protected GoogleMirrorTimelineRequest(ffhttp_GoogleMirrorResource resource, String endpoint, String subEndpoint, String method, 
											  ffhttp_IHttpContent content, ffhttp_IDeserialize responseDeserializer) 
		{
			super(resource, endpoint, ENDPOINT_TIMELINE + resource.getTimeline().getId() + '/' + subEndpoint, 
				  method, content, responseDeserializer);
		}
	}
	
	/**
	 * GoogleMirrorRequest
	 * 
	 * Abtract class created for all Google Mirror Requests.
	 */
	public abstract class GoogleMirrorRequest extends ffhttp_Client.AbstractClientRequest
	{ 
	 	protected GoogleMirrorRequest(ffhttp_GoogleMirrorResource resource, String mainEndpoint, String subEndpoint, String method, 
	 								 ffhttp_IHttpContent content, ffhttp_IDeserialize responseDeserializer) 
	 	{
			super(resource.getService(), mainEndpoint + subEndpoint, method, content, responseDeserializer);
		}
	}
}
