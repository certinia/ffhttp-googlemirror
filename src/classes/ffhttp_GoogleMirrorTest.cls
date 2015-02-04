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
 * ffhttp_GoogleMirrorTest
 *
 * Test class for the GoogleMirror 'package'.
 * 
 * This class currently provides test code coverage for this package. 
 * It checks that all base URLs are what Google Mirror requires.
 */
@isTest
private class ffhttp_GoogleMirrorTest 
{
	static testMethod void testGoogleMirrorClient()
	{
		ffhttp_Client.Credentials credentials = new ffhttp_Client.Credentials('Bearer', 'Test');
		ffhttp_GoogleMirror gm = new ffhttp_GoogleMirror(credentials);
		
		System.assertEquals(gm.getCredentials().getAccessToken(), 'Test');
	}
	
	/**
	 * ffhttp_GoogleMirrorAccounts test
	 */
	static testMethod void ffhttp_GoogleMirrorAccountsInsertRequest()
	{
		ffhttp_GoogleMirrorModelAccount account = new ffhttp_GoogleMirrorModelAccount();
		account.setAccountName('TestAccount').setAccountType('TestAccountType').setUserToken('TestUserToken');
		
		ffhttp_GoogleMirrorAccounts accounts = createGoogleMirrorAccounts();	
		
		ffhttp_GoogleMirrorAccounts.InsertRequest insertRequest = accounts.insertRequest(account);
		assertRequestEndpointAndMethod(insertRequest, 'https://www.googleapis.com/mirror/v1/accounts/TestUserToken/TestAccountType/TestAccount', 'POST');
	}
	
	private static ffhttp_GoogleMirrorAccounts createGoogleMirrorAccounts()
	{
		ffhttp_GoogleMirror gm = createGoogleMirror();
		ffhttp_GoogleMirrorAccounts accounts = gm.accounts();
		System.assert(accounts != null, 'Accounts should not be null.');
		System.assertEquals(accounts.getService(), gm);
		
		accounts.setService(null);
		System.assertEquals(accounts.getService(), null);
		
		accounts.setService(gm);
		
		return accounts;
	}
	
	/**
	 * ffhttp_GoogleMirrorContacts tests
	 */
	static testMethod void ffhttp_GoogleMirrorContactsDeleteRequest()
	{
		ffhttp_GoogleMirrorContacts contacts = createGoogleMirrorContacts();
		ffhttp_GoogleMirrorContacts.DeleteRequest deleteRequest = contacts.deleteRequest('0B94302Tka2HWkNrOElaaUxQaUU');
		assertRequestEndpointAndMethod(deleteRequest, 'https://www.googleapis.com/mirror/v1/contacts/0B94302Tka2HWkNrOElaaUxQaUU', 'DELETE');
	}
	
	static testMethod void ffhttp_GoogleMirrorContactsGetRequest()
	{
		ffhttp_GoogleMirrorContacts contacts = createGoogleMirrorContacts();
		ffhttp_GoogleMirrorContacts.GetRequest getRequest = contacts.getRequest('0B94302Tka2HWkNrOElaaUxQaUU');
		assertRequestEndpointAndMethod(getRequest, 'https://www.googleapis.com/mirror/v1/contacts/0B94302Tka2HWkNrOElaaUxQaUU', 'GET');
	}
	
	static testMethod void ffhttp_GoogleMirrorContactsInsertRequest()
	{
		ffhttp_GoogleMirrorModelContact contact = new ffhttp_GoogleMirrorModelContact();
		contact.setDisplayName('Matt Wood');
		
		ffhttp_GoogleMirrorContacts contacts = createGoogleMirrorContacts();
		ffhttp_GoogleMirrorContacts.InsertRequest insertRequest = contacts.insertRequest(contact);
		assertRequestEndpointAndMethod(insertRequest, 'https://www.googleapis.com/mirror/v1/contacts/', 'POST');
	}
	
	static testMethod void ffhttp_GoogleMirrorContactsListRequest()
	{
		ffhttp_GoogleMirrorContacts contacts = createGoogleMirrorContacts();
		ffhttp_GoogleMirrorContacts.ListRequest listRequest = contacts.listRequest();
		assertRequestEndpointAndMethod(listRequest, 'https://www.googleapis.com/mirror/v1/contacts/', 'GET');
	}
	
