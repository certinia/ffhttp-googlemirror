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
 * ffhttp_GoogleMirrorTimeline
 *
 * Class to encapsulate all the Google Mirror Timeline API calls.
 * https://developers.google.com/glass/v1/reference/#Timeline
 */
public with sharing class ffhttp_GoogleMirrorTimeline extends ffhttp_GoogleMirrorResource
{
	//Statics
	//Order By Types
	public static final String ORDER_BY_DISPLAY_TIME = 'displayTime';
	public static final String ORDER_BY_WRITE_TIME = 'writeTime';
	
	/**
	 * Constructor
	 *
	 * @param service The ffhttp_GoogleMirrorTimeline service.
	 * @return Access to the Timeline API calls.
	 */
	public ffhttp_GoogleMirrorTimeline(ffhttp_GoogleMirror service) 
	{
		super(service);
	}
	
	/*********************************************************************************************************
	 * Requests
	 *********************************************************************************************************/
	
	/**
     * Deletes a timeline item.
     *
     * @param timelineItemId The ID of the timelineItem.
     * @return the request
     */
	public DeleteRequest deleteRequest(String timelineItemId) 
	{
		return new DeleteRequest(this, timelineItemId);
	}
	
	/**
     * Gets a single timeline item by ID.
     *
     * @param timelineItemId The ID of the timelineItem.
     * @return the request
     */
	public GetRequest getRequest(String timelineItemId)
	{
		return new GetRequest(this, timelineItemId);
	}

	/**
     * Inserts a new item into the timeline. 
     * 
     * @param timelineItem The ffhttp_GoogleMirrorModelTimeline
     * @return the request
     */
	public InsertRequest insertRequest(ffhttp_GoogleMirrorModelTimeline timelineItem)
	{
		return new InsertRequest(this, timelineItem);
	}
	
	/**
     * Retrieves a list of timeline items for the authenticated user. 
     *
     * @return the request
     */
	public ListRequest listRequest() 
	{
		return new ListRequest(this);
	}
	
	/**
     * Updates a timeline item in place.
     * 
     * @param timelineItem The ffhttp_GoogleMirrorModelTimeline
     * @return the request
     */
	public UpdateRequest updateRequest(ffhttp_GoogleMirrorModelTimeline timelineItem)
	{
		return new UpdateRequest(this, timelineItem.getId(), timelineItem);
	}

	/*********************************************************************************************************
	 * API Callout Inner Classes
	 *********************************************************************************************************/

	public class DeleteRequest extends GoogleMirrorRequest
	{
		DeleteRequest(ffhttp_GoogleMirrorTimeline timeline, String timelineItemId) 
		{
			super(timeline, METADATA_ENDPOINT, ENDPOINT_TIMELINE + timelineItemId, REQUEST_METHOD_DELETE, null, null);
		}
	}
	
	public class GetRequest extends GoogleMirrorRequest
	{
		GetRequest(ffhttp_GoogleMirrorTimeline timeline, String timelineItemId) 
		{
			super(timeline, METADATA_ENDPOINT, ENDPOINT_TIMELINE + timelineItemId, REQUEST_METHOD_GET, null, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleMirrorModelTimeline.class));
		}
	}
	
	public class InsertRequest extends GoogleMirrorRequest
	{
		InsertRequest(ffhttp_GoogleMirrorTimeline timeline, ffhttp_IHttpContent content)
		{
			super(timeline, METADATA_ENDPOINT, ENDPOINT_TIMELINE, REQUEST_METHOD_POST, content,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleMirrorModelTimeline.class));
		}
		
		/**
		 * Request parameters
		 */
		public String getUploadType()
		{
			return getParam('uploadType');
		}
		public InsertRequest setUploadType(String uploadType)
		{
			addParam('uploadType', uploadType);
			return this;
		}
	}
	
	public class ListRequest extends GoogleMirrorRequest
	{
		ListRequest(ffhttp_GoogleMirrorTimeline timeline)
		{
			super(timeline, METADATA_ENDPOINT, ENDPOINT_TIMELINE, REQUEST_METHOD_GET, null,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleMirrorModelTimeline.ItemList.class));
		}
		
		/**
		 * Request parameters
		 */
		public String getBundleId()
		{
			return getParam('bundleId');
		}
		public ListRequest setBundleId(String bundleId)
		{
			addParam('bundleId', bundleId);
			return this;
		}
		public Boolean getIncludeDeleted()
		{
			return getParam('includeDeleted', false);
		}
		public ListRequest setIncludeDeleted(Boolean includeDeleted)
		{
			addParam('includeDeleted', includeDeleted);
			return this;
		}
		public Integer getMaxResults()
		{
			return getParam('maxResults', 20);
		}
		public ListRequest setMaxResults(Integer maxResults)
		{	
			addParam('maxResults', maxResults);
			return this;
		}
		public String getOrderBy()
		{
			return getParam('orderBy', 'displayTime');
		}
		public ListRequest setOrderBy(String orderBy)
		{	
			addParam('orderBy', orderBy);
			return this;
		} 
		public String getPageToken()
		{	
			return getParam('pageToken');
		}
		public ListRequest setPageToken(String pageToken)
		{
			addParam('pageToken', pageToken);
			return this;
		}	
		public Boolean getPinnedOnly()
		{
			return getParam('pinnedOnly', false);
		}
		public ListRequest setPinnedOnly(Boolean pinnedOnly)
		{
			addParam('pinnedOnly', pinnedOnly);
			return this;
		}
		public String getSourceItemId()
		{
			return getParam('sourceItemId');
		}
		public ListRequest setSourceItemId(String sourceItemId)
		{	
			addParam('sourceItemId', sourceItemId);
			return this;
		} 
	}
	
	public class UpdateRequest extends GoogleMirrorRequest
	{
		UpdateRequest(ffhttp_GoogleMirrorTimeline timeline, String timelineItemId, ffhttp_IHttpContent content)
		{
			super(timeline, METADATA_ENDPOINT, ENDPOINT_TIMELINE + timelineItemId, REQUEST_METHOD_PUT, content,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleMirrorModelTimeline.class));
		}
		
		/**
		 * Request parameters
		 */
		public String getUploadType()
		{
			return getParam('uploadType');
		}
		public UpdateRequest setUploadType(String uploadType)
		{
			addParam('uploadType', uploadType);
			return this;
		}
	}
}
