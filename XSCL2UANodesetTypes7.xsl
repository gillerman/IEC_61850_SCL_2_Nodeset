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
<!--
Section 1: Preamble
-->
<xsl:stylesheet xmlns="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd"
                xmlns:nsSCL="http://www.iec.ch/61850/2003/SCL"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:fn="http://www.w3.org/2005/xpath-functions"            
                version="2.0" exclude-result-prefixes="nsSCL">
 <xsl:output method="xml" version="1.0" omit-xml-declaration="yes" indent="yes"/>
 <xsl:template match="/">
  <UANodeSet xmlns="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd" 
             xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
             xsi:schemaLocation="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd file:///C:/UANodeSet.xsd">
    <NamespaceUris>
      <Uri>http://gcs.com/IEC61850Types</Uri>
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
Section 2: Create Base Data Types
-->
    <UADataType NodeId="ns=1;s=P_BOOLEAN" BrowseName="1:P_BOOLEAN">
      <DisplayName>IEC61850P_BOOLEAN</DisplayName>
      <Description>IEC 61850 Primitive DA Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=1</Reference>
      </References>
    </UADataType>    
    <UADataType NodeId="ns=1;s=P_INT8U" BrowseName="1:P_INT8U">
      <DisplayName>IEC61850P_Int8U</DisplayName>
      <Description>IEC 61850 Primitive DA Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=3</Reference>
      </References>
    </UADataType>
    <UADataType NodeId="ns=1;s=P_INT16" BrowseName="1:P_INT16">
      <DisplayName>IEC61850P_Int16</DisplayName>
      <Description>IEC 61850 Primitive DA Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=3</Reference>
      </References>
    </UADataType>
    <UADataType NodeId="ns=1;s=P_INT16U" BrowseName="1:P_INT16U">
      <DisplayName>IEC61850P_Int16U</DisplayName>
      <Description>IEC 61850 Primitive DA Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=5</Reference>
      </References>
    </UADataType>
    <UADataType NodeId="ns=1;s=P_INT24" BrowseName="1:P_INT24">
      <DisplayName>IEC61850P_Int24</DisplayName>
      <Description>IEC 61850 Primitive DA Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=6</Reference>
      </References>
    </UADataType>    
    <UADataType NodeId="ns=1;s=P_UInt24" BrowseName="1:P_UInt24">
      <DisplayName>IEC61850P_UInt24</DisplayName>
      <Description>IEC 61850 Primitive DA Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=7</Reference>
      </References>
    </UADataType>      
    <UADataType NodeId="ns=1;s=P_INT32" BrowseName="1:P_INT32">
      <DisplayName>IEC61850P_Int32</DisplayName>
      <Description>IEC 61850 Primitive DA Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=6</Reference>
      </References>
    </UADataType>
    <UADataType NodeId="ns=1;s=P_INT32U" BrowseName="1:P_INT32U">
      <DisplayName>IEC61850P_Int32U</DisplayName>
      <Description>IEC 61850 Primitive DA Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=7</Reference>
      </References>
    </UADataType>  
    <UADataType NodeId="ns=1;s=P_INT64" BrowseName="1:P_INT64">
      <DisplayName>IEC61850P_Int32</DisplayName>
      <Description>IEC 61850 Primitive DA Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=8</Reference>
      </References>
    </UADataType> 
    <UADataType NodeId="ns=1;s=P_INT64U" BrowseName="1:P_INT64U">
      <DisplayName>IEC61850P_Int64U</DisplayName>
      <Description>IEC 61850 Primitive DA Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=9</Reference>
      </References>
    </UADataType>
    <!--<xs:enumeration value="INT128"/>-->
    <UADataType NodeId="ns=1;s=P_FLOAT32" BrowseName="1:P_FLOAT32">
      <DisplayName>IEC61850P_FLOAT32</DisplayName>
      <Description>IEC 61850 Primitive DA Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=10</Reference>
      </References>
    </UADataType>      
    <UADataType NodeId="ns=1;s=P_FLOAT64" BrowseName="1:P_FLOAT64">
      <DisplayName>IEC61850P_FLOAT64</DisplayName>
      <Description>IEC 61850 Primitive DA Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=11</Reference>
      </References>
    </UADataType>    
    <UADataType NodeId="ns=1;s=P_Enum" BrowseName="1:P_Enum">
      <DisplayName>IEC61850P_Enum</DisplayName>
      <Description>IEC 61850 Primitive DA Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=29</Reference>
      </References>
    </UADataType> 
    <UADataType NodeId="ns=1;s=P_AutoReclosingKind" BrowseName="1:P_AutoReclosingKind">
      <DisplayName>AutoReclosingKind</DisplayName>
      <Description>IEC 61850 AutoReclosingKind</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=P_Enum</Reference>
      </References>
    </UADataType>
    <UADataType NodeId="ns=1;s=P_DbposKind" BrowseName="1:P_DbposKind">
      <DisplayName>DbposKind</DisplayName>
      <Description>IEC 61850 Dbpos Enum</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=P_Enum</Reference>
      </References>
    </UADataType>
    <UADataType NodeId="ns=1;s=P_SIUnitKind" BrowseName="1:P_SIUnitKind">
      <DisplayName>SIUnitKind</DisplayName>
      <Description>IEC 61850 SI Unit Enum</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=P_Enum</Reference>
      </References>
    </UADataType>
    
    <!-- <xs:enumeration value="Tcmd"/>-->
    <UADataType NodeId="ns=1;s=P_Quality" BrowseName="1:P_Quality">
      <DisplayName>IEC61850P_Quality</DisplayName>
      <Description>IEC 61850 Primitive DA Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=19</Reference>
      </References>
    </UADataType>       
    <UADataType NodeId="ns=1;s=P_Timestamp" BrowseName="1:P_Timestamp">
      <DisplayName>IEC61850P_Timestamp</DisplayName>
      <Description>IEC 61850 Primitive DA Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=13</Reference>
      </References>
    </UADataType>           
    <UADataType NodeId="ns=1;s=P_VisString32" BrowseName="1:P_VisString32">
      <DisplayName>IEC61850P_VisString32</DisplayName>
      <Description>IEC 61850 Primitive DA Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=12</Reference>
      </References>
    </UADataType>  
    <UADataType NodeId="ns=1;s=P_P" BrowseName="1:P_P">
      <DisplayName>P_P</DisplayName>
      <Description>IEC 61850 IP Address Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=P_VisString32</Reference>
      </References>
    </UADataType>
    <UADataType NodeId="ns=1;s=P_VisString64" BrowseName="1:P_VisString64">
      <DisplayName>IEC61850P_VisString64</DisplayName>
      <Description>IEC 61850 Primitive DA Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=12</Reference>
      </References>
    </UADataType>    
    <UADataType NodeId="ns=1;s=P_VisString129" BrowseName="1:P_VisString129">
      <DisplayName>IEC61850P_VisString129</DisplayName>
      <Description>IEC 61850 Primitive DA Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=12</Reference>
      </References>
    </UADataType>    
    <UADataType NodeId="ns=1;s=P_VisString255" BrowseName="1:P_VisString255">
      <DisplayName>IEC61850P_VisString255</DisplayName>
      <Description>IEC 61850 Primitive DA Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=12</Reference>
      </References>
    </UADataType>   
<!--      
			<xs:enumeration value="Octet64"/>
			<xs:enumeration value="Unicode255"/>
-->     
    <UADataType NodeId="ns=1;s=P_Struct" BrowseName="1:P_Struct">
      <DisplayName>IEC61850P_Struct</DisplayName>
      <Description>IEC 61850 Primitive DA Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=22</Reference>
      </References>
    </UADataType>       
<!--
			<xs:enumeration value="EntryTime"/>
			<xs:enumeration value="Check"/>
			<xs:enumeration value="ObjRef"/>
			<xs:enumeration value="Currency"/>
			<xs:enumeration value="PhyComAddr"/>
			<xs:enumeration value="SvOptFlds"/> 
-->
    <UAVariable NodeId="ns=1;s=IEC62541DataTypeDictionary" BrowseName="1:IEC62541DataTypeDictionary" DataType="i=15">
      <DisplayName>IEC 62541 Data Type Dictionary</DisplayName>
      <Description>IEC 62541 Data Type Dictionary</Description>
      <References>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=72</Reference>
        <Reference ReferenceType="HasComponent" IsForward="false">i=93</Reference>
      </References>
    </UAVariable>  
<!--
Section 3: Create Derived Data Types and corresponding Variable Types
--> 
    <!--
    <UADataType NodeId="ns=1;s=Unit_No_MultiplierKind" BrowseName="1:Unit_No_MultiplierKind">
      <DisplayName>Unit_No_MultiplierKind</DisplayName>
      <Description>IEC 61850 Part 7-3 Unit_No_MultiplierKind Enum</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=22</Reference>
      </References>
    </UADataType> 
    -->
    <UADataType NodeId="ns=1;s=ComposedDADT" BrowseName="1:ComposedDADT">
      <DisplayName>ComposedDA</DisplayName>
      <Description>IEC 61850 Part 7-3 Composed DA Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=P_Struct</Reference>
      </References>
    </UADataType>
    <UADataType NodeId="ns=1;s=AnalogueValueDADT" BrowseName="1:AnalogueValueDADT">
      <DisplayName>AnalogueValue</DisplayName>
      <Description>IEC 61850 Part 7-3 AnalogueValue Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ComposedDADT</Reference>
      </References>
     <Definition Name="AnalogueValueDADT">
        <Field Name="i" DataType="ns=1;s=P_FLOAT32">
          <Description>TBD</Description>
        </Field>
        <Field Name="f" DataType="ns=1;s=P_FLOAT32">
          <Description>TBD</Description>
        </Field>
      </Definition>
    </UADataType>
    <UADataType NodeId="ns=1;s=VectorDADT" BrowseName="1:VectorDADT">
      <DisplayName>Vector</DisplayName>
      <Description>IEC 61850 Part 7-3 Vector Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ComposedDADT</Reference>
      </References>
      <Definition Name="VectorDADT">
        <Field Name="mag" DataType="ns=1;s=AnalogueValueDADT">
          <Description>TBD</Description>
        </Field>
        <Field Name="ang" DataType="ns=1;s=AnalogueValueDADT">
          <Description>TBD</Description>
        </Field>
      </Definition>
    </UADataType>
    
    <UADataType NodeId="ns=1;s=ControlBlockOptFieldsDT" BrowseName="1:ControlBlockOptFieldsDT">
      <DisplayName>IEC61850ControlBlockOptFields</DisplayName>
      <Description>IEC 61850 Part 7-3 ControlBlockOptFields Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=P_INT32U</Reference>
      </References>
    </UADataType>
    <UAVariableType NodeId="ns=1;s=ControlBlockOptFieldsPT" BrowseName="1:ControlBlockOptFieldsPT" DataType="ns=1;s=ControlBlockOptFieldsDT">
      <DisplayName>ControlBlockOptFields</DisplayName>
      <Description>IEC 61850 Part 6 ControlBlockOptFields Property Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BasePT</Reference>
      </References>
    </UAVariableType>
    <UADataType NodeId="ns=1;s=ControlBlockTrgOpsDT" BrowseName="1:ControlBlockTrgOpsDT">
      <DisplayName>IEC61850ControlBlockTrgOps</DisplayName>
      <Description>IEC 61850 Part 7-3 ControlBlockTrgOps Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=P_INT32U</Reference>
      </References>
    </UADataType>
    <UAVariableType NodeId="ns=1;s=ControlBlockTrgOpsPT" BrowseName="1:ControlBlockTrgOpsPT" DataType="ns=1;s=ControlBlockTrgOpsDT">
      <DisplayName>ControlBlockTrgOps</DisplayName>
      <Description>IEC 61850 Part 6 ControlBlockTrgOps Variable Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BasePT</Reference>
      </References>
    </UAVariableType>  
    
    <UADataType NodeId="ns=1;s=stValDADT" BrowseName="1:stValDADT">
      <DisplayName>IEC61850stVal</DisplayName>
      <Description>IEC 61850 Part 7-3 Status Value Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850FCDADT</Reference>
      </References>
    </UADataType>
    <UAVariableType NodeId="ns=1;s=stValDAVT" BrowseName="1:stValDAVT">
      <DisplayName>IEC61850stVal</DisplayName>
      <Description>IEC 61850 Part 7-3 Status Data Attribute Variable Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850FCDADVT</Reference>
      </References>
    </UAVariableType>    
    <!--
    <UAVariableType NodeId="ns=1;s=CMV_MAG_FLOATVT" BrowseName="1:CMV_MAG_FLOATVT" DataType="ns=1;s=CMV_MAG_FLOATDT">
      <DisplayName>CMV_MAG_FLOAT</DisplayName>
      <Description>IEC 61850 Part 7-3 Complex Measured Value MAG_FLOAT Variable Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=SubstitutionCDCVT</Reference>
      </References>
    </UAVariableType>
    <UADataType NodeId="ns=1;s=CMV_MAG_ANG_FLOATDT" BrowseName="1:CMV_MAG_ANG_FLOATDT">
      <DisplayName>CMV_MAG_ANG_FLOAT</DisplayName>
      <Description>IEC 61850 Part 7-3 Complex Measured Value MAG_ANG_FLOAT Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=CMVCDCDT</Reference>
      </References>
      <Definition Name="CMV_MAG_ANG_FLOATDT">
        <Field Name="cVal" DataType="ns=1;s=Vector_MagnitudeAngle_FloatDT">
          <Description>TBD</Description>
        </Field>
        <Field Name="q" DataType="ns=1;s=P_Quality">
          <Description>TBD</Description>
        </Field>
        <Field Name="t" DataType="ns=1;s=P_Timestamp">
          <Description>TDB</Description>
        </Field>
      </Definition>
    </UADataType>
    <UAVariableType NodeId="ns=1;s=CMV_MAG_ANG_FLOATVT" BrowseName="1:CMV_MAG_ANG_FLOATVT" DataType="ns=1;s=CMV_MAG_ANG_FLOATDT">
      <DisplayName>CMV_MAG_ANG_FLOAT</DisplayName>
      <Description>IEC 61850 Part 7-3 Complex Measured Value MAG_ANG_FLOAT Variable Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=SubstitutionCDCVT</Reference>
      </References>
    </UAVariableType>
    -->
  <!-- 
    <UADataType NodeId="ns=1;s=CMVDT" BrowseName="1:CMVDT">
      <DisplayName>IEC61850CMV</DisplayName>
      <Description>IEC 61850 Part 7-3 Complex Measured Value Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850FCDADataVariableType</Reference>
      </References>
      <Definition Name="CMVDT">
        <Field Name="cVal" DataType="ns=1;s=VectorDADT">
          <Description>TBD</Description>
        </Field>
        <Field Name="q" DataType="ns=1;s=P_Quality">
          <Description>TBD</Description>
        </Field>
        <Field Name="t" DataType="ns=1;s=P_Timestamp">
          <Description>TDB</Description>
        </Field>
      </Definition>
    </UADataType>
    <UAVariableType NodeId="ns=1;s=CMVVT" BrowseName="1:CMVVT" DataType="ns=1;s=CMVDT">
      <DisplayName>CMV</DisplayName>
      <Description>IEC 61850 Part 7-3 Complex Measured Value Variable Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=SubstitutionCDCVT</Reference>
      </References>
    </UAVariableType>
    -->
    <!--
    <UADataType NodeId="ns=1;s=stValModDT" BrowseName="1:stValModDT">
      <DisplayName>IEC61850stValModDT</DisplayName>
      <Description>IEC 61850 stValModDT</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850FCDADataType</Reference>
      </References>
    </UADataType>
    --> 