	static testMethod void ffhttp_GoogleMirrorContactsUpdateRequest()
	{
		ffhttp_GoogleMirrorModelContact contact = new ffhttp_GoogleMirrorModelContact();
		contact.setId('0B94302Tka2HWkNrOElaaUxQaUU');
		
		ffhttp_GoogleMirrorContacts contacts = createGoogleMirrorContacts();
		ffhttp_GoogleMirrorContacts.UpdateRequest updateRequest = contacts.updateRequest(contact);
		assertRequestEndpointAndMethod(updateRequest, 'https://www.googleapis.com/mirror/v1/contacts/0B94302Tka2HWkNrOElaaUxQaUU', 'PUT');
	}
	
	private static ffhttp_GoogleMirrorContacts createGoogleMirrorContacts()
	{
		ffhttp_GoogleMirror gm = createGoogleMirror();
		ffhttp_GoogleMirrorContacts contacts = gm.contacts();
		System.assert(contacts != null, 'Contacts should not be null.');
		System.assertEquals(contacts.getService(), gm);
		
		contacts.setService(null);
		System.assertEquals(contacts.getService(), null);
		
		contacts.setService(gm);
		
		return contacts;
	}
	
	/**
	 * ffhttp_GoogleMirrorLocations tests
	 */
	static testMethod void ffhttp_GoogleMirrorLocationsGetRequest()
	{
		ffhttp_GoogleMirrorLocations locations = createGoogleMirrorLocations();
		ffhttp_GoogleMirrorLocations.GetRequest getRequest = locations.getRequest('latest');
		assertRequestEndpointAndMethod(getRequest, 'https://www.googleapis.com/mirror/v1/locations/latest', 'GET');
	}
	
	static testMethod void ffhttp_GoogleMirrorLocationsListRequest()
	{
		ffhttp_GoogleMirrorLocations locations = createGoogleMirrorLocations();
		ffhttp_GoogleMirrorLocations.ListRequest listRequest = locations.listRequest();
		assertRequestEndpointAndMethod(listRequest, 'https://www.googleapis.com/mirror/v1/locations/', 'GET');
	}
	
	private static ffhttp_GoogleMirrorLocations createGoogleMirrorLocations()
	{
		ffhttp_GoogleMirror gm = createGoogleMirror();
		ffhttp_GoogleMirrorLocations locations = gm.locations();
		System.assert(locations != null, 'Locations should not be null.');
		System.assertEquals(locations.getService(), gm);
		
		locations.setService(null);
		System.assertEquals(locations.getService(), null);
		
		locations.setService(gm);
		
		return locations;
	}
	 
	/**
	 * ffhttp_GoogleMirrorSettings tests
	 */
	static testMethod void ffhttp_GoogleMirrorSettingsGetRequest()
	{
		ffhttp_GoogleMirrorSettings settings = createGoogleMirrorSettings();
		ffhttp_GoogleMirrorSettings.GetRequest getRequest = settings.getRequest('locale');
		assertRequestEndpointAndMethod(getRequest, 'https://www.googleapis.com/mirror/v1/settings/locale', 'GET');
	}
	
	private static ffhttp_GoogleMirrorSettings createGoogleMirrorSettings()
	{
		ffhttp_GoogleMirror gm = createGoogleMirror();
		ffhttp_GoogleMirrorSettings settings = gm.settings();
		System.assert(settings != null, 'Settings should not be null.');
		System.assertEquals(settings.getService(), gm);
		
		settings.setService(null);
		System.assertEquals(settings.getService(), null);
		
		settings.setService(gm);
		
		return settings;
	}
	
	/**
	 * ffhttp_GoogleMirrorSubscriptions tests
	 */
	static testMethod void ffhttp_GoogleMirrorSubscriptionsDeleteRequest()
	{
		ffhttp_GoogleMirrorSubscriptions subscriptions = createGoogleMirrorSubscriptions();
		ffhttp_GoogleMirrorSubscriptions.DeleteRequest deleteRequest = subscriptions.deleteRequest('0B94302Tka2HWkNrOElaaUxQaUU');
		assertRequestEndpointAndMethod(deleteRequest, 'https://www.googleapis.com/mirror/v1/subscriptions/0B94302Tka2HWkNrOElaaUxQaUU', 'DELETE');
	}
	
	static testMethod void ffhttp_GoogleMirrorSubscriptionsInsertRequest()
	{
		ffhttp_GoogleMirrorModelSubscription subscription = new ffhttp_GoogleMirrorModelSubscription();
		subscription.setCallbackUrl('https://www.google.co.uk/test');
		subscription.setCollection('timeline');
		
		ffhttp_GoogleMirrorSubscriptions subscriptions = createGoogleMirrorSubscriptions();
		ffhttp_GoogleMirrorSubscriptions.InsertRequest insertRequest = subscriptions.insertRequest(subscription);
		assertRequestEndpointAndMethod(insertRequest, 'https://www.googleapis.com/mirror/v1/subscriptions/', 'POST');
	}
	
