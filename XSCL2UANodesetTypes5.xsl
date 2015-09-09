<?xml version="1.0" encoding="utf-8"?>
<!--
Title:CID to UANodeset Stylesheet
Copyright ©  OPC Foundation, Inc., 2013. Released 2013-05-0 12:40

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
<xsl:stylesheet xmlns="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:fn="http://www.w3.org/2005/xpath-functions"           
                xmlns:nsSCL="http://www.iec.ch/61850/2003/SCL" 
                xmlns:uax="http://opcfoundation.org/UA/2008/02/Types.xsd" 
                version="2.0" exclude-result-prefixes="nsSCL">
 <xsl:output method="xml" version="1.0" omit-xml-declaration="yes" indent="yes"/>
 <xsl:template match="/">
  <UANodeSet xmlns="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd" 
             xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
             xmlns:s1="http://sample.com/Instances" 
             xmlns:s0="http://sample.com/Types" 
             xmlns:uax="http://opcfoundation.org/UA/2008/02/Types.xsd" 
             xsi:schemaLocation="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
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
   
    <UADataType NodeId="ns=1;s=bTypeBOOLEAN" BrowseName="1:bTypeBOOLEAN">
      <DisplayName>IEC 61850 bType BOOLEAN</DisplayName>
      <Description>IEC 61850 bType BOOLEAN</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=1</Reference>
      </References>
    </UADataType>
    
    <UADataType NodeId="ns=1;s=bTypeInt8U" BrowseName="1:bTypeInt8U">
      <DisplayName>IEC 61850 bType Int8U</DisplayName>
      <Description>IEC 61850 bType Int8U</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=3</Reference>
      </References>
    </UADataType>
    
    <UADataType NodeId="ns=1;s=bTypeInt16" BrowseName="1:bTypeInt16">
      <DisplayName>IEC 61850 bType Int16</DisplayName>
      <Description>IEC 61850 bType Int16</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=3</Reference>
      </References>
    </UADataType>
    
    <UADataType NodeId="ns=1;s=bTypeInt16U" BrowseName="1:bTypeInt16U">
      <DisplayName>IEC 61850 bType Int16U</DisplayName>
      <Description>IEC 61850 bType Int16U</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=5</Reference>
      </References>
    </UADataType>
    
    <UADataType NodeId="ns=1;s=bTypeInt24" BrowseName="1:bTypeInt24">
      <DisplayName>IEC 61850 bType Int24</DisplayName>
      <Description>IEC 61850 bType Int24</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=6</Reference>
      </References>
    </UADataType>
          
    <UADataType NodeId="ns=1;s=bTypeUInt24" BrowseName="1:bTypeUInt24">
      <DisplayName>IEC 61850 bType UInt24</DisplayName>
      <Description>IEC 61850 bType UInt24</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=7</Reference>
      </References>
    </UADataType>
            
    <UADataType NodeId="ns=1;s=bTypeInt32" BrowseName="1:bTypeInt32">
      <DisplayName>IEC 61850 bType Int32</DisplayName>
      <Description>IEC 61850 bType Int32</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=6</Reference>
      </References>
    </UADataType>
    
    <UADataType NodeId="ns=1;s=bTypeInt32U" BrowseName="1:bTypeInt32U">
      <DisplayName>IEC 61850 bType Int32U</DisplayName>
      <Description>IEC 61850 bType Int32U</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=7</Reference>
      </References>
    </UADataType>
        
    <UADataType NodeId="ns=1;s=bTypeInt64" BrowseName="1:bTypeInt64">
      <DisplayName>IEC 61850 bType Int32</DisplayName>
      <Description>IEC 61850 bType Int32</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=8</Reference>
      </References>
    </UADataType> 
      
    <UADataType NodeId="ns=1;s=bTypeInt64U" BrowseName="1:bTypeInt64U">
      <DisplayName>IEC 61850 bType Int64U</DisplayName>
      <Description>IEC 61850 bType UIn64</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=9</Reference>
      </References>
    </UADataType>

    <!-- 
			<xs:enumeration value="INT128"/>
-->
    <UADataType NodeId="ns=1;s=bTypeFloat32" BrowseName="1:bTypeFloat32">
      <DisplayName>IEC 61850 bType Float32</DisplayName>
      <Description>IEC 61850 bType Float32</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=10</Reference>
      </References>
    </UADataType>  
    
    <UADataType NodeId="ns=1;s=bTypeFloat64" BrowseName="1:bTypeFloat64">
      <DisplayName>IEC 61850 bType Float64</DisplayName>
      <Description>IEC 61850 bType Float64</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=11</Reference>
      </References>
    </UADataType> 
    
    <UADataType NodeId="ns=1;s=bTypeEnum" BrowseName="1:bTypeEnum">
      <DisplayName>IEC 61850 bType Enum</DisplayName>
      <Description>IEC 61850 bType Enum</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=29</Reference>
      </References>
    </UADataType> 
    
        
    <UADataType NodeId="ns=1;s=bTypeDbpos" BrowseName="1:bTypeDbpos">
      <DisplayName>IEC 61850 Dbpos Enum</DisplayName>
      <Description>IEC 61850 Dbpos Enum</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=DbposDT</Reference>
      </References>
    </UADataType>   
<!--
			<xs:enumeration value="Tcmd"/>
-->
    <UADataType NodeId="ns=1;s=bTypeQuality" BrowseName="1:bTypeQuality">
      <DisplayName>IEC 61850 bType Quality</DisplayName>
      <Description>IEC 61850 bType Quality</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=19</Reference>
      </References>
    </UADataType>       

    <UADataType NodeId="ns=1;s=bTypeTimestamp" BrowseName="1:bTypeTimestamp">
      <DisplayName>IEC 61850 bType Timestamp</DisplayName>
      <Description>IEC 61850 bType Timestamp</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=13</Reference>
      </References>
    </UADataType>       

    <UADataType NodeId="ns=1;s=bTypeTimestamp" BrowseName="1:bTypeTimestamp">
      <DisplayName>IEC 61850 bType Timestamp</DisplayName>
      <Description>IEC 61850 bType Timestamp</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=13</Reference>
      </References>
    </UADataType> 
    
    <UADataType NodeId="ns=1;s=bTypeVisString32" BrowseName="1:bTypeVisString32">
      <DisplayName>IEC 61850 bType VisString32</DisplayName>
      <Description>IEC 61850 bType VisString32</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=12</Reference>
      </References>
    </UADataType>
    
    <UADataType NodeId="ns=1;s=bTypeVisString64" BrowseName="1:bTypeVisString64">
      <DisplayName>IEC 61850 bType VisString64</DisplayName>
      <Description>IEC 61850 bType VisString64</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=12</Reference>
      </References>
    </UADataType>
    
    <UADataType NodeId="ns=1;s=bTypeVisString129" BrowseName="1:bTypeVisString129">
      <DisplayName>IEC 61850 bType VisString129</DisplayName>
      <Description>IEC 61850 bType VisString129</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=12</Reference>
      </References>
    </UADataType>
    
    <UADataType NodeId="ns=1;s=bTypeVisString255" BrowseName="1:bTypeVisString255">
      <DisplayName>IEC 61850 bType VisString255</DisplayName>
      <Description>IEC 61850 bType VisString255</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=12</Reference>
      </References>
    </UADataType>
    
