<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:my="http://www.iec.ch/61850/2003/SCL" version="2.0" exclude-result-prefixes="my">
	<xsl:output method="xml" version="1.0" omit-xml-declaration="yes" indent="yes"/>
	<!--
Title:CID to UANodeset Stylesheet
Copyright ©  OPC Foundation, Inc., 2013. Released 2013-02-22 10:34

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
Section 1:
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
Section 2:
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
Section 3:
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
Section 4:
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
Section 5:
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
Section 6:
CREATE Functional Constraint Objects
-->
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=ST</xsl:attribute>
				<xsl:attribute name="BrowseName">1:ST Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">ST Functional Constraint</xsl:element>
				<xsl:element name="Description">ST Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=MX</xsl:attribute>
				<xsl:attribute name="BrowseName">1:MX Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">MX Functional Constraint</xsl:element>
				<xsl:element name="Description">MX Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=CO</xsl:attribute>
				<xsl:attribute name="BrowseName">1:CO Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">CO Functional Constraint</xsl:element>
				<xsl:element name="Description">CO Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=SP</xsl:attribute>
				<xsl:attribute name="BrowseName">1:SP Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">SP Functional Constraint</xsl:element>
				<xsl:element name="Description">SP Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=SV</xsl:attribute>
				<xsl:attribute name="BrowseName">1:SV Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">SV Functional Constraint</xsl:element>
				<xsl:element name="Description">SV Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=CF</xsl:attribute>
				<xsl:attribute name="BrowseName">1:CF Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">CF Functional Constraint</xsl:element>
				<xsl:element name="Description">CF Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=DC</xsl:attribute>
				<xsl:attribute name="BrowseName">1:DC Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">DC Functional Constraint</xsl:element>
				<xsl:element name="Description">DC Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=SG</xsl:attribute>
				<xsl:attribute name="BrowseName">1:SG Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">SG Functional Constraint</xsl:element>
				<xsl:element name="Description">SG Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=SE</xsl:attribute>
				<xsl:attribute name="BrowseName">1:SE Functional Constraint</xsl:attribute>
				<xsl:element name="DisplayName">SE Functional Constraint</xsl:element>
				<xsl:element name="Description">SE Functional Constraint</xsl:element>
				<References>
					<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=EX</xsl:attribute>
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
Section 7:
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
Section 8:
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
Section 9:
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
Section 11:
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
Section 11.1:
Parse DataSet Instances for instance tree
Create Dataset instance
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
                  <!-- For each data set attach 7-3 CDC attributes to each DO -->
									<xsl:call-template name="FCDA"/>
								</xsl:for-each>

<!--
Section 11.2:
Parse DataSet Instances for instance tree
Create Dataset instance
-->
                <!-- For each data set attach 7-2 attributes to each Report Control -->
								<xsl:for-each select="my:ReportControl">
									<xsl:call-template name="ReportControl"/>
								</xsl:for-each>
							</xsl:for-each>
<!--
Section 12:
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
                
<!--
Section 12.1:
Parse Report Control Instances for instance tree 
-->
                
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
                  <!-- For each data set attach 7-3 CDC attributes to each DO -->
                  <xsl:call-template name="FCDA"/>
								</xsl:for-each>
<!--
Section 12.2:
Parse Report Control Instances for instance tree 
-->
                <!-- For each data set attach 7-2 attributes to each Report Control -->
								<xsl:for-each select="my:ReportControl">
									<xsl:call-template name="ReportControl"/>
								</xsl:for-each>								
								
<!--
Section 12.3:
Parse DO Instances for instance tree
Set default values for data object instances (instance objects)
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
Section 12.3.1:
Parse DA Instances for instance tree
Set default values for data attribute instances (instance attributes)
SDO are tied to measured values with in the data sets above.
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

<!--**********************************************************************

Parse types for OPC UA type system

**********************************************************************--> 
      
			<xsl:for-each select="//my:DataTypeTemplates">
