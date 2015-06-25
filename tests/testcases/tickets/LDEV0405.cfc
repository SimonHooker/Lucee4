<!--- 
 *
 * Copyright (c) 2015, Lucee Assosication Switzerland. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either 
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public 
 * License along with this library.  If not, see <http://www.gnu.org/licenses/>.
 * 
 ---><cfscript>
component extends="org.lucee.cfml.test.LuceeTestCase"	{

	public void function testORMSettingsDataSource(){
		http method="get" result="local.result" url="#createURL("LDEV0405/index.cfm")#" addtoken="false";
		local.first=trim(result.filecontent);
		
		http method="get" result="local.result" url="#createURL("LDEV0405/index.cfm")#" addtoken="false";
		local.second=trim(result.filecontent);
		
		http method="get" result="local.result" url="#createURL("LDEV0405/index.cfm")#" addtoken="false";
		local.third=trim(result.filecontent);
		
		// the number of connections should not increase
		assertEquals(first,second);
		assertEquals(first,third);
	}
	
	private string function createURL(string calledName){
		var baseURL="http://#cgi.HTTP_HOST##getDirectoryFromPath(contractPath(getCurrenttemplatepath()))#";
		return baseURL&""&calledName;
	}
	
} 
</cfscript>