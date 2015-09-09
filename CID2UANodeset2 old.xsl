<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:my="http://www.iec.ch/61850/2003/SCL" version="2.0" exclude-result-prefixes="my">
	<xsl:output method="xml" version="1.0" omit-xml-declaration="yes" indent="yes"/>
	<!--
Title:CID to UANodeset Stylesheet
Copyright ©  OPC Foundation, Inc., 2013. Released 2013-03-1 13:37

Authors: Denis Francesconi, Hydro-Québec
         John Gillerman, GridCloudSystem, Inc.

Unless explicitly acquired and licensed from Licensor under another license, 
the contents of this file are subject to the Reciprocal Community License ("RCL") Version 0.9, 
or subsequent versions as allowed by the RCL, and You may not copy or use this file in either source code 
or executable form, except in compliance with the terms and conditions of the RCL.

All software distributed under the RCL is provided strictly on an "AS IS" basis, 
WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, AND LICENSOR HEREBY DISCLAIMS ALL SUCH WARRANTIES, 
INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, 
QUIET ENJOYMENT, OR NON-INFRINGEMENT. 

See the RCL for specific language governing rights and limitations under the RCL. 

-->
	<xsl:template match="/">
		<UANodeSet xmlns="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:s1="http://sample.com/Instances" xmlns:s0="http://sample.com/Types" xmlns:uax="http://opcfoundation.org/UA/2008/02/Types.xsd" xsi:schemaLocation="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd file:///Z:/Downloads/8-2%20Temp/HQ/UAnode%20set/UANodeSet.xsd">
			<NamespaceUris>
				<Uri>http://sample.com/Instances</Uri>
				<Uri>http://sample.com/Types</Uri>
			</NamespaceUris>
			<Aliases>
				<Alias Alias="Boolean">i=1</Alias>
				<Alias Alias="SByte">i=2</Alias>
				<Alias Alias="Byte">i=3</Alias>
				<Alias Alias="Int16">i=4</Alias>
				<Alias Alias="UInt16">i=5</Alias>
				<Alias Alias="Int32">i=6</Alias>
				<Alias Alias="UInt32">i=7</Alias>
				<Alias Alias="Int64">i=8</Alias>
				<Alias Alias="UInt64">i=9</Alias>
				<Alias Alias="Float">i=10</Alias>
				<Alias Alias="Double">i=11</Alias>
				<Alias Alias="DateTime">i=13</Alias>
				<Alias Alias="String">i=12</Alias>
				<Alias Alias="Guid">i=14</Alias>
				<Alias Alias="ByteString">i=15</Alias>
				<Alias Alias="XmlElement">i=16</Alias>
				<Alias Alias="NodeId">i=17</Alias>
				<Alias Alias="ExpandedNodeId">i=18</Alias>
				<Alias Alias="StatusCode">i=19</Alias>
				<Alias Alias="QualifiedName">i=20</Alias>
				<Alias Alias="LocalizedText">i=21</Alias>
				<Alias Alias="Structure">i=22</Alias>
				<Alias Alias="Number">i=26</Alias>
				<Alias Alias="Integer">i=27</Alias>
				<Alias Alias="UInteger">i=28</Alias>
				<Alias Alias="HasChild">i=34</Alias>
				<Alias Alias="Organizes">i=35</Alias>
				<Alias Alias="HasEventSource">i=36</Alias>
				<Alias Alias="HasModellingRule">i=37</Alias>
				<Alias Alias="HasEncoding">i=38</Alias>
				<Alias Alias="HasDescription">i=39</Alias>
				<Alias Alias="HasTypeDefinition">i=40</Alias>
				<Alias Alias="HasSubtype">i=45</Alias>
				<Alias Alias="HasProperty">i=46</Alias>
				<Alias Alias="HasComponent">i=47</Alias>
				<Alias Alias="HasNotifier">i=48</Alias>
				<Alias Alias="FolderType">i=58</Alias>
				<Alias Alias="ObjectFolder">i=85</Alias>
				<Alias Alias="TypeFolder">i=86</Alias>
				<Alias Alias="ObjectTypes">i=88</Alias>
			</Aliases>
<!--
CREATE Object Types for above and including LNode super type
-->			
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=2;s=IED</xsl:attribute>
				<xsl:attribute name="BrowseName">2:IED</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 IED Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 IED Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=2;s=AccessPoint</xsl:attribute>
				<xsl:attribute name="BrowseName">2:AccessPoint</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 AccessPoint Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 AccessPoint Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=2;s=IEC 61850 Server</xsl:attribute>
				<xsl:attribute name="BrowseName">2:IEC 61850 Server</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 Server Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 Server Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=2;s=LogicalDevice</xsl:attribute>
				<xsl:attribute name="BrowseName">2:LogicalDevice</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 LogicalDevice Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 LogicalDevice Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=2;s=LogicalNode</xsl:attribute>
				<xsl:attribute name="BrowseName">2:LogicalNode</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 LogicalNode Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 LogicalNode Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=2;s=ReportControl</xsl:attribute>
				<xsl:attribute name="BrowseName">2:ReportControl</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 ReportControl Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 ReportControl Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=2;s=ReportControlOptFields</xsl:attribute>
				<xsl:attribute name="BrowseName">2:ReportControlOptFields</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 ReportControlOptFields Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 ReportControlOptFields Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=2;s=ReportControlTrgOps</xsl:attribute>
				<xsl:attribute name="BrowseName">2:ReportControlTrgOps</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 ReportControlTrgOps Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 ReportControlTrgOps Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=2;s=FunctionalConstraint</xsl:attribute>
				<xsl:attribute name="BrowseName">2:FunctionalConstraint</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 FunctionalConstraint Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 FunctionalConstraint Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=2;s=DataSet</xsl:attribute>
				<xsl:attribute name="BrowseName">2:DataSet</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 DataSet Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 DataSet Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=2;s=Substation</xsl:attribute>
				<xsl:attribute name="BrowseName">2:Substation</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 Substation Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 Substation Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=2;s=VoltageLevel</xsl:attribute>
				<xsl:attribute name="BrowseName">2:VoltageLevel</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 VoltageLevel Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 VoltageLevel Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=2;s=PowerTransformer</xsl:attribute>
				<xsl:attribute name="BrowseName">2:PowerTransformer</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 PowerTransformer Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 PowerTransformer Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=2;s=TransformerWinding</xsl:attribute>
				<xsl:attribute name="BrowseName">2:TransformerWinding</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 TransformerWinding Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 TransformerWinding Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=2;s=Bay</xsl:attribute>
				<xsl:attribute name="BrowseName">2:Bay</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 Bay Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 Bay Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=2;s=ConductingEquipment</xsl:attribute>
				<xsl:attribute name="BrowseName">2:ConductingEquipment</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 ConductingEquipment Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 ConductingEquipment Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>			
<!--
CREATE Object Types for CDC super types
-->		
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=2;s=Base CDC</xsl:attribute>
				<xsl:attribute name="BrowseName">2:Base CDC</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 Base Common Data Class Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 Base Common Data Class Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=2;s=Composed CDC</xsl:attribute>
				<xsl:attribute name="BrowseName">2:Composed CDC</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 Composed Common Data Class Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 Composed Common Data Class Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">ns=2;s=Base CDC</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=2;s=Primitive CDC</xsl:attribute>
				<xsl:attribute name="BrowseName">2:Primitive CDC</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 Primitive Common Data Class Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 Primitive Common Data Class Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">ns=2;s=Base CDC</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=2;s=Substitution CDC</xsl:attribute>
				<xsl:attribute name="BrowseName">2:Substitution CDC</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 Substitution Common Data Class Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 Substitution Common Data Class Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">ns=2;s=Primitive CDC</Reference>
				</References>
			</UAObjectType>			
<!--
CREATE Data Types for LNode and CDC super types
-->	
<!--
			<UADataType>
				<xsl:attribute name="NodeId">ns=2;s=Base LNode Data Type</xsl:attribute>
				<xsl:attribute name="BrowseName">2:Base LNode Data Type</xsl:attribute>
				<DisplayName>IEC 61850 LNode Data Type</DisplayName>
				<Description>IEC 61850 LNode Data Type</Description>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=22</Reference>
				</References>
			</UADataType>
