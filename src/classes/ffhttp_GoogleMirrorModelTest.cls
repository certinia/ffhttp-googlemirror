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
 * ffhttp_GoogleMirrorModelTest
 *
 * Test class for the ffhttp_GoogleMirrorModel classes
 */
@isTest
public class ffhttp_GoogleMirrorModelTest 
{
	static testMethod void ffhttp_GoogleMirrorModelAccount()
	{
		//Create all the required sub-classes
		ffhttp_GoogleMirrorModelAccount.AuthToken authToken = new ffhttp_GoogleMirrorModelAccount.AuthToken();
		authToken.setAuthToken('ya29.vQBedNZEfqwZGzQvxunMVhpLXObx0a-eIrsCBLzpTQLpRGE2qs8g69nCbONCRYYGGlxD6fFoER4zVQ')
				 .setType('Bearer');
		
		ffhttp_GoogleMirrorModelAccount.UserData userData = new ffhttp_GoogleMirrorModelAccount.UserData();
		userData.setKey('TestKey')
				.setValue('TestValue');
		
		//Create the account class. Chain the set calls so that we can check that we correctly return the account object.
		ffhttp_GoogleMirrorModelAccount account = new ffhttp_GoogleMirrorModelAccount();
		account.setAuthTokens(new List<ffhttp_GoogleMirrorModelAccount.AuthToken>{authToken})
			   .setFeatures(new String[]{'Google Maps'})
			   .setPassword('password')
			   .setUserData(new List<ffhttp_GoogleMirrorModelAccount.UserData>{userData})
			   .setAccountName('TestAccount')
			   .setAccountType('TestAccountType')
			   .setUserToken('TestUserToken');
		
		//Assert that we get the appropriate return values.	
		System.assertEquals(account.getAuthTokens()[0].getAuthToken(), 'ya29.vQBedNZEfqwZGzQvxunMVhpLXObx0a-eIrsCBLzpTQLpRGE2qs8g69nCbONCRYYGGlxD6fFoER4zVQ');
		System.assertEquals(account.getAuthTokens()[0].getType(), 'Bearer');
		System.assertEquals(account.getFeatures()[0], 'Google Maps');
		System.assertEquals(account.getPassword(), 'password');
		System.assertEquals(account.getUserData()[0].getKey(), 'TestKey');
		System.assertEquals(account.getUserData()[0].getValue(), 'TestValue');
		System.assertEquals(account.getAccountName(), 'TestAccount');
		System.assertEquals(account.getAccountType(), 'TestAccountType');
		System.assertEquals(account.getUserToken(), 'TestUserToken');
	}
	
	static testMethod void ffhttp_GoogleMirrorModelAttachment()
	{
		//Create the Timeline.Attachment class. Chain the set calls so that we can check that we correctly return the Timeline.Attachment object.
		ffhttp_GoogleMirrorModelAttachment attachment = createAttachment();
											
		//Assert that we get the appropriate return values.	
		assertAttachment(attachment);
	}
	
	private static ffhttp_GoogleMirrorModelAttachment createAttachment()
	{
		ffhttp_GoogleMirrorModelAttachment attachment = new ffhttp_GoogleMirrorModelAttachment();
		attachment.setId('at23')
				  .setContentType('image/jpeg')
				  .setContentUrl('https://lh6.googleusercontent.com/-NBNROxZe69I/AAAAAAAAAAI/AAAAAAAAAEk/s4JcLi3bdro/s64/photo.jpg')
				  .setIsProcessingContent(false);
		return attachment;
	}
	
	private static void assertAttachment(ffhttp_GoogleMirrorModelAttachment attachment)
	{
		System.assertEquals(attachment.getKind(), null);
		System.assertEquals(attachment.getId(), 'at23');
		System.assertEquals(attachment.getContentType(), 'image/jpeg');
		System.assertEquals(attachment.getContentUrl(), 'https://lh6.googleusercontent.com/-NBNROxZe69I/AAAAAAAAAAI/AAAAAAAAAEk/s4JcLi3bdro/s64/photo.jpg');
		System.assertEquals(attachment.getIsProcessingContent(), false);
	}
	