<!--      
			<xs:enumeration value="Octet64"/>
			<xs:enumeration value="Unicode255"/>
      
    <UADataType NodeId="ns=1;s=bTypeStruct" BrowseName="1:bTypeStruct">
      <DisplayName>bType Struct</DisplayName>
      <Description>bType Struct</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=22</Reference>
      </References>
    </UADataType>       

			<xs:enumeration value="EntryTime"/>
			<xs:enumeration value="Check"/>
			<xs:enumeration value="ObjRef"/>
			<xs:enumeration value="Currency"/>
			<xs:enumeration value="PhyComAddr"/>
			<xs:enumeration value="SvOptFlds"/> 
-->
        
    <UADataType NodeId="ns=1;s=cTypeVector" BrowseName="1:cTypeVector">
      <DisplayName>IEC 61850 cType Vector Data Type</DisplayName>
      <Description>IEC 61850 Constructed Type Vector Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=22</Reference>
      </References>
      <!-- Add SDO and DA fields to DOType data types -->
      <Definition Name="cTypeVectorDT">
        <Field Name="mag" DataType="ns=1;s=bTypeFloat32">
          <Description>TBD</Description>
        </Field>
        <Field Name="ang" DataType="ns=1;s=bTypeFloat32">
          <Description>TBD</Description>
        </Field>
      </Definition>
    </UADataType>
  
<!--
Section 1:
CREATE Base Types
-->
      <UAObjectType NodeId="ns=1;s=IEC61850BaseObjectType" BrowseName="1:IEC61850BaseObjectType">
        <DisplayName>IEC 61850 Base Object Type</DisplayName>
        <Description>IEC 61850 Base Object Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
        </References>
      </UAObjectType>
  
      <UAReferenceType NodeId="ns=1;s=IEC61850BaseReferenceType" BrowseName="1:IEC61850BaseReferenceType" IsAbstract="true" Symmetric="false">
        <DisplayName>IEC 61850 Base Reference Type</DisplayName>
        <Description>IEC 61850 Base Reference Type</Description>
        <References>
            <Reference ReferenceType="HasSubtype" IsForward="false">i=32</Reference>
        </References>
        <InverseName>IEC61850ReferencedBy</InverseName>
      </UAReferenceType>
    <!--    
    <UADataType NodeId="ns=1;s=BaseDODataType" BrowseName="1:BaseDODataType">
      <DisplayName>IEC 61850 Base Data Object Data Type</DisplayName>
      <Description>IEC 61850 Base Data Object Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=22</Reference>
      </References>
    </UADataType> 
    -->
    <UAVariableType NodeId="ns=1;s=IEC61850BaseDOVariableType" BrowseName="1:IEC61850BaseDOVariableType" DataType="ns=1;s=tDT">
      <DisplayName>IEC 61850 Base Data Object Variable Type</DisplayName>
      <Description>IEC 61850 Base Data Object Variable Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=62</Reference>
      </References>
    </UAVariableType> 
    <UADataType NodeId="ns=1;s=IEC61850BaseDADataType" BrowseName="1:IEC61850BaseDADataType">
      <DisplayName>IEC 61850 Base Data Attribute Data Type</DisplayName>
      <Description>IEC 61850 Base Data Attribute Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=22</Reference>
      </References>
    </UADataType>
    <UAVariableType NodeId="ns=1;s=IEC61850BaseDAVariableType" BrowseName="1:IEC61850BaseDAVariableType" DataType="ns=1;s=IEC61850BaseDADataType">
      <DisplayName>IEC 61850 Base Data Attribute Variable Type</DisplayName>
      <Description>IEC 61850 Base Data Attribute Variable Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=62</Reference>
      </References>
    </UAVariableType>
    <UAVariableType NodeId="ns=1;s=IEC61850BaseSDOVariableType" BrowseName="1:IEC61850BaseSDOVariableType" DataType="ns=1;s=CMVDT">
      <DisplayName>IEC 61850 Base Sub Data Object Variable Type</DisplayName>
      <Description>IEC 61850 Base Sub Data Object Variable Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=62</Reference>
      </References>
    </UAVariableType>
    
    <UADataType NodeId="ns=1;s=CMVDT" BrowseName="1:CMVDT">
      <DisplayName>IEC 61850 CMV Data Type</DisplayName>
      <Description>Complex Measured Value Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=22</Reference>
      </References>
      <!-- Add SDO and DA fields to DOType data types -->
      <Definition Name="CMVDT">
        <Field Name="cVal" DataType="ns=1;s=cTypeVector">
          <Description>TBD</Description>
        </Field>
        <Field Name="q" DataType="ns=1;s=bTypeQuality">
          <Description>TBD</Description>
        </Field>
        <Field Name="t" DataType="ns=1;s=bTypeTimestamp">
          <Description>TDB</Description>
        </Field>
      </Definition>
    </UADataType> 
    
    <UAVariableType NodeId="ns=1;s=CMVVT" BrowseName="1:CMVVT" DataType="ns=1;s=CMVDT">
      <DisplayName>CMV Variable Type</DisplayName>
      <Description>Complex Measured Value Variable Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseSDOVariableType</Reference>
      </References>
    </UAVariableType>