-->
			<UADataType>
				<xsl:attribute name="NodeId">ns=2;s=Base CDC Data Type</xsl:attribute>
				<xsl:attribute name="BrowseName">2:Base CDC Data Type</xsl:attribute>
				<DisplayName>2:IEC 61850 Base Common Data Class Data Type</DisplayName>
				<Description>IEC 61850 Base Common Data Class Data Type</Description>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=22</Reference>
				</References>
			</UADataType>
			<UADataType>
				<xsl:attribute name="NodeId">ns=2;s=Composed CDC Data Type</xsl:attribute>
				<xsl:attribute name="BrowseName">2:Composed CDC Data Type</xsl:attribute>
				<DisplayName>2:IEC 61850 Composed Common Data Class Data Type</DisplayName>
				<Description>IEC 61850 Composed Common Data Class Data Type</Description>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">ns=2;s=Base CDC Data Type</Reference>
				</References>
			</UADataType>
			<UADataType>
				<xsl:attribute name="NodeId">ns=2;s=Primitive CDC Data Type</xsl:attribute>
				<xsl:attribute name="BrowseName">2:Primitive CDC Data Type</xsl:attribute>
				<DisplayName>2:IEC 61850 Primitive Common Data Class Data Type</DisplayName>
				<Description>IEC 61850 Primitive Common Data Class Data Type</Description>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">ns=2;s=Base CDC Data Type</Reference>
				</References>
			</UADataType>
			<UADataType>
				<xsl:attribute name="NodeId">ns=2;s=Substitution CDC Data Type</xsl:attribute>
				<xsl:attribute name="BrowseName">2:Substitution CDC Data Type</xsl:attribute>
				<DisplayName>2:IEC 61850 Substitution Common Data Class Data Type</DisplayName>
				<Description>IEC 61850 Substitution Common Data Class Data Type</Description>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">ns=2;s=Primitive CDC Data Type</Reference>
				</References>
			</UADataType>
<!--
CREATE Data Types and Variable type for DA super type
-->		
			<UADataType>
				<xsl:attribute name="NodeId">ns=2;s=Base DA Data Type</xsl:attribute>
				<xsl:attribute name="BrowseName">2:Base DA Data Type</xsl:attribute>
				<DisplayName>2:IEC 61850 Base Data Attribute Data Type</DisplayName>
				<Description>IEC 61850 Base Data Attribute Data Type</Description>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=22</Reference>
				</References>
			</UADataType>
			<UAVariableType>
				<xsl:attribute name="NodeId">ns=2;s=Base DA Variable Type</xsl:attribute>
				<xsl:attribute name="BrowseName">2:Base DA Variable Type</xsl:attribute>
				<DisplayName>2:IEC 61850 Base DA Variable Type</DisplayName>
				<Description>IEC 61850 Base DA Variable Type</Description>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=62</Reference>
				</References>
			</UAVariableType>
<!--
CREATE Object Folders
-->			
			<UAObject>
				<xsl:attribute name="NodeId">ns=2;s=IEDs</xsl:attribute>
				<xsl:attribute name="BrowseName">2:IEDs</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 IEDs</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
					<Reference ReferenceType="HasTypeDefinition">i=61</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=2;s=Access Points</xsl:attribute>
				<xsl:attribute name="BrowseName">2:Access Points</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 Access Points</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
					<Reference ReferenceType="HasTypeDefinition">i=61</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=2;s=IEC 61850 Servers</xsl:attribute>
				<xsl:attribute name="BrowseName">2:IEC 61850 Servers</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 Servers</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
					<Reference ReferenceType="HasTypeDefinition">i=61</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=2;s=Logical Devices</xsl:attribute>
				<xsl:attribute name="BrowseName">2:Logical Devices</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 Logical Devices</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
					<Reference ReferenceType="HasTypeDefinition">i=61</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=2;s=Logical Nodes</xsl:attribute>
				<xsl:attribute name="BrowseName">2:Logical Nodes</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 Logical Nodes</xsl:element>
				<xsl:element name="Description">IEC 61850 Logical Nodes</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
					<Reference ReferenceType="HasTypeDefinition">i=61</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=2;s=Data Sets</xsl:attribute>
				<xsl:attribute name="BrowseName">2:Data Sets</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 Data Sets</xsl:element>
				<xsl:element name="Description">IEC 61850 Data Sets</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
					<Reference ReferenceType="HasTypeDefinition">i=61</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=2;s=Report Controls</xsl:attribute>
				<xsl:attribute name="BrowseName">2:Report Controls</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 Report Controls</xsl:element>
				<xsl:element name="Description">IEC 61850 Report Controls</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
					<Reference ReferenceType="HasTypeDefinition">i=61</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=2;s=Functional Constraints</xsl:attribute>
				<xsl:attribute name="BrowseName">2:Functional Constraints</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 Functional Constraints</xsl:element>
				<xsl:element name="Description">IEC 61850 Functional Constraints</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
					<Reference ReferenceType="HasTypeDefinition">i=61</Reference>
				</References>
			</UAObject>
<!--
Temporary DO and DA Folders for trouble shooting
-->
			<UAObject>
				<xsl:attribute name="NodeId">ns=2;s=DOs</xsl:attribute>
				<xsl:attribute name="BrowseName">2:DOs</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 Data Objects</xsl:element>
				<xsl:element name="Description">IEC 61850 Data Objects</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
					<Reference ReferenceType="HasTypeDefinition">i=61</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=2;s=DAs</xsl:attribute>
				<xsl:attribute name="BrowseName">2:DAs</xsl:attribute>
				<xsl:element name="DisplayName">2:IEC 61850 Data Attributes</xsl:element>
				<xsl:element name="Description">IEC 61850 Data Attributes</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
					<Reference ReferenceType="HasTypeDefinition">i=61</Reference>
				</References>
			</UAObject>			
<!--
CREATE Functional Constraint Objects
-->
			<UAObject>
				<xsl:attribute name="NodeId">ns=2;s=ST</xsl:attribute>
				<xsl:attribute name="BrowseName">2:ST Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">ST Functional Constraint</xsl:element>
				<xsl:element name="Description">ST Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=2;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=2;s=MX</xsl:attribute>
				<xsl:attribute name="BrowseName">2:MX Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">MX Functional Constraint</xsl:element>
				<xsl:element name="Description">MX Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=2;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=2;s=CO</xsl:attribute>
				<xsl:attribute name="BrowseName">2:CO Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">CO Functional Constraint</xsl:element>
				<xsl:element name="Description">CO Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=2;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=2;s=SP</xsl:attribute>
				<xsl:attribute name="BrowseName">2:SP Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">SP Functional Constraint</xsl:element>
				<xsl:element name="Description">SP Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=2;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=2;s=SV</xsl:attribute>
				<xsl:attribute name="BrowseName">2:SV Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">SV Functional Constraint</xsl:element>
				<xsl:element name="Description">SV Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=2;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=2;s=CF</xsl:attribute>
				<xsl:attribute name="BrowseName">2:CF Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">CF Functional Constraint</xsl:element>
				<xsl:element name="Description">CF Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=2;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=2;s=DC</xsl:attribute>
				<xsl:attribute name="BrowseName">2:DC Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">DC Functional Constraint</xsl:element>
				<xsl:element name="Description">DC Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=2;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=2;s=SG</xsl:attribute>
				<xsl:attribute name="BrowseName">2:SG Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">SG Functional Constraint</xsl:element>
				<xsl:element name="Description">SG Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=2;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=2;s=SE</xsl:attribute>
				<xsl:attribute name="BrowseName">2:SE Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">SE Functional Constraint</xsl:element>
				<xsl:element name="Description">SE Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=2;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=2;s=EX</xsl:attribute>
				<xsl:attribute name="BrowseName">2:EX Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">EX Functional Constraint</xsl:element>
				<xsl:element name="Description">EX Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=2;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>						
<!--
CREATE Data Dictionary Variable
-->
			<UAVariable>
				<xsl:attribute name="NodeId">ns=2;s=IEC 62541 Data Type Dictionary</xsl:attribute>
				<xsl:attribute name="BrowseName">2:IEC 62541 Data Type Dictionary</xsl:attribute>
				<xsl:element name="DisplayName">IEC 62541 Data Type Dictionary</xsl:element>
				<xsl:element name="Description">IEC 62541 Data Type Dictionary</xsl:element>
				<References>
					<Reference ReferenceType="HasTypeDefinition">i=72</Reference>
					<Reference ReferenceType="HasComponent" IsForward="false">i=93</Reference>
				</References>
			</UAVariable>