	static testMethod void ffhttp_GoogleMirrorModelAttachmentsList()
	{
		ffhttp_GoogleMirrorModelAttachment.ItemList attachmentList = new ffhttp_GoogleMirrorModelAttachment.ItemList();
	 	System.assertEquals(attachmentList.getKind(), 'mirror#attachmentsList');
	 	System.assertEquals(attachmentList.getItems(), null);
	 	
	 	checkKind(attachmentList, 'mirror#attachmentsList');
	}
	
	static testMethod void ffhttp_GoogleMirrorModelContact()
	{
		//Create the contact class. Chain the set calls so that we can check that we correctly return the contact object.
		ffhttp_GoogleMirrorModelContact contact = createContact();
					 
		//Assert that we get the appropriate return values.	
		assertContact(contact);
	}
	
	private static ffhttp_GoogleMirrorModelContact createContact()
	{
		//Create all the required sub-classes
		ffhttp_GoogleMirrorModelContact.AcceptCommand acceptCommand = new ffhttp_GoogleMirrorModelContact.AcceptCommand();
		acceptCommand.setType('TAKE_A_NOTE');							
												
		//Create the contact class. Chain the set calls so that we can check that we correctly return the contact object.
		ffhttp_GoogleMirrorModelContact contact = new ffhttp_GoogleMirrorModelContact();
		contact.setAcceptCommands(new List<ffhttp_GoogleMirrorModelContact.AcceptCommand>{acceptCommand})
			   .setAcceptTypes(new List<String>{'image/jpeg'})
			   .setDisplayName('Joe Bloggs')
			   .setId('ct6')
			   .setImageUrls(new String[]{'https://lh6.googleusercontent.com/-NBNROxZe69I/AAAAAAAAAAI/AAAAAAAAAEk/s4JcLi3bdro/s64/photo.jpg'})
			   .setPhoneNumber('+447795556777')
			   .setPriority(5)
			   .setSharingFeatures(new String[]{'ADD_CAPTION'})
			   .setSource('216600443086-f9tvdjih5cb01uasosnhllfmtdghh3di.apps.googleusercontent.com')
			   .setSpeakableName('Joe Bloggs Junior')
			   .setType('INDIVIDUAL'); 	
		return contact;
	}
	
	private static void assertContact(ffhttp_GoogleMirrorModelContact contact)
	{
		System.assertEquals(contact.getKind(), 'mirror#contact');
		System.assertEquals(contact.getAcceptCommands()[0].getType(), 'TAKE_A_NOTE');
		System.assertEquals(contact.getAcceptTypes()[0], 'image/jpeg');
		System.assertEquals(contact.getDisplayName(), 'Joe Bloggs');
		System.assertEquals(contact.getId(), 'ct6');
		System.assertEquals(contact.getImageUrls()[0], 'https://lh6.googleusercontent.com/-NBNROxZe69I/AAAAAAAAAAI/AAAAAAAAAEk/s4JcLi3bdro/s64/photo.jpg');
		System.assertEquals(contact.getPhoneNumber(), '+447795556777');
		System.assertEquals(contact.getPriority(), 5);
		System.assertEquals(contact.getSharingFeatures()[0], 'ADD_CAPTION');
		System.assertEquals(contact.getSource(), '216600443086-f9tvdjih5cb01uasosnhllfmtdghh3di.apps.googleusercontent.com');
		System.assertEquals(contact.getSpeakableName(), 'Joe Bloggs Junior');
		System.assertEquals(contact.getType(), 'INDIVIDUAL');
		
		checkKind(contact, 'mirror#contact');
	}
	