<!--
Section 5:
CREATE Object Types and folders for non subtyped IEC 61850 types
-->

      <UAObjectType NodeId="ns=1;s=IED" BrowseName="1:IED">
        <DisplayName>IEC 61850 IED Object Type</DisplayName>
        <Description>IEC 61850 IED Object Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseObjectType</Reference>
        </References>
      </UAObjectType>
      <UAObject NodeId="ns=1;s=IEDs" BrowseName="1:IEDs">
        <DisplayName>IEC 61850 IEDs</DisplayName>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
          <Reference ReferenceType="HasTypeDefinition">i=61</Reference>
        </References>
      </UAObject>
  
      <UAObjectType NodeId="ns=1;s=IEC61850AccessPoint" BrowseName="1:IEC61850AccessPoint">
        <DisplayName>IEC 61850 AccessPoint Object Type</DisplayName>
        <Description>IEC 61850 AccessPoint Object Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseObjectType</Reference>
        </References>
      </UAObjectType>
      <UAObject NodeId="ns=1;s=IEC61850AccessPoints" BrowseName="1:IEC61850AccessPoints">
        <DisplayName>IEC 61850 Access Points</DisplayName>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
          <Reference ReferenceType="HasTypeDefinition">i=61</Reference>
        </References>
      </UAObject>
  
      <UAObjectType NodeId="ns=1;s=IEC61850Server" BrowseName="1:IEC61850Server">
        <DisplayName>IEC 61850 Server Object Type</DisplayName>
        <Description>IEC 61850 Server Object Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseObjectType</Reference>
        </References>
      </UAObjectType>
      <UAObject NodeId="ns=1;s=IEC61850Servers" BrowseName="1:IEC61850Servers">
        <DisplayName>IEC 61850 Servers</DisplayName>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
          <Reference ReferenceType="HasTypeDefinition">i=61</Reference>
        </References>
      </UAObject>
  
      <UAObjectType NodeId="ns=1;s=LD" BrowseName="1:LD">
        <DisplayName>IEC 61850 LogicalDevice Object Type</DisplayName>
        <Description>IEC 61850 LogicalDevice Object Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseObjectType</Reference>
        </References>
      </UAObjectType>
      <UAObject NodeId="ns=1;s=LDs" BrowseName="1:LDs">
        <DisplayName>IEC 61850 Logical Devices</DisplayName>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
          <Reference ReferenceType="HasTypeDefinition">i=61</Reference>
        </References>
      </UAObject>
  
      <UAObjectType NodeId="ns=1;s=BaseLN" BrowseName="1:BaseLN">
        <DisplayName>IEC 61850 Base LogicalNode Object Type</DisplayName>
        <Description>IEC 61850 Base Logical Node Object Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseObjectType</Reference>
        </References>
      </UAObjectType>
      <UAObject NodeId="ns=1;s=LNs" BrowseName="1:LNs">
        <DisplayName>IEC 61850 Logical Nodes</DisplayName>
        <Description>IEC 61850 Logical Nodes</Description>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
          <Reference ReferenceType="HasTypeDefinition">i=61</Reference>
        </References>
      </UAObject>
      <UAReferenceType NodeId="ns=1;s=LNode.SSeq"
                      BrowseName="1:LNode.SSeq"
                      IsAbstract="false"
                      Symmetric="false">
        <DisplayName>LNode.SSeq</DisplayName>
        <References>
            <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseReferenceType</Reference>
        </References>
        <InverseName>SSeq.LNode</InverseName>
      </UAReferenceType>
        <UAReferenceType NodeId="ns=1;s=SSeq.LNode"
                      BrowseName="1:SSeq.LNode"
                      IsAbstract="false"
                      Symmetric="false">
        <DisplayName>SSeq.LNode</DisplayName>
        <References>
            <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseReferenceType</Reference>
        </References>
        <InverseName>LNode.SSeq</InverseName>
      </UAReferenceType> 
      
      <UAObjectType NodeId="ns=1;s=ReportControl" BrowseName="1:ReportControl">
        <DisplayName>IEC 61850 ReportControl Object Type</DisplayName>
        <Description>IEC 61850 ReportControl Object Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseObjectType</Reference>
        </References>
      </UAObjectType>
      <UAObject NodeId="ns=1;s=Report Controls" BrowseName="1:Report Controls">
        <DisplayName>IEC 61850 Report Controls</DisplayName>
        <Description>IEC 61850 Report Controls</Description>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
          <Reference ReferenceType="HasTypeDefinition">i=61</Reference>
        </References>
      </UAObject>
  
      <UAObjectType NodeId="ns=1;s=ReportControlOptFields" BrowseName="1:ReportControlOptFields">
        <DisplayName>IEC 61850 ReportControlOptFields Object Type</DisplayName>
        <Description>IEC 61850 ReportControlOptFields Object Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseObjectType</Reference>
        </References>
      </UAObjectType>
      <UAObjectType NodeId="ns=1;s=ReportControlTrgOps" BrowseName="1:ReportControlTrgOps">
        <DisplayName>IEC 61850 ReportControlTrgOps Object Type</DisplayName>
        <Description>IEC 61850 ReportControlTrgOps Object Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseObjectType</Reference>
        </References>
      </UAObjectType>
  
      <UAObjectType NodeId="ns=1;s=FunctionalConstraint" BrowseName="1:FunctionalConstraint">
        <DisplayName>IEC 61850 FunctionalConstraint Object Type</DisplayName>
        <Description>IEC 61850 FunctionalConstraint Object Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseObjectType</Reference>
        </References>
      </UAObjectType>
      <UAObject NodeId="ns=1;s=Functional Constraints" BrowseName="1:Functional Constraints">
        <DisplayName>IEC 61850 Functional Constraints</DisplayName>
        <Description>IEC 61850 Functional Constraints</Description>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
          <Reference ReferenceType="HasTypeDefinition">i=61</Reference>
        </References>
      </UAObject>
      <UAObject NodeId="ns=1;s=STFC" BrowseName="1:STFC">
        <DisplayName>ST Functional Constraint</DisplayName>
        <Description>ST Functional Constraint</Description>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
          <Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
        </References>
      </UAObject>
      <UAObject NodeId="ns=1;s=MXFC" BrowseName="1:MXFC">
        <DisplayName>MX Functional Constraint</DisplayName>
        <Description>MX Functional Constraint</Description>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
          <Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
        </References>
      </UAObject>
      <UAObject NodeId="ns=1;s=COFC" BrowseName="1:COFC">
        <DisplayName>CO Functional Constraint</DisplayName>
        <Description>CO Functional Constraint</Description>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
          <Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
        </References>
      </UAObject>
      <UAObject NodeId="ns=1;s=SPFC" BrowseName="1:SPFC">
        <DisplayName>SP Functional Constraint</DisplayName>
        <Description>SP Functional Constraint</Description>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
          <Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
        </References>
      </UAObject>
      <UAObject NodeId="ns=1;s=SVFC" BrowseName="1:SVFC">
        <DisplayName>SV Functional Constraint</DisplayName>
        <Description>SV Functional Constraint</Description>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
          <Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
        </References>
      </UAObject>
      <UAObject NodeId="ns=1;s=CFFC" BrowseName="1:CFFC">
        <DisplayName>CF Functional Constraint</DisplayName>
        <Description>CF Functional Constraint</Description>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
          <Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
        </References>
      </UAObject>
      <UAObject NodeId="ns=1;s=DCFC" BrowseName="1:DCFC">
        <DisplayName>DC Functional Constraint</DisplayName>
        <Description>DC Functional Constraint</Description>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
          <Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
        </References>
      </UAObject>
      <UAObject NodeId="ns=1;s=SGFC" BrowseName="1:SGFC">
        <DisplayName>SG Functional Constraint</DisplayName>
        <Description>SG Functional Constraint</Description>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
          <Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
        </References>
      </UAObject>
      <UAObject NodeId="ns=1;s=SEFC" BrowseName="1:SEFC">
        <DisplayName>SE Functional Constraint</DisplayName>
        <Description>SE Functional Constraint</Description>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
          <Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
        </References>
      </UAObject>
      <UAObject NodeId="ns=1;s=EXFC" BrowseName="1:EXFC">
        <DisplayName>EX Functional Constraint</DisplayName>
        <Description>EX Functional Constraint</Description>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
          <Reference ReferenceType="HasTypeDefinition">ns=1;s=FunctionalConstraint</Reference>
        </References>
      </UAObject>
  
      <UAObjectType NodeId="ns=1;s=DataSet" BrowseName="1:DataSet">
        <DisplayName>IEC 61850 DataSet Object Type</DisplayName>
        <Description>IEC 61850 DataSet Object Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseObjectType</Reference>
        </References>
      </UAObjectType>
      <UAObject NodeId="ns=1;s=DataSets" BrowseName="1:DataSets">
        <DisplayName>IEC 61850 Data Sets</DisplayName>
        <Description>IEC 61850 Data Sets</Description>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
          <Reference ReferenceType="HasTypeDefinition">i=61</Reference>
        </References>
      </UAObject>
  
      <UAObjectType NodeId="ns=1;s=SS" BrowseName="1:SS">
        <DisplayName>IEC 61850 Substation Object Type</DisplayName>
        <Description>IEC 61850 Substation Object Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseObjectType</Reference>
        </References>
      </UAObjectType>
      <UAObject NodeId="ns=1;s=SSs" BrowseName="1:SSs">
        <DisplayName>IEC 61850 Substations</DisplayName>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
          <Reference ReferenceType="HasTypeDefinition">i=61</Reference>
        </References>
      </UAObject>
  
      <UAObjectType NodeId="ns=1;s=VL" BrowseName="1:VL">
        <DisplayName>IEC 61850 VoltageLevel Object Type</DisplayName>
        <Description>IEC 61850 VoltageLevel Object Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseObjectType</Reference>
        </References>
      </UAObjectType>
      <UAObject NodeId="ns=1;s=VLs" BrowseName="1:VLs">
        <DisplayName>IEC 61850 VoltageLevels</DisplayName>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
          <Reference ReferenceType="HasTypeDefinition">i=61</Reference>
        </References>
      </UAObject>
  
      <UAObjectType NodeId="ns=1;s=V" BrowseName="1:V">
        <DisplayName>IEC 61850 Voltage Object Type</DisplayName>
        <Description>IEC 61850 Voltage Object Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseObjectType</Reference>
        </References>
      </UAObjectType>
      <UAObject NodeId="ns=1;s=Vs" BrowseName="1:Vs">
        <DisplayName>IEC 61850 Voltages</DisplayName>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
          <Reference ReferenceType="HasTypeDefinition">i=61</Reference>
        </References>
      </UAObject>
  
      <UAObjectType NodeId="ns=1;s=XFR" BrowseName="1:XFR">
        <DisplayName>IEC 61850 PowerTransformer Object Type</DisplayName>
        <Description>IEC 61850 PowerTransformer Object Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseObjectType</Reference>
        </References>
      </UAObjectType>
      <UAObject NodeId="ns=1;s=XFRs" BrowseName="1:XFRs">
        <DisplayName>IEC 61850 Power Transformers</DisplayName>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
          <Reference ReferenceType="HasTypeDefinition">i=61</Reference>
        </References>
      </UAObject>
  
      <UAObjectType NodeId="ns=1;s=TW" BrowseName="1:TW">
        <DisplayName>IEC 61850 TransformerWinding Object Type</DisplayName>
        <Description>IEC 61850 TransformerWinding Object Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseObjectType</Reference>
        </References>
      </UAObjectType>
      <UAObject NodeId="ns=1;s=TWs" BrowseName="1:TWs">
        <DisplayName>IEC 61850 Transformer Windings</DisplayName>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
          <Reference ReferenceType="HasTypeDefinition">i=61</Reference>
        </References>
      </UAObject>
  
  
      <UAObjectType NodeId="ns=1;s=Bay" BrowseName="1:Bay">
        <DisplayName>IEC 61850 Bay Object Type</DisplayName>
        <Description>IEC 61850 Bay Object Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseObjectType</Reference>
        </References>
      </UAObjectType>
      <UAObject NodeId="ns=1;s=Bays" BrowseName="1:Bays">
        <DisplayName>IEC 61850 Bays</DisplayName>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
          <Reference ReferenceType="HasTypeDefinition">i=61</Reference>
        </References>
      </UAObject>
  
      <UAObjectType NodeId="ns=1;s=CE" BrowseName="1:CE">
        <DisplayName>IEC 61850 Conducting Equipment Object Type</DisplayName>
        <Description>IEC 61850 Conducting Equipment Object Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseObjectType</Reference>
        </References>
      </UAObjectType>
      <UAObject NodeId="ns=1;s=CEs" BrowseName="1:CEs">
        <DisplayName>IEC 61850 ConductingEquipments</DisplayName>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
          <Reference ReferenceType="HasTypeDefinition">i=61</Reference>
        </References>
      </UAObject>
  
      <UAObjectType NodeId="ns=1;s=SubE" BrowseName="1:SubE">
        <DisplayName>IEC 61850 Sub Equipment Object Type</DisplayName>
        <Description>IEC 61850 Sub Equipment Object Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=CE</Reference>
        </References>
      </UAObjectType>
      <UAObject NodeId="ns=1;s=SubEs" BrowseName="1:SubEs">
        <DisplayName>IEC 61850 Sub Equipments</DisplayName>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
          <Reference ReferenceType="HasTypeDefinition">i=61</Reference>
        </References>
      </UAObject>
  
      <UAObjectType NodeId="ns=1;s=T" BrowseName="1:T">
        <DisplayName>IEC 61850 Terminal Object Type</DisplayName>
        <Description>IEC 61850 Terminal Object Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseObjectType</Reference>
        </References>
      </UAObjectType> 
      <UAReferenceType NodeId="ns=1;s=T.CN"
                      BrowseName="1:T.CN"
                      IsAbstract="false"
                      Symmetric="false">
        <DisplayName>Terminal.ConnectivityNode</DisplayName>
        <References>
            <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseReferenceType</Reference>
        </References>
        <InverseName>ConnectivityNode.Terminal</InverseName>
      </UAReferenceType> 
      <UAObject NodeId="ns=1;s=Ts" BrowseName="1:Ts">
        <DisplayName>IEC 61850 Terminals</DisplayName>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
          <Reference ReferenceType="HasTypeDefinition">i=61</Reference>
        </References>
      </UAObject>
  
      <UAObjectType NodeId="ns=1;s=CN" BrowseName="1:CN">
        <DisplayName>IEC 61850 Connectivity Node Object Type</DisplayName>
        <Description>IEC 61850 Connectivity Node Object Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseObjectType</Reference>
        </References>
      </UAObjectType>
      <UAReferenceType NodeId="ns=1;s=CN.T"
                      BrowseName="1:CN.T"
                      IsAbstract="false"
                      Symmetric="false">
        <DisplayName>ConnectivityNode.Terminal</DisplayName>
        <References>
            <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseReferenceType</Reference>
        </References>
        <InverseName>Terminal.ConnectivityNode</InverseName>
      </UAReferenceType>
      <UAObject NodeId="ns=1;s=CNs" BrowseName="1:CNs">
        <DisplayName>IEC 61850 Connectivity Nodes</DisplayName>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
          <Reference ReferenceType="HasTypeDefinition">i=61</Reference>
        </References>
      </UAObject>