<!--
Parse Instance Data for instance tree
-->			
			<xsl:for-each select="//my:IED">
				<UAObject NodeId="ns=2;s=IED System" BrowseName="2:IED System">
					<xsl:attribute name="NodeId">ns=2;s=IED System</xsl:attribute>
					<xsl:attribute name="BrowseName">2:IED System</xsl:attribute>
					<xsl:element name="DisplayName">IED System</xsl:element>
					<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
					<References>
						<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=IEDs</Reference>
						<Reference ReferenceType="HasTypeDefinition">ns=2;s=IED</Reference>
					</References>
				</UAObject>
				<xsl:for-each select="//my:AccessPoint">
					<UAObject NodeId="ns=2;s=AP1" BrowseName="2:AP1">
						<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@name"/></xsl:attribute>
						<xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/></xsl:attribute>
						<xsl:element name="DisplayName">
							<xsl:value-of select="@name"/>
						</xsl:element>
						<xsl:element name="Description">
							<xsl:value-of select="@desc"/>
						</xsl:element>
						<References>
							<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=IED System</Reference>
							<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=Access Points</Reference>
							<Reference ReferenceType="HasTypeDefinition">ns=2;s=AccessPoint</Reference>
						</References>
					</UAObject>
					<UAVariable>
						<xsl:attribute name="NodeId">ns=2;s=AccessPoint/router</xsl:attribute>
						<xsl:attribute name="BrowseName">2:AccessPoint/router</xsl:attribute>
						<xsl:attribute name="DataType">i=12</xsl:attribute>
						<xsl:element name="DisplayName">AccessPoint/router</xsl:element>
						<Description/>
						<References>
							<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
							<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="@name"/>
							</Reference>
						</References>
						<Value>
							<uax:String>
								<xsl:value-of select="@router"/>
							</uax:String>
						</Value>
					</UAVariable>
					<UAVariable>
						<xsl:attribute name="NodeId">ns=2;s=AccessPoint/clock</xsl:attribute>
						<xsl:attribute name="BrowseName">2:AccessPoint/clock</xsl:attribute>
						<xsl:attribute name="DataType">i=12</xsl:attribute>
						<xsl:element name="DisplayName">AccessPoint/clock</xsl:element>
						<Description/>
						<References>
							<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
							<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="@name"/>
							</Reference>
						</References>
						<Value>
							<uax:String>
								<xsl:value-of select="@clock"/>
							</uax:String>
						</Value>
					</UAVariable>
<!--
Parse Server Instances for instance tree 
-->	
					<xsl:for-each select="//my:Server">
						<UAObject NodeId="ns=2;s=Server1" BrowseName="2:Server1">
							<DisplayName>Server1</DisplayName>
							<Description>IEC61850 Compliant data model</Description>
							<References>
								<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="../@name"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=IEC 61850 Servers</Reference>
								<Reference ReferenceType="HasTypeDefinition">ns=2;s=IEC 61850 Server</Reference>
							</References>
						</UAObject>
						<UAVariable>
							<xsl:attribute name="NodeId">ns=2;s=Server/timeout</xsl:attribute>
							<xsl:attribute name="BrowseName">2:Server/timeout</xsl:attribute>
							<xsl:attribute name="DataType">i=12</xsl:attribute>
							<xsl:element name="DisplayName">Server/timeout</xsl:element>
							<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=Server1</Reference>
							</References>
							<Value>
								<uax:String>900</uax:String>
							</Value>
						</UAVariable>
<!--
Parse LD Instances for instance tree 
-->	
						<xsl:for-each select="//my:LDevice">
							<UAObject>
								<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@inst"/></xsl:attribute>
								<xsl:attribute name="BrowseName">2:<xsl:value-of select="@inst"/></xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="@inst"/></xsl:element>
								<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
								<References>
									<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=Server1</Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=Logical Devices</Reference>
									<Reference ReferenceType="HasTypeDefinition">ns=2;s=LogicalDevice</Reference>
								</References>
							</UAObject>
<!--
Parse LN0 Instances for instance tree 
-->
							<xsl:for-each select="my:LN0">
								<UAObject>
									<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../@inst"/>/<xsl:value-of select="@lnClass"/><xsl:value-of select="@inst"/></xsl:attribute>
									<xsl:attribute name="BrowseName">2:<xsl:value-of select="../@inst"/>/<xsl:value-of select="@lnClass"/><xsl:value-of select="@inst"/></xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="../@inst"/>/<xsl:value-of select="@lnClass"/><xsl:value-of select="@inst"/></xsl:element>
									<xsl:element name="Description">
										<xsl:value-of select="@desc"/>
									</xsl:element>
									<References>
										<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="../@inst"/></Reference>
										<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=Logical Nodes</Reference>
										<Reference ReferenceType="HasTypeDefinition">ns=2;s=LogicalNode</Reference>
									</References>
								</UAObject>
<!--
Parse DataSet Instances for instance tree 
-->
								<xsl:for-each select="my:DataSet">
									<UAObject>
										<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/><xsl:value-of select="@name"/></xsl:attribute>
										<xsl:attribute name="BrowseName">2:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/><xsl:value-of select="@name"/></xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/><xsl:value-of select="@name"/></xsl:element>
										<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
										<References>
											<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/></Reference>
											<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=Data Sets</Reference>
											<Reference ReferenceType="HasTypeDefinition">ns=2;s=DataSet</Reference>
										</References>
									</UAObject>						
									<xsl:call-template name="FCDA"/>
								</xsl:for-each>
								<xsl:for-each select="my:ReportControl">
									<xsl:call-template name="ReportControl"/>
								</xsl:for-each>
							</xsl:for-each>
<!--
Parse LN Instances for instance tree 
-->
							<xsl:for-each select="my:LN">
								<UAObject>
									<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../@inst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@inst"/></xsl:attribute>
									<xsl:attribute name="BrowseName">2:<xsl:value-of select="../@inst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@inst"/></xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="../@inst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@inst"/></xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
										<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="../@inst"/></Reference>
										<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=Logical Nodes</Reference>
										<Reference ReferenceType="HasTypeDefinition">ns=2;s=<xsl:value-of select="@lnType"/></Reference>
									</References>
								</UAObject>

								<xsl:for-each select="my:DataSet">
									<UAObject>
										<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@prefix"/><xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/><xsl:value-of select="@name"/></xsl:attribute>
										<xsl:attribute name="BrowseName">2:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@prefix"/><xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/><xsl:value-of select="@name"/></xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@prefix"/><xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/><xsl:value-of select="@name"/></xsl:element>
										<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
										<References>
											<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@prefix"/><xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/></Reference>
											<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=Data Sets</Reference>
											<Reference ReferenceType="HasTypeDefinition">ns=2;s=DataSet</Reference>
										</References>
									</UAObject>

									<xsl:call-template name="FCDA"/>
								</xsl:for-each>
<!--
Parse Report Control Instances for instance tree 
-->
								<xsl:for-each select="my:ReportControl">
									<xsl:call-template name="ReportControl"/>
								</xsl:for-each>								
								
								<!--
Parse DO Instances for instance tree
-->
								<xsl:for-each select="my:DOI">
									<UAObject>
										<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@prefix"/><xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>.<xsl:value-of select="@name"/></xsl:attribute>
										<xsl:attribute name="BrowseName">2:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@prefix"/><xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>.<xsl:value-of select="@name"/></xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@prefix"/><xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>.<xsl:value-of select="@name"/>
										</xsl:element><xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
										<References>
											<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@prefix"/><xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/></Reference>
											<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=DOs</Reference>
											<Reference ReferenceType="HasTypeDefinition">ns=2;s=<xsl:value-of select="@name"/></Reference>
										</References>
									</UAObject>

<!--
Parse DA Instances for instance tree
-->
									<xsl:for-each select="my:DAI">
										<UAVariable>
											<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../../@inst"/>/<xsl:value-of select="../../@prefix"/><xsl:value-of select="../../@lnClass"/><xsl:value-of select="../../@inst"/>.<xsl:value-of select="../@name"/>.<xsl:value-of select="@name"/></xsl:attribute>
											<xsl:attribute name="BrowseName">2:<xsl:value-of select="../../../@inst"/>/<xsl:value-of select="../../@prefix"/><xsl:value-of select="../../@lnClass"/><xsl:value-of select="../../@inst"/>.<xsl:value-of select="../@name"/>.<xsl:value-of select="@name"/></xsl:attribute>
											<xsl:attribute name="DataType">i=12</xsl:attribute>
											<xsl:element name="DisplayName"><xsl:value-of select="../../../@inst"/>/<xsl:value-of select="../../@prefix"/><xsl:value-of select="../../@lnClass"/><xsl:value-of select="../../@inst"/>.<xsl:value-of select="../@name"/>.<xsl:value-of select="@name"/></xsl:element>
											<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
											<References>
												<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="../../../@inst"/>/<xsl:value-of select="../../@prefix"/><xsl:value-of select="../../@lnClass"/><xsl:value-of select="../../@inst"/>.<xsl:value-of select="../@name"/></Reference>
												<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=DAs</Reference>
												<Reference ReferenceType="HasTypeDefinition">ns=2;s=<xsl:value-of select="@name"/></Reference>
											</References>
											<xsl:for-each select="my:Val">
												<Value>
													<uax:String>
														<xsl:value-of select="."/>
													</uax:String>
												</Value>
											</xsl:for-each>
										</UAVariable>
									</xsl:for-each>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:for-each>
