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
 * ffhttp_GoogleMirrorModelTimeline
 *
 * An object that represents the meta data for a timeline in Google Mirror.
 * https://developers.google.com/glass/v1/reference/timeline
 */
public with sharing class ffhttp_GoogleMirrorModelTimeline extends ffhttp_GoogleMirrorModelAbstractObject
{
	//Statics																	
	//Notification Level
	public static final String NOTIFICATION_LEVEL_DEFAULT = 'DEFAULT';	//Notifications of default importance. 
																		//A chime will be played to alert users.
																		
	//Instance variables	
	private String bundleId;		//The bundle ID for this item. Services can specify a bundleId to group many items together.
									//They appear under a single top-level item on the device.
	private String canonicalUrl;	//A canonical URL pointing to the canonical/high quality version of the data represented 
									//by the timeline item.
	private DateTime created;		//The time at which this item was created, formatted according to RFC 3339.
	private DateTime displayTime;	//The time that should be displayed when this item is viewed in the timeline, formatted according to RFC 3339. 
									//This user's timeline is sorted chronologically on display time, so this will also determine where the item 
									//is displayed in the timeline. If not set by the service, the display time defaults to the updated time.
	private String etag;			//ETag for this item.	
	private String html;			//HTML content for this item. 
									//If both text and html are provided for an item, the html will be rendered in the timeline. 
									//Allowed HTML elements - You can use these elements in your timeline cards.
									//Headers: h1, h2, h3, h4, h5, h6
									//Images: img
									//Lists: li, ol, ul
									//HTML5 semantics: article, aside, details, figure, figcaption, footer, header, nav, section, summary, time
									//Structural: blockquote, br, div, hr, p, span
									//Style: b, big, center, em, i, u, s, small, strike, strong, style, sub, sup
									//Tables: table, tbody, td, tfoot, th, thead, tr
									//Blocked HTML elements: These elements and their contents are removed from HTML payloads.
									//Document headers: head, title
									//Embeds: audio, embed, object, source, video
									//Frames: frame, frameset
									//Scripting: applet, script
									//Other elements: Any elements that aren't listed are removed, but their contents are preserved.
	private String id;				//The ID of the timeline item. This is unique within a user's timeline.	
	private String inReplyTo;		//If this item was generated as a reply to another item, this field will be set to the ID of the item 
									//being replied to. This can be used to attach a reply to the appropriate conversation or post.	
	private Boolean isBundleCover;	//Whether this item is a bundle cover.
									//If an item is marked as a bundle cover, it will be the entry point to the bundle of items that
									//have the same bundleId as that item. It will be shown only on the main timeline — not within the 
									//opened bundle.
									//On the main timeline, items that are shown are:
									//Items that have isBundleCover set to true
									//Items that do not have a bundleId
									//In a bundle sub-timeline, items that are shown are:
									//Items that have the bundleId in question AND isBundleCover set to false
	private Boolean isDeleted;		//When true, indicates this item is deleted, and only the ID property is set.	
	private Boolean isPinned;		//When true, indicates this item is pinned, which means it's grouped alongside "active" 
									//items like navigation and hangouts, on the opposite side of the home screen from historical 
									//(non-pinned) timeline items. You can allow the user to toggle the value of this property with 
									//the TOGGLE_PINNED built-in menu item.	
	private Integer pinScore;		//For pinned items, this determines the order in which the item is displayed in the timeline, with a higher score 
									//appearing closer to the clock. Note: setting this field is currently not supported.	
	private String selfLink;		//A URL that can be used to retrieve this item.	
	private String sourceItemId;	//Opaque string you can use to map a timeline item to data in your own service.	writable
	private String speakableText;	//The speakable version of the content of this item. 
									//Along with the READ_ALOUD menu item, use this field to provide text that would be clearer when read aloud,
									//or to provide extended information to what is displayed visually on Glass.
									//Glassware should also specify the speakableType field, which will be spoken before this text in cases 
									//where the additional context is useful, for example when the user requests that the item be read aloud 
									//following a notification.
	private String speakableType;	//A speakable description of the type of this item. 
									//This will be announced to the user prior to reading the content of the item in cases where the additional 
									//context is useful, for example when the user requests that the item be read aloud following a notification.
									//This should be a short, simple noun phrase such as "Email", "Text message", or "Daily Planet News Update".
									//Glassware are encouraged to populate this field for every timeline item, even if the item does not contain 
									//speakableText or text so that the user can learn the type of the item without looking at the screen.
	private String text;			//Text content of this item.
	private String title;			//The title of this item.
	private DateTime updated;		//The time at which this item was last modified, formatted according to RFC 3339.	
	
	private Notification notification;		//Controls how notifications for this item are presented on the device. 
											//If this is missing, no notification will be generated.	

	private List<ffhttp_GoogleMirrorModelAttachment> attachments;	//A list of media attachments associated with this item. 
																	//As a convenience, you can refer to attachments in your HTML payloads 
																	//with the attachment or cid scheme. 
																	//For example:
																	//attachment: <img src="attachment:attachment_index"> 
																	//where attachment_index is the 0-based index of this array.
																	//cid: <img src="cid:attachment_id"> 
																	//where attachment_id is the ID of the attachment.
	private ffhttp_GoogleMirrorModelContact creator;				//The user or group that created this item.
	private List<ffhttp_GoogleMirrorModelContact> recipients;		//A list of users or groups that this item has been shared with.
	private ffhttp_GoogleMirrorModelLocation location; 				//The geographic location associated with this item.
	private List<ffhttp_GoogleMirrorModelMenuItem> menuItems;		//A list of menu items that will be presented to the user when this item is 
																	//selected in the timeline.
		
	/**
	 * Constructor
	 */
	public ffhttp_GoogleMirrorModelTimeline()
	{
		super(KIND_MIRROR_TIMELINE);
	}
	
	/**
	 * Get/Sets
	 */
	public String getBundleId()
	{
		return bundleId;
	}
	public ffhttp_GoogleMirrorModelTimeline setBundleId(String bundleId)
	{
		this.bundleId = bundleId;
		return this;
	}
	public String getCanonicalUrl()
	{
		return canonicalUrl;
	}
	public ffhttp_GoogleMirrorModelTimeline setCanonicalUrl(String canonicalUrl)
	{
		this.canonicalUrl = canonicalUrl;
		return this;
	}
	public DateTime getCreated()
	{
		return created;
	}
	public ffhttp_GoogleMirrorModelTimeline setCreated(DateTime created)
	{
		this.created = created;
		return this;
	}
	public DateTime getDisplayTime()
	{
		return displayTime;
	}
	public ffhttp_GoogleMirrorModelTimeline setDisplayTime(DateTime displayTime)
	{
		this.displayTime = displayTime;
		return this;
	}
	public String getEtag()
	{
		return etag;
	}
	public ffhttp_GoogleMirrorModelTimeline setEtag(String etag)
	{
		this.etag = etag;
		return this;
	}
	public String getHtml()
	{
		return html;
	}
	public ffhttp_GoogleMirrorModelTimeline setHtml(String html)
	{
		this.html = html;
		return this;
	}
	public String getId()
	{
		return id;
	}
	public ffhttp_GoogleMirrorModelTimeline setId(String id)
	{
		this.id = id;
		return this;
	}
	public String getInReplyTo()
	{
		return inReplyTo;
	}
	public ffhttp_GoogleMirrorModelTimeline setInReplyTo(String inReplyTo)
	{
		this.inReplyTo = inReplyTo;
		return this;
	}
	public Boolean getIsBundleCover()
	{
		return isBundleCover;
	}
	public ffhttp_GoogleMirrorModelTimeline setIsBundleCover(Boolean isBundleCover)
	{
		this.isBundleCover = isBundleCover;
		return this;
	}
	public Boolean getIsDeleted()
	{
		return isDeleted;
	}
	public ffhttp_GoogleMirrorModelTimeline setIsDeleted(Boolean isDeleted)
	{
		this.isDeleted = isDeleted;
		return this;
	}
	public Boolean getIsPinned()
	{
		return isPinned;
	}
	public ffhttp_GoogleMirrorModelTimeline setIsPinned(Boolean isPinned)
	{
		this.isPinned = isPinned;
		return this;
	}
	public Integer getPinScore()
	{
		return pinScore;
	}
	public ffhttp_GoogleMirrorModelTimeline setPinScore(Integer pinScore)
	{
		this.pinScore = pinScore;
		return this;
	}
	public String getSelfLink()
	{
		return selfLink;
	}
	public ffhttp_GoogleMirrorModelTimeline setSelfLink(String selfLink)
	{
		this.selfLink = selfLink;
		return this;
	}
	public String getSourceItemId()
	{
		return sourceItemId;
	}
	public ffhttp_GoogleMirrorModelTimeline setSourceItemId(String sourceItemId)
	{
		this.sourceItemId = sourceItemId;
		return this;
	}
	public String getSpeakableText()
	{
		return speakableText;
	}
	public ffhttp_GoogleMirrorModelTimeline setSpeakableText(String speakableText)
	{
		this.speakableText = speakableText;
		return this;
	}
	public String getSpeakableType()
	{
		return speakableType;
	}
	public ffhttp_GoogleMirrorModelTimeline setSpeakableType(String speakableType)
	{
		this.speakableType = speakableType;
		return this;
	}
	public String getText()
	{
		return text;
	}
	public ffhttp_GoogleMirrorModelTimeline setText(String text)
	{
		this.text = text;
		return this;
	}
	public String getTitle()
	{
		return title;
	}
	public ffhttp_GoogleMirrorModelTimeline setTitle(String title)
	{
		this.title = title;
		return this;
	}
	public DateTime getUpdated()
	{
		return updated;
	}
	public ffhttp_GoogleMirrorModelTimeline setUpdated(DateTime updated)
	{
		this.updated = updated;
		return this;
	}
	public List<ffhttp_GoogleMirrorModelMenuItem> getMenuItems()
	{
		return menuItems;
	}
	public ffhttp_GoogleMirrorModelTimeline setMenuItems(List<ffhttp_GoogleMirrorModelMenuItem> menuItems)
	{
		this.menuItems = menuItems;
		return this;
	}
	public Notification getNotification()
	{
		return notification;
	}
	public ffhttp_GoogleMirrorModelTimeline setNotification(Notification notification)
	{
		this.notification = notification;
		return this;
	}
	public List<ffhttp_GoogleMirrorModelAttachment> getAttachments()
	{
		return attachments;
	}
	public ffhttp_GoogleMirrorModelTimeline setAttachments(List<ffhttp_GoogleMirrorModelAttachment> attachments)
	{
		this.attachments = attachments;
		return this;
	}
	public ffhttp_GoogleMirrorModelContact getCreator()
	{
		return creator;
	}
	public ffhttp_GoogleMirrorModelTimeline setCreator(ffhttp_GoogleMirrorModelContact creator)
	{
		this.creator = creator;
		return this;
	}
	public List<ffhttp_GoogleMirrorModelContact> getRecipients()
	{
		return recipients;
	}
	public ffhttp_GoogleMirrorModelTimeline setRecipients(List<ffhttp_GoogleMirrorModelContact> recipients)
	{
		this.recipients = recipients;
		return this;
	}
	public ffhttp_GoogleMirrorModelLocation getLocation()
	{
		return location;
	}
	public ffhttp_GoogleMirrorModelTimeline setLocation(ffhttp_GoogleMirrorModelLocation location)
	{
		this.location = location;
		return this;
	}
	
	/**
	 * Notification
	 */
	public class Notification extends ffhttp_AbstractJsonSerializable
	{
		//Instance Variables
	 	private DateTime deliveryTime;									//The time at which the notification should be delivered.
		private String notification = NOTIFICATION_LEVEL_DEFAULT;		//Describes how important the notification is. 
																		//Allowed values are: DEFAULT.
		
		/**
		 * Get/Sets
		 */
		public DateTime getDeliveryTime()
		{
			return deliveryTime;
		}
		public Notification setDeliveryTime(DateTime deliveryTime)
		{
			this.deliveryTime = deliveryTime;
			return this;
		}
		public String getNotification()
		{
			return notification;
		}
		public Notification setNotification(String notification)
		{
			this.notification = notification;
			return this;
		}
	}
	
	/**
	 * Object to represent a list of Google Mirror TimelineItems.
	 */
	public with sharing class ItemList extends ffhttp_GoogleMirrorModelAbstractObject.AbstractList
	{
		List<ffhttp_GoogleMirrorModelTimeline> items;
		
		/**
		 * Constructor
		 */
		public ItemList()
		{
			super(KIND_MIRROR_TIMELINE_LIST);
		}
			
		public override List<ffhttp_GoogleMirrorModelAbstractObject> getItems() 
		{
			return (List<ffhttp_GoogleMirrorModelTimeline>)items;
		}
	}	
}