<!--
Section 4:
CREATE Object Types for CDC super types
-->  
      <UAObjectType NodeId="ns=1;s=BaseCDC" BrowseName="1:BaseCDC">
        <DisplayName>IEC 61850 Base Common Data Class Object Type</DisplayName>
        <Description>IEC 61850 Base Common Data Class Object Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseObjectType</Reference>
        </References>
      </UAObjectType>
      <UAObjectType NodeId="ns=1;s=ComposedCDC" BrowseName="1:ComposedCDC">
        <DisplayName>IEC 61850 Composed Common Data Class Object Type</DisplayName>
        <Description>IEC 61850 Composed Common Data Class Object Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=BaseCDC</Reference>
        </References>
      </UAObjectType>
      <UAObjectType NodeId="ns=1;s=PrimitiveCDC" BrowseName="1:PrimitiveCDC">
        <DisplayName>IEC 61850 Primitive Common Data Class Object Type</DisplayName>
        <Description>IEC 61850 Primitive Common Data Class Object Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=BaseCDC</Reference>
        </References>
      </UAObjectType>
      <UAObjectType NodeId="ns=1;s=SubstitutionCDC" BrowseName="1:SubstitutionCDC">
        <DisplayName>IEC 61850 Substitution Common Data Class Object Type</DisplayName>
        <Description>IEC 61850 Substitution Common Data Class Object Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=PrimitiveCDC</Reference>
        </References>
      </UAObjectType>
