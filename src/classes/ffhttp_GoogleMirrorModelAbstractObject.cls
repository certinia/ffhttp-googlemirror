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
 * ffhttp_GoogleMirrorModelAbstractObject
 *
 * Base Google Mirror object returned via the Google Mirror Response.
 * All other Google Mirror objects extend this class.
 */
public abstract class ffhttp_GoogleMirrorModelAbstractObject extends ffhttp_AbstractJsonSerializable
{
	//Statics
	//Google Mirror object types
	public static final String KIND_MIRROR_CONTACT = 'mirror#contact';
	public static final String KIND_MIRROR_LOCATION = 'mirror#location';
	public static final String KIND_MIRROR_SETTING = 'mirror#setting';
	public static final String KIND_MIRROR_SUBSCRIPTION = 'mirror#subscription';
	public static final String KIND_MIRROR_TIMELINE = 'mirror#timelineItem';
	
	//Google Mirror list object types
	public static final String KIND_MIRROR_ATTACHMENTS_LIST = 'mirror#attachmentsList';
	public static final String KIND_MIRROR_CONTACTS_LIST = 'mirror#contacts';
	public static final String KIND_MIRROR_LOCATIONS_LIST = 'mirror#locationsList';
	public static final String KIND_MIRROR_SUBSCRIPTIONS_LIST = 'mirror#subscriptionsList';
	public static final String KIND_MIRROR_TIMELINE_LIST = 'mirror#timeline';
	
	//UploadTypes
	public static final String UPLOAD_TYPE_MEDIA = 'media';				//Upload the media only, without any metadata.
	public static final String UPLOAD_TYPE_MULTIPART = 'multipart';		//Upload both the media and its metadata, in a single request.
	public static final String UPLOAD_TYPE_RESUMABLE = 'resumable';		//Upload the file in a resumable fashion, using a series of at least two 
																		//requests where the first request includes the metadata.
	
	//Instance Variables
	private String kind;	//The kind of Google Mirror object
	
	/**
	 * Constructor
	 */
	public ffhttp_GoogleMirrorModelAbstractObject(String kind)
	{
		this.kind = kind;
	}
	
	/**
	 * Get/Sets
	 */
	public String getKind()
	{
		return kind;
	}
	
	/**
	 * AbstractList
	 *
	 * Base Google Mirror object for lists returned via the Google Mirror Response.
 	 * All other Google Mirror lists extend this class.
	 */
	public abstract class AbstractList extends ffhttp_GoogleMirrorModelAbstractObject
	{	
		//Instance Variables
		private String nextPageToken;	//The page token for the next page of items.	
		
		//Abstract methods
		public abstract List<ffhttp_GoogleMirrorModelAbstractObject> getItems();	//The actual list of items 
																					//(e.g. contacts, subscriptions, etc...).
		/**
		 * Constructor
		 */
		public AbstractList(String kind)
		{
			super(kind);
		}
		
		/**
		 * Get/Sets
		 */
		public String getNextPageToken()
		{
			return nextPageToken;
		}
		public AbstractList setNextPageToken(String nextPageToken)
		{
			this.nextPageToken = nextPageToken;
			return this;
		}
	}
}