	static testMethod void ffhttp_GoogleMirrorModelContactList()
	{
		ffhttp_GoogleMirrorModelContact.ItemList contactList = new ffhttp_GoogleMirrorModelContact.ItemList();
	 	System.assertEquals(contactList.getKind(), 'mirror#contacts');
	 	System.assertEquals(contactList.getItems(), null);
	 	
	 	checkKind(contactList, 'mirror#contacts');
	}
	
	static testMethod void ffhttp_GoogleMirrorModelLocation()
	{
		//Create the location class. Chain the set calls so that we can check that we correctly return the location object.
		ffhttp_GoogleMirrorModelLocation location = createLocation();
		
		//Assert that we get the appropriate return values.	
		assertLocation(location);
	}
	
	private static ffhttp_GoogleMirrorModelLocation createLocation()
	{
		ffhttp_GoogleMirrorModelLocation location = new ffhttp_GoogleMirrorModelLocation();
		location.setAccuracy(1.0D)
				.setAddress('HG3 1RY')
				.setDisplayName('Office')
				.setId('lc7')
				.setLatitude(53.976661D)
				.setLongitude(-1.568101D)
				.setTimestamp(Datetime.newInstance(2014, 09, 04));
		return location;
	}
	
	private static void assertLocation(ffhttp_GoogleMirrorModelLocation location)
	{
		System.assertEquals(location.getKind(), 'mirror#location');	
		System.assertEquals(location.getAccuracy(), 1.0D);
		System.assertEquals(location.getAddress(), 'HG3 1RY');
		System.assertEquals(location.getDisplayName(), 'Office');
		System.assertEquals(location.getId(), 'lc7');
		System.assertEquals(location.getLatitude(), 53.976661D);
		System.assertEquals(location.getLongitude(), -1.568101D);
		System.assertEquals(location.getTimestamp(), Datetime.newInstance(2014, 09, 04));
		
		checkKind(location, 'mirror#location');
	}
	
	static testMethod void ffhttp_GoogleMirrorModelLocationList()
	{
		ffhttp_GoogleMirrorModelLocation.ItemList locationList = new ffhttp_GoogleMirrorModelLocation.ItemList();
	 	System.assertEquals(locationList.getKind(), 'mirror#locationsList');
	 	System.assertEquals(locationList.getItems(), null);
	 	
	 	checkKind(locationList, 'mirror#locationsList');
	}
	
	static testMethod void ffhttp_GoogleMirrorModelMenuItem()
	{
		//Create the MenuItem class. Chain the set calls so that we can check that we correctly return the MenuItem object.
		ffhttp_GoogleMirrorModelMenuItem menuItem = createMenuItem();
		
		//Assert that we get the appropriate return values.	
		assertMenuItem(menuItem);
	}
	
	private static ffhttp_GoogleMirrorModelMenuItem createMenuItem()
	{
		//Create all the required sub-classes
		ffhttp_GoogleMirrorModelMenuItem.MenuItemValue menuItemValue = new ffhttp_GoogleMirrorModelMenuItem.MenuItemValue();
		menuItemValue.setDisplayName('Play Video')
					 .setIconUrl('https://lh6.googleusercontent.com/-NBNROxZe69I/AAAAAAAAAAI/AAAAAAAAAEk/s4JcLi3bdro/s33/photo.jpg')
					 .setState('DEFAULT');
		
		ffhttp_GoogleMirrorModelMenuItem menuItem = new ffhttp_GoogleMirrorModelMenuItem();
		menuItem.setAction('CUSTOM')
				.setId('mi02')
				.setPayload('PLAY_VIDEO')
				.setRemoveWhenSelected(false)
				.setValues(new List<ffhttp_GoogleMirrorModelMenuItem.MenuItemValue>{menuItemValue});
		return menuItem;
	}
	
