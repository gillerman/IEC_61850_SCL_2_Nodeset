<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:my="http://www.iec.ch/61850/2003/SCL" version="2.0" exclude-result-prefixes="my">
	<xsl:output method="xml" version="1.0" omit-xml-declaration="yes" indent="yes"/>
	<!--
Title:CID to UANodeset Stylesheet
Copyright ©  OPC Foundation, Inc., 2013. Released 2013-02-18 16:37

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
				<xsl:attribute name="NodeId">ns=1;s=IED</xsl:attribute>
				<xsl:attribute name="BrowseName">1:IED</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 IED Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 IED Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=1;s=AccessPoint</xsl:attribute>
				<xsl:attribute name="BrowseName">1:AccessPoint</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 AccessPoint Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 AccessPoint Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=1;s=IEC 61850 Server</xsl:attribute>
				<xsl:attribute name="BrowseName">1:IEC 61850 Server</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 Server Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 Server Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=1;s=LogicalDevice</xsl:attribute>
				<xsl:attribute name="BrowseName">1:LogicalDevice</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 LogicalDevice Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 LogicalDevice Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=1;s=LogicalNode</xsl:attribute>
				<xsl:attribute name="BrowseName">1:LogicalNode</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 LogicalNode Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 LogicalNode Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=1;s=ReportControl</xsl:attribute>
				<xsl:attribute name="BrowseName">1:ReportControl</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 ReportControl Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 ReportControl Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=1;s=ReportControlOptFields</xsl:attribute>
				<xsl:attribute name="BrowseName">1:ReportControlOptFields</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 ReportControlOptFields Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 ReportControlOptFields Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=1;s=ReportControlTrgOps</xsl:attribute>
				<xsl:attribute name="BrowseName">1:ReportControlTrgOps</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 ReportControlTrgOps Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 ReportControlTrgOps Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=1;s=FunctionalConstraint</xsl:attribute>
				<xsl:attribute name="BrowseName">1:FunctionalConstraint</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 FunctionalConstraint Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 FunctionalConstraint Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=1;s=DataSet</xsl:attribute>
				<xsl:attribute name="BrowseName">1:DataSet</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 DataSet Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 DataSet Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=1;s=Substation</xsl:attribute>
				<xsl:attribute name="BrowseName">1:Substation</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 Substation Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 Substation Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=1;s=VoltageLevel</xsl:attribute>
				<xsl:attribute name="BrowseName">1:VoltageLevel</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 VoltageLevel Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 VoltageLevel Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=1;s=PowerTransformer</xsl:attribute>
				<xsl:attribute name="BrowseName">1:PowerTransformer</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 PowerTransformer Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 PowerTransformer Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=1;s=TransformerWinding</xsl:attribute>
				<xsl:attribute name="BrowseName">1:TransformerWinding</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 TransformerWinding Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 TransformerWinding Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=1;s=Bay</xsl:attribute>
				<xsl:attribute name="BrowseName">1:Bay</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 Bay Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 Bay Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=1;s=ConductingEquipment</xsl:attribute>
				<xsl:attribute name="BrowseName">1:ConductingEquipment</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 ConductingEquipment Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 ConductingEquipment Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>			
<!--
CREATE Object Types for CDC super types
-->		
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=1;s=Base CDC</xsl:attribute>
				<xsl:attribute name="BrowseName">1:Base CDC</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 Base Common Data Class Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 Base Common Data Class Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=1;s=Composed CDC</xsl:attribute>
				<xsl:attribute name="BrowseName">1:Composed CDC</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 Composed Common Data Class Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 Composed Common Data Class Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=Base CDC</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=1;s=Primitive CDC</xsl:attribute>
				<xsl:attribute name="BrowseName">1:Primitive CDC</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 Primitive Common Data Class Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 Primitive Common Data Class Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=Base CDC</Reference>
				</References>
			</UAObjectType>
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=1;s=Substitution CDC</xsl:attribute>
				<xsl:attribute name="BrowseName">1:Substitution CDC</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 Substitution Common Data Class Object Type</xsl:element>
				<xsl:element name="Description">IEC 61850 Substitution Common Data Class Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=Primitive CDC</Reference>
				</References>
			</UAObjectType>			
<!--
CREATE Data Types for LNode and CDC super types
-->	
<!--
			<UADataType>
				<xsl:attribute name="NodeId">ns=1;s=Base LNode Data Type</xsl:attribute>
				<xsl:attribute name="BrowseName">1:Base LNode Data Type</xsl:attribute>
				<DisplayName>IEC 61850 LNode Data Type</DisplayName>
				<Description>IEC 61850 LNode Data Type</Description>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=22</Reference>
				</References>
			</UADataType>
-->
			<UADataType>
				<xsl:attribute name="NodeId">ns=1;s=Base CDC Data Type</xsl:attribute>
				<xsl:attribute name="BrowseName">1:Base CDC Data Type</xsl:attribute>
				<DisplayName>IEC 61850 Base Common Data Class Data Type</DisplayName>
				<Description>IEC 61850 Base Common Data Class Data Type</Description>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=22</Reference>
				</References>
			</UADataType>
			<UADataType>
				<xsl:attribute name="NodeId">ns=1;s=Composed CDC Data Type</xsl:attribute>
				<xsl:attribute name="BrowseName">1:Composed CDC Data Type</xsl:attribute>
				<DisplayName>IEC 61850 Composed Common Data Class Data Type</DisplayName>
				<Description>IEC 61850 Composed Common Data Class Data Type</Description>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=Base CDC Data Type</Reference>
				</References>
			</UADataType>
			<UADataType>
				<xsl:attribute name="NodeId">ns=1;s=Primitive CDC Data Type</xsl:attribute>
				<xsl:attribute name="BrowseName">1:Primitive CDC Data Type</xsl:attribute>
				<DisplayName>IEC 61850 Primitive Common Data Class Data Type</DisplayName>
				<Description>IEC 61850 Primitive Common Data Class Data Type</Description>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=Base CDC Data Type</Reference>
				</References>
			</UADataType>
			<UADataType>
				<xsl:attribute name="NodeId">ns=1;s=Substitution CDC Data Type</xsl:attribute>
				<xsl:attribute name="BrowseName">1:Substitution CDC Data Type</xsl:attribute>
				<DisplayName>IEC 61850 Substitution Common Data Class Data Type</DisplayName>
				<Description>IEC 61850 Substitution Common Data Class Data Type</Description>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=Primitive CDC Data Type</Reference>
				</References>
			</UADataType>