<!--
Section 13:
For the type tree under lnClasses:
Create object types for the standard lnClasses and their subtyped device LNodeTypes:
Create object, data types, variable types, and instance variables for each contained DO
Create references from each lnClass to their contained CDC variable instance.
Create references from each LNType to thier contained DO variable instance.
However, CDC and DOType related nodes are created below.
DOs are subtypes of DOTypes and DO instance variables appear under CDCs, 
but links from DOs to DOTypes and DOTypes to CDCs are done in section 14.
--> 
				<xsl:for-each select="my:LNodeType">
					<!-- Create LNClass Object Types--> 
					<UAObjectType>
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@lnClass"/></xsl:attribute>
						<xsl:attribute name="BrowseName">1:<xsl:value-of select="@lnClass"/></xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@lnClass"/> lnClass</xsl:element>
						<xsl:element name="Description"> lnClass</xsl:element>
						<References>
							<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=LogicalNode</Reference>
							<xsl:for-each select="my:DO">
								<!-- Add references from LNClass object types to DOType variable instances (not working?)--> 
								<Reference ReferenceType="HasComponent">ns=1;s=<xsl:value-of select="@type"/>Instance</Reference>
							</xsl:for-each>
						</References>
					</UAObjectType>
					<!-- Create LNodeType Object Types --> 
					<UAObjectType>
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/></xsl:attribute>
						<xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/></xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@id"/> LNodeType</xsl:element>
						<xsl:element name="Description"><xsl:value-of select="@desc"/> LNodeType Object Type</xsl:element>
						<References>
							<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=<xsl:value-of select="@lnClass"/></Reference>
							<xsl:for-each select="my:DO">
								<!-- Add references from LNodeType object types to DO variable instance -->
                <Reference ReferenceType="HasComponent">ns=1;s=<xsl:value-of select="@name"/>Instance</Reference>
							</xsl:for-each>
						</References>
					</UAObjectType>
					<!-- Create DO object types and subtype them from their DOType object types --> 
					<xsl:for-each select="my:DO">
						<UAObjectType>
							<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/></xsl:attribute>
							<xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/></xsl:attribute>
							<xsl:element name="DisplayName"><xsl:value-of select="@name"/> DO</xsl:element>
							<xsl:element name="Description"><xsl:value-of select="@name"/> DO Object Type</xsl:element>
							<References>
								<!-- Add subtype reference from DOType object type to DO object type -->
								<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=<xsl:value-of select="@type"/></Reference>
							</References>
						</UAObjectType>
            <!-- Create DO variable type in Variable Type hierarchy-->
            <UAVariableType>
              <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>VT</xsl:attribute>
              <xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/>VT</xsl:attribute>
              <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@name"/>DT</xsl:attribute>
              <xsl:element name="DisplayName"><xsl:value-of select="@name"/> DO</xsl:element>
              <xsl:element name="Description"><xsl:value-of select="@desc"/> DO Variable Type</xsl:element>
              <References>
                <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=Base DO Variable Type</Reference>
                <!-- Subtype DO variable type from DOType variable type -->
                <Reference ReferenceType="HasSubtype" IsForward="true">ns=1;s=<xsl:value-of select="@id"/>VT</Reference>
              </References>
            </UAVariableType>
            <!-- Create DO variable instances-->
            <UAVariable>
              <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>Instance</xsl:attribute>
              <xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/>Instance</xsl:attribute>
              <xsl:element name="DisplayName"><xsl:value-of select="@name"/> DO Instance</xsl:element>
              <xsl:element name="Description"><xsl:value-of select="@name"/> DO Variable Instance</xsl:element>
              <References>
                <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="@name"/>VT</Reference>
              </References>
            </UAVariable>
						<!-- Create data types for DOs and subtype them from their DOType data types--> 
						<UADataType>
							<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>DT</xsl:attribute>
							<xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/>DT</xsl:attribute>
							<xsl:element name="DisplayName"><xsl:value-of select="@name"/> DO Data Type</xsl:element>
							<xsl:element name="Description">Data Object Data Type</xsl:element>
							<References>
								<Reference ReferenceType="HasChild">ns=1;s=<xsl:value-of select="@name"/>.Binary</Reference>
								<Reference ReferenceType="HasEncoding">ns=1;s=<xsl:value-of select="@name"/>.Binary</Reference>
								<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=<xsl:value-of select="@type"/>DT</Reference>
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
								<Reference ReferenceType="HasChild">ns=1;s=<xsl:value-of select="@name"/>.Schema0</Reference>
								<Reference ReferenceType="HasDescription" IsForward="false">ns=1;s=<xsl:value-of select="@name"/>.Schema0</Reference>
							</References>
						</UAObject>
						<UAVariable>
							<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>.Schema0</xsl:attribute>
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
Section 14:
For the type tree under CDCs:
Create object types, variable types, instance Variables, and data types for each CDC 
Create DOType Object type and subtype from CDC
Create object types, variable types, instance Variables, and data types for each contained DAs and SDOs.
Create references from each LNodeType to their contained DO.