	private static void assertMenuItem(ffhttp_GoogleMirrorModelMenuItem menuItem)
	{
		System.assertEquals(menuItem.getAction(), 'CUSTOM');
		System.assertEquals(menuItem.getId(), 'mi02');
		System.assertEquals(menuItem.getPayload(), 'PLAY_VIDEO');
		System.assertEquals(menuItem.getRemoveWhenSelected(), false);
		System.assertEquals(menuItem.getValues()[0].getDisplayName(), 'Play Video');
		System.assertEquals(menuItem.getValues()[0].getIconUrl(), 'https://lh6.googleusercontent.com/-NBNROxZe69I/AAAAAAAAAAI/AAAAAAAAAEk/s4JcLi3bdro/s33/photo.jpg');
		System.assertEquals(menuItem.getValues()[0].getState(), 'DEFAULT');
	}
	
	static testMethod void ffhttp_GoogleMirrorModelMenuItemValue()
	{
		ffhttp_GoogleMirrorModelMenuItem menuItem = new ffhttp_GoogleMirrorModelMenuItem();
		menuItem.addValue('Play Video');
		
		System.assertEquals(menuItem.getValues()[0].getDisplayName(), 'Play Video');
		System.assertEquals(menuItem.getValues()[0].getIconUrl(), null);
		System.assertEquals(menuItem.getValues()[0].getState(), 'DEFAULT');
		
		menuItem.setValues(null);
		menuItem.addValue('Play Audio', 'TEST');
		
		System.assertEquals(menuItem.getValues()[0].getDisplayName(), 'Play Audio');
		System.assertEquals(menuItem.getValues()[0].getIconUrl(), null);
		System.assertEquals(menuItem.getValues()[0].getState(), 'TEST');
		
		menuItem.setValues(null);
		menuItem.addValue('View Image', 'DEFAULT', 'https://lh6.googleusercontent.com/-NBNROxZe69I/AAAAAAAAAAI/AAAAAAAAAEk/s4JcLi3bdro/s33/photo.jpg');
		
		System.assertEquals(menuItem.getValues()[0].getDisplayName(), 'View Image');
		System.assertEquals(menuItem.getValues()[0].getIconUrl(), 'https://lh6.googleusercontent.com/-NBNROxZe69I/AAAAAAAAAAI/AAAAAAAAAEk/s4JcLi3bdro/s33/photo.jpg');
		System.assertEquals(menuItem.getValues()[0].getState(), 'DEFAULT');
	}

	static testMethod void ffhttp_GoogleMirrorModelSetting()
	{
		//Create the setting class. Chain the set calls so that we can check that we correctly return the setting object.
		ffhttp_GoogleMirrorModelSetting setting = new ffhttp_GoogleMirrorModelSetting();
		setting.setId('locale')
			   .setValue('en');
		
		//Assert that we get the appropriate return values.	
		checkKind(setting, 'mirror#setting');
		
		System.assertEquals(setting.getKind(), 'mirror#setting');
		System.assertEquals(setting.getId(), 'locale');
		System.assertEquals(setting.getValue(), 'en');
	}
	