<!--
Parse types for type system
--> 
			<xsl:for-each select="//my:DataTypeTemplates">
<!--
Create object and data types for LNs as well as contained DOs
--> 
				<xsl:for-each select="my:LNodeType">
					<!-- Create object type for standard lnClasses --> 
					<UAObjectType>
						<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@lnClass"/></xsl:attribute>
						<xsl:attribute name="BrowseName">2:<xsl:value-of select="@lnClass"/></xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@lnClass"/> lnClass</xsl:element>
						<xsl:element name="Description"> lnClass</xsl:element>
						<References>
							<Reference ReferenceType="HasSubtype" IsForward="false">ns=2;s=LogicalNode</Reference>
							<xsl:for-each select="my:DO">
								<!-- Add references to DO object type --> 
								<Reference ReferenceType="HasComponent">ns=2;s=<xsl:value-of select="@type"/></Reference>
							</xsl:for-each>
						</References>
					</UAObjectType>
					<!-- Create object types for LNodeTypes --> 
					<UAObjectType>
						<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@id"/></xsl:attribute>
						<xsl:attribute name="BrowseName">2:<xsl:value-of select="@id"/></xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@id"/>LNodeType</xsl:element>
						<xsl:element name="Description"><xsl:value-of select="@desc"/>LNodeType</xsl:element>
						<References>
							<Reference ReferenceType="HasSubtype" IsForward="false">ns=2;s=<xsl:value-of select="@lnClass"/></Reference>
							<xsl:for-each select="my:DO">
								<!-- Add references to DO data type -->
								<Reference ReferenceType="HasComponent">ns=2;s=<xsl:value-of select="@type"/></Reference>
							</xsl:for-each>
						</References>
					</UAObjectType>
					<!-- Create data types for LNodeTypes -->
					<!--
					<UADataType>
						<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@id"/> Data Type</xsl:attribute>
						<xsl:attribute name="BrowseName">2:<xsl:value-of select="@id"/> Data Type</xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@id"/> LNodeType Data Type</xsl:element>
						<xsl:element name="Description"><xsl:value-of select="@desc"/> LNodeType Data Type</xsl:element>
						<References>
							<Reference ReferenceType="HasChild">ns=2;s=<xsl:value-of select="@id"/>.Binary</Reference>
							<Reference ReferenceType="HasEncoding">ns=2;s=<xsl:value-of select="@id"/>.Binary</Reference>
							<Reference ReferenceType="HasSubtype" IsForward="false">ns=2;s=Base LNode Data Type</Reference>
						</References>
						<Definition>
							<xsl:attribute name="Name"><xsl:value-of select="@id"/></xsl:attribute>
							<xsl:for-each select="my:DO">
								<Field>
									<xsl:attribute name="Name"><xsl:value-of select="@name"/></xsl:attribute>
									<xsl:attribute name="DataType">ns=2;s=<xsl:value-of select="@type"/></xsl:attribute>
								</Field>
							</xsl:for-each>
						</Definition>
					</UADataType>
					<UAObject>
						<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@id"/>.Binary</xsl:attribute>
						<xsl:attribute name="BrowseName">2:<xsl:value-of select="@id"/>.Binary</xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@id"/>.Binary</xsl:element>
						<xsl:element name="Description">Binary Data Type Encoding></xsl:element>
						<References>
							<Reference ReferenceType="HasTypeDefinition">i=76</Reference>
							<Reference ReferenceType="HasChild">ns=2;s=<xsl:value-of select="@id"/>.Schema</Reference>
							<Reference ReferenceType="HasDescription" IsForward="false">ns=2;s=<xsl:value-of select="@id"/>.Schema</Reference>
						</References>
					</UAObject>
					<UAVariable>
						<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@id"/>.Schema</xsl:attribute>
						<xsl:attribute name="BrowseName">2:<xsl:value-of select="@id"/>.Schema</xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@id"/>.Schema</xsl:element>
						<xsl:element name="Description">Data Type Description></xsl:element>
						<References>
							<Reference ReferenceType="HasTypeDefinition">i=69</Reference>
							<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=IEC 62541 Data Type Dictionary</Reference>
						</References>
					</UAVariable>
					-->
					<!-- Create object type for the DOs and subtype them from their DOType object types --> 
					<xsl:for-each select="my:DO">
						<UAObjectType>
							<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@name"/></xsl:attribute>
							<xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/></xsl:attribute>
							<xsl:element name="DisplayName"><xsl:value-of select="@name"/> DO</xsl:element>
							<xsl:element name="Description">Data Object</xsl:element>
							<References>
								<!-- Add references to DO object type -->
								<Reference ReferenceType="HasSubtype" IsForward="false">ns=2;s=<xsl:value-of select="@type"/></Reference>
							</References>
						</UAObjectType>
						<!-- Create data types for DOs and subtype them from their DOType data types--> 
						<UADataType>
							<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@name"/> Data Type</xsl:attribute>
							<xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/> Data Type</xsl:attribute>
							<xsl:element name="DisplayName"><xsl:value-of select="@name"/> DO Data Type</xsl:element>
							<xsl:element name="Description">Data Object Data Type</xsl:element>
							<References>
								<Reference ReferenceType="HasChild">ns=2;s=<xsl:value-of select="@name"/>.Binary</Reference>
								<Reference ReferenceType="HasEncoding">ns=2;s=<xsl:value-of select="@name"/>.Binary</Reference>
								<Reference ReferenceType="HasSubtype" IsForward="false">ns=2;s=<xsl:value-of select="@type"/> Data Type</Reference>
							</References>
							<Definition>
								<xsl:attribute name="Name"><xsl:value-of select="@name"/></xsl:attribute>
							</Definition>
						</UADataType>
						<UAObject>
							<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@name"/>.Binary</xsl:attribute>
							<xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/>.Binary</xsl:attribute>
							<xsl:element name="DisplayName"><xsl:value-of select="@name"/>.Binary</xsl:element>
							<xsl:element name="Description">Binary Data Type Encoding></xsl:element>
							<References>
								<Reference ReferenceType="HasTypeDefinition">i=76</Reference>
								<Reference ReferenceType="HasChild">ns=2;s=<xsl:value-of select="@name"/>.Schema</Reference>
								<Reference ReferenceType="HasDescription" IsForward="false">ns=2;s=<xsl:value-of select="@name"/>.Schema</Reference>
							</References>
						</UAObject>
						<UAVariable>
							<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@name"/>.Schema</xsl:attribute>
							<xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/>.Schema</xsl:attribute>
							<xsl:element name="DisplayName"><xsl:value-of select="@name"/>.Schema</xsl:element>
							<xsl:element name="Description">Data Type Description></xsl:element>
							<References>
								<Reference ReferenceType="HasTypeDefinition">i=69</Reference>
								<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=IEC 62541 Data Type Dictionary</Reference>
							</References>
						</UAVariable>
					</xsl:for-each>
				</xsl:for-each>