<!--  
Section 3:
CREATE Data Types for CDC super types
-->
      <UADataType NodeId="ns=1;s=BaseCDCDataType" BrowseName="1:BaseCDCDataType">
        <DisplayName>IEC 61850 Base Common Data Class Data Type</DisplayName>
        <Description>IEC 61850 Base Common Data Class Data Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">i=22</Reference>
        </References>
      </UADataType>
      <UADataType NodeId="ns=1;s=ComposedCDCDataType" BrowseName="1:ComposedCDCDataType">
        <DisplayName>IEC 61850 Composed Common Data Class Data Type</DisplayName>
        <Description>IEC 61850 Composed Common Data Class Data Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=BaseCDCDataType</Reference>
        </References>
      </UADataType>
      <UADataType NodeId="ns=1;s=PrimitiveCDCDataType" BrowseName="1:PrimitiveCDCDataType">
        <DisplayName>IEC 61850 Primitive Common Data Class Data Type</DisplayName>
        <Description>IEC 61850 Primitive Common Data Class Data Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=BaseCDCDataType</Reference>
        </References>
      </UADataType>
      <UADataType NodeId="ns=1;s=SubstitutionCDCDataType" BrowseName="1:SubstitutionCDCDataType">
        <DisplayName>IEC 61850 Substitution Common Data Class Data Type</DisplayName>
        <Description>IEC 61850 Substitution Common Data Class Data Type</Description>
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=PrimitiveCDCDataType</Reference>
        </References>
      </UADataType>

<!--
Section 6:
Temporary DO and DA Folders for trouble shooting
-->
      <UAObject NodeId="ns=1;s=DOs" BrowseName="1:DOs">
        <DisplayName>IEC 61850 Data Objects</DisplayName>
        <Description>IEC 61850 Data Objects</Description>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
          <Reference ReferenceType="HasTypeDefinition">i=61</Reference>
        </References>
      </UAObject>
      <UAObject NodeId="ns=1;s=DAs" BrowseName="1:DAs">
        <DisplayName>IEC 61850 Data Attributes</DisplayName>
        <Description>IEC 61850 Data Attributes</Description>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
          <Reference ReferenceType="HasTypeDefinition">i=61</Reference>
        </References>
      </UAObject>
      <UAObject NodeId="ns=1;s=SDOs" BrowseName="1:SDOs">
        <DisplayName>IEC 61850 Sub Data Objects</DisplayName>
        <Description>IEC 61850 Sub Data Objects</Description>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
          <Reference ReferenceType="HasTypeDefinition">i=61</Reference>
        </References>
      </UAObject>
<!--
Section 7:
CREATE Data Dictionary Variable
-->
      <UAVariable NodeId="ns=1;s=IEC62541DataTypeDictionary" BrowseName="1:IEC62541DataTypeDictionary" DataType="i=15">
        <DisplayName>IEC 62541 Data Type Dictionary</DisplayName>
        <Description>IEC 62541 Data Type Dictionary</Description>
        <References>
          <Reference ReferenceType="HasTypeDefinition">i=72</Reference>
          <Reference ReferenceType="HasComponent" IsForward="false">i=93</Reference>
        </References>
      </UAVariable>    