	static testMethod void ffhttp_GoogleMirrorSubscriptionsListRequest()
	{
		ffhttp_GoogleMirrorSubscriptions subscriptions = createGoogleMirrorSubscriptions();
		ffhttp_GoogleMirrorSubscriptions.ListRequest listRequest = subscriptions.listRequest();
		assertRequestEndpointAndMethod(listRequest, 'https://www.googleapis.com/mirror/v1/subscriptions/', 'GET');
	}
	
	static testMethod void ffhttp_GoogleMirrorSubscriptionsUpdateRequest()
	{
		ffhttp_GoogleMirrorModelSubscription subscription = new ffhttp_GoogleMirrorModelSubscription();
		subscription.setId('od5');
		subscription.setCallbackUrl('https://www.google.co.uk/test');
		subscription.setCollection('timeline');
		
		ffhttp_GoogleMirrorSubscriptions subscriptions = createGoogleMirrorSubscriptions();
		ffhttp_GoogleMirrorSubscriptions.UpdateRequest updateRequest = subscriptions.updateRequest(subscription);
		assertRequestEndpointAndMethod(updateRequest, 'https://www.googleapis.com/mirror/v1/subscriptions/od5', 'PUT');
	}
	
	private static ffhttp_GoogleMirrorSubscriptions createGoogleMirrorSubscriptions()
	{
		ffhttp_GoogleMirror gm = createGoogleMirror();
		ffhttp_GoogleMirrorSubscriptions subscriptions = gm.subscriptions();
		System.assert(subscriptions != null, 'Subscriptions should not be null.');
		System.assertEquals(subscriptions.getService(), gm);
		
		subscriptions.setService(null);
		System.assertEquals(subscriptions.getService(), null);
		
		subscriptions.setService(gm);
		
		return subscriptions;
	}
	
	/**
	 * ffhttp_GoogleMirrorTimeline tests
	 */
	static testMethod void ffhttp_GoogleMirrorTimelineDeleteRequest()
	{
		ffhttp_GoogleMirrorTimeline timeline = createGoogleMirrorTimeline();
		ffhttp_GoogleMirrorTimeline.DeleteRequest deleteRequest = timeline.deleteRequest('0B94302Tka2HWkNrOElaaUxQaUU');
		assertRequestEndpointAndMethod(deleteRequest, 'https://www.googleapis.com/mirror/v1/timeline/0B94302Tka2HWkNrOElaaUxQaUU', 'DELETE');
	}
	
	static testMethod void ffhttp_GoogleMirrorTimelineGetRequest()
	{
		ffhttp_GoogleMirrorTimeline timeline = createGoogleMirrorTimeline();
		ffhttp_GoogleMirrorTimeline.GetRequest getRequest = timeline.getRequest('0B94302Tka2HWkNrOElaaUxQaUU');
		assertRequestEndpointAndMethod(getRequest, 'https://www.googleapis.com/mirror/v1/timeline/0B94302Tka2HWkNrOElaaUxQaUU', 'GET');
	}
	
	static testMethod void ffhttp_GoogleMirrorTimelineInsertMetaDataRequest()
	{
		ffhttp_GoogleMirrorModelTimeline tl = new ffhttp_GoogleMirrorModelTimeline();
		
		ffhttp_GoogleMirrorTimeline timeline = createGoogleMirrorTimeline();
		ffhttp_GoogleMirrorTimeline.InsertRequest insertRequest = timeline.insertRequest(tl);
		assertRequestEndpointAndMethod(insertRequest, 'https://www.googleapis.com/mirror/v1/timeline/', 'POST');
		
		System.assertEquals(insertRequest.getUploadType(), null);
		
		insertRequest.setUploadType('media');
		
		System.assertEquals(insertRequest.getUploadType(), 'media');
	}
	