<!--
CREATE Data Types and Variable type for DA super type
-->								
			<UADataType>
				<xsl:attribute name="NodeId">ns=1;s=Base DA Data Type</xsl:attribute>
				<xsl:attribute name="BrowseName">1:Base DA Data Type</xsl:attribute>
				<DisplayName>IEC 61850 Base Data Attribute Data Type</DisplayName>
				<Description>IEC 61850 Base Data Attribute Data Type</Description>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=22</Reference>
				</References>
			</UADataType>
			<UAVariableType>
				<xsl:attribute name="NodeId">ns=1;s=Base DA Variable Type</xsl:attribute>
				<xsl:attribute name="BrowseName">1:Base DA Variable Type</xsl:attribute>
				<DisplayName>IEC 61850 Base DA Variable Type</DisplayName>
				<Description>IEC 61850 Base DA Variable Type</Description>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">i=62</Reference>
				</References>
			</UAVariableType>
<!--
CREATE Object Folders
-->			
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=IEDs</xsl:attribute>
				<xsl:attribute name="BrowseName">1:IEDs</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 IEDs</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
					<Reference ReferenceType="HasTypeDefinition">i=61</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=Access Points</xsl:attribute>
				<xsl:attribute name="BrowseName">1:Access Points</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 Access Points</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
					<Reference ReferenceType="HasTypeDefinition">i=61</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=IEC 61850 Servers</xsl:attribute>
				<xsl:attribute name="BrowseName">1:IEC 61850 Servers</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 Servers</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
					<Reference ReferenceType="HasTypeDefinition">i=61</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=Logical Devices</xsl:attribute>
				<xsl:attribute name="BrowseName">1:Logical Devices</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 Logical Devices</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
					<Reference ReferenceType="HasTypeDefinition">i=61</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=Logical Nodes</xsl:attribute>
				<xsl:attribute name="BrowseName">1:Logical Nodes</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 Logical Nodes</xsl:element>
				<xsl:element name="Description">IEC 61850 Logical Nodes</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
					<Reference ReferenceType="HasTypeDefinition">i=61</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=Data Sets</xsl:attribute>
				<xsl:attribute name="BrowseName">1:Data Sets</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 Data Sets</xsl:element>
				<xsl:element name="Description">IEC 61850 Data Sets</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
					<Reference ReferenceType="HasTypeDefinition">i=61</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=Report Controls</xsl:attribute>
				<xsl:attribute name="BrowseName">1:Report Controls</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 Report Controls</xsl:element>
				<xsl:element name="Description">IEC 61850 Report Controls</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
					<Reference ReferenceType="HasTypeDefinition">i=61</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=Functional Constraints</xsl:attribute>
				<xsl:attribute name="BrowseName">1:Functional Constraints</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 Functional Constraints</xsl:element>
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
				<xsl:attribute name="NodeId">ns=1;s=DOs</xsl:attribute>
				<xsl:attribute name="BrowseName">1:DOs</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 Data Objects</xsl:element>
				<xsl:element name="Description">IEC 61850 Data Objects</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
					<Reference ReferenceType="HasTypeDefinition">i=61</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=DAs</xsl:attribute>
				<xsl:attribute name="BrowseName">1:DAs</xsl:attribute>
				<xsl:element name="DisplayName">IEC 61850 Data Attributes</xsl:element>
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
				<xsl:attribute name="NodeId">ns=1;s=ST Functional Constraint</xsl:attribute>
				<xsl:attribute name="BrowseName">1:ST Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">ST Functional Constraint</xsl:element>
				<xsl:element name="Description">ST Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=MX Functional Constraint</xsl:attribute>
				<xsl:attribute name="BrowseName">1:MX Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">MX Functional Constraint</xsl:element>
				<xsl:element name="Description">MX Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=CO Functional Constraint</xsl:attribute>
				<xsl:attribute name="BrowseName">1:CO Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">CO Functional Constraint</xsl:element>
				<xsl:element name="Description">CO Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=SP Functional Constraint</xsl:attribute>
				<xsl:attribute name="BrowseName">1:SP Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">SP Functional Constraint</xsl:element>
				<xsl:element name="Description">SP Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=SV Functional Constraint</xsl:attribute>
				<xsl:attribute name="BrowseName">1:SV Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">SV Functional Constraint</xsl:element>
				<xsl:element name="Description">SV Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=CF Functional Constraint</xsl:attribute>
				<xsl:attribute name="BrowseName">1:CF Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">CF Functional Constraint</xsl:element>
				<xsl:element name="Description">CF Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=DC Functional Constraint</xsl:attribute>
				<xsl:attribute name="BrowseName">1:DC Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">DC Functional Constraint</xsl:element>
				<xsl:element name="Description">DC Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=SG Functional Constraint</xsl:attribute>
				<xsl:attribute name="BrowseName">1:SG Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">SG Functional Constraint</xsl:element>
				<xsl:element name="Description">SG Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=SE Functional Constraint</xsl:attribute>
				<xsl:attribute name="BrowseName">1:SE Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">SE Functional Constraint</xsl:element>
				<xsl:element name="Description">SE Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=EX Functional Constraint</xsl:attribute>
				<xsl:attribute name="BrowseName">1:EX Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">EX Functional Constraint</xsl:element>
				<xsl:element name="Description">EX Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>						