DOs are subtype of DOType, but links to CDS are done in the section below.
Create references from each lnClass to their contained CDC variable instance.
Create references from each LNType to thier contained DO variable instance.
--> 
        
				<xsl:for-each select="my:DOType">
          <!-- Create CDC instance variables that were referenced by the LNClasses (No parent yet) -->
          <UAVariable>
            <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@cdc"/>Instance</xsl:attribute>
            <xsl:attribute name="BrowseName">1:<xsl:value-of select="@cdc"/>Instance</xsl:attribute>
            <xsl:element name="DisplayName"><xsl:value-of select="@cdc"/> CDC Instance</xsl:element>
            <xsl:element name="Description"><xsl:value-of select="@cdc"/> Common Data Class Variable Instance</xsl:element>
            <References>
              <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="@cdc"/>VT</Reference>
            </References>
          </UAVariable>
          <!-- Create CDC variable types -->
          <UAVariableType>
            <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@cdc"/>VT</xsl:attribute>
            <xsl:attribute name="BrowseName">1:<xsl:value-of select="@cdc"/>VT</xsl:attribute>
            <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@cdc"/>DT</xsl:attribute>
            <xsl:element name="DisplayName"><xsl:value-of select="@cdc"/> CDC</xsl:element>
            <xsl:element name="Description"><xsl:value-of select="@cdc"/> Common Data Class Variable Type</xsl:element>
            <References>
              <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=Base DA Variable Type</Reference>
            </References>
          </UAVariableType>
          <!-- Create CDC data types -->
          <UADataType>
            <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@cdc"/>DT</xsl:attribute>
            <xsl:attribute name="BrowseName">1:<xsl:value-of select="@cdc"/>DT</xsl:attribute>
            <xsl:element name="DisplayName"><xsl:value-of select="@cdc"/> CDC Data Type</xsl:element>
            <xsl:element name="Description"><xsl:value-of select="@desc"/> CDC Data Type</xsl:element>
            <References>
              <Reference ReferenceType="HasChild">ns=1;s=<xsl:value-of select="@cdc"/>.Binary</Reference>
              <Reference ReferenceType="HasEncoding">ns=1;s=<xsl:value-of select="@cdc"/>.Binary</Reference>
              <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=Composed CDC Data Type</Reference>
            </References>
            <Definition>
              <xsl:attribute name="Name">
                <xsl:value-of select="@cdc"/>
              </xsl:attribute>
              <!-- Add DOs as fields of each CDC data type-->
              <xsl:for-each select="my:DO">
                <Field>
                  <xsl:attribute name="Name"><xsl:value-of select="@name"/></xsl:attribute>
                  <xsl:attribute name="DataType">
                    ns=1;s=<xsl:value-of select="@type"/>
                  </xsl:attribute>
                </Field>
              </xsl:for-each>
            </Definition>
          </UADataType>
          <!-- Create Binary Encoding Object for CDC data types-->
          <UAObject>
            <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@cdc"/>.Binary</xsl:attribute>
            <xsl:attribute name="BrowseName">1:<xsl:value-of select="@cdc"/>.Binary</xsl:attribute>
            <xsl:element name="DisplayName"><xsl:value-of select="@cdc"/>.Binary</xsl:element>
            <xsl:element name="Description">Binary Data Type Encoding for Common Data Class Data Type ></xsl:element>
            <References>
              <Reference ReferenceType="HasTypeDefinition">i=76</Reference>
              <Reference ReferenceType="HasChild">ns=1;s=<xsl:value-of select="@cdc"/>.Schema1</Reference>
              <Reference ReferenceType="HasDescription" IsForward="false">ns=1;s=<xsl:value-of select="@cdc"/>.Schema1</Reference>
            </References>
          </UAObject>
          <!-- Create DTD to contain definition of each CDC data type-->
          <UAVariable>
            <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@cdc"/>.Schema1</xsl:attribute>
            <xsl:attribute name="BrowseName">1:<xsl:value-of select="@cdc"/>.Schema</xsl:attribute>
            <xsl:element name="DisplayName"><xsl:value-of select="@cdc"/>.Schema</xsl:element>
            <xsl:element name="Description">CDC Data Type Description></xsl:element>
            <References>
              <Reference ReferenceType="HasTypeDefinition">i=69</Reference>
              <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=IEC 62541 Data Type Dictionary</Reference>
            </References>
          </UAVariable>
          
           
          <!-- Create CDC object type in CDC hierarchy-->
          <UAObjectType>
            <xsl:attribute name="NodeId">
              ns=1;s=<xsl:value-of select="@cdc"/>
            </xsl:attribute>
            <xsl:attribute name="BrowseName">
              1:<xsl:value-of select="@cdc"/>
            </xsl:attribute>
            <xsl:element name="DisplayName">
              <xsl:value-of select="@cdc"/> CDC
            </xsl:element>
            <xsl:element name="Description">
              <xsl:value-of select="@cdc"/> Common Data Class Object Type
            </xsl:element>
            <References>
              <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=Composed CDC</Reference>
            </References>
          </UAObjectType>
          <!-- Create DOType object type as a subtype of the CDC object type-->
          <UAObjectType>
            <xsl:attribute name="NodeId">
              ns=1;s=<xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:attribute name="BrowseName">
              1:<xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:element name="DisplayName">
              <xsl:value-of select="@id"/> DOType
            </xsl:element>
            <xsl:element name="Description">
              <xsl:value-of select="@desc"/> DOType Object Type
            </xsl:element>
            <References>
              <!-- Add subtype reference from CDC object type to DOType Object Types -->
              <Reference ReferenceType="HasSubtype" IsForward="false">
                ns=1;s=<xsl:value-of select="@cdc"/>
              </Reference>
              <!-- Add references from SDO and DA instance variables to DOType Object Types-->
              <xsl:for-each select="my:SDO">
                <Reference ReferenceType="HasComponent">
                  ns=1;s=<xsl:value-of select="@name"/>Instance
                </Reference>
              </xsl:for-each>
              <xsl:for-each select="my:DA">
                <Reference ReferenceType="HasComponent">
                  ns=1;s=<xsl:value-of select="@name"/>Instance
                </Reference>
              </xsl:for-each>
            </References>
          </UAObjectType>
          <!-- Create data types for DOTypes -->
          <UADataType>
            <xsl:attribute name="NodeId">
              ns=1;s=<xsl:value-of select="@id"/>DT
            </xsl:attribute>
            <xsl:attribute name="BrowseName">
              1:<xsl:value-of select="@id"/>DT
            </xsl:attribute>
            <xsl:element name="DisplayName">
              <xsl:value-of select="@id"/> DOType Data Type
            </xsl:element>
            <xsl:element name="Description">
              <xsl:value-of select="@desc"/> DOType Data Type
            </xsl:element>
            <References>
              <Reference ReferenceType="HasChild">
                ns=1;s=<xsl:value-of select="@id"/>.Binary
              </Reference>
              <Reference ReferenceType="HasEncoding">
                ns=1;s=<xsl:value-of select="@id"/>.Binary
              </Reference>
              <!-- Add references from DOType data type to CDC data type -->
              <Reference ReferenceType="HasSubtype" IsForward="false">
                ns=1;s=<xsl:value-of select="@cdc"/>DT
              </Reference>
            </References>
            <!-- Add DA fields to DOType data types -->
            <Definition>
              <xsl:attribute name="Name">
                1:<xsl:value-of select="@id"/>
              </xsl:attribute>
              <xsl:for-each select="my:SDO">
                <Field>
                  <xsl:attribute name="Name">
                    <xsl:value-of select="@name"/>
                  </xsl:attribute>
                  <xsl:attribute name="DataType">
                    ns=1;s=<xsl:value-of select="@type"/>
                  </xsl:attribute>
                </Field>
              </xsl:for-each>
              <xsl:for-each select="my:DA">
                <Field>
                  <xsl:attribute name="Name">
                    <xsl:value-of select="@name"/>
                  </xsl:attribute>
                  <xsl:call-template name="BaseTypes"/>
                </Field>
              </xsl:for-each>
            </Definition>
          </UADataType>