<!--
Section 4:
CREATE Abstract Data Variable and Property Super Types
-->
    <!--
    <UAVariableType NodeId="ns=1;s=IEC61850DAVT" BrowseName="1:IEC61850DAVT" DataType="ns=1;s=IEC61850DADT" IsAbstract="true">
      <DisplayName>IEC61850DA</DisplayName>
      <Description>IEC 61850 Part 7-3 Base Data Attribute Abstract Variable Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=62</Reference>
      </References>
    </UAVariableType>
    -->
    <UADataType NodeId="ns=1;s=IEC61850FCDDT" BrowseName="1:IEC61850FCDDT" IsAbstract="true">
      <DisplayName>IEC61850FCD</DisplayName>
      <Description>IEC 61850 Part 7-3 Functionally Constrained Data Abstract Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=22</Reference>
      </References>
    </UADataType>
    <UADataType NodeId="ns=1;s=IEC61850FCDADT" BrowseName="1:IEC61850FCDADT" IsAbstract="true">
      <DisplayName>IEC61850FCDA</DisplayName>
      <Description>IEC 61850 Part 7-3 Functionally Constrained Data Attribute Abstract Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=22</Reference>
      </References>
    </UADataType>
    <UAVariableType NodeId="ns=1;s=IEC61850FCDVT" BrowseName="1:IEC61850FCDVT" DataType="ns=1;s=IEC61850FCDDT" IsAbstract="true">
      <DisplayName>IEC61850FCD</DisplayName>
      <Description>IEC 61850 Part 7-3 Base Functionally Constrained Data Abstract Variable Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=63</Reference>
      </References>
    </UAVariableType>
    <!--
    <UAVariableType NodeId="ns=1;s=IEC61850BaseDVT" BrowseName="1:IEC61850BaseDVT" DataType="i=24" IsAbstract="true">
      <DisplayName>IEC61850Base</DisplayName>
      <Description>IEC 61850 Part 6 Base Abstract Data Variable Type</Description>
      <References>
         <Reference ReferenceType="HasSubtype" IsForward="false">i=63</Reference>
      </References>
    </UAVariableType>
    -->
    <UAVariableType NodeId="ns=1;s=FCDADVT" BrowseName="1:FCDADVT" DataType="ns=1;s=IEC61850FCDADT" IsAbstract="true">
      <DisplayName>IEC61850FCDA</DisplayName>
      <Description>IEC 61850 Part 7-3 Functionally Constrained Data Attribute Abstract Data Variable Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=63</Reference>
      </References>
    </UAVariableType>
    <UAVariableType NodeId="ns=1;s=IEC61850BasePT" BrowseName="1:IEC61850BasePT" DataType="i=24" IsAbstract="true">
      <DisplayName>IEC61850Base</DisplayName>
      <Description>IEC 61850 Part 6 Base Property Type</Description>
      <References>
         <Reference ReferenceType="HasSubtype" IsForward="false">i=68</Reference>
      </References>
    </UAVariableType>
    <UAVariableType NodeId="ns=1;s=FCDAPT" BrowseName="1:FCDAPT" DataType="ns=1;s=IEC61850FCDADT" IsAbstract="true">
      <DisplayName>IEC61850FCDA</DisplayName>
      <Description>IEC 61850 Part 7-3 Functionally Constrained Data Attribute Abstract Property Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=68</Reference>
      </References>
    </UAVariableType>
    <UAVariableType NodeId="ns=1;s=IEC61850FCDPT" BrowseName="1:IEC61850FCDPT" DataType="ns=1;s=IEC61850FCDDT" IsAbstract="true">
      <DisplayName>IEC61850FCD</DisplayName>
      <Description>IEC 61850 Part 7-3 Base Functionally Constrained Data Abstract Property Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=68</Reference>
      </References>
    </UAVariableType>
<!--
Section 5:
CREATE Reference Types
-->
    <UAReferenceType NodeId="ns=1;s=IEC61850BaseRT" BrowseName="1:IEC61850BaseRT" IsAbstract="true" Symmetric="false">
      <DisplayName>IEC61850Base</DisplayName>
      <Description>IEC 61850 Base Reference Type</Description>
      <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">i=47</Reference>
      </References>
      <InverseName>IEC61850ReferencedBy</InverseName>
    </UAReferenceType>
    <UAReferenceType NodeId="ns=1;s=HasLD" BrowseName="1:HasLD" Symmetric="false">
      <DisplayName>HasLD</DisplayName>
      <Description>IEC 61850 Server Contains Logical Device Reference Type</Description>
      <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseRT</Reference>
      </References>
      <InverseName>ContainedBy</InverseName>
    </UAReferenceType>
        <UAReferenceType NodeId="ns=1;s=HasFile" BrowseName="1:HasFile" Symmetric="false">
      <DisplayName>HasFile</DisplayName>
      <Description>IEC 61850 Server Contains File Reference Type</Description>
      <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseRT</Reference>
      </References>
      <InverseName>ContainedBy</InverseName>
    </UAReferenceType>
    <UAReferenceType NodeId="ns=1;s=HasLN" BrowseName="1:HasLN" Symmetric="false">
      <DisplayName>HasLN</DisplayName>
      <Description>IEC 61850 Logical Device Contains Logical Node Reference Type</Description>
      <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseRT</Reference>
      </References>
      <InverseName>ContainedBy</InverseName>
    </UAReferenceType>
    <UAReferenceType NodeId="ns=1;s=HasDO" BrowseName="1:HasDO" Symmetric="false">
      <DisplayName>HasDO</DisplayName>
      <Description>IEC 61850 Logical Node Contains Data Object Reference Type</Description>
      <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseRT</Reference>
      </References>
      <InverseName>ContainedBy</InverseName>
    </UAReferenceType>
    <UAReferenceType NodeId="ns=1;s=HasInstances" BrowseName="1:HasInstances" Symmetric="false">
      <DisplayName>HasIn</DisplayName>
      <Description>IEC 61850 Logical Node Contains Data Object Reference Type</Description>
      <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseRT</Reference>
      </References>
      <InverseName>ContainedBy</InverseName>
    </UAReferenceType>    
    <UAReferenceType NodeId="ns=1;s=HasDS" BrowseName="1:HasDS" Symmetric="false">
      <DisplayName>HasDS</DisplayName>
      <Description>IEC 61850 Logical Node Contains Data Set Reference Type</Description>
      <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseRT</Reference>
      </References>
      <InverseName>ContainedBy</InverseName>
    </UAReferenceType>    
    <UAReferenceType NodeId="ns=1;s=HasRCB" BrowseName="1:HasRCB" Symmetric="false">
      <DisplayName>HasRCB</DisplayName>
      <Description>IEC 61850 Logical Node Contains Report Control Block Reference Type</Description>
      <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseRT</Reference>
      </References>
      <InverseName>ContainedBy</InverseName>
    </UAReferenceType>
    
<!--  
Section 6:
CREATE abstract Data Types for CDCs
-->
    <UADataType NodeId="ns=1;s=IEC61850CDCDT" BrowseName="1:IEC61850CDCDT" IsAbstract="true">
      <DisplayName>IEC61850CDC</DisplayName>
      <Description>IEC 61850 Part 7-3 Abstract Base Common Data Class Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=22</Reference>
      </References>
    </UADataType>
    <UADataType NodeId="ns=1;s=ComposedCDCDT" BrowseName="1:ComposedCDCDT" IsAbstract="true">
      <DisplayName>Composed CDC</DisplayName>
      <Description>IEC 61850 Part 7-3 Composed Common Data Class Abstract Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850CDCDT</Reference>
      </References>
    </UADataType>
    <UADataType NodeId="ns=1;s=HarmonicMeasurandCDCDT" BrowseName="1:HarmonicMeasurandCDCDT" IsAbstract="true">
      <DisplayName>Harmonic Measurand CDC</DisplayName>
      <Description>IEC 61850 Part 7-3 Harmonic Measurand Common Data Class Abstract Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ComposedCDCDT</Reference>
      </References>
    </UADataType>
    <UADataType NodeId="ns=1;s=PrimitiveCDCDT" BrowseName="1:PrimitiveCDCDT" IsAbstract="true">
      <DisplayName>Primitive CDC</DisplayName>
      <Description>IEC 61850 Part 7-3 Primitive Common Data Class Abstract Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850CDCDT</Reference>
      </References>
    </UADataType>
    <UADataType NodeId="ns=1;s=SubstitutionCDCDT" BrowseName="1:SubstitutionCDCDT" IsAbstract="true">
      <DisplayName>Substitution CDC</DisplayName>
      <Description>IEC 61850 Part 7-3 Substitution Common Data Class Abstract Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=PrimitiveCDCDT</Reference>
      </References>
    </UADataType>
    <UADataType NodeId="ns=1;s=ControllableCDCDT" BrowseName="1:ControllableCDCDT" IsAbstract="true">
      <DisplayName>Controllable CDC</DisplayName>
      <Description>IEC 61850 Part 7-3 Controllable Common Data Class Abstract Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=SubstitutionCDCDT</Reference>
      </References>
    </UADataType>
    <!--    
    <UADataType NodeId="ns=1;s=BaseDODataType" BrowseName="1:BaseDODataType" IsAbstract="true">
      <DisplayName>IEC61850Base Data Object Data Type</DisplayName>
      <Description>IEC 61850 Base Data Object Data Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=22</Reference>
      </References>
    </UADataType> 
    -->  
