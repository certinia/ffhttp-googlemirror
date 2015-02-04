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
 * ffhttp_GoogleMirrorModelAttachment
 *
 * An object that represents the meta data for a timeline.attachment in Google Mirror.
 * https://developers.google.com/glass/v1/reference/timeline/attachments
 */
public with sharing class ffhttp_GoogleMirrorModelAttachment extends ffhttp_GoogleMirrorModelAbstractObject
{
	private String id;						//The ID of the attachment.	
	private String contentType;				//The MIME type of the attachment.	
	private String contentUrl;				//The URL for the content.
	private Boolean isProcessingContent;	//Indicates that the contentUrl is not available because the attachment content 
											//is still being processed. If the caller wishes to retrieve the content, 
											//it should try again later.	
	
	/**
	 * Constructor
	 */
	public ffhttp_GoogleMirrorModelAttachment()
	{
		super(null);
	}
										
	/**
	 * Get/Sets
	 */
	public String getId()
	{
		return id;
	}
	public ffhttp_GoogleMirrorModelAttachment setId(String id)
	{
		this.id = id;
		return this;
	}
	public String getContentType()
	{
		return contentType;
	}
	public ffhttp_GoogleMirrorModelAttachment setContentType(String contentType)
	{
		this.contentType = contentType;
		return this;
	}
	public String getContentUrl()
	{
		return contentUrl;
	}
	public ffhttp_GoogleMirrorModelAttachment setContentUrl(String contentUrl)
	{
		this.contentUrl = contentUrl;
		return this;
	}
	public Boolean getIsProcessingContent()
	{
		return isProcessingContent;
	}
	public ffhttp_GoogleMirrorModelAttachment setIsProcessingContent(Boolean isProcessingContent)
	{
		this.isProcessingContent = isProcessingContent;
		return this;
	}
    
	/**
	 * Object to represent a list of Google Mirror Timeline.Attachments.
	 */
	public with sharing class ItemList extends ffhttp_GoogleMirrorModelAbstractObject.AbstractList
	{
		List<ffhttp_GoogleMirrorModelAttachment> items;
		
		/**
		 * Constructor
		 */
		public ItemList()
		{
			super(KIND_MIRROR_ATTACHMENTS_LIST);
		}
			
		public override List<ffhttp_GoogleMirrorModelAbstractObject> getItems() 
		{
			return (List<ffhttp_GoogleMirrorModelAttachment>)items;
		}
	}
}
