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
 * ffhttp_GoogleMirrorTimelineAttachments
 *
 * Class to encapsulate all the Google Mirror Timeline.Attachments API calls.
 * https://developers.google.com/glass/v1/reference/#Timeline.attachments
 */
public with sharing class ffhttp_GoogleMirrorTimelineAttachments extends ffhttp_GoogleMirrorResource
{
	/**
	 * Constructor
	 *
	 * @param service The ffhttp_GoogleMirror service.
	 * @return Access to the Timeline Attachments API calls.
	 */
	public ffhttp_GoogleMirrorTimelineAttachments(ffhttp_GoogleMirror service) 
	{
		super(service);
	}
	
	/**
	 * Constructor
	 *
	 * @param service The ffhttp_GoogleMirror service.
	 * @param timelineId The id of the timeline.
	 * @return Access to the Timeline Attachments API calls.
	 */
	public ffhttp_GoogleMirrorTimelineAttachments(ffhttp_GoogleMirror service, String timelineId)
	{
		super(service, new ffhttp_GoogleMirrorModelTimeline().setId(timelineId));
	}
	
	/**
	 * Constructor
	 *
	 * @param service The ffhttp_GoogleMirror service.
	 * @param timeline The ffhttp_GoogleMirrorModelTimeline.
	 * @return Access to the Timeline Attachments API calls.
	 */
	public ffhttp_GoogleMirrorTimelineAttachments(ffhttp_GoogleMirror service, ffhttp_GoogleMirrorModelTimeline timeline) 
	{
		super(service, timeline);
	}
	
	/*********************************************************************************************************
	 * Requests
	 *********************************************************************************************************/
	
	/**
     * Deletes an attachment from a timeline item. 
     *
     * @param attachmentId The ID of the attachment.
     * @return the request
     */
	public DeleteRequest deleteRequest(String attachmentId) 
	{
		validateTimeline();
		return new DeleteRequest(this, attachmentId);
	}
	
	/**
	 * Downloads the contents of an attachment.
	 *
	 * This is NOT part of the Google Mirror API, however it is a useful call for getting the contents of the attachment.
	 *
	 * @param attachment The ffhttp_GoogleMirrorModelAttachment containing the metadata for the attachment.
     * @return the request
	 */
	public DownloadRequest downloadRequest(ffhttp_GoogleMirrorModelAttachment attachment)
	{ 
		validateTimeline();
		return new DownloadRequest(this, attachment);
	}
	
	/**
     * Retrieves an attachment on a timeline item by item ID and attachment ID. 
     *
     * @param attachmentId The ID of the attachment.
     * @return the request
     */
	public GetRequest getRequest(String attachmentId)
	{
		validateTimeline();
		return new GetRequest(this, attachmentId);
	}
	
	/**
     * Inserts a new item into the timeline. 
     *
     * @param content the BlobContent
     * @return the request
     */
	public InsertRequest insertRequest(Blob content, String contentType)
	{
		validateTimeline();
		
		ffhttp_BlobContent bc = new ffhttp_BlobContent(content, contentType);
		InsertRequest request = new InsertRequest(this, bc);
		return request.setUploadType(ffhttp_GoogleMirrorModelAbstractObject.UPLOAD_TYPE_MEDIA);
	}
	
	/**
     * Retrieves a list of timeline items for the authenticated user. 
     *
     * @return the request
     */
	public ListRequest listRequest() 
	{
		validateTimeline();
		return new ListRequest(this);
	}

	/*********************************************************************************************************
	 * API Callout Inner Classes
	 *********************************************************************************************************/

	public class DeleteRequest extends GoogleMirrorTimelineRequest
	{
		DeleteRequest(ffhttp_GoogleMirrorTimelineAttachments timelineAttachments, String attachmentId) 
		{
			super(timelineAttachments, METADATA_ENDPOINT, ENDPOINT_ATTACHMENTS + attachmentId, REQUEST_METHOD_DELETE, null, null);
		}
	}
	
	public class DownloadRequest extends ffhttp_Client.AbstractClientRequest
	{ 
	 	DownloadRequest(ffhttp_GoogleMirrorTimelineAttachments timelineAttachments, ffhttp_GoogleMirrorModelAttachment attachment)
	 	{
			super(timelineAttachments.getService(), attachment.getContentUrl(), REQUEST_METHOD_GET, null, null);
		}
	}
	
	public class GetRequest extends GoogleMirrorTimelineRequest
	{
		GetRequest(ffhttp_GoogleMirrorTimelineAttachments timelineAttachments, String attachmentId) 
		{
			super(timelineAttachments, METADATA_ENDPOINT, ENDPOINT_ATTACHMENTS + attachmentId, REQUEST_METHOD_GET, null, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleMirrorModelAttachment.class));
		}
	}
	
	public class InsertRequest extends GoogleMirrorTimelineRequest
	{
		InsertRequest(ffhttp_GoogleMirrorTimelineAttachments timelineAttachments, ffhttp_BlobContent content)
		{
			super(timelineAttachments, UPLOAD_ENDPOINT, ENDPOINT_ATTACHMENTS, REQUEST_METHOD_POST, content,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleMirrorModelAttachment.class));
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
	
	public class ListRequest extends GoogleMirrorTimelineRequest
	{
		ListRequest(ffhttp_GoogleMirrorTimelineAttachments timelineAttachments)
		{
			super(timelineAttachments, METADATA_ENDPOINT, ENDPOINT_ATTACHMENTS, REQUEST_METHOD_GET, null,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleMirrorModelAttachment.ItemList.class));
		}
	}
}