<!--  
Section 7:
CREATE abstract Variable Types for CDCs
-->
    <UAVariableType NodeId="ns=1;s=IEC61850CDCVT" BrowseName="1:IEC61850CDCVT" DataType="ns=1;s=IEC61850CDCDT" IsAbstract="true">
      <DisplayName>IEC61850CDC</DisplayName>
      <Description>IEC 61850 Part 7-3 Base Common Data Class Abstract Variable Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=62</Reference>
      </References>
    </UAVariableType>
    <UAVariableType NodeId="ns=1;s=ComposedCDCVT" BrowseName="1:ComposedCDCVT" DataType="ns=1;s=ComposedCDCDT" IsAbstract="true">
      <DisplayName>Composed CDC</DisplayName>
      <Description>IEC 61850 Part 7-3 Composed Common Data Class Abstract Variable Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850CDCVT</Reference>
      </References>
    </UAVariableType>
    <UAVariableType NodeId="ns=1;s=HarmonicMeasurandCDCVT" BrowseName="1:HarmonicMeasurandCDCVT" DataType="ns=1;s=HarmonicMeasurandCDCDT" IsAbstract="true">
      <DisplayName>Harmonic Measurand CD</DisplayName>
      <Description>IEC 61850 Part 7-3 Harmonic Measurand Common Data Class Abstract Variable Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ComposedCDCVT</Reference>
      </References>
    </UAVariableType>
    <UAVariableType NodeId="ns=1;s=PrimitiveCDCVT" BrowseName="1:PrimitiveCDCVT" DataType="ns=1;s=PrimitiveCDCDT" IsAbstract="true">
      <DisplayName>Primitive CDC</DisplayName>
      <Description>IEC 61850 Part 7-3 Primitive Common Data Class Abstract Variable Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850CDCVT</Reference>
      </References>
    </UAVariableType>
    <UAVariableType NodeId="ns=1;s=SubstitutionCDCVT" BrowseName="1:SubstitutionCDCVT" DataType="ns=1;s=SubstitutionCDCDT" IsAbstract="true">
      <DisplayName>Substitution CDC</DisplayName>
      <Description>IEC 61850 Part 7-3 Substitution Common Data Class Abstract Variable Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=PrimitiveCDCVT</Reference>
      </References>
    </UAVariableType>
    <UAVariableType NodeId="ns=1;s=ControllableCDCVT" BrowseName="1:ControllableCDCVT" DataType="ns=1;s=ControllableCDCDT" IsAbstract="true">
      <DisplayName>Controllable CDC</DisplayName>
      <Description>IEC 61850 Part 7-3 Controllable Common Data Class Abstract Variable Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=SubstitutionCDCVT</Reference>
      </References>
    </UAVariableType> 
    <!--
    <UAVariableType NodeId="ns=1;s=IEC61850BaseDOVariableType" BrowseName="1:IEC61850BaseDOVariableType" DataType="ns=1;s=tDT" IsAbstract="true">
      <DisplayName>IEC61850Base Data Object Variable Type</DisplayName>
      <Description>IEC 61850 Part 7-3 Base Data Object Variable Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=62</Reference>
      </References>
    </UAVariableType>
    -->
<!--
Section 8:
CREATE Abstract Object Types for CDCs
--> 

    <UAObjectType NodeId="ns=1;s=IEC61850NamedOT" BrowseName="1:IEC61850NamedOT" IsAbstract="true">
      <DisplayName>IEC61850Named Object Type</DisplayName>
      <Description>IEC 61850 Base Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">i=58</Reference>
      </References>
    </UAObjectType> 
    <UAObjectType NodeId="ns=1;s=Log" BrowseName="1:Log">
      <DisplayName>Log Object Type</DisplayName>
      <Description>IEC 61850 Log Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850NamedOT</Reference>
      </References>
    </UAObjectType> 
    <!--
    <UAObjectType NodeId="ns=1;s=CDC" BrowseName="1:CDC" IsAbstract="true">
      <DisplayName>Abstract CDC Object Type</DisplayName>
      <Description>IEC 61850 Part 7-3 Common Data Class Abstract Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850NamedOT</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=ComposedCDC" BrowseName="1:ComposedCDC" IsAbstract="true">
      <DisplayName>Abstract Composed CDC Object Type</DisplayName>
      <Description>IEC 61850 Part 7-3 Composed Common Data Abstract Class Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=CDC</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=PrimitiveCDC" BrowseName="1:PrimitiveCDC" IsAbstract="true">
      <DisplayName>Abstract Primitive CDC Object Type</DisplayName>
      <Description>IEC 61850 Part 7-3 Primitive Common Data Class Abstract Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=CDC</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=SubstitutionCDC" BrowseName="1:SubstitutionCDC" IsAbstract="true">
      <DisplayName>Abstract Substitution CDC Object Type</DisplayName>
      <Description>IEC 61850 Part 7-3 Substitution Common Data Class Abstract Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=PrimitiveCDC</Reference>
      </References>
    </UAObjectType>
    -->
<!--
Section 9:
CREATE Concrete Object Types and Object Folders for Logical Device and Logical Node
-->
    <UAObjectType NodeId="ns=1;s=LD" BrowseName="1:LD">
      <DisplayName>LD</DisplayName>
      <Description>IEC 61850 Part 6 LogicalDevice Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850NamedOT</Reference>
      </References>
    </UAObjectType>
    <UAObject NodeId="ns=1;s=LDs" BrowseName="1:LDs">
      <DisplayName>IEC61850 Logical Devices</DisplayName>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=61</Reference>
      </References>
    </UAObject>
    <UAObjectType NodeId="ns=1;s=LN" BrowseName="1:LN">
      <DisplayName>LN</DisplayName>
      <Description>IEC 61850 Base Part 7-4 Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850NamedOT</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=LN0" BrowseName="1:LN0">
      <DisplayName>LN0</DisplayName>
      <Description>IEC 61850 Part 7-4 Logical 0 Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=LN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=LNPHD" BrowseName="1:LNPHD">
      <DisplayName>LNPHD</DisplayName>
      <Description>IEC 61850 Base Part 7-4 Physical Device Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=LN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=LNDOM" BrowseName="1:LNDOM">
      <DisplayName>LNDOM</DisplayName>
      <Description>IEC 61850 Part 7-4 Abstract Domain Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=LN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=DomainLN" BrowseName="1:DomainLN">
      <DisplayName>DomainLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Domain Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=LNDOM</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=StatisticsLN" BrowseName="1:StatisticsLN">
      <DisplayName>StatisticsLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Statistics Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=DomainLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=PortBindingLN" BrowseName="1:PortBindingLN">
      <DisplayName>PortBindingLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Port Binding Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=DomainLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=SubscriptionSupervisionLN" BrowseName="1:SubscriptionSupervisionLN">
      <DisplayName>SubscriptionSupervisionLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Subscription Supervision Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=DomainLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=NonProcessInterfaceLN" BrowseName="1:NonProcessInterfaceLN">
      <DisplayName>NonProcessInterfaceLN</DisplayName>
      <Description>IEC 61850 Part 7-4 NonProcess Interface Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=StatisticsLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=NonProcessControllingEquipmentInterfaceLN" BrowseName="1:NonProcessControllingEquipmentInterfaceLN">
      <DisplayName>NonProcessControllingEquipmentInterfaceLN</DisplayName>
      <Description>IEC 61850 Part 7-4 NonProcess Controlling Equipment Interface Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=NonProcessInterfaceLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=AlarmTripControlLN" BrowseName="1:AlarmTripControlLN">
      <DisplayName>AlarmTripControlLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Alarm Trip Control Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=StatisticsLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=FunctionLN" BrowseName="1:FunctionLN">
      <DisplayName>FunctionLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Function Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=StatisticsLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=EnergyLN" BrowseName="1:EnergyLN">
      <DisplayName>EnergyLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Energy Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=FunctionLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=EquipmentInterfaceLN" BrowseName="1:EquipmentInterfaceLN">
      <DisplayName>EquipmentInterfaceLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Equipment Interface Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=FunctionLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=CmdEquipmentInterfaceLN" BrowseName="1:CmdEquipmentInterfaceLN">
      <DisplayName>CmdEquipmentInterfaceLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Command Equipment Interface Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=EquipmentInterfaceLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=ConductorLN" BrowseName="1:ConductorLN">
      <DisplayName>ConductorLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Conductor Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=EquipmentInterfaceLN</Reference>
      </References>
    </UAObjectType> 
    <UAObjectType NodeId="ns=1;s=InstrumentTransformerLN" BrowseName="1:InstrumentTransformerLN">
      <DisplayName>InstrumentTransformerLN</DisplayName>
      <Description>IEC 61850 Part 7-4 InstrumentTransformer Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=EquipmentInterfaceLN</Reference>
      </References>
    </UAObjectType> 
    <UAObjectType NodeId="ns=1;s=SensorLN" BrowseName="1:SensorLN">
      <DisplayName>SensorLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Sensor Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=EquipmentInterfaceLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=SwitchingEquipmentLN" BrowseName="1:SwitchingEquipmentLN">
      <DisplayName>SwitchingEquipmentLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Switching Equipment Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=EquipmentInterfaceLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=FuntionOutputLN" BrowseName="1:FuntionOutputLN">
      <DisplayName>FuntionOutputLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Funtion Output Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=FunctionLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=HarmonicsLN" BrowseName="1:HarmonicsLN">
      <DisplayName>HarmonicsLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Harmonics Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=FunctionLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=LeakageLevelSupervisionLN" BrowseName="1:LeakageLevelSupervisionLN">
      <DisplayName>LeakageLevelSupervisionLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Leakage Level Supervision Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=FunctionLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=PowerQualityLN" BrowseName="1:PowerQualityLN">
      <DisplayName>PowerQualityLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Power Quality Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=FunctionLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=UnbalanceDetectionLN" BrowseName="1:UnbalanceDetectionLN">
      <DisplayName>UnbalanceDetectionLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Unbalance Detection Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=PowerQualityLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=ProtectionLN" BrowseName="1:ProtectionLN">
      <DisplayName>ProtectionLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Protection Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=FunctionLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=CurrentProtectionLN" BrowseName="1:CurrentProtectionLN">
      <DisplayName>CurrentProtectionLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Current Protection Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ProtectionLN</Reference>
      </References>
    </UAObjectType> 
    <UAObjectType NodeId="ns=1;s=EarthfaultProtectionLN" BrowseName="1:EarthfaultProtectionLN">
      <DisplayName>EarthfaultProtectionLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Earthfault Protection Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ProtectionLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=FrequencyProtectionLN" BrowseName="1:FrequencyProtectionLN">
      <DisplayName>FrequencyProtectionLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Frequency Protection Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ProtectionLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=GeneratorProtectionLN" BrowseName="1:GeneratorProtectionLN">
      <DisplayName>GeneratorProtectionLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Generator Protection Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ProtectionLN</Reference>
      </References>
    </UAObjectType> 
    <UAObjectType NodeId="ns=1;s=MotorStartupProtectionLN" BrowseName="1:MotorStartupProtectionLN">
      <DisplayName>MotorStartupProtectionLN</DisplayName>
      <Description>IEC 61850 Part 7-4 MotorStartup Protection Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ProtectionLN</Reference>
      </References>
    </UAObjectType> 
    <UAObjectType NodeId="ns=1;s=PowerFactorProtectionLN" BrowseName="1:PowerFactorProtectionLN">
      <DisplayName>PowerFactorProtectionLN</DisplayName>
      <Description>IEC 61850 Part 7-4 PowerFactor Protection Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ProtectionLN</Reference>
      </References>
    </UAObjectType> 
    <UAObjectType NodeId="ns=1;s=PowerProtectionLN" BrowseName="1:PowerProtectionLN">
      <DisplayName>PowerProtectionLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Power Protection Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ProtectionLN</Reference>
      </References>
    </UAObjectType> 
    <UAObjectType NodeId="ns=1;s=VoltageProtectionLN" BrowseName="1:VoltageProtectionLN">
      <DisplayName>VoltageProtectionLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Voltage Protection Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ProtectionLN</Reference>
      </References>
    </UAObjectType> 
    <UAObjectType NodeId="ns=1;s=RecorderLN" BrowseName="1:RecorderLN">
      <DisplayName>RecorderLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Recorder Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=FunctionLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=DRChannelLN" BrowseName="1:DRChannelLN">
      <DisplayName>DRChannelLN</DisplayName>
      <Description>IEC 61850 Part 7-4 DRChannel Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=RecorderLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=SupervisionLN" BrowseName="1:SupervisionLN">
      <DisplayName>SupervisionLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Supervision Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=FunctionLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=LineSupervisionLN" BrowseName="1:LineSupervisionLN">
      <DisplayName>LineSupervisionLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Line Supervision Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=SupervisionLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=SwitchgearSupervisionLN" BrowseName="1:SwitchgearSupervisionLN">
      <DisplayName>SwitchgearSupervisionLN</DisplayName>
      <Description>IEC 61850 Part 7-4 SwitchgearSupervisionLN Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=SupervisionLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=ThresholdLN" BrowseName="1:ThresholdLN">
      <DisplayName>ThresholdLN</DisplayName>
      <Description>IEC 61850 Part 7-4 ThresholdLN Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=FunctionLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=ControllingLN" BrowseName="1:ControllingLN">
      <DisplayName>ControllingLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Controlling Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=FunctionLN</Reference>
      </References>
    </UAObjectType>
        <UAObjectType NodeId="ns=1;s=ControlledLN" BrowseName="1:ControlledLN">
      <DisplayName>ControlledLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Controlled Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ControllingLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=AutomaticControlLN" BrowseName="1:AutomaticControlLN">
      <DisplayName>AutomaticControlLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Automatic Control Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ControlledLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=BrakeLN" BrowseName="1:BrakeLN">
      <DisplayName>BrakeLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Brake Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ControlledLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=ControlEquipmentInterfaceLN" BrowseName="1:ControlEquipmentInterfaceLN">
      <DisplayName>ControlEquipmentInterfaceLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Control Equipment Interface Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ControlledLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=MediaSupervisionLN" BrowseName="1:MediaSupervisionLN">
      <DisplayName>MediaSupervisionLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Media Supervision Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ControlledLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=HydroControlLN" BrowseName="1:HydroControlLN">
      <DisplayName>HydroControlLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Hydro Control Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ControllingLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=GateLN" BrowseName="1:GateLN">
      <DisplayName>GateLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Gate Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=HydroControlLN</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=ValveLN" BrowseName="1:ValveLN">
      <DisplayName>ValveLN</DisplayName>
      <Description>IEC 61850 Part 7-4 Valve Logical Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=HydroControlLN</Reference>
      </References>
    </UAObjectType>
    <UAObject NodeId="ns=1;s=LNs" BrowseName="1:LNs">
      <DisplayName>IEC61850 Logical Nodes</DisplayName>
      <Description>IEC 61850 Part 7-4 Logical Nodes Folder</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=61</Reference>
      </References>
    </UAObject>
    <UAReferenceType NodeId="ns=1;s=LNode.SSeq"
                    BrowseName="1:LNode.SSeq"
                    IsAbstract="false"
                    Symmetric="false">
      <DisplayName>LNode.SSeq</DisplayName>
      <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseRT</Reference>
      </References>
      <InverseName>SSeq.LNode</InverseName>
    </UAReferenceType>
      <UAReferenceType NodeId="ns=1;s=SSeq.LNode"
                    BrowseName="1:SSeq.LNode"
                    IsAbstract="false"
                    Symmetric="false">
      <DisplayName>SSeq.LNode</DisplayName>
      <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseRT</Reference>
      </References>
      <InverseName>LNode.SSeq</InverseName>
    </UAReferenceType> 