<!--
CREATE Data Dictionary Variable
-->
			<UAVariable>
				<xsl:attribute name="NodeId">ns=1;s=IEC 62541 Data Type Dictionary</xsl:attribute>
				<xsl:attribute name="BrowseName">1:IEC 62541 Data Type Dictionary</xsl:attribute>
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
				<UAObject NodeId="ns=1;s=IED System" BrowseName="1:IED System">
					<xsl:attribute name="NodeId">ns=1;s=IED System</xsl:attribute>
					<xsl:attribute name="BrowseName">1:IED System</xsl:attribute>
					<xsl:element name="DisplayName">IED System</xsl:element>
					<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
					<References>
						<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=IEDs</Reference>
						<Reference ReferenceType="HasTypeDefinition">ns=1;s=IED</Reference>
					</References>
				</UAObject>
				<xsl:for-each select="//my:AccessPoint">
					<UAObject NodeId="ns=1;s=AP1" BrowseName="1:AP1">
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/></xsl:attribute>
						<xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/></xsl:attribute>
						<xsl:element name="DisplayName">
							<xsl:value-of select="@name"/>
						</xsl:element>
						<xsl:element name="Description">
							<xsl:value-of select="@desc"/>
						</xsl:element>
						<References>
							<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=IED System</Reference>
							<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Access Points</Reference>
							<Reference ReferenceType="HasTypeDefinition">ns=1;s=AccessPoint</Reference>
						</References>
					</UAObject>
					<UAVariable>
						<xsl:attribute name="NodeId">ns=1;s=AccessPoint/router</xsl:attribute>
						<xsl:attribute name="BrowseName">1:AccessPoint/router</xsl:attribute>
						<xsl:attribute name="DataType">i=12</xsl:attribute>
						<xsl:element name="DisplayName">AccessPoint/router</xsl:element>
						<Description/>
						<References>
							<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
							<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@name"/>
							</Reference>
						</References>
						<Value>
							<uax:String>
								<xsl:value-of select="@router"/>
							</uax:String>
						</Value>
					</UAVariable>
					<UAVariable>
						<xsl:attribute name="NodeId">ns=1;s=AccessPoint/clock</xsl:attribute>
						<xsl:attribute name="BrowseName">1:AccessPoint/clock</xsl:attribute>
						<xsl:attribute name="DataType">i=12</xsl:attribute>
						<xsl:element name="DisplayName">AccessPoint/clock</xsl:element>
						<Description/>
						<References>
							<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
							<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@name"/>
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
						<UAObject NodeId="ns=1;s=Server1" BrowseName="1:Server1">
							<DisplayName>Server1</DisplayName>
							<Description>IEC61850 Compliant data model</Description>
							<References>
								<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../@name"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=IEC 61850 Servers</Reference>
								<Reference ReferenceType="HasTypeDefinition">ns=1;s=IEC 61850 Server</Reference>
							</References>
						</UAObject>
						<UAVariable>
							<xsl:attribute name="NodeId">ns=1;s=Server/timeout</xsl:attribute>
							<xsl:attribute name="BrowseName">1:Server/timeout</xsl:attribute>
							<xsl:attribute name="DataType">i=12</xsl:attribute>
							<xsl:element name="DisplayName">Server/timeout</xsl:element>
							<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=Server1</Reference>
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
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@inst"/></xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="@inst"/></xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="@inst"/></xsl:element>
								<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
								<References>
									<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=Server1</Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Logical Devices</Reference>
									<Reference ReferenceType="HasTypeDefinition">ns=1;s=LogicalDevice</Reference>
								</References>
							</UAObject>
<!--
Parse LN0 Instances for instance tree 
-->
							<xsl:for-each select="my:LN0">
								<UAObject>
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../@inst"/>/<xsl:value-of select="@lnClass"/><xsl:value-of select="@inst"/></xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="../@inst"/>/<xsl:value-of select="@lnClass"/><xsl:value-of select="@inst"/></xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="../@inst"/>/<xsl:value-of select="@lnClass"/><xsl:value-of select="@inst"/></xsl:element>
									<xsl:element name="Description">
										<xsl:value-of select="@desc"/>
									</xsl:element>
									<References>
										<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../@inst"/></Reference>
										<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Logical Nodes</Reference>
										<Reference ReferenceType="HasTypeDefinition">ns=1;s=LogicalNode</Reference>
									</References>
								</UAObject>
<!--
Parse DataSet Instances for instance tree 
-->
								<xsl:for-each select="my:DataSet">
									<UAObject>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/><xsl:value-of select="@name"/></xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/><xsl:value-of select="@name"/></xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/><xsl:value-of select="@name"/></xsl:element>
										<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
										<References>
											<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/></Reference>
											<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Data Sets</Reference>
											<Reference ReferenceType="HasTypeDefinition">ns=1;s=DataSet</Reference>
										</References>
									</UAObject>
									<xsl:for-each select="my:FCDA">
												<UAVariable>
													<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
													<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
													<xsl:attribute name="DataType">i=12</xsl:attribute>
													<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:element>
													<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
													<References>
														<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
														<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/><xsl:value-of select="@fc"/></Reference>
													</References>
													<Value>
														<uax:String/>
													</Value>
												</UAVariable>
									</xsl:for-each>
								</xsl:for-each>
