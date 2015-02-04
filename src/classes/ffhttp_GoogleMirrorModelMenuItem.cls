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
 * ffhttp_GoogleMirrorModelMenuItem
 *
 * An object that represents the meta data for a Timeline.MenuItem in Google Mirror.
 * https://developers.google.com/glass/v1/reference/timeline
 */
public with sharing class ffhttp_GoogleMirrorModelMenuItem extends ffhttp_AbstractJsonSerializable
{
	//MenuItem Actions
	public static final String MENU_ITEM_ACTION_CUSTOM = 'CUSTOM'; 			//Custom action set by the service. 
																			//When the user selects this menuItem, the API triggers a notification
																			//to your callbackUrl with the userActions.type set to CUSTOM and the 
																			//userActions.payload set to the ID of this menu item. 
																			//This is the default value.
																						
	public static final String MENU_ITEM_ACTION_REPLY = 'REPLY'; 			//Initiate a reply to the timeline item using the voice recording UI. 
																			//The creator attribute must be set in the timeline item for this menu
																			//to be available.
	public static final String MENU_ITEM_ACTION_REPLY_ALL = 'REPLY_ALL'; 	//Same behavior as REPLY. The original timeline item's recipients will 
																			//be added to the reply item.
	public static final String MENU_ITEM_ACTION_DELETE = 'DELETE'; 			//Delete the timeline item.
	public static final String MENU_ITEM_ACTION_SHARE = 'SHARE';			//Share the timeline item with the available contacts.
	public static final String MENU_ITEM_ACTION_OPEN_URI = 'OPEN_URI'; 		//Open the payload of the menu item in the browser.
	public static final String MENU_ITEM_ACTION_PLAY_VIDEO = 'PLAY_VIDEO';	//Open the payload of the menu item in the Glass video player.
	public static final String MENU_ITEM_ACTION_READ_ALOUD = 'READ_ALOUD'; 	//Read the timeline item's speakableText aloud; if this field is not set, 
																			//read the text field; if none of those fields are set, this menu item 
																			//is ignored.
	public static final String MENU_ITEM_ACTION_VOICE_CALL = 'VOICE_CALL';	//Initiate a phone call using the timeline item's creator.phoneNumber 
																			//attribute as recipient.

	public static final String MENU_ITEM_ACTION_NAVIGATE = 'NAVIGATE'; 				//Navigate to the timeline item's location.
	public static final String MENU_ITEM_ACTION_TOGGLE_PINNED = 'TOGGLE_PINNED'; 	//Toggle the isPinned state of the timeline item.
	public static final String MENU_ITEM_ACTION_SEND_MESSAGE = 'SEND_MESSAGE';		//Initiate sending a message to the timeline item's creator:
																					//If the creator.phoneNumber is set and Glass is connected to an 
																					//Android phone, the message is an SMS.
																					//Otherwise, if the creator.email is set, the message is an email.
																					
	public static final String MENU_ITEM_ACTION_GET_MEDIA_INPUT = 'GET_MEDIA_INPUT';	//Allow users to provide media payloads to Glassware from a
																						//menu item (currently, only transcribed text from voice 
																						//input is supported). 
																						//Subscribe to notifications when users invoke this menu item 
																						//to receive the timeline item ID. Retrieve the media from 
																						//the timeline item in the payload property.
																						
	//MenuItem Value States
	public static final String MENU_ITEM_VALUE_STATE_DEFAULT = 'DEFAULT'; 		//Default value shown when displayed in the menuItems list.
	public static final String MENU_ITEM_VALUE_STATE_PENDING = 'PENDING';		//Value shown when the menuItem has been selected by the user but 
																				//can still be cancelled.
	public static final String MENU_ITEM_VALUE_STATE_CONFIRMED = 'CONFIRMED';	//Value shown when the menuItem has been selected by the user and 
																				//can no longer be cancelled.
	
	//Instance Variables
	private String action; 					//Controls the behavior when the user picks the menu option. 
											//See MenuItem Actions statics for allowed values.
	private String id;						//The ID for this menu item. 
											//This is generated by the application and is treated as an opaque token.
	private String payload;					//A generic payload whose meaning changes depending on this MenuItem's action.
											//When the action is OPEN_URI, the payload is the URL of the website to view.
											//When the action is PLAY_VIDEO, the payload is the streaming URL of the video.
											//When the action is GET_MEDIA_INPUT, the payload is the text transcription of a user's speech input.
	private Boolean removeWhenSelected;		//If set to true on a CUSTOM menu item, that item will be removed from the menu after it is selected.
	private List<MenuItemValue> values;		//For CUSTOM items, a list of values controlling the appearance of the menu item in each of its 
											//states. A value for the DEFAULT state must be provided. 
											//If the PENDING or CONFIRMED states are missing, they will not be shown.
	
	/**
	 * Helper methods
	 */				
	public ffhttp_GoogleMirrorModelMenuItem addValue(String displayName)
	{
		return addValue(displayName, MENU_ITEM_VALUE_STATE_DEFAULT);
	}
	public ffhttp_GoogleMirrorModelMenuItem addValue(String displayName, String state)
	{
		return addValue(displayName, state, null);
	}
	public ffhttp_GoogleMirrorModelMenuItem addValue(String displayName, String state, String iconUrl)
	{					
		MenuItemValue value = new MenuItemValue();
		if (values == null)
		{
			values = new List<MenuItemValue>();
		}
		values.add(value);
		
		value.setDisplayName(displayName);
		value.setState(state);
		value.setIconUrl(iconUrl);
		return this;
	}
	
	/**
	 * Get/Sets
	 */
	public String getAction()
	{
		return action;
	}
	public ffhttp_GoogleMirrorModelMenuItem setAction(String action)
	{
		this.action = action;
		return this;
	}
	public String getId()
	{
		return id;
	}
	public ffhttp_GoogleMirrorModelMenuItem setId(String id)
	{
		this.id = id;
		return this;
	}
	public String getPayload()
	{
		return payload;
	}
	public ffhttp_GoogleMirrorModelMenuItem setPayload(String payload)
	{
		this.payload = payload;
		return this;
	}
	public Boolean getRemoveWhenSelected()
	{
		return removeWhenSelected;
	}
	public ffhttp_GoogleMirrorModelMenuItem setRemoveWhenSelected(Boolean removeWhenSelected)
	{
		this.removeWhenSelected = removeWhenSelected;
		return this;
	}
	public List<MenuItemValue> getValues()
	{
		return values;
	}
	public ffhttp_GoogleMirrorModelMenuItem setValues(List<MenuItemValue> values)
	{
		this.values = values;
		return this;
	}
	 
	/**
	 * MenuItemValue
	 */
	public class MenuItemValue extends ffhttp_AbstractJsonSerializable
	{
		//Instance Variables
		private String displayName;		//The name to display for the menu item. 
										//If you specify this property for a built-in menu item, the default contextual voice command for that 
										//menu item is not shown.
		private String iconUrl;			//URL of an icon to display with the menu item.
		private String state;			//The state that this value applies to. Allowed values are: DEFAULT, PENDING & CONFIRMED.
		
		/**
		 * Get/Sets
		 */
		public String getDisplayName()
		{
			return displayName;
		}
		public MenuItemValue setDisplayName(String displayName)
		{
			this.displayName = displayName;
			return this;
		}
		public String getIconUrl()
		{
			return iconUrl;
		}
		public MenuItemValue setIconUrl(String iconUrl)
		{
			this.iconUrl = iconUrl;
			return this;
		}
		public String getState()
		{
			return state;
		}
		public MenuItemValue setState(String state)
		{
			this.state = state;
			return this;
		}
	}
}