<!--
Section 10:
CREATE Concrete Object Types and Object Folders for DS, RCB and FC's
-->      
    <UAObjectType NodeId="ns=1;s=DS" BrowseName="1:DS">
      <DisplayName>DS</DisplayName>
      <Description>IEC 61850 Part 6 DataSet Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850NamedOT</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=LNOwnedDS" BrowseName="1:LNOwnedDS">
      <DisplayName>LNOwnedDS</DisplayName>
      <Description>IEC 61850 Part 6 LN Owned DataSet Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=DS</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=ConfiguredDS" BrowseName="1:ConfiguredDS">
      <DisplayName>ConfiguredDS</DisplayName>
      <Description>IEC 61850 Part 6 Configured DataSet Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=LNOwnedDS</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=PersistentDS" BrowseName="1:PersistentDS">
      <DisplayName>PersistentDS</DisplayName>
      <Description>IEC 61850 Part 6 Persistent DataSet Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=LNOwnedDS</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=NonPersistentDS" BrowseName="1:NonPersistentDS">
      <DisplayName>NonPersistentDS</DisplayName>
      <Description>IEC 61850 Part 6 Nonpersistent DataSet Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=DS</Reference>
      </References>
    </UAObjectType>
    <UAObject NodeId="ns=1;s=DataSets" BrowseName="1:DataSets">
      <DisplayName>IEC61850 Data Sets</DisplayName>
      <Description>IEC 61850 Part 6 Data Sets Folder</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=61</Reference>
      </References>
    </UAObject>  
    
    <UAObjectType NodeId="ns=1;s=ControlBlock" BrowseName="1:ControlBlock">
      <DisplayName>ControlBlock</DisplayName>
      <Description>IEC 61850 Part 6 ControlBlock Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850NamedOT</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=GCB" BrowseName="1:GCB">
      <DisplayName>GCB</DisplayName>
      <Description>IEC 61850 Part 6 Goose Control Block Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ControlBlock</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=LCB" BrowseName="1:LCB">
      <DisplayName>LCB</DisplayName>
      <Description>IEC 61850 Part 6 Log Control Block Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ControlBlock</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=RCB" BrowseName="1:RCB">
      <DisplayName>RCB</DisplayName>
      <Description>IEC 61850 Part 6 Report Control Block Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ControlBlock</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=BRCB" BrowseName="1:BRCB">
      <DisplayName>BRCB</DisplayName>
      <Description>IEC 61850 Part 6 BufferedReport Control Block Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=RCB</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=URCB" BrowseName="1:URCB">
      <DisplayName>URCB</DisplayName>
      <Description>IEC 61850 Part 6 UnbufferedReport Control Block Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=RCB</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=SGCB" BrowseName="1:SGCB">
      <DisplayName>SGCB</DisplayName>
      <Description>IEC 61850 Part 6 Sampled Control Block Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ControlBlock</Reference>
      </References>
    </UAObjectType>
    <UAObjectType NodeId="ns=1;s=SVCB" BrowseName="1:SVCB">
      <DisplayName>SVCB</DisplayName>
      <Description>IEC 61850 Part 6 Sampled Values Control Block Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ControlBlock</Reference>
      </References>
    </UAObjectType>
    <UAObject NodeId="ns=1;s=Control Blocks" BrowseName="1:Control Blocks">
      <DisplayName>IEC61850 Control Blocks</DisplayName>
      <Description>IEC 61850 Part 6 Control Blocks Folder</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=61</Reference>
      </References>
    </UAObject>
  
    <UAObjectType NodeId="ns=1;s=FunctionalConstraint" BrowseName="1:FunctionalConstraint">
      <DisplayName>FunctionalConstraint</DisplayName>
      <Description>IEC 61850 FunctionalConstraint Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850NamedOT</Reference>
      </References>
    </UAObjectType>
    <UAObject NodeId="ns=1;s=Functional Constraints" BrowseName="1:Functional Constraints">
      <DisplayName>IEC61850 Functional Constraints</DisplayName>
      <Description>IEC 61850 Functional Constraints Folder</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=61</Reference>
      </References>
    </UAObject>
    <UAObject NodeId="ns=1;s=STFC" BrowseName="1:STFC">
      <DisplayName>ST Functional Constraint</DisplayName>
      <Description>ST Functional Constraint</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">ns=1;s=FunctionalConstraint</Reference>
      </References>
    </UAObject>
    <UAObject NodeId="ns=1;s=MXFC" BrowseName="1:MXFC">
      <DisplayName>MX Functional Constraint</DisplayName>
      <Description>MX Functional Constraint</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">ns=1;s=FunctionalConstraint</Reference>
      </References>
    </UAObject>
    <UAObject NodeId="ns=1;s=COFC" BrowseName="1:COFC">
      <DisplayName>CO Functional Constraint</DisplayName>
      <Description>CO Functional Constraint</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">ns=1;s=FunctionalConstraint</Reference>
      </References>
    </UAObject>
    <UAObject NodeId="ns=1;s=SPFC" BrowseName="1:SPFC">
      <DisplayName>SP Functional Constraint</DisplayName>
      <Description>SP Functional Constraint</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">ns=1;s=FunctionalConstraint</Reference>
      </References>
    </UAObject>
    <UAObject NodeId="ns=1;s=SVFC" BrowseName="1:SVFC">
      <DisplayName>SV Functional Constraint</DisplayName>
      <Description>SV Functional Constraint</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">ns=1;s=FunctionalConstraint</Reference>
      </References>
    </UAObject>
    <UAObject NodeId="ns=1;s=CFFC" BrowseName="1:CFFC">
      <DisplayName>CF Functional Constraint</DisplayName>
      <Description>CF Functional Constraint</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">ns=1;s=FunctionalConstraint</Reference>
      </References>
    </UAObject>
    <UAObject NodeId="ns=1;s=DCFC" BrowseName="1:DCFC">
      <DisplayName>DC Functional Constraint</DisplayName>
      <Description>DC Functional Constraint</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">ns=1;s=FunctionalConstraint</Reference>
      </References>
    </UAObject>
    <UAObject NodeId="ns=1;s=SGFC" BrowseName="1:SGFC">
      <DisplayName>SG Functional Constraint</DisplayName>
      <Description>SG Functional Constraint</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">ns=1;s=FunctionalConstraint</Reference>
      </References>
    </UAObject>
    <UAObject NodeId="ns=1;s=SEFC" BrowseName="1:SEFC">
      <DisplayName>SE Functional Constraint</DisplayName>
      <Description>SE Functional Constraint</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">ns=1;s=FunctionalConstraint</Reference>
      </References>
    </UAObject>
    <UAObject NodeId="ns=1;s=EXFC" BrowseName="1:EXFC">
      <DisplayName>EX Functional Constraint</DisplayName>
      <Description>EX Functional Constraint</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Functional Constraints</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">ns=1;s=FunctionalConstraint</Reference>
      </References>
    </UAObject>
 