<!--
Parse Report Control Instances for instance tree 
-->
								<xsl:for-each select="my:ReportControl">
									<UAObject>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></xsl:element>
										<xsl:element name="Description"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@desc"/>$RP$<xsl:value-of select="@name"/></xsl:element>
										<References>
											<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/></Reference>
											<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Report Controls</Reference>
											<Reference ReferenceType="HasTypeDefinition">ns=1;s=ReportControl</Reference>
										</References>
									</UAObject>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.datSet</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.datSet</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.datSet</xsl:element>
										<xsl:element name="Description">datSet shall be derived from the respective attribute in the BRCB</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@datSet"/>
											</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.rptID</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.rptID</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.rptID</xsl:element>
										<xsl:element name="Description">Report ID</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@rptID"/>
											</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.confRev</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.confRev</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.confRev</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@confRev"/>
											</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.buffered</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.buffered</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.buffered</xsl:element>
										<xsl:element name="Description">Buffered (if TRUE Report is Buffered)</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@buffered"/>
											</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.GI</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.GI</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.GI</xsl:element>
										<xsl:element name="Description">General Interrogation (if TRUE TrgOp General Interrogation then the report is issued)</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></Reference>
										</References>
										<Value>
											<uax:String>False</uax:String>
										</Value>
									</UAVariable>
									<UAObject>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps</xsl:attribute>
										<DisplayName><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps</DisplayName>
										<Description>Controls Logical Device Report Control Block Trigger Options</Description>
										<References>
											<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></Reference>
											<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Report Controls Trg Ops</Reference>
											<Reference ReferenceType="HasTypeDefinition">ns=1;s=ReportControlTrgOps</Reference>
										</References>
									</UAObject>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.dchg</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.dchg</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.dchg</xsl:element>
										<xsl:element name="Description">data-change</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps</Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@dchg"/>
											</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.qchg</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.qchg</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.qchg</xsl:element>
										<xsl:element name="Description">quality-change</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps</Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@qchg"/>
											</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.qchg</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.dudp</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.dudp</xsl:element>
										<xsl:element name="Description">data-update</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps</Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@dudp"/>
											</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.period</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.period</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.period</xsl:element>
										<xsl:element name="Description">integrity</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps</Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@period"/>
											</uax:String>
										</Value>
									</UAVariable>
									<UAObject>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</xsl:attribute>
										<DisplayName><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$.OptFields</DisplayName>
										<Description>Controls Logical Device Report Control Block Trigger Options</Description>
										<References>
											<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>
											</Reference>
											<Reference ReferenceType="HasTypeDefinition">ns=1;s=ReportControlOptFields</Reference>
										</References>
									</UAObject>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.seqNum</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.seqNum</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.seqNum</xsl:element>
										<xsl:element name="Description">sequence-number (if TRUE SqNum shall be included in the report)</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@seqNum"/>
											</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.timeStamp</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.timeStamp</xsl:attribute>
										<xsl:attribute name="DataType">String</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.timeStamp</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@timeStamp"/>report-time-stamp (if TRUE TimeOfEntry shall be included in the report);</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.dataSet</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.dataSet</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.dataSet</xsl:element>
										<xsl:element name="Description"/>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@dataSet"/>data-set-name (if TRUE DatSet shall be included in the report)</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.ReasonCode</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.ReasonCode</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.ReasonCode</xsl:element>
										<xsl:element name="Description"/>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@reasonCode"/>reason-for-inclusion (if TRUE ReasonCode shall be included in the report)</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.DataRef</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.DataRef</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.DataRef</xsl:element>
										<xsl:element name="Description">data-reference (if TRUE DataRef or DataAttributeReference shall be included in the report)</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@dataRef"/>
											</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.bufOvfl</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.bufOvfl</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.bufOvfl</xsl:element>
										<xsl:element name="Description">buffer-overflow (if TRUE shall indicate that a buffer overflow has occurred)</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@dataRef"/>
											</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.EntryID</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.EntryID</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.EntryID</xsl:element>
										<xsl:element name="Description">entryID (if TRUE EntryID shall be included in the report)</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@entryID"/>
											</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.ConfigRef</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.ConfigRef</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.ConfigRef</xsl:element>
										<xsl:element name="Description">config-reference (if TRUE ConfRef shall be included in the report)</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@ConfigRef"/>
											</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.segmentation</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.segmentation</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.segmentation</xsl:element>
										<xsl:element name="Description">segmentation (if TRUE segmentation shall be included in the report)</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/>
												<xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@segmentation"/>
											</uax:String>
										</Value>
									</UAVariable>
								</xsl:for-each>
							</xsl:for-each>
<!--
Parse LN Instances for instance tree 
-->
							<xsl:for-each select="my:LN">
								<UAObject>
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../@inst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@inst"/></xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="../@inst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@inst"/></xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="../@inst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@inst"/></xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
										<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../@inst"/></Reference>
										<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Logical Nodes</Reference>
										<Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="@lnType"/></Reference>
									</References>
								</UAObject>

								<xsl:for-each select="my:DataSet">
									<UAObject>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@prefix"/><xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/><xsl:value-of select="@name"/></xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@prefix"/><xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/><xsl:value-of select="@name"/></xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@prefix"/><xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/><xsl:value-of select="@name"/></xsl:element>
										<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
										<References>
											<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@prefix"/><xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/></Reference>
											<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Data Sets</Reference>
											<Reference ReferenceType="HasTypeDefinition">ns=1;s=DataSet</Reference>
										</References>
									</UAObject>
									<xsl:for-each select="my:FCDA">
										<UAVariable>
											<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
											<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
											<xsl:attribute name="DataType">i=12</xsl:attribute>
											<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:element>
											<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
											<References>
												<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
												<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/><xsl:value-of select="@fc"/></Reference>
											</References>
                      <Value>
                        <uax:String/>
                      </Value>
										</UAVariable>
									</xsl:for-each>
								</xsl:for-each>