	static testMethod void ffhttp_GoogleMirrorTimelineListRequest()
	{
		ffhttp_GoogleMirrorTimeline timeline = createGoogleMirrorTimeline();
		ffhttp_GoogleMirrorTimeline.ListRequest listRequest = timeline.listRequest();
		assertRequestEndpointAndMethod(listRequest, 'https://www.googleapis.com/mirror/v1/timeline/', 'GET');
		
		System.assertEquals(listRequest.getBundleId(), null);
		System.assertEquals(listRequest.getIncludeDeleted(), false);
		System.assertEquals(listRequest.getMaxResults(), 20);
		System.assertEquals(listRequest.getOrderBy(), 'displayTime');
		System.assertEquals(listRequest.getPageToken(), null);
		System.assertEquals(listRequest.getPinnedOnly(), false);
		System.assertEquals(listRequest.getSourceItemId(), null);
		
		listRequest.setBundleId('bundleId')
				   .setIncludeDeleted(true)
				   .setMaxResults(100)
				   .setOrderBy('writeTime')
				   .setPageToken('pageToken')
				   .setPinnedOnly(true)
				   .setSourceItemId('sourceItemId');
		
		System.assertEquals(listRequest.getBundleId(), 'bundleId');
		System.assertEquals(listRequest.getIncludeDeleted(), true);
		System.assertEquals(listRequest.getMaxResults(), 100);
		System.assertEquals(listRequest.getOrderBy(), 'writeTime');
		System.assertEquals(listRequest.getPageToken(), 'pageToken');
		System.assertEquals(listRequest.getPinnedOnly(), true);
		System.assertEquals(listRequest.getSourceItemId(), 'sourceItemId');
	}
	
	static testMethod void ffhttp_GoogleMirrorTimelineUpdateMetaDataRequest()
	{
		ffhttp_GoogleMirrorModelTimeline tl = new ffhttp_GoogleMirrorModelTimeline();
		tl.setId('0B94302Tka2HWkNrOElaaUxQaUU');
		
		ffhttp_GoogleMirrorTimeline timeline = createGoogleMirrorTimeline();
		ffhttp_GoogleMirrorTimeline.UpdateRequest updateRequest = timeline.updateRequest(tl);
		assertRequestEndpointAndMethod(updateRequest, 'https://www.googleapis.com/mirror/v1/timeline/0B94302Tka2HWkNrOElaaUxQaUU', 'PUT');
		
		System.assertEquals(updateRequest.getUploadType(), null);
		
		updateRequest.setUploadType('media');
		
		System.assertEquals(updateRequest.getUploadType(), 'media');
	}
	
	private static ffhttp_GoogleMirrorTimeline createGoogleMirrorTimeline()
	{
		ffhttp_GoogleMirror gm = createGoogleMirror();
		ffhttp_GoogleMirrorTimeline timeline = gm.timeline();
		System.assert(timeline != null, 'Timeline should not be null.');
		System.assertEquals(timeline.getService(), gm);
		
		timeline.setService(null);
		System.assertEquals(timeline.getService(), null);
		
		timeline.setService(gm);
		
		return timeline;
	}
	
	/**
	 * ffhttp_GoogleMirrorTimelineAttachments tests
	 */
	static testMethod void ffhttp_GoogleMirrorTimelineAttachmentsDeleteRequest()
	{
		ffhttp_GoogleMirrorTimelineAttachments timelineAttachment = createGoogleMirrorTimelineAttachment();
		ffhttp_GoogleMirrorTimelineAttachments.DeleteRequest deleteRequest = timelineAttachment.deleteRequest('ob6');
		assertRequestEndpointAndMethod(deleteRequest, 'https://www.googleapis.com/mirror/v1/timeline/0B94302Tka2HWkNrOElaaUxQaUU/attachments/ob6', 'DELETE');
	}
	
	static testMethod void ffhttp_GoogleMirrorTimelineAttachmentsDownloadRequest()
	{
		ffhttp_GoogleMirrorModelAttachment attachment = new ffhttp_GoogleMirrorModelAttachment();
		attachment.setContentType('image/jpeg');
		attachment.setContentUrl('https://www.googleapis.com/mirror/v1/timeline/9e7ceb32-016b-4a4b-b1a4-a47935b782f1/attachments/ps:6081586067976565810?alt=media');
		attachment.setId('ps:6081586067976565810');
		
		ffhttp_GoogleMirrorTimelineAttachments timelineAttachment = createGoogleMirrorTimelineAttachment();
		ffhttp_GoogleMirrorTimelineAttachments.DownloadRequest downloadRequest = timelineAttachment.downloadRequest(attachment);
		assertRequestEndpointAndMethod(downloadRequest, 'https://www.googleapis.com/mirror/v1/timeline/9e7ceb32-016b-4a4b-b1a4-a47935b782f1/attachments/ps:6081586067976565810?alt=media', 'GET');
	}
	