<!--
Section 11:
CREATE Concrete Object Types, Variable Types, Instance Variables and Object Folders for IED, Access Point and Server
-->
    <UAObjectType NodeId="ns=1;s=SubNetwork" BrowseName="1:SubNetwork">
      <DisplayName>SubNetwork</DisplayName>
      <Description>IEC 61850 Part 6 SubNetwork Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850NamedOT</Reference>
      </References>
    </UAObjectType>
    <UAObject NodeId="ns=1;s=SubNetworks" BrowseName="1:SubNetworks">
      <DisplayName>IEC61850 SubNetworks</DisplayName>
      <Description>IEC 61850 Part 6 SubNetworks Folder</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=61</Reference>
      </References>
    </UAObject>
    <UAReferenceType NodeId="ns=1;s=HasAP"
                    BrowseName="1:HasAP"
                    IsAbstract="false"
                    Symmetric="false">
      <DisplayName>HasAP</DisplayName>
      <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseRT</Reference>
      </References>
      <InverseName>ConnectedTo</InverseName>
    </UAReferenceType> 
    <UAObjectType NodeId="ns=1;s=IED" BrowseName="1:IED">
      <DisplayName>IED</DisplayName>
      <Description>IEC 61850 Part 6 IED Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850NamedOT</Reference>
      </References>
    </UAObjectType>
    <UAVariableType NodeId="ns=1;s=IED.ConfigVersionPT" BrowseName="1:IED.ConfigVersionPT" DataType="ns=1;s=P_VisString255">
      <DisplayName>IED.ConfigVersion</DisplayName>
      <Description>IEC61850 IED.ConfigVersion Property Type</Description>
      <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BasePT</Reference>
      </References>
    </UAVariableType>
    <UAVariable NodeId="ns=1;s=IED.ConfigVersion" BrowseName="1:IED.ConfigVersion" DataType="ns=1;s=P_VisString255">
      <DisplayName>IED.ConfigVersion</DisplayName>
      <Description>IED.ConfigVersion Instance Variable</Description>
      <References>
        <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=IED</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=68</Reference>
      </References>
    </UAVariable>
    <UAVariableType NodeId="ns=1;s=IED.ManufacturerPT" BrowseName="1:IED.ManufacturerPT" DataType="ns=1;s=P_VisString255">
      <DisplayName>IED.Manufacturer</DisplayName>
      <Description>IEC61850 IED.Manufacturer Property Type</Description>
      <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BasePT</Reference>
      </References>
    </UAVariableType>
    <UAVariable NodeId="ns=1;s=IED.Manufacturer" BrowseName="1:IED.Manufacturer" DataType="ns=1;s=P_VisString255">
        <DisplayName>IED.Manufacturer</DisplayName>
        <Description>IED.Manufacturer Instance Variable</Description>
        <References>
          <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=IED</Reference>
          <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=68</Reference>
        </References>
    </UAVariable>
    <UAVariableType NodeId="ns=1;s=IED.TypePT" BrowseName="1:IED.TypePT" DataType="ns=1;s=P_VisString255">
      <DisplayName>IED.Type</DisplayName>
      <Description>IEC61850 IED.Type Property Type</Description>
      <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BasePT</Reference>
      </References>
    </UAVariableType>
    <UAVariable NodeId="ns=1;s=IED.Type" BrowseName="1:IED.Type" DataType="ns=1;s=P_VisString255">
        <DisplayName>IED.Type </DisplayName>
        <Description>IED.Type Instance Variable</Description>
        <References>
          <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=IED</Reference>
          <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=68</Reference>
        </References>
    </UAVariable>
    <UAObject NodeId="ns=1;s=IEDs" BrowseName="1:IEDs">
      <DisplayName>IEC61850 IEDs</DisplayName>
      <Description>IEC 61850 Part 6 IEDs Folder</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=61</Reference>
      </References>
    </UAObject>
 
    <UAObjectType NodeId="ns=1;s=AccessPoint" BrowseName="1:AccessPoint">
      <DisplayName>AccessPoint</DisplayName>
      <Description>IEC 61850 Part 6 AccessPoint Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850NamedOT</Reference>
      </References>
    </UAObjectType>
    <UAVariableType NodeId="ns=1;s=AccessPoint.routerPT" BrowseName="1:AccessPoint.routerPT" DataType="ns=1;s=P_BOOLEAN">
      <DisplayName>AccessPoint.router</DisplayName>
      <Description>IEC61850 AccessPoint.router Property Type</Description>
      <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BasePT</Reference>
      </References>
    </UAVariableType>
    <UAVariable NodeId="ns=1;s=AccessPoint.router" BrowseName="1:AccessPoint.router" DataType="ns=1;s=P_BOOLEAN">
      <DisplayName>AccessPoint.router</DisplayName>
      <Description>IEC61850 AccessPoint.router Instance Variable</Description>
      <References>
        <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=AccessPoint</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=68</Reference>
      </References>
    </UAVariable>
    <UAVariableType NodeId="ns=1;s=AccessPoint.clockPT" BrowseName="1:AccessPoint.clockPT" DataType="ns=1;s=P_BOOLEAN">
      <DisplayName>AccessPoint.clock</DisplayName>
      <Description>IEC61850 AccessPoint.clock Property Type</Description>
      <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BasePT</Reference>
      </References>
    </UAVariableType>
    <UAVariable NodeId="ns=1;s=AccessPoint.clock" BrowseName="1:AccessPoint.clock" DataType="ns=1;s=P_BOOLEAN">
      <DisplayName>AccessPoint.clock</DisplayName>
      <Description>IEC61850 AccessPoint.clock Instance Variable</Description>
      <References>
        <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=AccessPoint</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=68</Reference>
      </References>
    </UAVariable>
    <UAObject NodeId="ns=1;s=AccessPoints" BrowseName="1:AccessPoints">
      <DisplayName>IEC61850 Access Points</DisplayName>
      <Description>IEC 61850 Part 6 Access Points Folder</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=61</Reference>
      </References>
    </UAObject>
    <UAObjectType NodeId="ns=1;s=IEC61850Server" BrowseName="1:IEC61850Server">
      <DisplayName>IEC61850Server</DisplayName>
      <Description>IEC 61850 Part 6 Server Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850NamedOT</Reference>
      </References>
    </UAObjectType>
    <UAVariableType NodeId="ns=1;s=IEC61850Server.timeoutPT" BrowseName="1:IEC61850Server.timeoutPT" DataType="ns=1;s=P_INT32U">
      <DisplayName>Server.timeout</DisplayName>
      <Description>IEC61850 Server.timeout Property Type</Description>
      <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BasePT</Reference>
      </References>
    </UAVariableType>
    <UAVariable NodeId="ns=1;s=IEC61850Server.timeout" BrowseName="1:IEC61850Server.timeout" DataType="ns=1;s=P_INT32U">
      <DisplayName>Server.timeout</DisplayName>
      <Description>IEC61850 Server.timeout Instance Variable</Description>
      <References>
        <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=IEC61850Server</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=68</Reference>
      </References>
    </UAVariable>
    <UAObject NodeId="ns=1;s=IEC61850Servers" BrowseName="1:IEC61850Servers">
      <DisplayName>IEC61850 Servers</DisplayName>
      <Description>IEC 61850 Part 6 Servers Folder</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=61</Reference>
      </References>
    </UAObject>
    
<!--
Section 12:
CREATE Concrete Object Types, Variable Types, Instance Variables and Object Folders for objects above Logical Device
-->    
    <UAObjectType NodeId="ns=1;s=SS" BrowseName="1:SS">
      <DisplayName>Substation</DisplayName>
      <Description>IEC 61850 Part 6 Substation Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850NamedOT</Reference>
      </References>
    </UAObjectType>
    <UAObject NodeId="ns=1;s=SSs" BrowseName="1:SSs">
      <DisplayName>IEC61850 Substations</DisplayName>
      <Description>IEC 61850 Part 6 Substations Folder</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=61</Reference>
      </References>
    </UAObject>
  
    <UAObjectType NodeId="ns=1;s=VL" BrowseName="1:VL">
      <DisplayName>VoltageLevel</DisplayName>
      <Description>IEC 61850 Part 6 VoltageLevel Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850NamedOT</Reference>
      </References>
    </UAObjectType>
    <UAObject NodeId="ns=1;s=VLs" BrowseName="1:VLs">
      <DisplayName>IEC61850 VoltageLevels</DisplayName>
      <Description>IEC 61850 Part 6 Voltage Levels Folder</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=61</Reference>
      </References>
    </UAObject>
  
    <UAObjectType NodeId="ns=1;s=V" BrowseName="1:V">
      <DisplayName>Voltage</DisplayName>
      <Description>IEC 61850 Part 6 Voltage Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850NamedOT</Reference>
      </References>
    </UAObjectType>
    <UAObject NodeId="ns=1;s=Vs" BrowseName="1:Vs">
      <DisplayName>IEC61850 Voltages</DisplayName>
      <Description>IEC 61850 Part 6 Voltages Folder</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=61</Reference>
      </References>
    </UAObject>
  
    <UAObjectType NodeId="ns=1;s=XFR" BrowseName="1:XFR">
      <DisplayName>Power Transformer</DisplayName>
      <Description>IEC 61850 Part 6 Power Transformer Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850NamedOT</Reference>
      </References>
    </UAObjectType>
    <UAObject NodeId="ns=1;s=XFRs" BrowseName="1:XFRs">
      <DisplayName>IEC61850 Power Transformers</DisplayName>
      <Description>IEC 61850 Part 6 Transformers Folder</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=61</Reference>
      </References>
    </UAObject>
  
    <UAObjectType NodeId="ns=1;s=TW" BrowseName="1:TW">
      <DisplayName>TransformerWinding </DisplayName>
      <Description>IEC 61850 Part 6 TransformerWinding Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850NamedOT</Reference>
      </References>
    </UAObjectType>
    <UAObject NodeId="ns=1;s=TWs" BrowseName="1:TWs">
      <DisplayName>IEC61850 Transformer Windings</DisplayName>
      <Description>IEC 61850 Part 6 Transformer Windings Folder</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=61</Reference>
      </References>
    </UAObject>
  
    <UAObjectType NodeId="ns=1;s=Bay" BrowseName="1:Bay">
      <DisplayName>Bay</DisplayName>
      <Description>IEC 61850 Part 6 Bay Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850NamedOT</Reference>
      </References>
    </UAObjectType>
    <UAObject NodeId="ns=1;s=Bays" BrowseName="1:Bays">
      <DisplayName>IEC61850 Bays</DisplayName>
      <Description>IEC 61850 Part 6 Bays Folder</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=61</Reference>
      </References>
    </UAObject>
  
    <UAObjectType NodeId="ns=1;s=CE" BrowseName="1:CE">
      <DisplayName>Conducting Equipment</DisplayName>
      <Description>IEC 61850 Part 6 Conducting Equipment Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850NamedOT</Reference>
      </References>
    </UAObjectType>
    <UAObject NodeId="ns=1;s=CEs" BrowseName="1:CEs">
      <DisplayName>IEC61850 ConductingEquipment</DisplayName>
      <Description>IEC 61850 Part 6 Conducting Equipment Folder</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=61</Reference>
      </References>
    </UAObject>
  
    <UAObjectType NodeId="ns=1;s=SubE" BrowseName="1:SubE">
      <DisplayName>Sub Equipment</DisplayName>
      <Description>IEC 61850 Part 6 Sub Equipment Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=CE</Reference>
      </References>
    </UAObjectType>
    <UAObject NodeId="ns=1;s=SubEs" BrowseName="1:SubEs">
      <DisplayName>IEC61850 Sub Equipment</DisplayName>
      <Description>IEC 61850 Part 6 Sub Equipment Folder</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=61</Reference>
      </References>
    </UAObject>
  
    <UAObjectType NodeId="ns=1;s=T" BrowseName="1:T">
      <DisplayName>Terminal</DisplayName>
      <Description>IEC 61850 Part 6 Terminal Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850NamedOT</Reference>
      </References>
    </UAObjectType> 
    <UAReferenceType NodeId="ns=1;s=T.CN"
                    BrowseName="1:T.CN"
                    IsAbstract="false"
                    Symmetric="false">
      <DisplayName>Terminal.ConnectivityNode</DisplayName>
      <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseRT</Reference>
      </References>
      <InverseName>ConnectivityNode.Terminal</InverseName>
    </UAReferenceType> 
    <UAObject NodeId="ns=1;s=Ts" BrowseName="1:Ts">
      <DisplayName>IEC61850 Terminals</DisplayName>
      <Description>IEC 61850 Part 6 Terminals Folder</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=61</Reference>
      </References>
    </UAObject>
  
    <UAObjectType NodeId="ns=1;s=CN" BrowseName="1:CN">
      <DisplayName>Connectivity Node</DisplayName>
      <Description>IEC 61850 Part 6 Connectivity Node Object Type</Description>
      <References>
        <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850NamedOT</Reference>
      </References>
    </UAObjectType>
    <UAReferenceType NodeId="ns=1;s=CN.T"
                    BrowseName="1:CN.T"
                    IsAbstract="false"
                    Symmetric="false">
      <DisplayName>ConnectivityNode.Terminal</DisplayName>
      <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850BaseRT</Reference>
      </References>
      <InverseName>Terminal.ConnectivityNode</InverseName>
    </UAReferenceType>
    <UAObject NodeId="ns=1;s=CNs" BrowseName="1:CNs">
      <DisplayName>IEC61850 Connectivity Nodes</DisplayName>
      <Description>IEC 61850 Part 6 Connectivity Nodes Folder</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=61</Reference>
      </References>
    </UAObject>