<!--
Parse Report Control Instances for instance tree 
-->
								<xsl:for-each select="my:ReportControl">
									<UAObject>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></xsl:element>
										<xsl:element name="Description"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@desc"/>$RP$<xsl:value-of select="@name"/></xsl:element>
										<References>
											<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/></Reference>
											<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Report Controls</Reference>
											<Reference ReferenceType="HasTypeDefinition">ns=1;s=ReportControl</Reference>
										</References>
									</UAObject>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.datSet</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.datSet</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.datSet</xsl:element>
										<xsl:element name="Description">datSet shall be derived from the respective attribute in the BRCB</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@datSet"/>
											</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.rptID</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.rptID</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.rptID</xsl:element>
										<xsl:element name="Description">Report ID</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@rptID"/>
											</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.confRev</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.confRev</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.confRev</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@confRev"/>
											</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.buffered</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.buffered</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.buffered</xsl:element>
										<xsl:element name="Description">Buffered (if TRUE Report is Buffered)</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@buffered"/>
											</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.GI</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.GI</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.GI</xsl:element>
										<xsl:element name="Description">General Interrogation (if TRUE TrgOp General Interrogation then the report is issued)</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></Reference>
										</References>
										<Value>
											<uax:String>False</uax:String>
										</Value>
									</UAVariable>
									<UAObject>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps</xsl:attribute>
										<DisplayName><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps</DisplayName>
										<Description>Controls Logical Device Report Control Block Trigger Options</Description>
										<References>
											<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></Reference>
											<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Report Controls Trg Ops</Reference>
											<Reference ReferenceType="HasTypeDefinition">ns=1;s=ReportControlTrgOps</Reference>
										</References>
									</UAObject>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.dchg</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.dchg</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.dchg</xsl:element>
										<xsl:element name="Description">data-change</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps</Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@dchg"/>
											</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.qchg</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.qchg</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.qchg</xsl:element>
										<xsl:element name="Description">quality-change</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps</Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@qchg"/>
											</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.qchg</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.dudp</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.dudp</xsl:element>
										<xsl:element name="Description">data-update</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps</Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@dudp"/>
											</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.period</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.period</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps.period</xsl:element>
										<xsl:element name="Description">integrity</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.TrgOps</Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@period"/>
											</uax:String>
										</Value>
									</UAVariable>
									<UAObject>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</xsl:attribute>
										<DisplayName><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$.OptFields</DisplayName>
										<Description>Controls Logical Device Report Control Block Trigger Options</Description>
										<References>
											<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>
											</Reference>
											<Reference ReferenceType="HasTypeDefinition">ns=1;s=ReportControlOptFields</Reference>
										</References>
									</UAObject>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.seqNum</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.seqNum</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.seqNum</xsl:element>
										<xsl:element name="Description">sequence-number (if TRUE SqNum shall be included in the report)</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@seqNum"/>
											</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.timeStamp</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.timeStamp</xsl:attribute>
										<xsl:attribute name="DataType">String</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.timeStamp</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@timeStamp"/>report-time-stamp (if TRUE TimeOfEntry shall be included in the report);</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.dataSet</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.dataSet</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.dataSet</xsl:element>
										<xsl:element name="Description"/>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@dataSet"/>data-set-name (if TRUE DatSet shall be included in the report)</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.ReasonCode</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.ReasonCode</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.ReasonCode</xsl:element>
										<xsl:element name="Description"/>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@reasonCode"/>reason-for-inclusion (if TRUE ReasonCode shall be included in the report)</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.DataRef</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.DataRef</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.DataRef</xsl:element>
										<xsl:element name="Description">data-reference (if TRUE DataRef or DataAttributeReference shall be included in the report)</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@dataRef"/>
											</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.bufOvfl</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.bufOvfl</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.bufOvfl</xsl:element>
										<xsl:element name="Description">buffer-overflow (if TRUE shall indicate that a buffer overflow has occurred)</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@dataRef"/>
											</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.EntryID</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.EntryID</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.EntryID</xsl:element>
										<xsl:element name="Description">entryID (if TRUE EntryID shall be included in the report)</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@entryID"/>
											</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.ConfigRef</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.ConfigRef</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.ConfigRef</xsl:element>
										<xsl:element name="Description">config-reference (if TRUE ConfRef shall be included in the report)</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@ConfigRef"/>
											</uax:String>
										</Value>
									</UAVariable>
									<UAVariable>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.segmentation</xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.segmentation</xsl:attribute>
										<xsl:attribute name="DataType">i=12</xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields.segmentation</xsl:element>
										<xsl:element name="Description">segmentation (if TRUE segmentation shall be included in the report)</xsl:element>
										<References>
											<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
											<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/>
												<xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
										</References>
										<Value>
											<uax:String>
												<xsl:value-of select="@segmentation"/>
											</uax:String>
										</Value>
									</UAVariable>
								</xsl:for-each>								
								
								<!--
Parse DO Instances for instance tree
-->
								<xsl:for-each select="my:DOI">
									<UAObject>
										<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@prefix"/><xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>.<xsl:value-of select="@name"/></xsl:attribute>
										<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@prefix"/><xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>.<xsl:value-of select="@name"/></xsl:attribute>
										<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@prefix"/><xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>.<xsl:value-of select="@name"/>
										</xsl:element><xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
										<References>
											<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@prefix"/><xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/></Reference>
											<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DOs</Reference>
											<Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="@name"/></Reference>
										</References>
									</UAObject>