<!--
Section 14.1:
For DAs within DOTypes
-->
          <xsl:for-each select="my:DA">
						<!-- Create DA variable types -->
						<UAVariableType>
							<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>VT</xsl:attribute>
							<xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/>VT</xsl:attribute>
              <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@name"/>DT</xsl:attribute>
							<xsl:element name="DisplayName"><xsl:value-of select="@name"/> DA</xsl:element>
              <xsl:element name="Description"><xsl:value-of select="@name"/> DA Variable Type</xsl:element>
						<References>
							<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=Base DA Variable Type</Reference>
						</References>
						</UAVariableType>
            <!-- Create DA instance variables -->
            <UAVariable>
              <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>Instance</xsl:attribute>
              <xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/>Instance</xsl:attribute>
              <xsl:element name="DisplayName"><xsl:value-of select="@name"/> DA Instance</xsl:element>
              <xsl:element name="Description"><xsl:value-of select="@name"/> DA Variable Instance</xsl:element>
              <References>
                <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="@name"/>VT</Reference>
              </References>
            </UAVariable>
            <!-- Create data types for contained DAs -->
            <UADataType>
              <xsl:attribute name="NodeId">
                ns=1;s=<xsl:value-of select="@name"/>DT
              </xsl:attribute>
              <xsl:attribute name="BrowseName">
                1:<xsl:value-of select="@name"/>DT
              </xsl:attribute>
              <xsl:element name="DisplayName">
                <xsl:value-of select="@name"/> Data Type
              </xsl:element>
              <xsl:element name="Description">
                <xsl:value-of select="@desc"/>
              </xsl:element>
              <References>
                <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=Base DA Data Type</Reference>
              </References>
              <!-- Add data type fields to DA data types -->
              <Definition>
                <xsl:attribute name="Name">
                  <xsl:value-of select="@id"/>
                </xsl:attribute>
                <xsl:attribute name="BaseType">
                  <xsl:value-of select="@cdc"/>
                </xsl:attribute>
                <xsl:for-each select="my:BDA">
                  <Field>
                    <xsl:attribute name="Name">
                      <xsl:value-of select="@name"/>
                    </xsl:attribute>
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
                <Reference ReferenceType="HasChild">ns=1;s=<xsl:value-of select="@id"/>.Schema2</Reference>
                <Reference ReferenceType="HasDescription" IsForward="false">ns=1;s=<xsl:value-of select="@id"/>.Schema2</Reference>
              </References>
            </UAObject>
            <UAVariable>
              <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>.Schema2</xsl:attribute>
              <xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/>.Schema</xsl:attribute>
              <xsl:element name="DisplayName"><xsl:value-of select="@id"/>.Schema</xsl:element>
              <xsl:element name="Description">Data Type Description></xsl:element>
              <References>
                <Reference ReferenceType="HasTypeDefinition">i=69</Reference>
                <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=IEC 62541 Data Type Dictionary</Reference>
              </References>
            </UAVariable>
          </xsl:for-each>