<!--
Section 13:
Temporary DO and DA Folders for trouble shooting
-->
    <UAObject NodeId="ns=1;s=DOs" BrowseName="1:DOs">
      <DisplayName>IEC61850 Data Objects</DisplayName>
      <Description>IEC 61850 Part 7-3 Data Objects Folder</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=61</Reference>
      </References>
    </UAObject>
    <UAObject NodeId="ns=1;s=DAs" BrowseName="1:DAs">
      <DisplayName>IEC61850 Data Attributes</DisplayName>
      <Description>IEC 61850 Part 7-3 Data Attributes Folder</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=61</Reference>
      </References>
    </UAObject>
    <UAObject NodeId="ns=1;s=SDOs" BrowseName="1:SDOs">
      <DisplayName>IEC61850 Sub Data Objects</DisplayName>
      <Description>IEC 61850 Part 7-3 Sub Data Objects Folder</Description>
      <References>
        <Reference ReferenceType="Organizes" IsForward="false">i=85</Reference>
        <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=61</Reference>
      </References>
    </UAObject>

<!--**********************************************************************

Parse types for OPC UA type system

**********************************************************************-->
<!--
Section 14:
For the type tree under lnClasses:
Create object types for the standard lnClasses and their subtyped device LNodeTypes:
Create object, data types, variable types, and instance variables for each contained DO
Create references from each lnClass to their contained CDC variable instance.
Create references from each LNType to thier contained DO variable instance.
However, CDC and DOType related nodes are created below.
DOs are subtypes of DOTypes and DO instance variables appear under CDCs, 
but links from DOs to DOTypes and DOTypes to CDCs are done in section 14.
--> 
    <xsl:for-each-group select="//nsSCL:DataTypeTemplates/nsSCL:LNodeType" group-by="@lnClass">
		  <!-- Create LNClass Object Types--> 
      <xsl:choose>
        <xsl:when test="@lnClass=&apos;LN0&apos;">
          <UAObjectType NodeId="ns=1;s=LLN0" BrowseName="1:LLN0">
            <DisplayName>LLN0</DisplayName>
            <Description>IEC 61850 Part 7-4 Logical 0 Node Object Type</Description>
            <References>
              <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=LN0</Reference>
            </References>
          </UAObjectType>
        </xsl:when>
        <xsl:when test="@lnClass=&apos;LPHD&apos;">
          <UAObjectType NodeId="ns=1;s=LPHD" BrowseName="1:LPHD">
            <DisplayName>LPHD</DisplayName>
            <Description>IEC 61850 Base Part 7-4 Physical Device Logical Node Object Type</Description>
            <References>
              <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=LNPHD</Reference>
            </References>
          </UAObjectType>
        </xsl:when>
        <xsl:otherwise>
		      <UAObjectType>
			      <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@lnClass"/></xsl:attribute>
			      <xsl:attribute name="BrowseName">1:<xsl:value-of select="@lnClass"/></xsl:attribute>
			      <xsl:element name="DisplayName"><xsl:value-of select="@lnClass"/> LN</xsl:element>
			      <xsl:element name="Description"> IEC 61850 Logical Node Class</xsl:element>
			      <References>
              <xsl:choose>
                <xsl:when test="@lnClass=&apos;LBRI&apos;
                             or @lnClass=&apos;LCCF&apos;
                             or @lnClass=&apos;LCCH&apos;
                             or @lnClass=&apos;LTRK&apos;">              
                  <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=DomainLN</Reference>
                </xsl:when>
                <xsl:when test="@lnClass=&apos;IARC&apos;">            
                  <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=StatisticsLN</Reference>
                </xsl:when>
                <xsl:when test="@lnClass=&apos;LGOS&apos;
                             or @lnClass=&apos;LSVS&apos;">              
                  <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=SuscriptionLN</Reference>
                </xsl:when>
                <xsl:when test="@lnClass=&apos;KTNK&apos;
                             or @lnClass=&apos;ZAXN&apos;
                             or @lnClass=&apos;ZBAT&apos;
                             or @lnClass=&apos;ZBSH&apos;
                             or @lnClass=&apos;ZCOM&apos;
                             or @lnClass=&apos;ZGIL&apos;
                             or @lnClass=&apos;ZREA&apos;
                             or @lnClass=&apos;ZRES&apos;
                             or @lnClass=&apos;ZSAR&apos;
                             or @lnClass=&apos;ZSMC&apos;
                             or @lnClass=&apos;ZTCF&apos;
                             or @lnClass=&apos;ZTCR&apos;">              
                  <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=DomainLN</Reference>
                </xsl:when>
                <xsl:when test="@lnClass=&apos;GGIO&apos;">              
                  <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ControlEquipmentInterfaceLN</Reference>
                </xsl:when>
                <xsl:otherwise> 
                  <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=FunctionLN</Reference>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:for-each select="nsSCL:DO">
					      <!-- Add references from LNClass object types to DOType instances 
					      <Reference ReferenceType="ns=1;s=HasDO">ns=1;s=<xsl:value-of select="@type"/>DOInstance</Reference>-->
				      </xsl:for-each>
			      </References>
          </UAObjectType>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each-group>      
    <xsl:for-each select="//nsSCL:DataTypeTemplates">
		<xsl:for-each select="nsSCL:LNodeType">
			<!-- Create LNodeType Object Types --> 
			<UAObjectType>
				<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/></xsl:attribute>
				<xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/></xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="@id"/> LNodeType</xsl:element>
				<xsl:element name="Description"><xsl:value-of select="@desc"/> IEC 61850 LNodeType Object Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=<xsl:value-of select="@lnClass"/></Reference>
				</References>
			</UAObjectType>
			<!-- Create DO object types and subtype them from their DOType object types --> 
			<xsl:for-each select="nsSCL:DO">
      </xsl:for-each>
		</xsl:for-each>
    <xsl:for-each-group select="nsSCL:LNodeType/nsSCL:DO" group-by="@type">
	    <!-- Create DO variable types and DOType instance variables-->
      <!--
      <UAVariableType>
				<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@type"/>DOVT</xsl:attribute>
				<xsl:attribute name="BrowseName">1:<xsl:value-of select="@type"/>DOVT</xsl:attribute>
        <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@type"/>DODT</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="@type"/> DO</xsl:element>
        <xsl:element name="Description"><xsl:value-of select="@type"/> IEC 61850 Data Object Variable Type</xsl:element>
				<References>
          <xsl:choose>
            <xsl:when test="@type= &apos;CMV_MAG_FLOAT&apos;
                      or	@type=&apos;CMV_MAG_ANG_FLOAT&apos;
                      or	@type=&apos;MV_FLOAT&apos;   
                      or	@type=&apos;MV_FLOAT_D&apos;">
              <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=<xsl:value-of select="@type"/>CDCVT</Reference>
            </xsl:when>
            <xsl:otherwise>
              <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=<xsl:value-of select="@type"/>CDCVT</Reference>
            </xsl:otherwise>
          </xsl:choose>
				</References>
			</UAVariableType>
      -->
      <!--
      <UAVariable>
        <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@type"/>DOInstance</xsl:attribute>
        <xsl:attribute name="BrowseName">1:<xsl:value-of select="@type"/>DOInstance</xsl:attribute>
        <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@type"/>DODT</xsl:attribute>
        <xsl:element name="DisplayName"><xsl:value-of select="@type"/> DO</xsl:element>
        <xsl:element name="Description"><xsl:value-of select="@type"/> IEC 61850 Data Object Variable Instance</xsl:element>
        <References>
          <Reference ReferenceType="HasTypeDefinition" IsForward="true">ns=1;s=<xsl:value-of select="@type"/>DOVT</Reference>
          <Reference ReferenceType="ns=1;s=HasDO" IsForward="false">ns=1;s=<xsl:value-of select="../@lnClass"/></Reference>
        </References>
      </UAVariable>
      -->
    </xsl:for-each-group>
    <xsl:for-each select="nsSCL:LNodeType/nsSCL:DO">
      <!-- Create DO variable types and instances -->
      <UADataType> 
				<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../@id"/>.<xsl:value-of select="@name"/>DT</xsl:attribute>
				<xsl:attribute name="BrowseName">1:<xsl:value-of select="../@id"/>.<xsl:value-of select="@name"/>DT</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="../@id"/>.<xsl:value-of select="@name"/></xsl:element>
				<xsl:element name="Description"><xsl:value-of select="@name"/> IEC 61850 Data Object Data Type</xsl:element>        
        <References>
          <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850FCDDT</Reference>
        </References>
      </UADataType>
      <UAVariableType>
				<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../@id"/>.<xsl:value-of select="@name"/>VT</xsl:attribute>
				<xsl:attribute name="BrowseName">1:<xsl:value-of select="../@id"/>.<xsl:value-of select="@name"/>VT</xsl:attribute>
        <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="../@id"/>.<xsl:value-of select="@name"/>DT</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="../@id"/>.<xsl:value-of select="@name"/></xsl:element>
				<xsl:element name="Description"><xsl:value-of select="@name"/> IEC 61850 Data Object Variable Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=IEC61850FCDVT</Reference>
				</References>
			</UAVariableType>
      <UAVariable>
        <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../@id"/>.<xsl:value-of select="@name"/></xsl:attribute>
        <xsl:attribute name="BrowseName">1:<xsl:value-of select="../@id"/>.<xsl:value-of select="@name"/></xsl:attribute>
        <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="../@id"/>.<xsl:value-of select="@name"/>DT</xsl:attribute>
        <xsl:element name="DisplayName"><xsl:value-of select="../@id"/>.<xsl:value-of select="@name"/></xsl:element>
        <xsl:element name="Description"><xsl:value-of select="@name"/> IEC 61850 Data Object Variable Instance</xsl:element>
        <References>
          <Reference ReferenceType="HasTypeDefinition" IsForward="true">ns=1;s=<xsl:value-of select="../@id"/>.<xsl:value-of select="@name"/>VT</Reference>
          <Reference ReferenceType="ns=1;s=HasDO" IsForward="false">ns=1;s=<xsl:value-of select="../@id"/></Reference>
        </References>
      </UAVariable>
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
      <xsl:for-each-group select="nsSCL:DOType" group-by="@cdc">
        <!-- Create abstract CDC object types in CDC hierarchy-->
        <!--<Reference ReferenceType="HasEncoding">ns=1;s=<xsl:value-of select="@id"/>.Binary</Reference>-->
        <!--<Reference ReferenceType="HasEncoding">ns=1;s=<xsl:value-of select="@id"/>.Binary</Reference>-->
        <!--
        <UAObjectType>
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@cdc"/></xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="@cdc"/></xsl:attribute>
          <xsl:attribute name="IsAbstract">true</xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@cdc"/> CDC</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@cdc"/> IEC 61850 Common Data Class Object Type</xsl:element>
          <References>
            <xsl:choose>
              <xsl:when test="@cdc=&apos;DPS&apos;
                           or	@cdc=&apos;ENS&apos;
                           or	@cdc=&apos;INS&apos;
                           or	@cdc=&apos;SPS&apos;
                           or	@cdc=&apos;CMV&apos;
                           or	@cdc=&apos;MV&apos;">
                <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=SubstitutionCDC</Reference>
              </xsl:when>
              <xsl:otherwise>
                <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ComposedCDC</Reference>
              </xsl:otherwise>
            </xsl:choose>
          </References>
        </UAObjectType>
        -->
        <!-- Create abstract CDC data type in CDC hierarchy-->
        <UADataType>
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@cdc"/>CDCDT</xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="@cdc"/>CDCDT</xsl:attribute>
          <xsl:attribute name="IsAbstract">true</xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@cdc"/> CDC</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@cdc"/> IEC 61850 Common Data Class Abstract Data Type</xsl:element>
          <References>
            <xsl:choose>
              <xsl:when test="@cdc=&apos;DEL&apos;
                           or	@cdc=&apos;SEQ&apos;
                           or	@cdc=&apos;WYE&apos;">
                <!--<Reference ReferenceType="HasEncoding">ns=1;s=<xsl:value-of select="@id"/>.Binary</Reference>-->
                <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ComposedCDCDT</Reference>
              </xsl:when>
              <xsl:when test="@cdc=&apos;HDEL&apos;
                           or	@cdc=&apos;HMV&apos;
                           or	@cdc=&apos;HWYE&apos;">
                <!--<Reference ReferenceType="HasEncoding">ns=1;s=<xsl:value-of select="@id"/>.Binary</Reference>-->
                <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=HarmonicMeasurandCDCDT</Reference>
              </xsl:when>
              <xsl:when test="@cdc=&apos;DPS&apos;
                           or	@cdc=&apos;ENS&apos;
                           or	@cdc=&apos;INS&apos;
                           or	@cdc=&apos;SPS&apos;
                           or	@cdc=&apos;CMV&apos;
                           or	@cdc=&apos;MV&apos;">
                <!--<Reference ReferenceType="HasEncoding">ns=1;s=<xsl:value-of select="@id"/>.Binary</Reference>-->
                <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=SubstitutionCDCDT</Reference>
              </xsl:when>
              <xsl:when test="@cdc=&apos;APC&apos;
                           or	@cdc=&apos;BAC&apos;
                           or	@cdc=&apos;BSC&apos;
                           or	@cdc=&apos;DPC&apos;
                           or	@cdc=&apos;ENC&apos;
                           or	@cdc=&apos;INC&apos;
                           or	@cdc=&apos;ISC&apos;
                           or	@cdc=&apos;SPC&apos;
                           or	@cdc=&apos;TAG&apos;">
                <!--<Reference ReferenceType="HasEncoding">ns=1;s=<xsl:value-of select="@id"/>.Binary</Reference>-->
                <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ControllableCDCDT</Reference>
              </xsl:when>
              <xsl:otherwise>
                <!--<Reference ReferenceType="HasEncoding">ns=1;s=<xsl:value-of select="@id"/>.Binary</Reference>-->
                <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=PrimitiveCDCDT</Reference>
              </xsl:otherwise>
            </xsl:choose>
          </References>
        </UADataType>
        <UAVariableType>
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@cdc"/>CDCVT</xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="@cdc"/>CDCVT</xsl:attribute>
          <xsl:attribute name="IsAbstract">true</xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@cdc"/> CDC</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@cdc"/> IEC 61850 Common Data Class Abstract Variable Type</xsl:element>
          <References>
            <xsl:choose>
              <xsl:when test="@cdc=&apos;DEL&apos;
                           or	@cdc=&apos;SEQ&apos;
                           or	@cdc=&apos;WYE&apos;">
                <!--<Reference ReferenceType="HasEncoding">ns=1;s=<xsl:value-of select="@id"/>.Binary</Reference>-->
                <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ComposedCDCVT</Reference>
              </xsl:when>
              <xsl:when test="@cdc=&apos;HDEL&apos;
                           or	@cdc=&apos;HMV&apos;
                           or	@cdc=&apos;HWYE&apos;">
                <!--<Reference ReferenceType="HasEncoding">ns=1;s=<xsl:value-of select="@id"/>.Binary</Reference>-->
                <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=HarmonicMeasurandCDCVT</Reference>
              </xsl:when>
              <xsl:when test="@cdc=&apos;DPS&apos;
                           or	@cdc=&apos;ENS&apos;
                           or	@cdc=&apos;INS&apos;
                           or	@cdc=&apos;SPS&apos;
                           or	@cdc=&apos;CMV&apos;
                           or	@cdc=&apos;MV&apos;">
                <!--<Reference ReferenceType="HasEncoding">ns=1;s=<xsl:value-of select="@id"/>.Binary</Reference>-->
                <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=SubstitutionCDCVT</Reference>
              </xsl:when>
              <xsl:when test="@cdc=&apos;APC&apos;
                           or	@cdc=&apos;BAC&apos;
                           or	@cdc=&apos;BSC&apos;
                           or	@cdc=&apos;DPC&apos;
                           or	@cdc=&apos;ENC&apos;
                           or	@cdc=&apos;INC&apos;
                           or	@cdc=&apos;ISC&apos;
                           or	@cdc=&apos;SPC&apos;
                           or	@cdc=&apos;TAG&apos;">
                <!--<Reference ReferenceType="HasEncoding">ns=1;s=<xsl:value-of select="@id"/>.Binary</Reference>-->
                <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=ControllableCDCVT</Reference>
              </xsl:when>
              <xsl:otherwise>
                <!--<Reference ReferenceType="HasEncoding">ns=1;s=<xsl:value-of select="@id"/>.Binary</Reference>-->
                <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=PrimitiveCDCVT</Reference>
              </xsl:otherwise>
            </xsl:choose>
          </References>
        </UAVariableType>        
      </xsl:for-each-group>
    
			<xsl:for-each select="nsSCL:DOType">
        <!-- Create concrete DOType object types as a subtype of the CDC object type -->
        <!-- Add subtype reference from CDC object type to DOType Object Types -->        
        <!-- Add references from SDO and DA instance variables to DOType Object Types-->
        <!--
        <UAObjectType>
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/></xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/></xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@id"/> DO</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@desc"/> IEC 61850 DOType Object Type</xsl:element>
          <References>
            <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=<xsl:value-of select="@cdc"/></Reference>
            <xsl:for-each select="nsSCL:SDO">
              <Reference ReferenceType="ns=1;s=HasDO" IsForward="true">ns=1;s=<xsl:value-of select="@name"/>SDOInstance</Reference>
            </xsl:for-each>
            <xsl:for-each select="nsSCL:DA">
              <Reference ReferenceType="HasComponent" IsForward="true">ns=1;s=<xsl:value-of select="@name"/>DAInstance</Reference>
            </xsl:for-each>
          </References>         
        </UAObjectType>
        -->
        <!-- Create concrete DOType data and variable types for DOs and SDO subtyped of the CDC data types -->
        <UADataType>
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>DODT</xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/>DODT</xsl:attribute>
          <xsl:attribute name="IsAbstract">false</xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@id"/> DO</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@desc"/> IEC 61850 DO Data Type</xsl:element>
          <References>
            <Reference ReferenceType="HasEncoding">ns=1;s=<xsl:value-of select="@id"/>.Binary</Reference>
            <!-- Add references from DOType data type to CDC data type -->
            <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=<xsl:value-of select="@cdc"/>CDCDT</Reference>
          </References>
          <!-- Add SDO and DA fields to DOType data types -->
          <Definition>
            <xsl:attribute name="Name">1:<xsl:value-of select="@id"/>DODT</xsl:attribute>
            <xsl:for-each select="nsSCL:SDO">
              <Field>
                <xsl:attribute name="Name"><xsl:value-of select="@name"/></xsl:attribute>
                <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@type"/>DODT</xsl:attribute>
                <xsl:element name="Description"><xsl:value-of select="@desc"/> SDO in DOType</xsl:element>
              </Field>
            </xsl:for-each>
            <xsl:for-each select="nsSCL:DA">
              <Field>
                <xsl:attribute name="Name"><xsl:value-of select="@name"/></xsl:attribute>
							  <xsl:call-template name="BaseTypes">
                  <xsl:with-param name="PP_"><xsl:value-of select="@bType"/></xsl:with-param>
                  <xsl:with-param name="Ptype"><xsl:value-of select="@type"/></xsl:with-param>
                </xsl:call-template>
                <xsl:element name="Description">DA in DOType</xsl:element>
              </Field>
            </xsl:for-each>
          </Definition>
        </UADataType>
        <UAVariableType>
				  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>DOVT</xsl:attribute>
				  <xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/>DOVT</xsl:attribute>
          <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@id"/>DODT</xsl:attribute>
				  <xsl:element name="DisplayName"><xsl:value-of select="@id"/> DO</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@desc"/> IEC 61850 Data Object Variable Type</xsl:element>
				  <References>
            <xsl:choose>
              <xsl:when test="@cdc= &apos;CMV_MAG_FLOAT&apos;
                        or	@cdc=&apos;CMV_MAG_ANG_FLOAT&apos;
                        or	@cdc=&apos;MV_FLOAT&apos;   
                        or	@cdc=&apos;MV_FLOAT_D&apos;">
                <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=<xsl:value-of select="@cdc"/>CDCVT</Reference>
              </xsl:when>
              <xsl:otherwise>
                <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=<xsl:value-of select="@cdc"/>CDCVT</Reference>
              </xsl:otherwise>
            </xsl:choose>
				  </References>
			  </UAVariableType>
        <!-- Create Binary Encoding Object for DOType data types-->
        <UAObject>
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>.Binary</xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/>.Binary</xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@id"/>.Binary</xsl:element>
          <xsl:element name="Description">Binary Data Type Encoding for IEC 61850 Common Data Class Data Type</xsl:element>
          <References>
            <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=76</Reference>
            <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="@id"/>.Schema</Reference>
          </References>
        </UAObject>
        <!-- Create DTD to contain definition of each DOType data type-->
        <UAVariable>
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>.Schema</xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/>.Schema</xsl:attribute>
          <xsl:attribute name="DataType">String</xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@id"/>.Schema</xsl:element>
          <xsl:element name="Description">IEC 61850 CDC Data Type Description</xsl:element>
          <References>
            <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=69</Reference>
            <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=IEC62541DataTypeDictionary</Reference>
          </References>
        </UAVariable>
      </xsl:for-each>