<!--
Create object types and data types for CDCs as well as contained DAs and SDOs
--> 
				<xsl:for-each select="my:DOType">
					<!-- Create object type for CDC -->
					<UAObjectType>
						<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@cdc"/></xsl:attribute>
						<xsl:attribute name="BrowseName">2:<xsl:value-of select="@cdc"/></xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@cdc"/> CDC</xsl:element>
						<xsl:element name="Description"> Common Data Class Object Type</xsl:element>
						<References>
							<Reference ReferenceType="HasSubtype" IsForward="false">ns=2;s=Composed CDC</Reference>
						</References>
					</UAObjectType>
					<!-- Create object type for DOType -->
					<UAObjectType>
						<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@id"/></xsl:attribute>
						<xsl:attribute name="BrowseName">2:<xsl:value-of select="@id"/></xsl:attribute>
						<xsl:element name="DisplayName"> <xsl:value-of select="@id"/> DOType</xsl:element>
						<xsl:element name="Description"><xsl:value-of select="@desc"/> DOType Object Type</xsl:element>
						<References>
							<!-- Add references to CDC object type -->
							<Reference ReferenceType="HasSubtype" IsForward="false">ns=2;s=<xsl:value-of select="@cdc"/></Reference>
							<!-- 
              <xsl:for-each select="my:SDO">
								<Reference ReferenceType="HasComponent">ns=2;s=<xsl:value-of select="@name"/></Reference>
							</xsl:for-each>
							<xsl:for-each select="my:DA">
								<Reference ReferenceType="HasComponent">ns=2;s=<xsl:value-of select="@name"/></Reference>
							</xsl:for-each>
              -->
						</References>
					</UAObjectType>
					<xsl:for-each select="my:DA">
						<!-- Create variable type and instances for DAs -->
						<UAVariableType>
							<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@name"/></xsl:attribute>
							<xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/></xsl:attribute>
							<xsl:element name="DisplayName"><xsl:value-of select="@name"/>  DA</xsl:element>
						<References>
							<Reference ReferenceType="HasSubtype" IsForward="false">ns=2;s=Base DA Variable Type</Reference>
						</References>
						</UAVariableType>
            <UAVariable>
              <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@name"/>Instance</xsl:attribute>
              <xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/>Instance</xsl:attribute>
              <xsl:element name="DisplayName"><xsl:value-of select="@name"/>  DA Instance</xsl:element>
              <References>
                <Reference ReferenceType="HasTypeDefinition" IsForward="true">ns=2;s=<xsl:value-of select="@name"/></Reference>
                <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="../@id"/></Reference>
              </References>
            </UAVariable>
					</xsl:for-each>
					<xsl:for-each select="my:SDO">
						<!-- Create variable type and instances for SDOs -->
						<UAVariableType>
							<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@name"/></xsl:attribute>
							<xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/></xsl:attribute>
							<xsl:element name="DisplayName"><xsl:value-of select="@name"/>  DA</xsl:element>
						<References>
							<Reference ReferenceType="HasSubtype" IsForward="false">ns=2;s=Base DA Variable Type</Reference>
						</References>
						</UAVariableType>
            <UAVariable>
              <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@name"/>Instance</xsl:attribute>
              <xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/>Instance</xsl:attribute>
              <xsl:element name="DisplayName"><xsl:value-of select="@name"/>  DA Instance</xsl:element>
              <References>
                <Reference ReferenceType="HasTypeDefinition" IsForward="true">ns=2;s=<xsl:value-of select="@name"/></Reference>
                <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="../@id"/></Reference>
              </References>
            </UAVariable>
					</xsl:for-each>
					<!-- Create data types for CDCs --> 
					<UADataType>
						<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@cdc"/> Data Type</xsl:attribute>
						<xsl:attribute name="BrowseName">2:<xsl:value-of select="@cdc"/> Data Type</xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@cdc"/> CDC Data Type</xsl:element>
						<xsl:element name="Description"><xsl:value-of select="@desc"/> CDC Data Type</xsl:element>
						<References>
							<Reference ReferenceType="HasChild">ns=2;s=<xsl:value-of select="@cdc"/>.Binary</Reference>
							<Reference ReferenceType="HasEncoding">ns=2;s=<xsl:value-of select="@cdc"/>.Binary</Reference>
							<Reference ReferenceType="HasSubtype" IsForward="false">ns=2;s=Composed CDC Data Type</Reference>
						</References>
						<Definition>
							<xsl:attribute name="Name"><xsl:value-of select="@cdc"/></xsl:attribute>
							<xsl:for-each select="my:DO">
								<Field>
									<xsl:attribute name="Name"><xsl:value-of select="@name"/></xsl:attribute>
									<xsl:attribute name="DataType">ns=2;s=<xsl:value-of select="@type"/></xsl:attribute>
								</Field>
							</xsl:for-each>
						</Definition>
					</UADataType>
					<UAObject>
						<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@cdc"/>.Binary</xsl:attribute>
						<xsl:attribute name="BrowseName">2:<xsl:value-of select="@cdc"/>.Binary</xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@cdc"/>.Binary</xsl:element>
						<xsl:element name="Description">Binary Data Type Encoding></xsl:element>
						<References>
							<Reference ReferenceType="HasTypeDefinition">i=76</Reference>
							<Reference ReferenceType="HasChild">ns=2;s=<xsl:value-of select="@cdc"/>.Schema</Reference>
							<Reference ReferenceType="HasDescription" IsForward="false">ns=2;s=<xsl:value-of select="@cdc"/>.Schema</Reference>
						</References>
					</UAObject>
					<UAVariable>
						<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@cdc"/>.Schema</xsl:attribute>
						<xsl:attribute name="BrowseName">2:<xsl:value-of select="@cdc"/>.Schema</xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@cdc"/>.Schema</xsl:element>
						<xsl:element name="Description">Data Type Description></xsl:element>
						<References>
							<Reference ReferenceType="HasTypeDefinition">i=69</Reference>
							<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=IEC 62541 Data Type Dictionary</Reference>
						</References>
					</UAVariable>				
					<!-- Create data types for DOTypes -->
					<UADataType>
						<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@id"/> Data Type</xsl:attribute>
						<xsl:attribute name="BrowseName">2:<xsl:value-of select="@id"/> Data Type</xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@id"/> DOType Data Type</xsl:element>
						<xsl:element name="Description"><xsl:value-of select="@desc"/> DOType Data Type</xsl:element><References>
							<Reference ReferenceType="HasChild">ns=2;s=<xsl:value-of select="@id"/>.Binary</Reference>
							<Reference ReferenceType="HasEncoding">ns=2;s=<xsl:value-of select="@id"/>.Binary</Reference>
							<!-- Add references to CDC data type -->
							<Reference ReferenceType="HasSubtype" IsForward="false">ns=2;s=<xsl:value-of select="@cdc"/> Data Type</Reference>
						</References>
						<Definition>
							<xsl:attribute name="Name">2:<xsl:value-of select="@id"/></xsl:attribute>
							<xsl:for-each select="my:SDO">
								<Field>
									<xsl:attribute name="Name"><xsl:value-of select="@name"/></xsl:attribute>
									<xsl:attribute name="DataType">ns=2;s=<xsl:value-of select="@type"/></xsl:attribute>
								</Field>
							</xsl:for-each>
							<xsl:for-each select="my:DA">
								<Field>
									<xsl:attribute name="Name"><xsl:value-of select="@name"/></xsl:attribute>
									<xsl:call-template name="BaseTypes"/>
								</Field>
							</xsl:for-each>
						</Definition>
					</UADataType>	
					<xsl:for-each select="my:DA">
						<!-- Create data types for contained DAs -->
						<UADataType>
							<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@name"/> Data Type</xsl:attribute>
							<xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/> Data Type</xsl:attribute>
							<xsl:element name="DisplayName"><xsl:value-of select="@name"/> Data Type</xsl:element>
							<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
							<References>
								<Reference ReferenceType="HasSubtype" IsForward="false">ns=2;s=Base DA Data Type</Reference>
							</References>
							<Definition>
								<xsl:attribute name="Name"><xsl:value-of select="@id"/></xsl:attribute>
								<xsl:attribute name="BaseType"><xsl:value-of select="@cdc"/></xsl:attribute>
								<xsl:for-each select="my:BDA">
									<Field>
										<xsl:attribute name="Name"><xsl:value-of select="@name"/></xsl:attribute>
										<xsl:call-template name="BaseTypes"/>
									</Field>
								</xsl:for-each>
							</Definition>
						</UADataType>								
						<UAObject>
							<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@id"/>.Binary</xsl:attribute>
							<xsl:attribute name="BrowseName">2:<xsl:value-of select="@id"/>.Binary</xsl:attribute>
							<xsl:element name="DisplayName"><xsl:value-of select="@id"/>.Binary</xsl:element>
							<xsl:element name="Description">Binary Data Type Encoding></xsl:element>
							<References>
								<Reference ReferenceType="HasTypeDefinition">i=76</Reference>
								<Reference ReferenceType="HasChild">ns=2;s=<xsl:value-of select="@id"/>.Schema</Reference>
								<Reference ReferenceType="HasDescription" IsForward="false">ns=2;s=<xsl:value-of select="@id"/>.Schema</Reference>
							</References>
						</UAObject>
						<UAVariable>
							<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@id"/>.Schema</xsl:attribute>
							<xsl:attribute name="BrowseName">2:<xsl:value-of select="@id"/>.Schema</xsl:attribute>
							<xsl:element name="DisplayName"><xsl:value-of select="@id"/>.Schema</xsl:element>
							<xsl:element name="Description">Data Type Description></xsl:element>
							<References>
								<Reference ReferenceType="HasTypeDefinition">i=69</Reference>
								<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=IEC 62541 Data Type Dictionary</Reference>
							</References>
						</UAVariable>
					</xsl:for-each>		
				</xsl:for-each>