<!--**********************************************************************

Parse types for OPC UA type system

**********************************************************************-->
<!--
Section 5:
For the type tree under lnClasses:
Create object types for the standard lnClasses and their subtyped device LNodeTypes:
Create object, data types, variable types, and instance variables for each contained DO
Create references from each lnClass to their contained CDC variable instance.
Create references from each LNType to thier contained DO variable instance.
However, CDC and DOType related nodes are created below.
DOs are subtypes of DOTypes and DO instance variables appear under CDCs, 
but links from DOs to DOTypes and DOTypes to CDCs are done in section 14.
--> 
  <xsl:for-each select="//nsSCL:DataTypeTemplates">
		<xsl:for-each select="nsSCL:LNodeType">
			<!-- Create LNClass Object Types--> 
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@lnClass"/></xsl:attribute>
				<xsl:attribute name="BrowseName">1:<xsl:value-of select="@lnClass"/></xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="@lnClass"/> lnClass</xsl:element>
				<xsl:element name="Description"> lnClass</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=BaseLN</Reference>
					<xsl:for-each select="nsSCL:DO">
						<!-- Add references from LNClass object types to DOType instances--> 
						<!--<Reference ReferenceType="HasComponent">ns=1;s=<xsl:value-of select="@type"/>Instance</Reference>-->
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
					<xsl:for-each select="nsSCL:DO">
						<!-- Add references from LNodeType object types to DO instance -->
            <!--<Reference ReferenceType="HasComponent">ns=1;s=<xsl:value-of select="@name"/>Instance</Reference>-->
					</xsl:for-each>
				</References>
			</UAObjectType>
			<!-- Create DO object types and subtype them from their DOType object types --> 
			<xsl:for-each select="nsSCL:DO">
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
	      <!-- Create DO variable types-->
        <UAVariableType>
					<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@type"/>VT</xsl:attribute>
					<xsl:attribute name="BrowseName">1:<xsl:value-of select="@type"/>VT</xsl:attribute>
          <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@type"/>DT</xsl:attribute>
					<xsl:element name="DisplayName"><xsl:value-of select="@type"/> DO</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@type"/> Data Object Variable Type</xsl:element>
				  <References>
					  <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseDOVariableType</Reference>
				  </References>
				</UAVariableType>
      </xsl:for-each>
		</xsl:for-each>

<!--
Section 6:
For the type tree under CDCs:
Create object types, variable types, instance Variables, and data types for each CDC 
Create DOType Object type and subtype from CDC
Create object types, variable types, instance Variables, and data types for each contained DAs and SDOs.
Create references from each LNodeType to their contained DO.

DOs are subtype of DOType, but links to CDS are done in the section below.
Create references from each lnClass to their contained CDC variable instance.
Create references from each LNType to thier contained DO variable instance.
--> 
        
			<xsl:for-each select="nsSCL:DOType">
        <!-- Create CDC object type in CDC hierarchy-->
        <UAObjectType>
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@cdc"/></xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="@cdc"/></xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@cdc"/> CDC Object Type</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@cdc"/> Common Data Class Object Type</xsl:element>
          <References>
            <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ComposedCDC</Reference>
          </References>
        </UAObjectType>
        <!-- Create DOType object type as a subtype of the CDC object type-->
        <UAObjectType>
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/></xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/></xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@id"/> DOType Object Type</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@desc"/> DOType Object Type</xsl:element>
          <References>
            <!-- Add subtype reference from CDC object type to DOType Object Types -->
            <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=<xsl:value-of select="@cdc"/></Reference>
            <!-- Add references from SDO and DA instance variables to DOType Object Types-->
            <xsl:for-each select="nsSCL:SDO">
              <Reference ReferenceType="HasComponent">ns=1;s=<xsl:value-of select="@name"/>Instance</Reference>
            </xsl:for-each>
            <xsl:for-each select="nsSCL:DA">
              <Reference ReferenceType="HasComponent">ns=1;s=<xsl:value-of select="@name"/>Instance</Reference>
            </xsl:for-each>
          </References>
        </UAObjectType>
        <!-- Create CDC data type in CDC hierarchy-->
        <UADataType>
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@cdc"/>DT</xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="@cdc"/>DT</xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@cdc"/> CDC Data Type</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@cdc"/> Common Data Class Data Type</xsl:element>
          <References>
            <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ComposedCDCDataType</Reference>
          </References>
        </UADataType>
        <!-- Create data type for DOTypes -->
        <UADataType>
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>DT</xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/>DT</xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@id"/> DOType Data Type</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@desc"/> DOType Data Type</xsl:element>
          <References>
            <Reference ReferenceType="HasEncoding">ns=1;s=<xsl:value-of select="@id"/>.Binary</Reference>
            <!-- Add references from DOType data type to CDC data type -->
            <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=<xsl:value-of select="@cdc"/>DT</Reference>
          </References>
          <!-- Add SDO and DA fields to DOType data types -->
          <Definition>
            <xsl:attribute name="Name">1:<xsl:value-of select="@id"/></xsl:attribute>
            <xsl:for-each select="nsSCL:SDO">
              <Field>
                <xsl:attribute name="Name"><xsl:value-of select="@name"/></xsl:attribute>
                <xsl:attribute name="DataType">ns=1;s=CMVDT</xsl:attribute>
                <xsl:element name="Description"><xsl:value-of select="@desc"/> TBD</xsl:element>
              </Field>
            </xsl:for-each>
            <xsl:for-each select="nsSCL:DA">
              <Field>
                <xsl:attribute name="Name"><xsl:value-of select="@name"/></xsl:attribute>
                <xsl:call-template name="BaseTypes"/>
                <xsl:element name="Description"><xsl:value-of select="@desc"/> TBD</xsl:element>
              </Field>
            </xsl:for-each>
          </Definition>
        </UADataType>          
        <!-- Create Binary Encoding Object for DOType data types-->
        <UAObject>
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>.Binary</xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/>.Binary</xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@id"/>.Binary</xsl:element>
          <xsl:element name="Description">Binary Data Type Encoding for Common Data Class Data Type</xsl:element>
          <References>
            <Reference ReferenceType="HasTypeDefinition">i=76</Reference>
            <Reference ReferenceType="HasComponent">ns=1;s=<xsl:value-of select="@id"/>.Schema</Reference>
          </References>
        </UAObject>
        <!-- Create DTD to contain definition of each DOType data type-->
        <UAVariable>
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>.Schema</xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/>.Schema</xsl:attribute>
          <xsl:attribute name="DataType">String</xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@id"/>.Schema</xsl:element>
          <xsl:element name="Description">CDC Data Type Description</xsl:element>
          <References>
            <Reference ReferenceType="HasTypeDefinition">i=69</Reference>
            <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=IEC62541DataTypeDictionary</Reference>
          </References>
        </UAVariable>