	static testMethod void ffhttp_GoogleMirrorModelSubscription()
	{
		//Create all the required sub-classes
		ffhttp_GoogleMirrorModelSubscription.Notification_UserAction userAction = new ffhttp_GoogleMirrorModelSubscription.Notification_UserAction();
		userAction.setPayload('TestPayload')
				  .setType('CUSTOM');
		
		ffhttp_GoogleMirrorModelSubscription.Notification notification = new ffhttp_GoogleMirrorModelSubscription.Notification();
		notification.setCollection('locations')
					.setItemId('nt23')
					.setOperation('INSERT')
					.setUserToken('userToken')
					.setVerifyToken('verifyToken')
					.setUserActions(new List<ffhttp_GoogleMirrorModelSubscription.Notification_UserAction>{userAction});
		
		//Create the subscription class. Chain the set calls so that we can check that we correctly return the subscription object.
		ffhttp_GoogleMirrorModelSubscription subscription = new ffhttp_GoogleMirrorModelSubscription();
		subscription.setCallbackUrl('https://eu3.salesforce.com/apex/connector')
					.setCollection('timeline')
					.setId('ss6')
					.setOperation(new String[]{'UPDATE'})
					.setUpdated(Datetime.newInstance(2014, 11, 04))
					.setUserToken('userToken')
					.setVerifyToken('verifyToken')
					.setNotification(notification);
		
		//Assert that we get the appropriate return values.	
		checkKind(subscription, 'mirror#subscription');
		
		System.assertEquals(subscription.getKind(), 'mirror#subscription');	
		System.assertEquals(subscription.getCallbackUrl(), 'https://eu3.salesforce.com/apex/connector');
		System.assertEquals(subscription.getCollection(), 'timeline');
		System.assertEquals(subscription.getId(), 'ss6');
		System.assertEquals(subscription.getOperation()[0], 'UPDATE');
		System.assertEquals(subscription.getUpdated(), Datetime.newInstance(2014, 11, 04));
		System.assertEquals(subscription.getUserToken(), 'userToken');
		System.assertEquals(subscription.getVerifyToken(), 'verifyToken');
		System.assertEquals(subscription.getNotification().getCollection(), 'locations');
		System.assertEquals(subscription.getNotification().getItemId(), 'nt23');
		System.assertEquals(subscription.getNotification().getOperation(), 'INSERT');
		System.assertEquals(subscription.getNotification().getUserToken(), 'userToken');
		System.assertEquals(subscription.getNotification().getVerifyToken(), 'verifyToken');
		System.assertEquals(subscription.getNotification().getUserActions()[0].getPayload(), 'TestPayload');
		System.assertEquals(subscription.getNotification().getUserActions()[0].getType(), 'CUSTOM');
	}
	
	static testMethod void ffhttp_GoogleMirrorModelSubscriptionList()
	{
		ffhttp_GoogleMirrorModelSubscription.ItemList subscriptionsList = new ffhttp_GoogleMirrorModelSubscription.ItemList();
	 	System.assertEquals(subscriptionsList.getKind(), 'mirror#subscriptionsList');
	 	System.assertEquals(subscriptionsList.getItems(), null);
	 	
	 	checkKind(subscriptionsList, 'mirror#subscriptionsList');
	}
	