<!--
Section 14.2:
For SDOs within DOTypes
-->
          <!-- For each SDO in the DOType -->
          <xsl:for-each select="my:SDO">
						<!-- Create variable type for SDO -->
						<UAVariableType>
							<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/></xsl:attribute>
							<xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/></xsl:attribute>
              <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@name"/>DT</xsl:attribute>
							<xsl:element name="DisplayName"><xsl:value-of select="@name"/> DA</xsl:element>
						<References>
							<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=Base DA Variable Type</Reference>
						</References>
						</UAVariableType>
					</xsl:for-each>
				</xsl:for-each>
        <!-- End of for-each DOTtype -->
<!--
Section 15:
Create data types for standalone DAs
--> 
				<xsl:for-each select="my:DAType">
					<UADataType>
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>DT</xsl:attribute>
						<xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/>DT</xsl:attribute>
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
							<Reference ReferenceType="HasChild">ns=1;s=<xsl:value-of select="@id"/>.Schema3</Reference>
							<Reference ReferenceType="HasDescription" IsForward="false">ns=1;s=<xsl:value-of select="@id"/>.Schema3</Reference>
						</References>
					</UAObject>
					<UAVariable>
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>.Schema3</xsl:attribute>
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
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>DT</xsl:attribute>
						<xsl:attribute name="BrowseName"><xsl:value-of select="@id"/>DT</xsl:attribute>
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
						<xsl:attribute name="ParentNodeId">ns=1;s=<xsl:value-of select="@id"/>DT</xsl:attribute>
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
Section 16
Sub template for Basetypes
Create association between IEC 61850 data types and OPC UA data types
--> 
	<xsl:template name="BaseTypes">
    <!-- if IEC 61850 data type is boolean then OPC UA data type id is 1 (OPC UA Boolean) -->
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
<!--
Section 17:
Sub template for Basetypes
Implements 7-3
Create association between a DO and a CDC
--> 
	<xsl:template name="FCDA">
			<xsl:for-each-group select="my:FCDA" group-by="@doName">
				<UAObject>
					<!-- Create UA object for doName.  Ex: ALM,  -->
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></xsl:attribute>
					<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></xsl:attribute>
					<xsl:attribute name="DataType">i=12</xsl:attribute>
					<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></xsl:element>
					<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
					<References>
						<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lninst"/>.<xsl:value-of select="@doName"/></Reference>
						<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/><xsl:value-of select="@fc"/></Reference>
                        <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=DOs</Reference>
					</References>
				</UAObject>
				<UAVariable>
					<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.q</xsl:attribute>
					<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.q</xsl:attribute>
					<xsl:attribute name="DataType">i=12</xsl:attribute>
					<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.q</xsl:element>
					<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
					<References>
					<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
					<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
                     <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@fc"/></Reference>
					</References>
					<Value>
						<String/>
					</Value>
					</UAVariable>
					<UAVariable>
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.t</xsl:attribute>
						<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.t</xsl:attribute>
						<xsl:attribute name="DataType">i=12</xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.t</xsl:element>
						<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
						<References>
							<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
							<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
                            <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@fc"/></Reference>
						</References>
						<Value>
							<String/>
						</Value>
					</UAVariable>
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
							<UAObject>
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:element>
								<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
								<References>
									<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>									
								</References>
							</UAObject>
							<UAObject>
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
								<References>
									<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="@daName"/>.mag</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="@daName"/></Reference>
								</References>
							</UAObject>
							<UAVariable>
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.i</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.i</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@daName"/>.<xsl:value-of select="@daName"/>.mag.i</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</UAVariable>
								<UAVariable>
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.f</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.f</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.f</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</UAVariable>
							</xsl:when>
							<!--All DAs not related to Measured Values-->
							<!--DOs & DAs with generic CDC MV-->
							<xsl:when test="@fc=&apos;MX&apos; 
								and	(@doName=&apos;Ampor&apos;
								or @doName=&apos;AvAmps1&apos;
								or @doName=&apos;AvAmps2&apos;
								or @doName=&apos;AvAmps3&apos;
								or @doName=&apos;AvAmps4&apos;
								or @doName=&apos;AvAmps5&apos;
								or @doName=&apos;AvAmps6&apos;
								or @doName=&apos;AvVAr1&apos;
								or @doName=&apos;AvVAr2&apos;
								or @doName=&apos;AvW1&apos;
								or @doName=&apos;AvW2&apos;
								or @doName=&apos;DifAngClc&apos;
								or @doName=&apos;DifHzClc&apos;
								or @doName=&apos;FltDiskm&apos;
								or @doName=&apos;Hz&apos;
								or @doName=&apos;ImbNgA&apos;
								or @doName=&apos;MaxAmps1o&apos;
								or @doName=&apos;MaxAmps2&apos;
								or @doName=&apos;MaxAmps3&apos;
								or @doName=&apos;MaxVAr&apos;
								or @doName=&apos;MaxW&apos;
								or @doName=&apos;TmpRl&apos;
								or @doName=&apos;TotPF&apos;
								or @doName=&apos;TotVA&apos;
								or @doName=&apos;TotVAr&apos;
								or @doName=&apos;TotW&apos;)">
								<xsl:element name="UAObject" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
										<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>						
									</References>
								</xsl:element>
								<xsl:element name="UAObject" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
										<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="@daName"/></Reference>
									</References>
								</xsl:element>
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.i</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.i</xsl:attribute>
									<xsl:attribute name="DataType">i=12</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@daName"/>.<xsl:value-of select="@daName"/>.mag.i</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>
									<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.f</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.f</xsl:attribute>
									<xsl:attribute name="DataType">i=12</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.f</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>
								<!--<xsl:call-template name="QualityandTime"/>-->	
							</xsl:when>
							<!--DOs with generic CDC ACD-->
							<xsl:when test="@fc=&apos;ST&apos; 
								and	(@doName=&apos;Str&apos;)">
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.general</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.general</xsl:attribute>
									<xsl:attribute name="DataType">i=1</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.general</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.phsA</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.phsA</xsl:attribute>
									<xsl:attribute name="DataType">i=1</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.phsA</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.phsB</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.phsB</xsl:attribute>
									<xsl:attribute name="DataType">i=1</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.phsB</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>	
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.phsC</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.phsC</xsl:attribute>
									<xsl:attribute name="DataType">i=1</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.phsC</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>	
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.neut</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.neut</xsl:attribute>
									<xsl:attribute name="DataType">i=1</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.neut</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>
								<!--<xsl:call-template name="QualityandTime"/>-->
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.dirGeneral</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.dirGeneral</xsl:attribute>
									<xsl:attribute name="DataType">i=12</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.dirGeneral</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>									
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.dirPhsA</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.dirPhsA</xsl:attribute>
									<xsl:attribute name="DataType">i=12</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.dirPhsA</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>									
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.dirPhsB</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.dirPhsB</xsl:attribute>
									<xsl:attribute name="DataType">i=12</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.dirPhsB</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>	
									<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.dirPhsC</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.dirPhsC</xsl:attribute>
									<xsl:attribute name="DataType">i=12</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.dirPhsC</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>		
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.dirNeut</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.dirNeut</xsl:attribute>
									<xsl:attribute name="DataType">i=12</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.dirNeut</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>										
							</xsl:when>
							<!--DOs with generic CDC ACT-->
							<xsl:when test="@fc=&apos;ST&apos; 
								and	(@doName=&apos;ArcMod&apos;
								or @doName=&apos;AlmThm&apos;
								or @doName=&apos;Op&apos;
								or @doName=&apos;OpCls&apos;
								or @doName=&apos;OpEx&apos;
								or @doName=&apos;Tr&apos;)">
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.general</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.general</xsl:attribute>
									<xsl:attribute name="DataType">i=1</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.general</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.phsA</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.phsA</xsl:attribute>
									<xsl:attribute name="DataType">i=1</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.phsA</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.phsB</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.phsB</xsl:attribute>
									<xsl:attribute name="DataType">i=1</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.phsB</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>	
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.phsC</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.phsC</xsl:attribute>
									<xsl:attribute name="DataType">i=1</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.phsC</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>	
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.neut</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.neut</xsl:attribute>
									<xsl:attribute name="DataType">i=1</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.neut</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>
								<!--<xsl:call-template name="QualityandTime"/>-->
								<xsl:element name="UAObject" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
									<xsl:attribute name="DataType">i=7</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
										<String/>
									</Value>
								</xsl:element>
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
									<xsl:attribute name="DataType">i=12</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>	
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.operTmPhsA</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.operTmPhsA</xsl:attribute>
									<xsl:attribute name="DataType">i=12</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.operTmPhsA</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>	
									<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.operTmPhsB</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.operTmPhsB</xsl:attribute>
									<xsl:attribute name="DataType">i=12</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.operTmPhsB</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>		
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.operTmPhsC</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.operTmPhsC</xsl:attribute>
									<xsl:attribute name="DataType">i=12</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.operTmPhsC</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>										
							</xsl:when>
							<!--DOs with generic CDC SPS-->
							<xsl:when test="@fc=&apos;ST&apos; 
								and ( contains(@doName,'Alm')
								or contains(@doName,'Ind')
								or @doName=&apos;AngInd&apos;
								or @doName=&apos;HzInd&apos;
								or @doName=&apos;Loc&apos;
								or @doName=&apos;Proxy&apos;
								or @doName=&apos;PwrUp&apos;
								or @doName=&apos;RcdMade&apos;
								or @doName=&apos;Rel&apos;
								or @doName=&apos;VInd&apos;)">
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
									<xsl:attribute name="DataType">i=1</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.stVal</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>
								<!--<xsl:call-template name="QualityandTime"/>-->	
							</xsl:when>
							<!--DOs with generic CDC DPC-->
							<xsl:when test="@fc=&apos;ST&apos; 
								and	(@doName=&apos;Pos&apos;)">
								<xsl:element name="UAObject" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
									<xsl:attribute name="DataType">i=7</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
										<String/>
									</Value>
								</xsl:element>
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
									<xsl:attribute name="DataType">i=12</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>									
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:attribute>
									<xsl:attribute name="DataType">i=2</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>							
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
									<xsl:attribute name="DataType">i=7</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.stVal</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.stSeld</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.stSeld</xsl:attribute>
									<xsl:attribute name="DataType">i=1</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.stSeld</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.ctlVal</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.ctlVal</xsl:attribute>
									<xsl:attribute name="DataType">i=1</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.ctlVal</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=CO</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>								
								<!--<xsl:call-template name="QualityandTime"/>-->	
							</xsl:when>								
							<!--DOs with generic CDC INC-->
							<xsl:when test="@fc=&apos;ST&apos; 
								and	(@doName=&apos;ArcMod&apos;
								or @doName=&apos;AscMod&apos;
								or @doName=&apos;CbfMod&apos;
								or @doName=&apos;DfpMod&apos;
								or @doName=&apos;EfdMod&apos;
								or @doName=&apos;EfmMod&apos;
								or @doName=&apos;FrqMod&apos;
								or @doName=&apos;Mod&apos;
								or @doName=&apos;NgcMod&apos;
								or @doName=&apos;NgvMod&apos;
								or @doName=&apos;NvdMod&apos;
								or @doName=&apos;OcpMod&apos;
								or @doName=&apos;SenMod&apos;
								or @doName=&apos;ThmMod&apos;
								or @doName=&apos;VtpMod&apos;)">
								<xsl:element name="UAObject" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
									<xsl:attribute name="DataType">i=7</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
										<String/>
									</Value>
								</xsl:element>
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
									<xsl:attribute name="DataType">i=12</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>									
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:attribute>
									<xsl:attribute name="DataType">i=3</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>							
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
									<xsl:attribute name="DataType">i=7</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.stVal</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.ctlVal</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.ctlVal</xsl:attribute>
									<xsl:attribute name="DataType">i=7</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.ctlVal</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=CO</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>									
								<!--<xsl:call-template name="QualityandTime"/>-->	
							</xsl:when>	
							<!--DOs with generic CDC INS-->
							<xsl:when test="@fc=&apos;ST&apos; 
								and	(@doName=&apos;ArcBeh&apos;
									or @doName=&apos;AscBeh&apos;
									or @doName=&apos;AutoRecSt&apos;
									or @doName=&apos;Beh&apos;
									or @doName=&apos;CbfBeh&apos;
									or @doName=&apos;DfpBeh&apos;
									or @doName=&apos;EEHealth&apos;
									or @doName=&apos;EfdBeh&apos;
									or @doName=&apos;EfmBeh&apos;
									or @doName=&apos;FltNum&apos;
									or @doName=&apos;FrqBeh&apos;
									or @doName=&apos;Health&apos;
									or @doName=&apos;NgcBeh&apos;
									or @doName=&apos;NgvBeh&apos;
									or @doName=&apos;NvdBeh&apos;
									or @doName=&apos;OcpBeh&apos;
									or @doName=&apos;OpCnt&apos;
									or @doName=&apos;PhyHealth&apos;
									or @doName=&apos;SenBeh&apos;
									or @doName=&apos;VtpBeh&apos;)">
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
									<xsl:attribute name="DataType">i=7</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.stVal</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
									</References>
									<Value>
									<String/>
									</Value>
								</xsl:element>
								<!--<xsl:call-template name="QualityandTime"/>-->	
							</xsl:when>							
						</xsl:choose>
					</xsl:if> 
				</xsl:for-each>
			</xsl:for-each-group>
	</xsl:template>
  
