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
 * ffhttp_GoogleMirrorContacts
 *
 * Class to encapsulate all the Google Mirror Contacts API calls.
 * https://developers.google.com/glass/v1/reference/#Contacts
 */
public with sharing class ffhttp_GoogleMirrorContacts extends ffhttp_GoogleMirrorResource
{
	/**
	 * Constructor
	 *
	 * @param service The ffhttp_GoogleMirror service.
	 * @return Access to the Contacts API calls.
	 */
	public ffhttp_GoogleMirrorContacts(ffhttp_GoogleMirror service) 
	{
		super(service);
	}
	
	/*********************************************************************************************************
	 * Requests
	 *********************************************************************************************************/
	
	/**
     * Deletes a contact.
     *
     * @param contactId The ID of the contact.
     * @return the request
     */
	public DeleteRequest deleteRequest(String contactId) 
	{
		return new DeleteRequest(this, contactId);
	}
	
	/**
     * Gets a single contact by ID.
     *
     * @param contactId The ID of the contact.
     * @return the request
     */
	public GetRequest getRequest(String contactId)
	{
		return new GetRequest(this, contactId);
	}
	
	/**
     * Inserts a new contact.
     *
     * @param contact the ffhttp_GoogleMirrorModelContact
     * @return the request
     */
	public InsertRequest insertRequest(ffhttp_GoogleMirrorModelContact contact)
	{
		return new InsertRequest(this, contact);
	}
	
	/**
     * Retrieves a list of contacts for the authenticated user.
     *
     * @return the request
     */
	public ListRequest listRequest() 
	{
		return new ListRequest(this);
	}
	
	/**
     * Updates a contact in place.
     *
     * @param contact the ffhttp_GoogleMirrorModelContact
     * @return the request
     */
	public UpdateRequest updateRequest(ffhttp_GoogleMirrorModelContact contact)
	{
		return new UpdateRequest(this, contact);
	}

	/*********************************************************************************************************
	 * API Callout Inner Classes
	 *********************************************************************************************************/

	public class DeleteRequest extends GoogleMirrorRequest
	{
		DeleteRequest(ffhttp_GoogleMirrorContacts contacts, String contactId) 
		{
			super(contacts, METADATA_ENDPOINT, ENDPOINT_CONTACTS + contactId, REQUEST_METHOD_DELETE, null, null);
		}
	}
	
	public class GetRequest extends GoogleMirrorRequest
	{
		GetRequest(ffhttp_GoogleMirrorContacts contacts, String contactId) 
		{
			super(contacts, METADATA_ENDPOINT, ENDPOINT_CONTACTS + contactId, REQUEST_METHOD_GET, null, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleMirrorModelContact.class));
		}
	}
	
	public class InsertRequest extends GoogleMirrorRequest
	{
		InsertRequest(ffhttp_GoogleMirrorContacts contacts, ffhttp_GoogleMirrorModelContact content)
		{
			super(contacts, METADATA_ENDPOINT, ENDPOINT_CONTACTS, REQUEST_METHOD_POST, content,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleMirrorModelContact.class));
		}
	}
	
	public class ListRequest extends GoogleMirrorRequest
	{
		ListRequest(ffhttp_GoogleMirrorContacts contacts)
		{
			super(contacts, METADATA_ENDPOINT, ENDPOINT_CONTACTS, REQUEST_METHOD_GET, null,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleMirrorModelContact.ItemList.class));
		}
	}
	
	public class UpdateRequest extends GoogleMirrorRequest
	{
		UpdateRequest(ffhttp_GoogleMirrorContacts contacts, ffhttp_GoogleMirrorModelContact content)
		{
			super(contacts, METADATA_ENDPOINT, ENDPOINT_CONTACTS + content.getId(), REQUEST_METHOD_PUT, content,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleMirrorModelContact.class));
		}
	}
}