<!--
Create data types for standalone DAs
--> 
				<xsl:for-each select="my:DAType">
					<UADataType>
						<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@id"/> Data Type</xsl:attribute>
						<xsl:attribute name="BrowseName">2:<xsl:value-of select="@id"/> Data Type</xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@id"/> Data Type</xsl:element>
						<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
						<References>
							<Reference ReferenceType="HasSubtype" IsForward="false">ns=2;s=Base DA Data Type</Reference>
						</References>
						<Definition>
							<xsl:attribute name="Name"><xsl:value-of select="@id"/></xsl:attribute>
							<xsl:attribute name="BaseType"><xsl:value-of select="@cdc"/></xsl:attribute>
							<xsl:for-each select="my:BDA">
								<Field>
									<xsl:attribute name="Name"><xsl:value-of select="@name"/></xsl:attribute>
									<xsl:call-template name="BaseTypes"/>
								</Field>
							</xsl:for-each>
						</Definition>
					</UADataType>
					<UAObject>
						<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@id"/>.Binary</xsl:attribute>
						<xsl:attribute name="BrowseName">2:<xsl:value-of select="@id"/>.Binary</xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@id"/>.Binary</xsl:element>
						<xsl:element name="Description">Binary Data Type Encoding></xsl:element>
						<References>
							<Reference ReferenceType="HasTypeDefinition">i=76</Reference>
							<Reference ReferenceType="HasChild">ns=2;s=<xsl:value-of select="@id"/>.Schema</Reference>
							<Reference ReferenceType="HasDescription" IsForward="false">ns=2;s=<xsl:value-of select="@id"/>.Schema</Reference>
						</References>
					</UAObject>
					<UAVariable>
						<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@id"/>.Schema</xsl:attribute>
						<xsl:attribute name="BrowseName">2:<xsl:value-of select="@id"/>.Schema</xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@id"/>.Schema</xsl:element>
						<xsl:element name="Description">Data Type Description></xsl:element>
						<References>
							<Reference ReferenceType="HasTypeDefinition">i=69</Reference>
							<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=IEC 62541 Data Type Dictionary</Reference>
						</References>
					</UAVariable>
				</xsl:for-each>
				<xsl:for-each select="my:EnumType">
					<UADataType>
						<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@id"/> Data Type</xsl:attribute>
						<xsl:attribute name="BrowseName"><xsl:value-of select="@id"/> Data Type</xsl:attribute>
						<DisplayName><xsl:value-of select="@id"/> Data Type</DisplayName>
						<Description>
							<xsl:value-of select="@id"/> Data Type</Description>
						<References>
							<Reference ReferenceType="HasProperty">ns=2;s=<xsl:value-of select="@id"/>Enum</Reference>
							<Reference ReferenceType="HasSubtype" IsForward="false">i=29</Reference>
						</References>
					</UADataType>
					<UAVariable>
						<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@id"/>Enum</xsl:attribute>
						<xsl:attribute name="BrowseName"><xsl:value-of select="@id"/>Enum</xsl:attribute>
						<xsl:attribute name="ParentNodeId">ns=2;s=<xsl:value-of select="@id"/> Data Type</xsl:attribute>
						<xsl:attribute name="DataType">i=7594</xsl:attribute>
						<xsl:attribute name="ValueRank">1</xsl:attribute>
						<DisplayName>
							<xsl:value-of select="@id"/>Enum</DisplayName>
						<References>
							<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
							<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="@id"/>Enum</Reference>
						</References>
						<Value>
							<ListOfExtensionObject xmlns="http://opcfoundation.org/UA/2008/02/Types.xsd">
								<xsl:for-each select="my:EnumVal">
									<ExtensionObject>
										<TypeId>
											<Identifier>i=7616</Identifier>
										</TypeId>
										<Body>
											<EnumValueType>
												<Value>
													<xsl:value-of select="@ord"/>
												</Value>
												<DisplayName>
													<Locale/>
													<Text>
														<xsl:value-of select="."/>
													</Text>
												</DisplayName>
												<Description>
													<Locale/>
													<Text>
														<xsl:value-of select="."/>
													</Text>
												</Description>
											</EnumValueType>
										</Body>
									</ExtensionObject>
								</xsl:for-each>
							</ListOfExtensionObject>
						</Value>
					</UAVariable>
				</xsl:for-each>
			</xsl:for-each>
		</UANodeSet>
	</xsl:template>
<!--
Sub template for Basetypes
--> 
	<xsl:template name="BaseTypes">
		<xsl:if test="@bType= &apos;BOOLEAN&apos;">
			<xsl:attribute name="DataType">i=1</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;INT8&apos;">
			<xsl:attribute name="DataType">i=2</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;INT16&apos;">
			<xsl:attribute name="DataType">i=4</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;INT24&apos;">
			<xsl:attribute name="DataType">i=6</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;INT32&apos;">
			<xsl:attribute name="DataType">i=6</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;INT128&apos;">
			<xsl:attribute name="DataType">i=8</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;INT8U&apos;">
			<xsl:attribute name="DataType">i=3</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;INT16U&apos;">
			<xsl:attribute name="DataType">i=5</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;INT24U&apos;">
			<xsl:attribute name="DataType">i=7</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;INT32U&apos;">
			<xsl:attribute name="DataType">i=7</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;FLOAT32&apos;">
			<xsl:attribute name="DataType">i=10</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;FLOAT64&apos;">
			<xsl:attribute name="DataType">i=11</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;Enum&apos;">
			<xsl:attribute name="DataType">i=6</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;Dppos&apos;">
			<xsl:attribute name="DataType">i=11</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;Tcmd&apos;">
			<xsl:attribute name="DataType">i=13</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;Quality&apos;">
			<xsl:attribute name="DataType">Quality</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;Timestamp&apos;">
			<xsl:attribute name="DataType">i=13</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;VisString32&apos;">
			<xsl:attribute name="DataType">String</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;VisString64&apos;">
			<xsl:attribute name="DataType">String</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;VisString255&apos;">
			<xsl:attribute name="DataType">String</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;Octet64&apos;">
			<xsl:attribute name="DataType">i=11</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;Struct&apos;">
			<xsl:attribute name="DataType">ns=2;s=<xsl:value-of select="@type"/></xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;EntryTime&apos;">
			<xsl:attribute name="DataType">i=13</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;Unicode255&apos;">
			<xsl:attribute name="DataType">String</xsl:attribute>
		</xsl:if>
	</xsl:template>