<!--
Section 16:
For DAs within DOTypes
-->
      <xsl:for-each-group select="nsSCL:DOType/nsSCL:DA" group-by="@name">
        <xsl:choose>
          <xsl:when test="@name= &apos;stVal&apos;">
          </xsl:when>
          <xsl:otherwise>
            <!-- Create DA variable types -->
				    <UAVariableType>
					    <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>DAVT</xsl:attribute>
					    <xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/>DAVT</xsl:attribute>
              <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@name"/>DADT</xsl:attribute>
					    <xsl:element name="DisplayName"><xsl:value-of select="../@id"/>.<xsl:value-of select="@name"/></xsl:element>
              <xsl:element name="Description"><xsl:value-of select="@bType"/> IEC 61850 Data Attribute Variable Type</xsl:element>
					    <References> 
                <xsl:choose>
                  <xsl:when test="@fc=&apos;SV&apos;
						        or	@fc=&apos;CF&apos;
						        or	@fc=&apos;DC&apos;
                    or	@fc=&apos;SG&apos;
                    or	@fc=&apos;SE&apos;
                    or	@fc=&apos;EX&apos;
                    or	@fc=&apos;GO&apos;
                    or	@fc=&apos;GS&apos;">	
                    <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=FCDAPT</Reference>
                  </xsl:when>
                  <xsl:when test="@fc=&apos;ST&apos;
						        or	@fc=&apos;MX&apos;
						        or	@fc=&apos;CO&apos;
                    or	@fc=&apos;SP&apos;
                    or	@fc=&apos;BR&apos;
                    or	@fc=&apos;RP&apos;
                    or	@fc=&apos;LG&apos;
                    or	@fc=&apos;MS&apos;
                    or	@fc=&apos;US&apos;">	
                    <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=FCDADVT</Reference>
                  </xsl:when>
						      <xsl:otherwise>
                    <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=FCDADVT</Reference>
						      </xsl:otherwise>
                </xsl:choose>
					    </References>
				    </UAVariableType>
            <!-- Create DA data types --> 
            <UADataType>
              <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>DADT</xsl:attribute>
              <xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/>DADT</xsl:attribute>
              <xsl:element name="DisplayName"><xsl:value-of select="../@id"/>.<xsl:value-of select="@name"/></xsl:element>
              <xsl:element name="Description"><xsl:value-of select="@bType"/> IEC 61850 Data Attribute Data Type</xsl:element>
              <References>
                <Reference>
                  <xsl:attribute name="ReferenceType">HasSubtype</xsl:attribute>
                  <xsl:attribute name="IsForward">false</xsl:attribute>
                  <xsl:choose>
                    <xsl:when test="@name=&apos;stVal&apos;">
                      <xsl:value-of select="fn:string('ns=1;s=FCDADT')"/>
                    </xsl:when>
					          <xsl:when test="@bType=&apos;Enum&apos;">
                      <xsl:value-of select="fn:concat('ns=1;s=', fn:string(@type), 'Kind')"/>
                    </xsl:when>
                    <xsl:when test="@bType= &apos;Struct&apos;">
                      <xsl:value-of select="fn:concat('ns=1;s=', fn:string(@type), 'DT')"/>
                    </xsl:when>
						        <xsl:otherwise>
                      <xsl:value-of select="fn:concat('ns=1;s=P_', fn:string(@bType))"/>
						        </xsl:otherwise>
                  </xsl:choose>
                </Reference>
              </References>
            </UADataType>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each-group>

      <xsl:for-each-group select="nsSCL:DOType/nsSCL:DA" group-by="@name">
        <!-- Create DA instance variables -->
        <UAVariable>
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../@id"/>.<xsl:value-of select="@name"/></xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="../@id"/>.<xsl:value-of select="@name"/></xsl:attribute>
          <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@name"/>DADT</xsl:attribute>
          <!--
          <xsl:choose>
					  <xsl:when test="@bType=&apos;Enum&apos;">
              <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@type"/>DT</xsl:attribute>
            </xsl:when>
            <xsl:when test="@bType= &apos;Struct&apos;">
              <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@type"/>DT</xsl:attribute>
            </xsl:when>
						<xsl:otherwise>
						  <xsl:attribute name="DataType">ns=1;s=P_<xsl:value-of select="@bType"/></xsl:attribute>
						</xsl:otherwise>
          </xsl:choose>
          -->
          <xsl:element name="DisplayName"><xsl:value-of select="../@id"/>.<xsl:value-of select="@name"/></xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@bType"/> IEC 61850 Data Attribute Variable Instance</xsl:element>
          <References>
            <Reference ReferenceType="HasTypeDefinition" IsForward="true">ns=1;s=<xsl:value-of select="@name"/>DAVT</Reference>
            <Reference ReferenceType="ns=1;s=HasDA" IsForward="false">ns=1;s=<xsl:value-of select="../@id"/>DOVT</Reference>
          </References>
        </UAVariable>
      </xsl:for-each-group>  
      <!--<xsl:for-each select="nsSCL:DA">-->
          <!--<xsl:if test="@bType= &apos;Struct&apos;">
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
          </xsl:if>-->
        <!--<xsl:if test="@bType= &apos;Struct&apos;">
          <UAObject>
            <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>.Binary</xsl:attribute>
            <xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/>.Binary</xsl:attribute>
            <xsl:element name="DisplayName"><xsl:value-of select="@id"/>.Binary</xsl:element>
            <xsl:element name="Description">Binary Data Type Encoding</xsl:element>
            <References>
              <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=76</Reference>
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
              <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=69</Reference>
              <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=IEC62541DataTypeDictionary</Reference>
            </References>
          </UAVariable>
        </xsl:if>
      </xsl:for-each>-->
        
        <!--