<!--
Section 6.1:
For DAs within DOTypes
-->
        <xsl:for-each select="nsSCL:DA">
					<!-- Create DA variable types -->
					<UAVariableType>
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>VT</xsl:attribute>
						<xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/>VT</xsl:attribute>
            <xsl:choose>
					    <xsl:when test="@bType=&apos;Enum&apos;">
                <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@type"/>DT</xsl:attribute>
              </xsl:when>
              <xsl:when test="@bType= &apos;Struct&apos;">
                <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@type"/>DT</xsl:attribute>
              </xsl:when>
						  <xsl:otherwise>
						    <xsl:attribute name="DataType">ns=1;s=bType<xsl:value-of select="@bType"/></xsl:attribute>
						  </xsl:otherwise>
            </xsl:choose>
						<xsl:element name="DisplayName"><xsl:value-of select="@name"/> DA</xsl:element>
            <xsl:element name="Description"><xsl:value-of select="@name"/> Data Attribute Variable Type</xsl:element>
					  <References>
						  <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseDAVariableType</Reference>
					  </References>
					</UAVariableType>
          <!-- Create DA instance variables -->
          <UAVariable>
            <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>Instance</xsl:attribute>
            <xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/>Instance</xsl:attribute>
            <xsl:choose>
					    <xsl:when test="@bType=&apos;Enum&apos;">
                <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@type"/>DT</xsl:attribute>
              </xsl:when>
              <xsl:when test="@bType= &apos;Struct&apos;">
                <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@type"/>DT</xsl:attribute>
              </xsl:when>
						  <xsl:otherwise>
						    <xsl:attribute name="DataType">ns=1;s=bType<xsl:value-of select="@bType"/></xsl:attribute>
						  </xsl:otherwise>
            </xsl:choose>
            <xsl:element name="DisplayName"><xsl:value-of select="@name"/> DA Instance</xsl:element>
            <xsl:element name="Description"><xsl:value-of select="@name"/> Data Attribute Variable Instance</xsl:element>
            <References>
              <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="@name"/>VT</Reference>
            </References>
          </UAVariable>
          <!-- Create data types for contained DAs -
          <UADataType>
            <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>DT</xsl:attribute>
            <xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/>DT</xsl:attribute>
            <xsl:element name="DisplayName"><xsl:value-of select="@name"/> DA Data Type</xsl:element>
            <xsl:element name="Description"><xsl:value-of select="@desc"/> Data Attribute Data Type</xsl:element>
            <References>
              <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=bType<xsl:value-of select="@bType"/></Reference>
            </References>
            <Definition>
              <xsl:attribute name="Name"><xsl:value-of select="@id"/></xsl:attribute>
              <xsl:attribute name="BaseType"><xsl:value-of select="@cdc"/></xsl:attribute>
              <xsl:for-each select="nsSCL:BDA">
                <Field>
                  <xsl:attribute name="Name"><xsl:value-of select="@name"/></xsl:attribute>
                  <xsl:call-template name="BaseTypes"/>
                  <xsl:element name="Description"><xsl:value-of select="@desc"/> TBD</xsl:element>
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
              <Reference ReferenceType="HasComponent">ns=1;s=<xsl:value-of select="@id"/>.Schema</Reference>
            </References>
          </UAObject>
          <UAVariable>
            <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>.Schema</xsl:attribute>
            <xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/>.Schema</xsl:attribute>
            <xsl:attribute name="DataType">String</xsl:attribute>
            <xsl:element name="DisplayName"><xsl:value-of select="@id"/>.Schema</xsl:element>
            <xsl:element name="Description">Data Type Description</xsl:element>
            <References>
              <Reference ReferenceType="HasTypeDefinition">i=69</Reference>
              <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=IEC62541DataTypeDictionary</Reference>
            </References>
          </UAVariable>
          -->
        </xsl:for-each>
<!--
Section 6.2:
For SDOs within DOTypes
-->
        <!-- For each SDO in the DOType -->
        <xsl:for-each select="nsSCL:SDO">
					<!-- Create variable type for SDO -->
					<UAVariableType>
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>VT</xsl:attribute>
						<xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/>VT</xsl:attribute>
            <xsl:attribute name="DataType">ns=1;s=CMVDT</xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@name"/> SDO</xsl:element>
            <xsl:element name="Description"><xsl:value-of select="@name"/> Sub Data Object Variable Type</xsl:element>
					<References>
						<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseSDOVariableType</Reference>
					</References>
					</UAVariableType>
          <!-- Create SDO instance variables -->
          <UAVariable>
            <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>Instance</xsl:attribute>
            <xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/>Instance</xsl:attribute>
            <xsl:attribute name="DataType">ns=1;s=CMVDT</xsl:attribute>
            <xsl:element name="DisplayName"><xsl:value-of select="@name"/> SDO Instance</xsl:element>
            <xsl:element name="Description"><xsl:value-of select="@desc"/> Sub Data Object Variable Instance</xsl:element>
            <References>
              <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="@name"/>VT</Reference>
            </References>
          </UAVariable>
          <!-- Create data types for contained SDOs
          <UADataType>
            <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>DT</xsl:attribute>
            <xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/>DT</xsl:attribute>
            <xsl:element name="DisplayName"><xsl:value-of select="@name"/> SDO Data Type</xsl:element>
            <xsl:element name="Description"><xsl:value-of select="@type"/> Sub Data Object Data Type</xsl:element>
            <References>
              <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=CMVDT</Reference>
            </References>
          </UADataType>
          <UAObject>
            <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>.Binary</xsl:attribute>
            <xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/>.Binary</xsl:attribute>
            <xsl:element name="DisplayName"><xsl:value-of select="@name"/>.Binary</xsl:element>
            <xsl:element name="Description"><xsl:value-of select="@type"/> Binary Data Type Encoding></xsl:element>
            <References>
              <Reference ReferenceType="HasTypeDefinition">i=76</Reference>
              <Reference ReferenceType="HasComponent">ns=1;s=<xsl:value-of select="@name"/>.Schema</Reference>
            </References>
          </UAObject>
          <UAVariable>
            <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>.Schema</xsl:attribute>
            <xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/>.Schema</xsl:attribute>
            <xsl:attribute name="DataType">String</xsl:attribute>
            <xsl:element name="DisplayName"><xsl:value-of select="@name"/>.Schema</xsl:element>
            <xsl:element name="Description"><xsl:value-of select="@type"/> Data Type Description</xsl:element>
            <References>
              <Reference ReferenceType="HasTypeDefinition">i=69</Reference>
              <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=IEC62541DataTypeDictionary</Reference>
            </References>
          </UAVariable>
          -->
        </xsl:for-each>
			</xsl:for-each>
      <!-- End of for-each DOTtype -->