<!--
Parse DA Instances for instance tree
-->
									<xsl:for-each select="my:DAI">
										<UAVariable>
											<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../../@inst"/>/<xsl:value-of select="../../@prefix"/><xsl:value-of select="../../@lnClass"/><xsl:value-of select="../../@inst"/>.<xsl:value-of select="../@name"/>.<xsl:value-of select="@name"/></xsl:attribute>
											<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../../@inst"/>/<xsl:value-of select="../../@prefix"/><xsl:value-of select="../../@lnClass"/><xsl:value-of select="../../@inst"/>.<xsl:value-of select="../@name"/>.<xsl:value-of select="@name"/></xsl:attribute>
											<xsl:attribute name="DataType">i=12</xsl:attribute>
											<xsl:element name="DisplayName"><xsl:value-of select="../../../@inst"/>/<xsl:value-of select="../../@prefix"/><xsl:value-of select="../../@lnClass"/><xsl:value-of select="../../@inst"/>.<xsl:value-of select="../@name"/>.<xsl:value-of select="@name"/></xsl:element>
											<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
											<References>
												<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../../../@inst"/>/<xsl:value-of select="../../@prefix"/><xsl:value-of select="../../@lnClass"/><xsl:value-of select="../../@inst"/>.<xsl:value-of select="../@name"/></Reference>
												<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
												<Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="@name"/></Reference>
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
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@lnClass"/></xsl:attribute>
						<xsl:attribute name="BrowseName">1:<xsl:value-of select="@lnClass"/></xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@lnClass"/> lnClass</xsl:element>
						<xsl:element name="Description"> lnClass</xsl:element>
						<References>
							<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=LogicalNode</Reference>
							<xsl:for-each select="my:DO">
								<!-- Add references to DO object type --> 
								<Reference ReferenceType="HasComponent">ns=1;s=<xsl:value-of select="@type"/></Reference>
							</xsl:for-each>
						</References>
					</UAObjectType>
					<!-- Create object types for LNodeTypes --> 
					<UAObjectType>
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/></xsl:attribute>
						<xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/></xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@id"/> LNodeType</xsl:element>
						<xsl:element name="Description"><xsl:value-of select="@desc"/> LNodeType</xsl:element>
						<References>
							<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=<xsl:value-of select="@lnClass"/></Reference>
							<xsl:for-each select="my:DO">
								<!-- Add references to DO data type -->
								<Reference ReferenceType="HasComponent">ns=1;s=<xsl:value-of select="@type"/></Reference>
							</xsl:for-each>
						</References>
					</UAObjectType>
					<!-- Create data types for LNodeTypes -->
					<!--
					<UADataType>
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/> Data Type</xsl:attribute>
						<xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/> Data Type</xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@id"/> LNodeType Data Type</xsl:element>
						<xsl:element name="Description"><xsl:value-of select="@desc"/> LNodeType Data Type</xsl:element>
						<References>
							<Reference ReferenceType="HasChild">ns=1;s=<xsl:value-of select="@id"/>.Binary</Reference>
							<Reference ReferenceType="HasEncoding">ns=1;s=<xsl:value-of select="@id"/>.Binary</Reference>
							<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=Base LNode Data Type</Reference>
						</References>
						<Definition>
							<xsl:attribute name="Name"><xsl:value-of select="@id"/></xsl:attribute>
							<xsl:for-each select="my:DO">
								<Field>
									<xsl:attribute name="Name"><xsl:value-of select="@name"/></xsl:attribute>
									<xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@type"/></xsl:attribute>
								</Field>
							</xsl:for-each>
						</Definition>
					</UADataType>
					<UAObject>
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>.Binary</xsl:attribute>
						<xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/>.Binary</xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@id"/>.Binary</xsl:element>
						<xsl:element name="Description">Binary Data Type Encoding></xsl:element>
						<References>
							<Reference ReferenceType="HasTypeDefinition">i=76</Reference>
							<Reference ReferenceType="HasChild">ns=1;s=<xsl:value-of select="@id"/>.Schema</Reference>
							<Reference ReferenceType="HasDescription" IsForward="false">ns=1;s=<xsl:value-of select="@id"/>.Schema</Reference>
						</References>
					</UAObject>
					<UAVariable>
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>.Schema</xsl:attribute>
						<xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/>.Schema</xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@id"/>.Schema</xsl:element>
						<xsl:element name="Description">Data Type Description></xsl:element>
						<References>
							<Reference ReferenceType="HasTypeDefinition">i=69</Reference>
							<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=IEC 62541 Data Type Dictionary</Reference>
						</References>
					</UAVariable>
					-->
					<!-- Create object type for the DOs and subtype them from their DOType object types --> 
					<xsl:for-each select="my:DO">
						<UAObjectType>
							<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/></xsl:attribute>
							<xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/></xsl:attribute>
							<xsl:element name="DisplayName"><xsl:value-of select="@name"/> DO</xsl:element>
							<xsl:element name="Description">Data Object</xsl:element>
							<References>
								<!-- Add references to DO object type -->
								<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=<xsl:value-of select="@type"/></Reference>
							</References>
						</UAObjectType>
						<!-- Create data types for DOs and subtype them from their DOType data types--> 
						<UADataType>
							<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/> Data Type</xsl:attribute>
							<xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/> Data Type</xsl:attribute>
							<xsl:element name="DisplayName"><xsl:value-of select="@name"/> DO Data Type</xsl:element>
							<xsl:element name="Description">Data Object Data Type</xsl:element>
							<References>
								<Reference ReferenceType="HasChild">ns=1;s=<xsl:value-of select="@name"/>.Binary</Reference>
								<Reference ReferenceType="HasEncoding">ns=1;s=<xsl:value-of select="@name"/>.Binary</Reference>
								<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=<xsl:value-of select="@type"/> Data Type</Reference>
							</References>
							<Definition>
								<xsl:attribute name="Name"><xsl:value-of select="@name"/></xsl:attribute>
							</Definition>
						</UADataType>
						<UAObject>
							<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>.Binary</xsl:attribute>
							<xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/>.Binary</xsl:attribute>
							<xsl:element name="DisplayName"><xsl:value-of select="@name"/>.Binary</xsl:element>
							<xsl:element name="Description">Binary Data Type Encoding></xsl:element>
							<References>
								<Reference ReferenceType="HasTypeDefinition">i=76</Reference>
								<Reference ReferenceType="HasChild">ns=1;s=<xsl:value-of select="@name"/>.Schema</Reference>
								<Reference ReferenceType="HasDescription" IsForward="false">ns=1;s=<xsl:value-of select="@name"/>.Schema</Reference>
							</References>
						</UAObject>
						<UAVariable>
							<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>.Schema</xsl:attribute>
							<xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/>.Schema</xsl:attribute>
							<xsl:element name="DisplayName"><xsl:value-of select="@name"/>.Schema</xsl:element>
							<xsl:element name="Description">Data Type Description></xsl:element>
							<References>
								<Reference ReferenceType="HasTypeDefinition">i=69</Reference>
								<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=IEC 62541 Data Type Dictionary</Reference>
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
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@cdc"/></xsl:attribute>
						<xsl:attribute name="BrowseName">1:<xsl:value-of select="@cdc"/></xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@cdc"/> CDC</xsl:element>
						<xsl:element name="Description"> Common Data Class Object Type</xsl:element>
						<References>
							<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=Composed CDC</Reference>
						</References>
					</UAObjectType>
					<!-- Create object type for DOType -->
					<UAObjectType>
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/></xsl:attribute>
						<xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/></xsl:attribute>
						<xsl:element name="DisplayName"> <xsl:value-of select="@id"/> DOType</xsl:element>
						<xsl:element name="Description"><xsl:value-of select="@desc"/> DOType Object Type</xsl:element>
						<References>
							<!-- Add references to CDC object type -->
							<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=<xsl:value-of select="@cdc"/></Reference>
							<xsl:for-each select="my:SDO">
								<Reference ReferenceType="HasComponent">ns=1;s=<xsl:value-of select="@name"/></Reference>
							</xsl:for-each>
							<xsl:for-each select="my:DA">
								<Reference ReferenceType="HasComponent">ns=1;s=<xsl:value-of select="@name"/></Reference>
							</xsl:for-each>
						</References>
					</UAObjectType>
					<xsl:for-each select="my:DA">
						<!-- Create variable type for DAs -->
						<UAVariableType>
							<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/></xsl:attribute>
							<xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/></xsl:attribute>
							<xsl:element name="DisplayName"><xsl:value-of select="@name"/>  DA</xsl:element>
						<References>
							<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=Base DA Variable Type</Reference>
						</References>
						</UAVariableType>
					</xsl:for-each>
					<xsl:for-each select="my:SDO">
						<!-- Create variable type for SDO -->
						<UAVariableType>
							<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/></xsl:attribute>
							<xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/></xsl:attribute>
							<xsl:element name="DisplayName"><xsl:value-of select="@name"/>  DA</xsl:element>
						<References>
							<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=Base DA Variable Type</Reference>
						</References>
						</UAVariableType>
					</xsl:for-each>
					<!-- Create data types for CDCs --> 
					<UADataType>
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@cdc"/> Data Type</xsl:attribute>
						<xsl:attribute name="BrowseName">1:<xsl:value-of select="@cdc"/> Data Type</xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@cdc"/> CDC Data Type</xsl:element>
						<xsl:element name="Description"><xsl:value-of select="@desc"/> CDC Data Type</xsl:element>
						<References>
							<Reference ReferenceType="HasChild">ns=1;s=<xsl:value-of select="@cdc"/>.Binary</Reference>
							<Reference ReferenceType="HasEncoding">ns=1;s=<xsl:value-of select="@cdc"/>.Binary</Reference>
							<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=Composed CDC Data Type</Reference>
						</References>
						<Definition>
							<xsl:attribute name="Name"><xsl:value-of select="@cdc"/></xsl:attribute>
							<xsl:for-each select="my:DO">
								<Field>
									<xsl:attribute name="Name"><xsl:value-of select="@name"/></xsl:attribute>
									<xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@type"/></xsl:attribute>
								</Field>
							</xsl:for-each>
						</Definition>
					</UADataType>
					<UAObject>
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@cdc"/>.Binary</xsl:attribute>
						<xsl:attribute name="BrowseName">1:<xsl:value-of select="@cdc"/>.Binary</xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@cdc"/>.Binary</xsl:element>
						<xsl:element name="Description">Binary Data Type Encoding></xsl:element>
						<References>
							<Reference ReferenceType="HasTypeDefinition">i=76</Reference>
							<Reference ReferenceType="HasChild">ns=1;s=<xsl:value-of select="@cdc"/>.Schema</Reference>
							<Reference ReferenceType="HasDescription" IsForward="false">ns=1;s=<xsl:value-of select="@cdc"/>.Schema</Reference>
						</References>
					</UAObject>
					<UAVariable>
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@cdc"/>.Schema</xsl:attribute>
						<xsl:attribute name="BrowseName">1:<xsl:value-of select="@cdc"/>.Schema</xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@cdc"/>.Schema</xsl:element>
						<xsl:element name="Description">Data Type Description></xsl:element>
						<References>
							<Reference ReferenceType="HasTypeDefinition">i=69</Reference>
							<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=IEC 62541 Data Type Dictionary</Reference>
						</References>
					</UAVariable>				
					<!-- Create data types for DOTypes -->
					<UADataType>
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/> Data Type</xsl:attribute>
						<xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/> Data Type</xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@id"/> DOType Data Type</xsl:element>
						<xsl:element name="Description"><xsl:value-of select="@desc"/> DOType Data Type</xsl:element><References>
							<Reference ReferenceType="HasChild">ns=1;s=<xsl:value-of select="@id"/>.Binary</Reference>
							<Reference ReferenceType="HasEncoding">ns=1;s=<xsl:value-of select="@id"/>.Binary</Reference>
							<!-- Add references to CDC data type -->
							<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=<xsl:value-of select="@cdc"/> Data Type</Reference>
						</References>
						<Definition>
							<xsl:attribute name="Name">1:<xsl:value-of select="@id"/></xsl:attribute>
							<xsl:for-each select="my:SDO">
								<Field>
									<xsl:attribute name="Name"><xsl:value-of select="@name"/></xsl:attribute>
									<xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@type"/></xsl:attribute>
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
							<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/> Data Type</xsl:attribute>
							<xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/> Data Type</xsl:attribute>
							<xsl:element name="DisplayName"><xsl:value-of select="@name"/> Data Type</xsl:element>
							<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
							<References>
								<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=Base DA Data Type</Reference>
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
							<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>.Binary</xsl:attribute>
							<xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/>.Binary</xsl:attribute>
							<xsl:element name="DisplayName"><xsl:value-of select="@id"/>.Binary</xsl:element>
							<xsl:element name="Description">Binary Data Type Encoding></xsl:element>
							<References>
								<Reference ReferenceType="HasTypeDefinition">i=76</Reference>
								<Reference ReferenceType="HasChild">ns=1;s=<xsl:value-of select="@id"/>.Schema</Reference>
								<Reference ReferenceType="HasDescription" IsForward="false">ns=1;s=<xsl:value-of select="@id"/>.Schema</Reference>
							</References>
						</UAObject>
						<UAVariable>
							<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>.Schema</xsl:attribute>
							<xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/>.Schema</xsl:attribute>
							<xsl:element name="DisplayName"><xsl:value-of select="@id"/>.Schema</xsl:element>
							<xsl:element name="Description">Data Type Description></xsl:element>
							<References>
								<Reference ReferenceType="HasTypeDefinition">i=69</Reference>
								<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=IEC 62541 Data Type Dictionary</Reference>
							</References>
						</UAVariable>
					</xsl:for-each>		
				</xsl:for-each>