	static testMethod void ffhttp_GoogleMirrorTimelineAttachmentsGetRequest()
	{
		ffhttp_GoogleMirrorTimelineAttachments timelineAttachment = createGoogleMirrorTimelineAttachment();
		ffhttp_GoogleMirrorTimelineAttachments.GetRequest getRequest = timelineAttachment.getRequest('ob6');
		assertRequestEndpointAndMethod(getRequest, 'https://www.googleapis.com/mirror/v1/timeline/0B94302Tka2HWkNrOElaaUxQaUU/attachments/ob6', 'GET');
	}
	
	static testMethod void ffhttp_GoogleMirrorTimelineAttachmentsInsertRequest()
	{
		ffhttp_GoogleMirrorTimelineAttachments timelineAttachment = createGoogleMirrorTimelineAttachment();
		ffhttp_GoogleMirrorTimelineAttachments.InsertRequest insertRequest = timelineAttachment.insertRequest(Blob.valueOf('image test'),  'image/jpeg');
		assertRequestEndpointAndMethod(insertRequest, 'https://www.googleapis.com/upload/mirror/v1/timeline/0B94302Tka2HWkNrOElaaUxQaUU/attachments/?uploadType=media', 'POST');
		
		System.assertEquals(insertRequest.getUploadType(), 'media');
		
		insertRequest.setUploadType('resumable');
		
		System.assertEquals(insertRequest.getUploadType(), 'resumable');
	}
	
	static testMethod void ffhttp_GoogleMirrorTimelineAttachmentsListRequest()
	{
		ffhttp_GoogleMirrorTimelineAttachments timelineAttachment = createGoogleMirrorTimelineAttachment();
		ffhttp_GoogleMirrorTimelineAttachments.ListRequest listRequest = timelineAttachment.listRequest();
		assertRequestEndpointAndMethod(listRequest, 'https://www.googleapis.com/mirror/v1/timeline/0B94302Tka2HWkNrOElaaUxQaUU/attachments/', 'GET');
	}
	
	private static ffhttp_GoogleMirrorTimelineAttachments createGoogleMirrorTimelineAttachment()
	{
		ffhttp_GoogleMirrorModelTimeline timeline = new ffhttp_GoogleMirrorModelTimeline();
		timeline.setId('0B94302Tka2HWkNrOElaaUxQaUU');
		
		ffhttp_GoogleMirror gm = createGoogleMirror();
		ffhttp_GoogleMirrorTimelineAttachments timelineAttachments = gm.timelineAttachments();
		System.assert(timelineAttachments != null, 'TimelineAttachments should not be null.');
		System.assertEquals(timelineAttachments.getService(), gm);
		System.assertEquals(timelineAttachments.getTimeline(), null);
		
		timelineAttachments = new ffhttp_GoogleMirrorTimelineAttachments(gm);
		System.assert(timelineAttachments != null, 'TimelineAttachments should not be null.');
		System.assertEquals(timelineAttachments.getService(), gm);
		System.assertEquals(timelineAttachments.getTimeline(), null);
		
		timelineAttachments = new ffhttp_GoogleMirrorTimelineAttachments(gm, '0B94302Tka2HWkNrOElaaUxQaUU');
		System.assert(timelineAttachments != null, 'TimelineAttachments should not be null.');
		System.assertEquals(timelineAttachments.getService(), gm);
		System.assert(timelineAttachments.getTimeline() != null);
		System.assertEquals(timelineAttachments.getTimeline().getId(), '0B94302Tka2HWkNrOElaaUxQaUU');
		
		timelineAttachments = new ffhttp_GoogleMirrorTimelineAttachments(gm, timeline);
		System.assert(timelineAttachments != null, 'TimelineAttachments should not be null.');
		System.assertEquals(timelineAttachments.getService(), gm);
		System.assertEquals(timelineAttachments.getTimeline(), timeline);
		
		timelineAttachments = gm.timelineAttachments();
		timelineAttachments.setService(gm);
		timelineAttachments.setTimeline(timeline);
		
		System.assertEquals(timelineAttachments.getService(), gm);
		System.assertEquals(timelineAttachments.getTimeline(), timeline);
		
		return timelineAttachments;
	}
	
	private static ffhttp_GoogleMirror createGoogleMirror()
	{
		return new ffhttp_GoogleMirror(new ffhttp_Client.Credentials('Bearer', 'Dummy Access Token'));
	}
	 
	private static void assertRequestEndpointAndMethod(ffhttp_Client.AbstractClientRequest request, 
													   String endpoint, String method)
	{
		System.HttpRequest httpRequest = request.buildHttpRequest();
		System.assertEquals(httpRequest.getEndpoint(), endpoint);
		System.assertEquals(httpRequest.getMethod(), method);
	}
}