Section 17:
For SDOs within DOTypes
-->
      <!--<xsl:for-each select="nsSCL:SDO">-->
        <!-- Create SDO instance variables -->
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
            <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=76</Reference>
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
            <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=69</Reference>
            <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=IEC62541DataTypeDictionary</Reference>
          </References>
        </UAVariable>
			</xsl:for-each>-->     
      <xsl:for-each-group select="nsSCL:DOType/nsSCL:SDO" group-by="@name">
				<!-- Create SDO variable types -->
				<UAVariableType>
					<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>DOVT</xsl:attribute>
					<xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/>DOVT</xsl:attribute>
          <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@type"/>DODT</xsl:attribute>
					<xsl:element name="DisplayName"><xsl:value-of select="@name"/> SDO</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@type"/> IEC 61850 Sub Data Object Variable Type</xsl:element>
				  <References>
					  <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=<xsl:value-of select="@type"/>DOVT</Reference>
				  </References>
				</UAVariableType>
      </xsl:for-each-group>
      <xsl:for-each-group select="nsSCL:DOType/nsSCL:SDO" group-by="@name">
				<!-- Create SDO instance variables -->
        <UAVariable>
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../@id"/>.<xsl:value-of select="@name"/></xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="../@id"/>.<xsl:value-of select="@name"/></xsl:attribute>
          <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@type"/>DODT</xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="../@id"/>.<xsl:value-of select="@name"/></xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@type"/> IEC 61850 Sub Data Object Variable Instance</xsl:element>
          <References>
            <Reference ReferenceType="HasTypeDefinition" IsForward="true">ns=1;s=<xsl:value-of select="@name"/>DOVT</Reference>
            <Reference ReferenceType="ns=1;s=HasSDO" IsForward="false">ns=1;s=<xsl:value-of select="../@id"/>DOVT</Reference>
          </References>
        </UAVariable>
      </xsl:for-each-group> 
    <!--</xsl:for-each>-->
    <!-- End of for-each DOTtype -->
<!--
Section 18:
Create data types for standalone DAs
-->     
		  <xsl:for-each select="nsSCL:DAType">
        <!--<xsl:if test="nsSCL:BDA/@bType=&apos;Struct&apos;">-->
			  <UADataType>
				  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>DT</xsl:attribute>
				  <xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/>DT</xsl:attribute>
				  <xsl:element name="DisplayName"><xsl:value-of select="@id"/></xsl:element>
				  <xsl:element name="Description"><xsl:value-of select="@desc"/> IEC 61850 Part 6 Struct BDA Data Type</xsl:element>
				  <References>
            <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=P_Struct</Reference>
          </References>
			  </UADataType>
        <!--</xsl:if>-->
        <xsl:for-each select="nsSCL:BDA">
          <!--
          <xsl:choose>   
            <xsl:when test="@bType=&apos;Enum&apos;">
			        <UADataType>
				        <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../@id"/>Kind</xsl:attribute>
				        <xsl:attribute name="BrowseName">1:<xsl:value-of select="../@id"/>Kind</xsl:attribute>
				        <xsl:element name="DisplayName"><xsl:value-of select="../@id"/>Kind</xsl:element>
				        <xsl:element name="Description"><xsl:value-of select="@desc"/> IEC 61850 Part 6 Enum BDA Data Type</xsl:element>
				        <References>
                  <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=<xsl:value-of select="@type"/>Kind</Reference>
                </References>
			        </UADataType>
            </xsl:when>
            <xsl:when test="@bType=&apos;Struct&apos;">
			        <UADataType>
				        <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../@id"/>DT</xsl:attribute>
				        <xsl:attribute name="BrowseName">1:<xsl:value-of select="../@id"/>DT</xsl:attribute>
				        <xsl:element name="DisplayName"><xsl:value-of select="../@id"/> Struct</xsl:element>
				        <xsl:element name="Description"><xsl:value-of select="@desc"/> IEC 61850 Part 6 Struct BDA Data Type</xsl:element>
				        <References>
                  <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=<xsl:value-of select="@type"/>DT</Reference>
                </References>
			        </UADataType>
		        </xsl:when>
            <xsl:otherwise>
              <UADataType>
				        <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../@id"/>DT</xsl:attribute>
				        <xsl:attribute name="BrowseName">1:<xsl:value-of select="../@id"/>DT</xsl:attribute>
				        <xsl:element name="DisplayName"><xsl:value-of select="../@id"/> Primitive</xsl:element>
				        <xsl:element name="Description"><xsl:value-of select="@desc"/> IEC 61850 Part 6 Primitive BDA Data Type</xsl:element>
				        <References>
                  <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=P_<xsl:value-of select="@bType"/></Reference>
                </References>
			        </UADataType>
						</xsl:otherwise>
          </xsl:choose>
          -->
        </xsl:for-each>  
		  </xsl:for-each>  
      
		  <xsl:for-each select="nsSCL:EnumType">
			  <UADataType>
				  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>Kind</xsl:attribute>
				  <xsl:attribute name="BrowseName"><xsl:value-of select="@id"/>Kind</xsl:attribute>
				  <DisplayName><xsl:value-of select="@id"/>Kind</DisplayName>
				  <Description><xsl:value-of select="@desc"/> Enum Data Type</Description>
				  <References>
					  <Reference ReferenceType="HasProperty">ns=1;s=<xsl:value-of select="@id"/>Kind.EnumStrings</Reference>
            <xsl:choose>
              <xsl:when test="@id= &apos;AutoRecSt&apos;">
                <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=P_AutoReclosingKind</Reference>
              </xsl:when>
              <xsl:when test="@id= &apos;Beh&apos;">
                <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=P_Enum</Reference>
              </xsl:when>
              <xsl:when test="@id= &apos;ctlModel&apos;">
                <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=P_Enum</Reference>
              </xsl:when>
              <xsl:when test="@id= &apos;Dbpos&apos;">
                <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=P_DbposKind</Reference>
              </xsl:when>
              <xsl:when test="@id= &apos;dir&apos;">
                <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=P_Enum</Reference>
              </xsl:when>
              <xsl:when test="@id= &apos;Health&apos;">
                <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=P_Enum</Reference>
              </xsl:when>
              <xsl:when test="@id= &apos;Mod&apos;">
                <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=P_Enum</Reference>
              </xsl:when>
              <xsl:when test="@id= &apos;seqT&apos;">
                <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=P_Enum</Reference>
              </xsl:when>
              <xsl:when test="@id= &apos;SIUnit&apos;">
                <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=P_SIUnitKind</Reference>
              </xsl:when>
              <xsl:otherwise>
                <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=P_Enum</Reference>
              </xsl:otherwise>
            </xsl:choose>
				  </References>
			  </UADataType>
			  <UAVariable>
				  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>Kind.EnumStrings</xsl:attribute>
				  <xsl:attribute name="BrowseName"><xsl:value-of select="@id"/>Kind.EnumStrings</xsl:attribute>
				  <xsl:attribute name="ParentNodeId">ns=1;s=<xsl:value-of select="@id"/>Kind</xsl:attribute>
				  <xsl:attribute name="DataType">i=7594</xsl:attribute>
				  <xsl:attribute name="ValueRank">1</xsl:attribute>
				  <DisplayName>
					  <xsl:value-of select="@id"/>Kind.EnumStrings</DisplayName>
				  <References>
					  <Reference ReferenceType="HasTypeDefinition" IsForward="true">i=68</Reference>
					  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@id"/>Enum</Reference>-->
				  </References>
				  <Value>
					  <ListOfExtensionObject xmlns="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd">
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
Section 19
Sub template for Basetypes
Create association between IEC 61850 data types and OPC UA data types
--> 
	<xsl:template name="BaseTypes">
    <xsl:param name="PP_"/>
    <xsl:param name="Ptype"/>
    <xsl:choose>
      <!-- if IEC 61850 data type is boolean then OPC UA data type id is 1 (OPC UA Boolean) -->
		  <xsl:when test="$PP_= &apos;BOOLEAN&apos;
		  or $PP_=&apos;INT8&apos;
		  or $PP_=&apos;INT16&apos;
		  or $PP_=&apos;INT24&apos;
		  or $PP_=&apos;INT32&apos;
		  or $PP_=&apos;INT128&apos;
		  or $PP_=&apos;INT8U&apos;
		  or $PP_=&apos;INT16U&apos;
		  or $PP_=&apos;INT24U&apos;
		  or $PP_=&apos;INT32U&apos;
		  or $PP_=&apos;FLOAT32&apos;
		  or $PP_=&apos;FLOAT64&apos;
      or $PP_=&apos;Dbpos&apos;
      or $PP_=&apos;Quality&apos;
      or $PP_=&apos;Timestamp&apos;
      or $PP_=&apos;VisString32&apos;
      or $PP_=&apos;VisString64&apos;
      or $PP_=&apos;VisString255&apos;">
			  <xsl:attribute name="DataType">ns=1;s=P_<xsl:value-of select="$PP_"/></xsl:attribute>
		  </xsl:when>
		  <xsl:when test="$PP_=&apos;Enum&apos;">
			  <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="$Ptype"/>Kind</xsl:attribute>
		  </xsl:when>
		  <xsl:when test="$PP_=&apos;Tcmd&apos;">
			  <xsl:attribute name="DataType">i=13</xsl:attribute>
		  </xsl:when>
		  <xsl:when test="$PP_=&apos;Octet64&apos;">
			  <xsl:attribute name="DataType">i=11</xsl:attribute>
		  </xsl:when>
		  <xsl:when test="$PP_=&apos;Struct&apos;">
			  <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="$Ptype"/>DT</xsl:attribute>
		  </xsl:when>
		  <xsl:when test="$PP_=&apos;EntryTime&apos;">
			  <xsl:attribute name="DataType">i=13</xsl:attribute>
		  </xsl:when>
		  <xsl:when test="$PP_=&apos;Unicode255&apos;">
			  <xsl:attribute name="DataType">i=12</xsl:attribute>
		  </xsl:when>
		  <xsl:otherwise>
		    <xsl:message>ERROR MESSAGE: This Data Type <xsl:value-of select="$PP_"/> is not supported</xsl:message>
	    </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>