<!--
Create data types for standalone DAs
--> 
				<xsl:for-each select="my:DAType">
					<UADataType>
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/> Data Type</xsl:attribute>
						<xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/> Data Type</xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@id"/> Data Type</xsl:element>
						<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
						<References>
							<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=Base DA Data Type</Reference>
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
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>.Binary</xsl:attribute>
						<xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/>.Binary</xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@id"/>.Binary</xsl:element>
						<xsl:element name="Description">Binary Data Type Encoding></xsl:element>
						<References>
							<Reference ReferenceType="HasTypeDefinition">i=76</Reference>
							<Reference ReferenceType="HasChild">ns=1;s=<xsl:value-of select="@id"/>.Schema</Reference>
							<Reference ReferenceType="HasDescription" IsForward="false">ns=1;s=<xsl:value-of select="@id"/>.Schema</Reference>
						</References>
					</UAObject>
					<UAVariable>
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>.Schema</xsl:attribute>
						<xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/>.Schema</xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@id"/>.Schema</xsl:element>
						<xsl:element name="Description">Data Type Description></xsl:element>
						<References>
							<Reference ReferenceType="HasTypeDefinition">i=69</Reference>
							<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=IEC 62541 Data Type Dictionary</Reference>
						</References>
					</UAVariable>
				</xsl:for-each>
				<xsl:for-each select="my:EnumType">
					<UADataType>
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/> Data Type</xsl:attribute>
						<xsl:attribute name="BrowseName"><xsl:value-of select="@id"/> Data Type</xsl:attribute>
						<DisplayName><xsl:value-of select="@id"/> Data Type</DisplayName>
						<Description>
							<xsl:value-of select="@id"/> Data Type</Description>
						<References>
							<Reference ReferenceType="HasProperty">ns=1;s=<xsl:value-of select="@id"/>Enum</Reference>
							<Reference ReferenceType="HasSubtype" IsForward="false">i=29</Reference>
						</References>
					</UADataType>
					<UAVariable>
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>Enum</xsl:attribute>
						<xsl:attribute name="BrowseName"><xsl:value-of select="@id"/>Enum</xsl:attribute>
						<xsl:attribute name="ParentNodeId">ns=1;s=<xsl:value-of select="@id"/> Data Type</xsl:attribute>
						<xsl:attribute name="DataType">i=7594</xsl:attribute>
						<xsl:attribute name="ValueRank">1</xsl:attribute>
						<DisplayName>
							<xsl:value-of select="@id"/>Enum</DisplayName>
						<References>
							<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
							<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@id"/>Enum</Reference>
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
Test for what?
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
			<xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@type"/></xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;EntryTime&apos;">
			<xsl:attribute name="DataType">i=13</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;Unicode255&apos;">
			<xsl:attribute name="DataType">String</xsl:attribute>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
