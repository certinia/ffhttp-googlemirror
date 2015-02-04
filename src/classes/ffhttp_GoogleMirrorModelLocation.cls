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
 * ffhttp_GoogleMirrorModelLocation
 *
 * An object that represents the meta data for a location in Google Mirror.
 * https://developers.google.com/glass/v1/reference/locations
 */
public with sharing class ffhttp_GoogleMirrorModelLocation extends ffhttp_GoogleMirrorModelAbstractObject
{
	private Double accuracy;		//The accuracy of the location fix in meters.
	private	String address;			//The full address of the location.
	private String displayName;		//The name to be displayed. 
									//This may be a business name or a user-defined place, such as "Home".
	private String id;				//The ID of the location.	
	private Double latitude;		//The latitude, in degrees.
	private Double longitude;		//The longitude, in degrees.
	private DateTime timestamp;		//The time at which this location was captured, formatted according to RFC 3339.	

	/**
	 * Constructor
	 */
	public ffhttp_GoogleMirrorModelLocation()
	{
		super(KIND_MIRROR_LOCATION);
	}
	
	/**
	 * Get/Sets
	 */
	public Double getAccuracy()
	{
		return accuracy;
	}
	public ffhttp_GoogleMirrorModelLocation setAccuracy(Double accuracy)
	{
		this.accuracy = accuracy;
		return this;
	}
	public String getAddress()
	{
		return address;
	}
	public ffhttp_GoogleMirrorModelLocation setAddress(String address)
	{
		this.address = address;
		return this;
	}
	public String getDisplayName()
	{
		return displayName;
	}
	public ffhttp_GoogleMirrorModelLocation setDisplayName(String displayName)
	{
		this.displayName = displayName;
		return this;
	}
	public String getId()
	{
		return id;
	}
	public ffhttp_GoogleMirrorModelLocation setId(String id)
	{
		this.id = id;
		return this;
	}
	public Double getLatitude()
	{
		return latitude;
	}
	public ffhttp_GoogleMirrorModelLocation setLatitude(Double latitude)
	{
		this.latitude = latitude;
		return this;
	}
	public Double getLongitude()
	{
		return longitude;
	}
	public ffhttp_GoogleMirrorModelLocation setLongitude(Double longitude)
	{
		this.longitude = longitude;
		return this;
	}
	public DateTime getTimestamp()
	{
		return timestamp;
	}
	public ffhttp_GoogleMirrorModelLocation setTimestamp(DateTime timestamp)
	{
		this.timestamp = timestamp;
		return this;
	}
	
	/**
	 * Object to represent a list of Google Mirror Locations.
	 */
	public with sharing class ItemList extends ffhttp_GoogleMirrorModelAbstractObject.AbstractList
	{
		List<ffhttp_GoogleMirrorModelLocation> items;
		
		/**
		 * Constructor
		 */
		public ItemList()
		{
			super(KIND_MIRROR_LOCATIONS_LIST);
		}
			
		public override List<ffhttp_GoogleMirrorModelAbstractObject> getItems() 
		{
			return (List<ffhttp_GoogleMirrorModelLocation>)items;
		}
	}	
}