<!--
Section 7:
Create data types for standalone DAs
--> 
		  <xsl:for-each select="nsSCL:DAType">
			  <UADataType>
				  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>DT</xsl:attribute>
				  <xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/>DT</xsl:attribute>
				  <xsl:element name="DisplayName"><xsl:value-of select="@id"/> DAType Data Type</xsl:element>
				  <xsl:element name="Description"><xsl:value-of select="@desc"/>DAType Data Type</xsl:element>
				  <References>
					  <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseDADataType</Reference>
				  </References>
				  <Definition>
					  <xsl:attribute name="Name"><xsl:value-of select="@id"/></xsl:attribute>
					  <xsl:attribute name="BaseType"><xsl:value-of select="@cdc"/></xsl:attribute>
					  <xsl:for-each select="nsSCL:BDA">
						  <Field>
							  <xsl:attribute name="Name"><xsl:value-of select="@name"/></xsl:attribute>
							  <xsl:call-template name="BaseTypes"/>
                <xsl:element name="Description"><xsl:value-of select="@desc"/> TBD</xsl:element>
						  </Field>
					  </xsl:for-each>
				  </Definition>
			  </UADataType>
			  <UAObject>
				  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>.Binary</xsl:attribute>
				  <xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/>.Binary</xsl:attribute>
				  <xsl:element name="DisplayName"><xsl:value-of select="@id"/>.Binary</xsl:element>
				  <xsl:element name="Description">Binary Data Type Encoding</xsl:element>
				  <References>
					  <Reference ReferenceType="HasTypeDefinition">i=76</Reference>
					  <Reference ReferenceType="HasComponent">ns=1;s=<xsl:value-of select="@id"/>.Schema</Reference>
				  </References>
			  </UAObject>
			  <UAVariable>
				  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>.Schema</xsl:attribute>
				  <xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/>.Schema</xsl:attribute>
          <xsl:attribute name="DataType">String</xsl:attribute>
				  <xsl:element name="DisplayName"><xsl:value-of select="@id"/>.Schema</xsl:element>
				  <xsl:element name="Description">Data Type Description</xsl:element>
				  <References>
					  <Reference ReferenceType="HasTypeDefinition">i=69</Reference>
					  <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=IEC62541DataTypeDictionary</Reference>
				  </References>
			  </UAVariable>
		  </xsl:for-each>
    
		  <xsl:for-each select="nsSCL:EnumType">
			  <UADataType>
				  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>DT</xsl:attribute>
				  <xsl:attribute name="BrowseName"><xsl:value-of select="@id"/>DT</xsl:attribute>
				  <DisplayName><xsl:value-of select="@id"/> Enum Data Type</DisplayName>
				  <Description><xsl:value-of select="@id"/> Enum Data Type</Description>
				  <References>
					  <Reference ReferenceType="HasProperty">ns=1;s=<xsl:value-of select="@id"/>Enum</Reference>
					  <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=bTypeEnum</Reference>
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
					  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@id"/>Enum</Reference>-->
				  </References>
				  <Value>
					  <ListOfExtensionObject xmlns="http://opcfoundation.org/UA/2008/02/Types.xsd">
						  <xsl:for-each select="nsSCL:EnumVal">
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
Section 11
Sub template for Basetypes
Create association between IEC 61850 data types and OPC UA data types
--> 
	<xsl:template name="BaseTypes">
    <!-- if IEC 61850 data type is boolean then OPC UA data type id is 1 (OPC UA Boolean) -->
		<xsl:if test="@bType= &apos;BOOLEAN&apos;">
			<xsl:attribute name="DataType">ns=1;s=bTypeBOOLEAN</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;INT8&apos;">
			<xsl:attribute name="DataType">ns=1;s=bTypeInt16</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;INT16&apos;">
			<xsl:attribute name="DataType">ns=1;s=bTypeInt16</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;INT24&apos;">
			<xsl:attribute name="DataType">ns=1;s=bTypeInt32</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;INT32&apos;">
			<xsl:attribute name="DataType">ns=1;s=bTypeInt32</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;INT128&apos;">
			<xsl:attribute name="DataType">i=8</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;INT8U&apos;">
			<xsl:attribute name="DataType">ns=1;s=bTypeInt16</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;INT16U&apos;">
			<xsl:attribute name="DataType">ns=1;s=bTypeInt16U</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;INT24U&apos;">
			<xsl:attribute name="DataType">ns=1;s=bTypeInt32U</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;INT32U&apos;">
			<xsl:attribute name="DataType">ns=1;s=bTypeInt32U</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;FLOAT32&apos;">
			<xsl:attribute name="DataType">ns=1;s=bTypeFloat32</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;FLOAT64&apos;">
			<xsl:attribute name="DataType">ns=1;s=bTypeFloat64</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;Enum&apos;">
			<xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@type"/>DT</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;Dbpos&apos;">
			<xsl:attribute name="DataType">ns=1;s=bTypeDbpos</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;Tcmd&apos;">
			<xsl:attribute name="DataType">i=13</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;Quality&apos;">
			<xsl:attribute name="DataType">ns=1;s=bTypeQuality</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;Timestamp&apos;">
			<xsl:attribute name="DataType">i=13</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;VisString32&apos;">
			<xsl:attribute name="DataType">i=12</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;VisString64&apos;">
			<xsl:attribute name="DataType">i=12</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;VisString255&apos;">
			<xsl:attribute name="DataType">i=12</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;Octet64&apos;">
			<xsl:attribute name="DataType">i=11</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;Struct&apos;">
			<xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@type"/>DT</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;EntryTime&apos;">
			<xsl:attribute name="DataType">i=13</xsl:attribute>
		</xsl:if>
		<xsl:if test="@bType = &apos;Unicode255&apos;">
			<xsl:attribute name="DataType">i=12</xsl:attribute>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>