<!--
Section 18
-->
	<xsl:template name="CMV">
		<xsl:param name="sdo" />
		<xsl:if test="$sdo!=&apos;&apos;">
				<UAObject>
					<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/></xsl:attribute>
					<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/></xsl:attribute>
					<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/></xsl:element>
					<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
					<References>
					<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/></Reference>
					<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
					</References>
				</UAObject>
			</xsl:if>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal</xsl:attribute>
				<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal</xsl:element>
				<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
				<References>
				<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/></Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag</xsl:attribute>
				<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag</xsl:element>
				<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
				<References>
				<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal</Reference>
				</References>
			</UAObject>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag.i</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag.i</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag.i</xsl:element>
			<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
			<References>
			<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
			<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag</Reference>
			<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=DAs</Reference>
			<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@fc"/></Reference>
			</References>
			<Value>
			<String/>
			</Value>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag.f</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag.f</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag.f</xsl:element>
			<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
			<References>
			<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
			<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag</Reference>
			<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=DAs</Reference>
			<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>
			</References>
			<Value>
			<String/>
			</Value>
		</UAVariable>
	</xsl:template>
  
	<!--
  Section 19:
  Report control template
  -->
	<xsl:template name="ReportControl">
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></xsl:attribute>
				<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/></xsl:element>
				<xsl:element name="Description"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@desc"/>$RP$<xsl:value-of select="@name"/></xsl:element>
				<References>
					<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@desc"/>$RP$<xsl:value-of select="@name"/></Reference>
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
					<String>
						<xsl:value-of select="@datSet"/>
					</String>
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
					<String>
						<xsl:value-of select="@rptID"/>
					</String>
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
					<String>
						<xsl:value-of select="@confRev"/>
					</String>
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
					<String>
						<xsl:value-of select="@buffered"/>
					</String>
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
					<String>False</String>
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
					<String>
						<xsl:value-of select="@dchg"/>
					</String>
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
					<String>
						<xsl:value-of select="@qchg"/>
					</String>
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
					<String>
						<xsl:value-of select="@dudp"/>
					</String>
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
					<String>
						<xsl:value-of select="@period"/>
					</String>
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
					<String>
						<xsl:value-of select="@seqNum"/>
					</String>
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
					<String>
						<xsl:value-of select="@timeStamp"/>report-time-stamp (if TRUE TimeOfEntry shall be included in the report);
					</String>
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
					<String>
						<xsl:value-of select="@dataSet"/>data-set-name (if TRUE DatSet shall be included in the report)
					</String>
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
					<String>
						<xsl:value-of select="@reasonCode"/>reason-for-inclusion (if TRUE ReasonCode shall be included in the report)
					</String>
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
					<String>
						<xsl:value-of select="@dataRef"/>
					</String>
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
					<String>
						<xsl:value-of select="@dataRef"/>
					</String>
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
					<String>
						<xsl:value-of select="@entryID"/>
					</String>
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
					<String>
						<xsl:value-of select="@ConfigRef"/>
					</String>
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
					<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>$RP$<xsl:value-of select="@name"/>.OptFields</Reference>
				</References>
				<Value>
					<String>
						<xsl:value-of select="@segmentation"/>
					</String>
				</Value>
			</UAVariable>
	</xsl:template>
</xsl:stylesheet>