<!--
Sub template for Basetypes
--> 
	<xsl:template name="FCDA">
			<xsl:for-each-group select="my:FCDA" group-by="@doName">
				<xsl:element name="UAObject" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
					<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></xsl:attribute>
					<xsl:attribute name="BrowseName">2:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></xsl:attribute>
					<xsl:attribute name="DataType">i=12</xsl:attribute>
					<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></xsl:element>
					<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
					<References>
						<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/><xsl:value-of select="@fc"/></Reference>
                        <Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=DOs</Reference>
					</References>
				</xsl:element>
				<xsl:element name="UAVariable" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
					<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.q</xsl:attribute>
					<xsl:attribute name="BrowseName">2:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.q</xsl:attribute>
					<xsl:attribute name="DataType">i=12</xsl:attribute>
					<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.q</xsl:element>
					<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
					<References>
					<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
					<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
					<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=DAs</Reference>
					<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="@fc"/></Reference>
					</References>
					<Value>
						<String/>
					</Value>
					</xsl:element>
					<xsl:element name="UAVariable" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
						<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.t</xsl:attribute>
						<xsl:attribute name="BrowseName">2:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.t</xsl:attribute>
						<xsl:attribute name="DataType">i=12</xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.t</xsl:element>
						<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
						<References>
							<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
							<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
							<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=DAs</Reference>
                            <Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="@fc"/></Reference>
						</References>
						<Value>
							<String/>
						</Value>
					</xsl:element>
				<xsl:for-each select="current-group()">
					<xsl:if test="not(@daName=&apos;q&apos; or @daName=&apos;t&apos;)">
						<xsl:choose>
						<!--DOs with CDC WYE-->						
						<xsl:when test="@doName=&apos;A&apos;
									or @doName=&apos;ALoc&apos;
									or @doName=&apos;DifAClc&apos;
									or @doName=&apos;HATm&apos;
									or @doName=&apos;HCfA&apos;
									or @doName=&apos;HKf&apos;
									or @doName=&apos;HRmsA&apos;
									or @doName=&apos;HRmsPhV&apos;
									or @doName=&apos;HTdf&apos;
									or @doName=&apos;HTif&apos;
									or @doName=&apos;HTsW&apos;
									or @doName=&apos;HTuW&apos;
									or @doName=&apos;ImbA&apos;
									or @doName=&apos;ImbV&apos;
									or @doName=&apos;PF&apos;
									or @doName=&apos;PhPdmWav&apos;
									or @doName=&apos;PhPlt&apos;
									or @doName=&apos;PhPst&apos;
									or @doName=&apos;PhV&apos;
									or @doName=&apos;PNV&apos;
									or @doName=&apos;RstA&apos;
									or @doName=&apos;TddA&apos;
									or @doName=&apos;TddEvnA&apos;
									or @doName=&apos;TddOddA&apos;
									or @doName=&apos;ThdA&apos;
									or @doName=&apos;ThdEvnA&apos;
									or @doName=&apos;ThdEvnPhV&apos;
									or @doName=&apos;ThdOddA&apos;
									or @doName=&apos;ThdOddPhV&apos;
									or @doName=&apos;ThdPhV&apos;
									or @doName=&apos;VA&apos;
									or @doName=&apos;VAr&apos;
									or @doName=&apos;W&apos;
									or @doName=&apos;Z&apos;">
								<xsl:call-template name="CMV"><xsl:with-param name="sdo">.phsA</xsl:with-param></xsl:call-template>
								<xsl:call-template name="CMV"><xsl:with-param name="sdo">.phsB</xsl:with-param></xsl:call-template>							
								<xsl:call-template name="CMV"><xsl:with-param name="sdo">.phsC</xsl:with-param></xsl:call-template>
								<xsl:call-template name="CMV"><xsl:with-param name="sdo">.neut</xsl:with-param></xsl:call-template>							
								<xsl:call-template name="CMV"><xsl:with-param name="sdo">.net</xsl:with-param></xsl:call-template>
								<xsl:call-template name="CMV"><xsl:with-param name="sdo">.res</xsl:with-param></xsl:call-template>
							</xsl:when>
							<!--DOs with CDC CMV-->
							<xsl:when test="@doName=&apos;VolResoPt&apos;
									or @doName=&apos;NeutVol&apos;
									or @doName=&apos;Imp&apos;
									or @doName=&apos;FltZ&apos;
									or @doName=&apos;ColAEFN&apos;">
								<xsl:call-template name="CMV"><xsl:with-param name="sdo"></xsl:with-param></xsl:call-template>
							</xsl:when>	
						<!--DOs with CDC DEL-->
							<xsl:when test="@doName=&apos;PPPst&apos;
								or @doName=&apos;PPPlt&apos;
								or @doName=&apos;PPPiMax&apos;
								or @doName=&apos;PhPiMax&apos;
								or @doName=&apos;PPPiLoFil&apos;
								or @doName=&apos;PhPiLoFil&apos;
								or @doName=&apos;PPPiRootA&apos;
								or @doName=&apos;PhPiRoot&apos;
								or @doName=&apos;HRmsPPV&apos;
								or @doName=&apos;ThdPPV&apos;
								or @doName=&apos;ThdOddPPV&apos;
								or @doName=&apos;ThdEvnPPV&apos;
								or @doName=&apos;HCfPPV&apos;
								or @doName=&apos;PPV&apos;">
									<xsl:call-template name="CMV"><xsl:with-param name="sdo">.phsAB</xsl:with-param></xsl:call-template>
									<xsl:call-template name="CMV"><xsl:with-param name="sdo">.phsBC</xsl:with-param></xsl:call-template>							
									<xsl:call-template name="CMV"><xsl:with-param name="sdo">.phsCA</xsl:with-param></xsl:call-template>
							</xsl:when>
							<!--DOs & DAs with generic CDC MV-->
							<xsl:when test="@daName=&apos;MX&apos;">
							<xsl:element name="UAObject" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
								<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								<xsl:attribute name="BrowseName">2:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:element>
								<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
								<References>
									<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>						
								</References>
							</xsl:element>
							<xsl:element name="UAObject" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
								<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</xsl:attribute>
								<xsl:attribute name="BrowseName">2:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
								<References>
									<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="@daName"/></Reference>
								</References>
							</xsl:element>
							<xsl:element name="UAVariable" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
								<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.i</xsl:attribute>
								<xsl:attribute name="BrowseName">2:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.i</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@daName"/>.<xsl:value-of select="@daName"/>.mag.i</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=MX</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>
								<xsl:element name="UAVariable" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
								<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.f</xsl:attribute>
								<xsl:attribute name="BrowseName">2:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.f</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.f</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=MX</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>
							</xsl:when>
							<!--All DAs not related to Measured Values-->
							<xsl:when test="@daName!=&apos;MX&apos;">
								<xsl:element name="UAVariable" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
									<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
									<xsl:attribute name="BrowseName">2:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
									<xsl:attribute name="DataType">i=12</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=MX</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>	
							</xsl:when>
						</xsl:choose>
					</xsl:if> 
				</xsl:for-each>
			</xsl:for-each-group>
	</xsl:template>
	<xsl:template name="CMV">
		<xsl:param name="sdo" />
		<xsl:if test="$sdo!=&apos;&apos;">
				<xsl:element name="UAObject" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
					<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/></xsl:attribute>
					<xsl:attribute name="BrowseName">2:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/></xsl:attribute>
					<xsl:attribute name="DataType">i=12</xsl:attribute>
					<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/></xsl:element>
					<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
					<References>
					<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
					</References>
				</xsl:element>
			</xsl:if>
			<xsl:element name="UAObject" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
				<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal</xsl:attribute>
				<xsl:attribute name="BrowseName">2:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal</xsl:attribute>
				<xsl:attribute name="DataType">i=12</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal</xsl:element>
				<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
				<References>
				<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/></Reference>
				</References>
			</xsl:element>
			<xsl:element name="UAObject" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
				<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag</xsl:attribute>
				<xsl:attribute name="BrowseName">2:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag</xsl:attribute>
				<xsl:attribute name="DataType">i=12</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag</xsl:element>
				<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
				<References>
				<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal</Reference>
				</References>
			</xsl:element>
		<xsl:element name="UAVariable" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
			<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag.i</xsl:attribute>
			<xsl:attribute name="BrowseName">2:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag.i</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag.i</xsl:element>
			<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
			<References>
			<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
			<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag</Reference>
			<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=DAs</Reference>
			<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="@fc"/></Reference>
			</References>
			<Value>
			<String/>
			</Value>
		</xsl:element>
		<xsl:element name="UAVariable" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
			<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag.f</xsl:attribute>
			<xsl:attribute name="BrowseName">2:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag.f</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag.f</xsl:element>
			<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
			<References>
			<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
			<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag</Reference>
			<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=DAs</Reference>
			</References>
			<Value>
			<String/>
			</Value>
		</xsl:element>
	</xsl:template>
	<!--Report control template-->
	<xsl:template name="ReportControl">
			<xsl:element name="UAObject" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
				<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></xsl:attribute>
				<xsl:attribute name="BrowseName">2:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></xsl:element>
				<xsl:element  name="Description"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@desc"/>$RP$<xsl:value-of select="@name"/></xsl:element>
				<xsl:element name="References">
					<xsl:element name="Reference">
						<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/></Reference>
						<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=Report Controls</Reference>
						<Reference ReferenceType="HasTypeDefinition">ns=2;s=ReportControl</Reference>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="UAVariable" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
				<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.datSet</xsl:attribute>
				<xsl:attribute name="BrowseName">2:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.datSet</xsl:attribute>
				<xsl:element  name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.datSet</xsl:element>
				<xsl:element  name="Description">datSet shall be derived from the respective attribute in the BRCB</xsl:element>
				<xsl:element name="References">
					<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
					<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></Reference>
				</xsl:element>
				<xsl:element name="Value">
					<xsl:element name="String">
						<xsl:value-of select="@datSet"/>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="UAVariable" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
				<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.rptID</xsl:attribute>
				<xsl:attribute name="BrowseName">2:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.rptID</xsl:attribute>
				<xsl:attribute name="DataType">i=12</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.rptID</xsl:element>
				<xsl:element name="Description">Report ID</xsl:element>
				<xsl:element name="References">
					<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
					<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></Reference>
				</xsl:element>
				<xsl:element name="Value">
					<xsl:element name="String">
						<xsl:value-of select="@rptID"/>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="UAVariable" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
				<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.confRev</xsl:attribute>
				<xsl:attribute name="BrowseName">2:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.confRev</xsl:attribute>
				<xsl:attribute name="DataType">i=12</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.confRev</xsl:element>
				<xsl:element name="References">
					<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
					<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></Reference>
				</xsl:element>
				<xsl:element name="Value">
					<xsl:element name="String">
						<xsl:value-of select="@confRev"/>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="UAVariable" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
				<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.buffered</xsl:attribute>
				<xsl:attribute name="BrowseName">2:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.buffered</xsl:attribute>
				<xsl:attribute name="DataType">i=12</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.buffered</xsl:element>
				<xsl:element name="Description">Buffered (if TRUE Report is Buffered)</xsl:element>
				<xsl:element name="References">
					<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
					<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></Reference>
				</xsl:element>
				<xsl:element name="Value">
					<xsl:element name="String">
						<xsl:value-of select="@buffered"/>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="UAVariable" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
				<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.GI</xsl:attribute>
				<xsl:attribute name="BrowseName">2:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.GI</xsl:attribute>
				<xsl:attribute name="DataType">i=12</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.GI</xsl:element>
				<xsl:element name="Description">General Interrogation (if TRUE TrgOp General Interrogation then the report is issued)</xsl:element>
				<xsl:element name="References">
					<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
					<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></Reference>
				</xsl:element>
				<xsl:element name="Value">
					<xsl:element name="String">False</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="UAObject" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
				<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps</xsl:attribute>
				<xsl:attribute name="BrowseName">2:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps</xsl:attribute>
				<DisplayName><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps</DisplayName>
				<Description>Controls Logical Device Report Control Block Trigger Options</Description>
				<xsl:element name="References">
					<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></Reference>
					<Reference ReferenceType="Organizes" IsForward="false">ns=2;s=Report Controls Trg Ops</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=2;s=ReportControlTrgOps</Reference>
				</xsl:element>
			</xsl:element>
			<xsl:element name="UAVariable" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
				<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.dchg</xsl:attribute>
				<xsl:attribute name="BrowseName">2:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.dchg</xsl:attribute>
				<xsl:attribute name="DataType">i=12</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.dchg</xsl:element>
				<xsl:element name="Description">data-change</xsl:element>
				<xsl:element name="References">
					<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
					<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps</Reference>
				</xsl:element>
				<xsl:element name="Value">
					<xsl:element name="String">
						<xsl:value-of select="@dchg"/>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="UAVariable" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
				<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.qchg</xsl:attribute>
				<xsl:attribute name="BrowseName">2:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.qchg</xsl:attribute>
				<xsl:attribute name="DataType">i=12</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.qchg</xsl:element>
				<xsl:element name="Description">quality-change</xsl:element>
				<xsl:element name="References">
					<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
					<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps</Reference>
				</xsl:element>
				<xsl:element name="Value">
					<xsl:element name="String">
						<xsl:value-of select="@qchg"/>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="UAVariable" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
				<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.qchg</xsl:attribute>
				<xsl:attribute name="BrowseName">2:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.dudp</xsl:attribute>
				<xsl:attribute name="DataType">i=12</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.dudp</xsl:element>
				<xsl:element name="Description">data-update</xsl:element>
				<xsl:element name="References">
					<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
					<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps</Reference>
				</xsl:element>
				<xsl:element name="Value">
					<xsl:element name="String">
						<xsl:value-of select="@dudp"/>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="UAVariable" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
				<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.period</xsl:attribute>
				<xsl:attribute name="BrowseName">2:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.period</xsl:attribute>
				<xsl:attribute name="DataType">i=12</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.period</xsl:element>
				<xsl:element name="Description">integrity</xsl:element>
				<xsl:element name="References">
					<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
					<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps</Reference>
				</xsl:element>
				<xsl:element name="Value">
					<xsl:element name="String">
						<xsl:value-of select="@period"/>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="UAObject" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
				<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</xsl:attribute>
				<xsl:attribute name="BrowseName">2:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</xsl:attribute>
				<DisplayName><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$.OptFields</DisplayName>
				<Description>Controls Logical Device Report Control Block Trigger Options</Description>
				<xsl:element name="References">
					<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>
					</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=2;s=ReportControlOptFields</Reference>
				</xsl:element>
			</xsl:element>
			<xsl:element name="UAVariable" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
				<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.seqNum</xsl:attribute>
				<xsl:attribute name="BrowseName">2:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.seqNum</xsl:attribute>
				<xsl:attribute name="DataType">i=12</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.seqNum</xsl:element>
				<xsl:element name="Description">sequence-number (if TRUE SqNum shall be included in the report)</xsl:element>
				<xsl:element name="References" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
					<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
					<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
				</xsl:element>
				<xsl:element name="Value">
					<xsl:element name="String">
						<xsl:value-of select="@seqNum"/>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="UAVariable" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
				<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.timeStamp</xsl:attribute>
				<xsl:attribute name="BrowseName">2:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.timeStamp</xsl:attribute>
				<xsl:attribute name="DataType">String</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.timeStamp</xsl:element>
				<xsl:element name="References">
					<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
					<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
				</xsl:element>
				<xsl:element name="Value">
					<xsl:element name="Value">
						<xsl:value-of select="@timeStamp"/>report-time-stamp (if TRUE TimeOfEntry shall be included in the report);
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="UAVariable" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
				<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.dataSet</xsl:attribute>
				<xsl:attribute name="BrowseName">2:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.dataSet</xsl:attribute>
				<xsl:attribute name="DataType">i=12</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.dataSet</xsl:element>
				<xsl:element name="Description"/>
				<xsl:element name="References">
					<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
					<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
				</xsl:element>
				<xsl:element name="Value">
					<xsl:element name="Value">
						<xsl:value-of select="@dataSet"/>data-set-name (if TRUE DatSet shall be included in the report)
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="UAVariable" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
				<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.ReasonCode</xsl:attribute>
				<xsl:attribute name="BrowseName">2:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.ReasonCode</xsl:attribute>
				<xsl:attribute name="DataType">i=12</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.ReasonCode</xsl:element>
				<xsl:element name="Description"/>
				<xsl:element name="References" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
					<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
					<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
				</xsl:element>
				<xsl:element name="Value">
					<xsl:element name="String">
						<xsl:value-of select="@reasonCode"/>reason-for-inclusion (if TRUE ReasonCode shall be included in the report)
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="UAVariable" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
				<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.DataRef</xsl:attribute>
				<xsl:attribute name="BrowseName">2:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.DataRef</xsl:attribute>
				<xsl:attribute name="DataType">i=12</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.DataRef</xsl:element>
				<xsl:element name="Description">data-reference (if TRUE DataRef or DataAttributeReference shall be included in the report)</xsl:element>
				<xsl:element name="References">
					<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
					<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
				</xsl:element>
				<xsl:element name="Value">
					<xsl:element name="String">
						<xsl:value-of select="@dataRef"/>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="UAVariable" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
				<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.bufOvfl</xsl:attribute>
				<xsl:attribute name="BrowseName">2:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.bufOvfl</xsl:attribute>
				<xsl:attribute name="DataType">i=12</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.bufOvfl</xsl:element>
				<xsl:element name="Description">buffer-overflow (if TRUE shall indicate that a buffer overflow has occurred)</xsl:element>
				<xsl:element name="References">
					<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
					<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
				</xsl:element>
				<xsl:element name="Value">
					<xsl:element name="String">
						<xsl:value-of select="@dataRef"/>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="UAVariable" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
				<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.EntryID</xsl:attribute>
				<xsl:attribute name="BrowseName">2:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.EntryID</xsl:attribute>
				<xsl:attribute name="DataType">i=12</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.EntryID</xsl:element>
				<xsl:element name="Description">entryID (if TRUE EntryID shall be included in the report)</xsl:element>
				<xsl:element name="References">
					<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
					<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
				</xsl:element>
				<xsl:element name="Value">
					<xsl:element name="String">
						<xsl:value-of select="@entryID"/>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="UAVariable" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
				<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.ConfigRef</xsl:attribute>
				<xsl:attribute name="BrowseName">2:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.ConfigRef</xsl:attribute>
				<xsl:attribute name="DataType">i=12</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.ConfigRef</xsl:element>
				<xsl:element name="Description">config-reference (if TRUE ConfRef shall be included in the report)</xsl:element>
				<xsl:element name="References">
					<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
					<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
				</xsl:element>
				<xsl:element name="Value">
					<xsl:element name="String">
						<xsl:value-of select="@ConfigRef"/>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="UAVariable" namespace="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
				<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.segmentation</xsl:attribute>
				<xsl:attribute name="BrowseName">2:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.segmentation</xsl:attribute>
				<xsl:attribute name="DataType">i=12</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.segmentation</xsl:element>
				<xsl:element name="Description">segmentation (if TRUE segmentation shall be included in the report)</xsl:element>
				<xsl:element name="References">
					<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
					<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
				</xsl:element>
				<xsl:element name="Value">
					<xsl:element name="String">
						<xsl:value-of select="@segmentation"/>
					</xsl:element>
				</xsl:element>
			</xsl:element>
	</xsl:template>
</xsl:stylesheet>