	static testMethod void ffhttp_GoogleMirrorModelTimeline()
	{
		//Create all the required sub-classes
		ffhttp_GoogleMirrorModelTimeline.Notification notification = new ffhttp_GoogleMirrorModelTimeline.Notification();
		notification.setDeliveryTime(Datetime.newInstance(2014, 11, 06))
					.setNotification('DEFAULT');
		
		ffhttp_GoogleMirrorModelAttachment attachment = createAttachment();
		ffhttp_GoogleMirrorModelContact creatorContact = createContact();
		ffhttp_GoogleMirrorModelContact recipientContact = createContact();
		ffhttp_GoogleMirrorModelLocation location = createLocation();
		ffhttp_GoogleMirrorModelMenuItem menuItem = createMenuItem();
		
		//Create the timeline class. Chain the set calls so that we can check that we correctly return the timeline object.
		ffhttp_GoogleMirrorModelTimeline timeline = new ffhttp_GoogleMirrorModelTimeline();
		timeline.setBundleId('ot6')
				.setCanonicalUrl('https://lh6.googleusercontent.com/')
				.setCreated(Datetime.newInstance(2014, 11, 05))
				.setDisplayTime(Datetime.newInstance(2014, 11, 05))
				.setEtag('ghja90ie0i0qitjl0u4ie')
				.setHtml('<b>Meet friends to see the fireworks<b>')
				.setId('tl6')
				.setInReplyTo('tli72')	
				.setIsBundleCover(false)
				.setIsDeleted(false)
				.setIsPinned(false)
				.setPinScore(10)
				.setSelfLink('https://www.googleapis.com/mirror/v1/timeline/tl6')
				.setSourceItemId('si80')
				.setSpeakableText('Meet friends to see the fireworks at seven')
				.setSpeakableType('Note')
				.setText('Meet friends to see the fireworks @ 7')
				.setTitle('Leeds Bonfire')
				.setUpdated(Datetime.newInstance(2014, 11, 13))
				.setMenuItems(new List<ffhttp_GoogleMirrorModelMenuItem>{menuItem})
				.setNotification(notification) 
				.setAttachments(new List<ffhttp_GoogleMirrorModelAttachment>{attachment})
				.setCreator(creatorContact)
				.setRecipients(new List<ffhttp_GoogleMirrorModelContact>{recipientContact})
				.setLocation(location);
	
		//Assert that we get the appropriate return values.	
		checkKind(timeline, 'mirror#timelineItem');
		
		System.assertEquals(timeline.getKind(), 'mirror#timelineItem');
		System.assertEquals(timeline.getBundleId(), 'ot6');
		System.assertEquals(timeline.getCanonicalUrl(), 'https://lh6.googleusercontent.com/');
		System.assertEquals(timeline.getCreated(), Datetime.newInstance(2014, 11, 05));
		System.assertEquals(timeline.getDisplayTime(), Datetime.newInstance(2014, 11, 05));
		System.assertEquals(timeline.getEtag(), 'ghja90ie0i0qitjl0u4ie');
		System.assertEquals(timeline.getHtml(), '<b>Meet friends to see the fireworks<b>'); 
		System.assertEquals(timeline.getId(), 'tl6');
		System.assertEquals(timeline.getInReplyTo(), 'tli72');
		System.assertEquals(timeline.getIsBundleCover(), false);
		System.assertEquals(timeline.getIsDeleted(), false);
		System.assertEquals(timeline.getIsPinned(), false);
		System.assertEquals(timeline.getPinScore(), 10);
		System.assertEquals(timeline.getSelfLink(), 'https://www.googleapis.com/mirror/v1/timeline/tl6');
		System.assertEquals(timeline.getSourceItemId(), 'si80');
		System.assertEquals(timeline.getSpeakableText(), 'Meet friends to see the fireworks at seven');
		System.assertEquals(timeline.getSpeakableType(), 'Note');
		System.assertEquals(timeline.getText(), 'Meet friends to see the fireworks @ 7');
		System.assertEquals(timeline.getTitle(), 'Leeds Bonfire');
		System.assertEquals(timeline.getUpdated(), Datetime.newInstance(2014, 11, 13));
		System.assertEquals(timeline.getNotification().getDeliveryTime(), Datetime.newInstance(2014, 11, 06));
		System.assertEquals(timeline.getNotification().getNotification(), 'DEFAULT');
		
		assertAttachment(timeline.getAttachments()[0]);
		assertContact(timeline.getCreator());
		assertContact(timeline.getRecipients()[0]);
		assertLocation(timeline.getLocation());
		assertMenuItem(timeline.getMenuItems()[0]);
	}
	
	static testMethod void ffhttp_GoogleMirrorModelTimelineList()
	{
		ffhttp_GoogleMirrorModelTimeline.ItemList timelineList = new ffhttp_GoogleMirrorModelTimeline.ItemList();
		timelineList.setNextPageToken('og5');
		
	 	System.assertEquals(timelineList.getKind(), 'mirror#timeline');
	 	System.assertEquals(timelineList.getItems(), null);
	 	System.assertEquals(timelineList.getNextPageToken(), 'og5');
	 	
	 	checkKind(timelineList, 'mirror#timeline');
	}
	
	private static void checkKind(ffhttp_GoogleMirrorModelAbstractObject obj, String kind)
	{
		String serializedObj = (String)obj.getHttpContent();
		
		ffhttp_JsonDeserializer deserializer = new ffhttp_JsonDeserializer(ffhttp_GoogleMirrorModelAbstractObject.class);
		ffhttp_GoogleMirrorModelAbstractObject deserializedObj = (ffhttp_GoogleMirrorModelAbstractObject)deserializer.deserialize(serializedObj);
		System.assertEquals(deserializedObj.getKind(), kind);
	}
}
