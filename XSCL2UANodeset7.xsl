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
             xmlns:uax="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd" 
             xsi:schemaLocation="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd file:///C:/UANodeSet.xsd">
    <NamespaceUris>
      <Uri>http://gcs.com/IEC61850Types</Uri>
      <Uri>http://gcs.com/IEC61850Instances</Uri>
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
Parse substation equipment instance data for instance tree
-->
    <xsl:for-each select="//nsSCL:Substation">
      <UAObject>
        <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@name"/></xsl:attribute>
        <xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/></xsl:attribute>
        <xsl:element name="DisplayName"><xsl:value-of select="@name"/> Substation</xsl:element>
        <xsl:element name="Description"><xsl:value-of select="@desc"/> Substation</xsl:element>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=SSs</Reference>
          <Reference ReferenceType="HasTypeDefinition">ns=1;s=SS</Reference>
        </References>
      </UAObject>
    </xsl:for-each>

    <xsl:for-each select="//nsSCL:Substation">
      <xsl:for-each select="nsSCL:VoltageLevel">
        <UAObject>
          <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/></xsl:attribute>
          <xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/></xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@name"/> Voltage Level</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@name"/> Voltage Level</xsl:element>
          <References>
            <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="../@name"/></Reference>
            <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=VLs</Reference>
            <Reference ReferenceType="HasTypeDefinition">ns=1;s=VL</Reference>
          </References>
        </UAObject>
        <xsl:for-each select="nsSCL:Voltage">
          <UAObject>
            <xsl:attribute name="NodeId">ns=2;s=<xsl:sequence select="fn:string(.)"/>
              <xsl:value-of select="@multiplier"/>
              <xsl:value-of select="@unit"/>
            </xsl:attribute>
            <xsl:attribute name="BrowseName">2:<xsl:sequence select="fn:string(.)"/>
              <xsl:value-of select="@multiplier"/>
              <xsl:value-of select="@unit"/>
            </xsl:attribute>
            <xsl:element name="DisplayName"><xsl:sequence select="fn:string(.)"/>
              <xsl:value-of select="@multiplier"/>
              <xsl:value-of select="@unit"/> Voltage</xsl:element>
            <xsl:element name="Description"><xsl:sequence select="fn:string(.)"/>
              <xsl:value-of select="@multiplier"/>
              <xsl:value-of select="@unit"/> Voltage</xsl:element>
            <References>
              <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/></Reference>
              <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Vs</Reference>
              <Reference ReferenceType="HasTypeDefinition">ns=1;s=V</Reference>
            </References>
          </UAObject>
        </xsl:for-each>
      </xsl:for-each>
    </xsl:for-each>

    <xsl:for-each select="//nsSCL:Substation/nsSCL:VoltageLevel">
      <xsl:for-each select="nsSCL:PowerTransformer">
        <UAObject>
          <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/></xsl:attribute>
          <xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/></xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@name"/> Power Transformer</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@type"/> Type Power Transformer</xsl:element>
          <References>
            <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/></Reference>
            <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=XFRs</Reference>
            <Reference ReferenceType="HasTypeDefinition">ns=1;s=XFR</Reference>
          </References>
        </UAObject>
        <xsl:for-each select="nsSCL:LNode">
          <xsl:call-template name="ProcessLNode">
            <xsl:with-param name="PLN"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/></xsl:with-param>
            <xsl:with-param name="PLNI"><xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/></xsl:with-param>
            <xsl:with-param name="PIED"><xsl:value-of select="@iedName"/></xsl:with-param>
            <xsl:with-param name="PSSeq"><xsl:value-of select="../../../@name"/>/<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/></xsl:with-param>
          </xsl:call-template>
       </xsl:for-each> 
        <xsl:for-each select="nsSCL:TransformerWinding">
          <UAObject>
            <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../../@name"/>/<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/></xsl:attribute>
            <xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/></xsl:attribute>
            <xsl:element name="DisplayName"><xsl:value-of select="@name"/> Transformer Winding</xsl:element>
              <xsl:element name="Description"><xsl:value-of select="@type"/> Transformer Winding</xsl:element>
            <References>
              <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="../../../@name"/>/<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/></Reference>
              <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=TWs</Reference>
              <Reference ReferenceType="HasTypeDefinition">ns=1;s=TW</Reference>
            </References>
          </UAObject>
          <xsl:for-each select="nsSCL:Terminal">
            <xsl:call-template name="ProcessTerminal">
              <xsl:with-param name="PSSeq"><xsl:value-of select="../../../../@name"/>/<xsl:value-of select="../../../@name"/>/<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/></xsl:with-param>
              <xsl:with-param name="PcNodeName"><xsl:value-of select="@cNodeName"/></xsl:with-param>
              <xsl:with-param name="PconnectivityNode"><xsl:value-of select="@connectivityNode"/></xsl:with-param>
            </xsl:call-template>
          </xsl:for-each>
        </xsl:for-each>
      </xsl:for-each>
    </xsl:for-each>
      
    <xsl:for-each select="//nsSCL:Substation/nsSCL:VoltageLevel">
      <xsl:for-each select="nsSCL:Bay">
        <UAObject>
          <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/></xsl:attribute>
          <xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/></xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@name"/> Bay</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@name"/> Bay</xsl:element>
          <References>
              <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/></Reference>
              <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Bays</Reference>
              <Reference ReferenceType="HasTypeDefinition">ns=1;s=Bay</Reference>
          </References>
        </UAObject>
        <xsl:for-each select="nsSCL:LNode">
          <xsl:call-template name="ProcessLNode">
            <xsl:with-param name="PLN"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/></xsl:with-param>
            <xsl:with-param name="PLNI"><xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/></xsl:with-param>
            <xsl:with-param name="PIED"><xsl:value-of select="@iedName"/></xsl:with-param>
            <xsl:with-param name="PSSeq"><xsl:value-of select="../../../@name"/>/<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each> 
        <xsl:for-each select="nsSCL:ConductingEquipment">
          <UAObject>
            <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../../@name"/>/<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/></xsl:attribute>
            <xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/></xsl:attribute>
            <xsl:element name="DisplayName"><xsl:value-of select="@name"/> Conducting Equipment</xsl:element>
            <xsl:element name="Description"><xsl:value-of select="@type"/> Type Conducting Equipment</xsl:element>
            <References>
              <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="../../../@name"/>/<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/></Reference>
              <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=CEs</Reference>
              <Reference ReferenceType="HasTypeDefinition">ns=1;s=CE</Reference>
            </References>
          </UAObject>
          <xsl:for-each select="nsSCL:LNode">
           <xsl:call-template name="ProcessLNode">
            <xsl:with-param name="PLN"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/></xsl:with-param>
             <xsl:with-param name="PLNI"><xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/></xsl:with-param>
            <xsl:with-param name="PIED"><xsl:value-of select="@iedName"/></xsl:with-param>
             <xsl:with-param name="PSSeq"><xsl:value-of select="../@name"/><xsl:value-of select="../@type"/></xsl:with-param>
           </xsl:call-template>
          </xsl:for-each> 
        </xsl:for-each>
      </xsl:for-each>
      <xsl:for-each select="nsSCL:ConnectivityNode">
        <xsl:call-template name="ProcessConnectivityNode">
          <xsl:with-param name="PPconnectivityNode"><xsl:value-of select="@connectivityNode"/></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
    </xsl:for-each>       

    <xsl:for-each select="//nsSCL:Substation/nsSCL:VoltageLevel/nsSCL:Bay/nsSCL:ConductingEquipment">
      <xsl:for-each select="nsSCL:LNode">
        <xsl:call-template name="ProcessLNode">
          <xsl:with-param name="PLN"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/></xsl:with-param>
          <xsl:with-param name="PLNI"><xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/></xsl:with-param>
          <xsl:with-param name="PIED"><xsl:value-of select="@iedName"/></xsl:with-param>
          <xsl:with-param name="PSSeq"><xsl:value-of select="../../../../@name"/>/<xsl:value-of select="../../../@name"/>/<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each> 
      <xsl:for-each select="nsSCL:Terminal">
        <xsl:call-template name="ProcessTerminal">
          <xsl:with-param name="PSSeq"><xsl:value-of select="../../../../@name"/>/<xsl:value-of select="../../../@name"/>/<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/></xsl:with-param>
          <xsl:with-param name="PcNodeName"><xsl:value-of select="@cNodeName"/></xsl:with-param>    
          <xsl:with-param name="PconnectivityNode"><xsl:value-of select="@connectivityNode"/></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      <xsl:for-each select="nsSCL:SubEquipment">
        <UAObject>
          <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../../../@name"/>/<xsl:value-of select="../../../@name"/>/<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/></xsl:attribute>
          <xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/></xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@name"/> Sub Equipment</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@phase"/> Phase Sub Equipment</xsl:element>
          <References>
            <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="../../../../@name"/>/<xsl:value-of select="../../../@name"/>/<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/></Reference>
            <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=SubEs</Reference>
            <Reference ReferenceType="HasTypeDefinition">ns=1;s=SubE</Reference>
          </References>
        </UAObject>
        <xsl:for-each select="nsSCL:LNode">
          <xsl:call-template name="ProcessLNode">
            <xsl:with-param name="PLN"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/></xsl:with-param>
            <xsl:with-param name="PLNI"><xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/></xsl:with-param>
            <xsl:with-param name="PIED"><xsl:value-of select="@iedName"/></xsl:with-param>
            <xsl:with-param name="PSSeq"><xsl:value-of select="../../../../../@name"/>/<xsl:value-of select="../../../../@name"/>/<xsl:value-of select="../../../@name"/>/<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/></xsl:with-param>
          </xsl:call-template>
       </xsl:for-each> 
      </xsl:for-each>
    </xsl:for-each>
<!--
Section 2:
Parse IED instances for instance tree 
-->	
    <xsl:for-each select="//nsSCL:SubNetwork">
      <UAObject>
        <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@name"/></xsl:attribute>
        <xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/></xsl:attribute>
        <xsl:element name="DisplayName"><xsl:value-of select="@name"/> SubNetwork</xsl:element>
        <xsl:element name="Description"><xsl:value-of select="@desc"/> SubNetwork</xsl:element>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=SubNetworks</Reference>
          <Reference ReferenceType="HasTypeDefinition">ns=1;s=SubNetwork</Reference>
          <Reference ReferenceType="ns=1;s=HasAP" IsForward="true">ns=2;s=<xsl:value-of select="nsSCL:ConnectedAP/@iedName"/>/<xsl:value-of select="nsSCL:ConnectedAP/@apName"/></Reference>
        </References>
      </UAObject>
      <UAVariable>
			  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@name"/>.type</xsl:attribute>
			  <xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/>.type</xsl:attribute>
			  <xsl:attribute name="DataType">ns=1;s=P_VisString255</xsl:attribute>
			  <xsl:element name="DisplayName">Type</xsl:element>
			  <Description/>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="@name"/></Reference>
			  </References>
			  <Value>
				  <String>
					  <xsl:value-of select="@type"/>
				  </String>
			  </Value>
		  </UAVariable>
    </xsl:for-each>
    
    <xsl:for-each select="//nsSCL:SubNetwork">
      <xsl:for-each select="nsSCL:ConnectedAP">
        <UAVariable>
					<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@iedName"/>/<xsl:value-of select="@apName"/>.PhysConn</xsl:attribute>
					<xsl:attribute name="BrowseName">2:<xsl:value-of select="@apName"/>.PhysConn</xsl:attribute>
					<xsl:attribute name="DataType">ns=1;s=P_VisString255</xsl:attribute>
					<xsl:element name="DisplayName">PhysConn</xsl:element>
					<Description/>
					<References>
						<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
						<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="@iedName"/>/<xsl:value-of select="@apName"/></Reference>
					</References>
					<Value>
						<String>
              <xsl:value-of select="nsSCL:PhysConn/nsSCL:P"/>
              <xsl:value-of select="fn:concat(' ', nsSCL:PhysConn/@type)"/>
						</String>
					</Value>
				</UAVariable>
      </xsl:for-each>
    </xsl:for-each>     

    <xsl:for-each select="//nsSCL:IED">
      <UAObject>
        <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@name"/></xsl:attribute>
        <xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/></xsl:attribute>
        <xsl:element name="DisplayName"><xsl:value-of select="@name"/> IED</xsl:element>
        <xsl:element name="Description"><xsl:value-of select="@desc"/> IED</xsl:element>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=IEDs</Reference>
          <Reference ReferenceType="HasTypeDefinition">ns=1;s=IED</Reference>
        </References>
      </UAObject>
      <UAVariable>
			  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@name"/>.type</xsl:attribute>
			  <xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/>.type</xsl:attribute>
			  <xsl:attribute name="DataType">ns=1;s=P_VisString255</xsl:attribute>
			  <xsl:element name="DisplayName">Type</xsl:element>
			  <Description/>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="@name"/></Reference>
			  </References>
			  <Value>
				  <String>
					  <xsl:value-of select="@type"/>
				  </String>
			  </Value>
		  </UAVariable>
      <UAVariable>
			  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@name"/>.manufacturer</xsl:attribute>
			  <xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/>.manufacturer</xsl:attribute>
			  <xsl:attribute name="DataType">ns=1;s=P_VisString255</xsl:attribute>
			  <xsl:element name="DisplayName">Manufacturer</xsl:element>
			  <Description/>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="@name"/></Reference>
			  </References>
			  <Value>
				  <String>
					  <xsl:value-of select="@manufacturer"/>
				  </String>
			  </Value>
		  </UAVariable>
      <UAVariable>
			  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@name"/>.configVersion</xsl:attribute>
			  <xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/>.configVersion</xsl:attribute>
			  <xsl:attribute name="DataType">ns=1;s=P_VisString255</xsl:attribute>
			  <xsl:element name="DisplayName">ConfigVersion</xsl:element>
			  <Description/>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="@name"/></Reference>
			  </References>
			  <Value>
				  <String>
					  <xsl:value-of select="@configVersion"/>
				  </String>
			  </Value>
		  </UAVariable>
    </xsl:for-each>
      
    <xsl:for-each select="//nsSCL:IED">
      <xsl:for-each select="nsSCL:AccessPoint">
        <UAObject>
          <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/></xsl:attribute>
          <xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/></xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@name"/> Access Point</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@desc"/> Access Point</xsl:element>
          <References>
            <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="../@name"/></Reference>
            <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=AccessPoints</Reference>
            <Reference ReferenceType="HasTypeDefinition">ns=1;s=AccessPoint</Reference>
          </References>
        </UAObject>
        <UAVariable>
					<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/>.router</xsl:attribute>
					<xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/>.router</xsl:attribute>
					<xsl:attribute name="DataType">ns=1;s=P_BOOLEAN</xsl:attribute>
					<xsl:element name="DisplayName">Router</xsl:element>
					<Description/>
					<References>
						<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
						<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/></Reference>
					</References>
					<Value>
						<String>
							<xsl:value-of select="@router"/>
						</String>
					</Value>
				</UAVariable>
				<UAVariable>
					<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/>.clock</xsl:attribute>
					<xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/>.clock</xsl:attribute>
					<xsl:attribute name="DataType">ns=1;s=P_BOOLEAN</xsl:attribute>
					<xsl:element name="DisplayName">Clock</xsl:element>
					<Description/>
					<References>
						<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
						<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/></Reference>
					</References>
					<Value>
						<String>
							<xsl:value-of select="@clock"/>
						</String>
					</Value>
				</UAVariable>
      </xsl:for-each>
    </xsl:for-each>     

    <xsl:for-each select="//nsSCL:IED/nsSCL:AccessPoint">
      <xsl:for-each select="nsSCL:Server">
        <UAObject>
          <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/>/Server</xsl:attribute>
          <xsl:attribute name="BrowseName">2:Server</xsl:attribute>
          <xsl:element name="DisplayName">Server</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@desc"/> Server</xsl:element>
          <References>
            <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/></Reference>
            <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=IEC61850Servers</Reference>
            <Reference ReferenceType="HasTypeDefinition">ns=1;s=IEC61850Server</Reference>
          </References>
        </UAObject>
        <UAVariable>
					<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/>/Server.timeout</xsl:attribute>
					<xsl:attribute name="BrowseName">2:Svr.timeout</xsl:attribute>
					<xsl:attribute name="DataType">ns=1;s=P_INT32U</xsl:attribute>
					<xsl:element name="DisplayName">Timeout</xsl:element>
					<References>
						<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
						<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/>/Server</Reference>
					</References>
					<Value>
						<String>
							<xsl:value-of select="@timeout"/>
						</String>
					</Value>
				</UAVariable>
      </xsl:for-each>
    </xsl:for-each>
<!--
Section 3:
Parse Logical Node instances for instance tree 
-->      
    <xsl:for-each select="//nsSCL:IED/nsSCL:AccessPoint/nsSCL:Server">
      <xsl:for-each select="nsSCL:LDevice">
        <UAObject>
          <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="@inst"/></xsl:attribute>
          <xsl:attribute name="BrowseName">2:<xsl:value-of select="@inst"/></xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@inst"/> Logical Device</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@desc"/> Logical Device</xsl:element>
          <References>
            <Reference ReferenceType="ns=1;s=HasLD" IsForward="false">ns=2;s=<xsl:value-of select="../../../@name"/>/<xsl:value-of select="../../@name"/>/Server</Reference>
            <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=LDs</Reference>
            <Reference ReferenceType="HasTypeDefinition">ns=1;s=LD</Reference>
          </References>
        </UAObject>
        <xsl:for-each select="nsSCL:LN0">
					<UAObject>
						<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../@inst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@inst"/></xsl:attribute>
						<xsl:attribute name="BrowseName">2:<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@inst"/></xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@inst"/> LN</xsl:element>
						<xsl:element name="Description"><xsl:value-of select="@desc"/> <xsl:value-of select="@lnType"/></xsl:element>
						<References>
							<Reference ReferenceType="ns=1;s=HasLN" IsForward="false">ns=2;s=<xsl:value-of select="../@inst"/></Reference>
              <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=LNs</Reference>
							<Reference ReferenceType="HasTypeDefinition">ns=1;s=LLN0</Reference>
						</References>
					</UAObject>   
          <xsl:for-each select="nsSCL:DataSet">
            <UAObject>
					    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@prefix"/><xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>.<xsl:value-of select="@name"/></xsl:attribute>
					    <xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/></xsl:attribute>
					    <xsl:element name="DisplayName"><xsl:value-of select="@name"/> DS</xsl:element>
					    <xsl:element name="Description"><xsl:value-of select="@desc"/> Data Set</xsl:element>
					    <References>
						    <Reference ReferenceType="ns=1;s=HasDS" IsForward="false">ns=2;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@prefix"/><xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/></Reference>
						    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DataSets</Reference>
						    <Reference ReferenceType="HasTypeDefinition">ns=1;s=DS</Reference>
					    </References>
				    </UAObject>
            <!-- For each data set attach 7-3 CDC attributes to each DO -->
				    <xsl:call-template name="FCDA">
              <xsl:with-param name="PLN"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@prefix"/><xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/></xsl:with-param>
            </xsl:call-template>
          </xsl:for-each>
          <!-- For each data set attach 7-2 attributes to each Report Control -->
          <xsl:for-each select="nsSCL:ControlBlock">
            <xsl:call-template name="ControlBlock">
              <xsl:with-param name="PLN"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@prefix"/><xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/></xsl:with-param>
				    </xsl:call-template> 
			    </xsl:for-each>
        </xsl:for-each>
        
        <xsl:for-each select="nsSCL:LN">
          <xsl:call-template name="ProcessLN">
            <xsl:with-param name="PLN"><xsl:value-of select="../@inst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@inst"/></xsl:with-param>
            <xsl:with-param name="PLNI"><xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@inst"/></xsl:with-param>
            <xsl:with-param name="PLNC"><xsl:value-of select="@lnClass"/></xsl:with-param>
            <xsl:with-param name="PLND"><xsl:value-of select="@desc"/></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
      </xsl:for-each>
    </xsl:for-each>
  </UANodeSet>
</xsl:template>
  
<!-- Aux Templates-->
<!-- Aux Templates-->
<!-- Aux Templates-->
<!-- Aux Templates-->
<!-- Aux Templates-->
<!-- Aux Templates-->
 
  <xsl:template name="ProcessLNode">
    <xsl:param name="PLN"/>
    <xsl:param name="PLNI"/>
    <xsl:param name="PIED"/>
    <xsl:param name="PSSeq"/>
    <UAObject>
			<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/></xsl:attribute>
			<xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLNI"/></xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PLNI"/> LNode</xsl:element>
			<xsl:element name="Description"><xsl:value-of select="$PLN"/> Logical Node in IED <xsl:value-of select="$PIED"/></xsl:element>
			<References>
				<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=LNs</Reference>
        
				<Reference ReferenceType="HasTypeDefinition">ns=1;s=LNDomain</Reference>
        <Reference ReferenceType="ns=1;s=LNode.SSeq" IsForward="true">ns=2;s=<xsl:value-of select="$PSSeq"/></Reference>
			</References>
		</UAObject>
  </xsl:template>
  
  <xsl:template name="ProcessTerminal">
    <xsl:param name="PSSeq"/>
    <xsl:param name="PcNodeName"/>
    <xsl:param name="PconnectivityNode"/>
    <UAObject>
      <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PSSeq"/>/<xsl:value-of select="$PcNodeName"/></xsl:attribute>
      <xsl:attribute name="BrowseName">2:<xsl:value-of select="$PcNodeName"/></xsl:attribute>
      <xsl:element name="DisplayName"><xsl:value-of select="$PSSeq"/>/<xsl:value-of select="$PcNodeName"/> Terminal</xsl:element>
      <xsl:element name="Description"><xsl:value-of select="$PSSeq"/>/<xsl:value-of select="$PcNodeName"/> Terminal</xsl:element>
      <References>
        <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PSSeq"/></Reference>
        <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Ts</Reference>
        <Reference ReferenceType="HasTypeDefinition">ns=1;s=T</Reference>
        <Reference ReferenceType="ns=1;s=T.CN" IsForward="true">ns=2;s=<xsl:value-of select="$PconnectivityNode"/></Reference>
      </References>
    </UAObject>
    <xsl:call-template name="ProcessConnectivityNode">
      <xsl:with-param name="PPconnectivityNode"><xsl:value-of select="$PconnectivityNode"/></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template name="ProcessConnectivityNode">
    <xsl:param name="PPconnectivityNode"/>
    <xsl:for-each select="distinct-values($PPconnectivityNode)">
      <UAObject>
        <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PPconnectivityNode"/></xsl:attribute>
        <xsl:attribute name="BrowseName">2:<xsl:value-of select="$PPconnectivityNode"/></xsl:attribute>
        <xsl:element name="DisplayName"><xsl:value-of select="$PPconnectivityNode"/> Connectivity Node</xsl:element>
        <xsl:element name="Description"><xsl:value-of select="$PPconnectivityNode"/> Connectivity Node</xsl:element>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=CNs</Reference>
          <Reference ReferenceType="HasTypeDefinition">ns=1;s=CN</Reference>
        </References>
      </UAObject>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template name="ProcessLN">
    <xsl:param name="PLN"/>
    <xsl:param name="PLNI"/>
    <xsl:param name="PLNC"/>
    <xsl:param name="PLND"/>
    <UAObject>
			<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/></xsl:attribute>
			<xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/></xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PLNI"/> LN</xsl:element>
			<xsl:element name="Description"><xsl:value-of select="$PLND"/> Logical Node</xsl:element>
			<References>
        <Reference ReferenceType="ns=1;s=HasLN" IsForward="false">ns=2;s=<xsl:value-of select="../@inst"/></Reference>
				<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=LNs</Reference>
				<Reference ReferenceType="HasTypeDefinition">ns=1;s=LN</Reference>
			</References>
	  </UAObject>
		<xsl:for-each select="nsSCL:DataSet">
		  <UAObject>
		    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></xsl:attribute>
		    <xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/></xsl:attribute>
		    <xsl:element name="DisplayName"><xsl:value-of select="@name"/> DS</xsl:element>
		    <xsl:element name="Description"><xsl:value-of select="@desc"/> Data Set</xsl:element>
		    <References>
			    <Reference ReferenceType="ns=1;s=HasDS" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/></Reference>
			    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DataSets</Reference>
			    <Reference ReferenceType="HasTypeDefinition">ns=1;s=DS</Reference>
			  </References>
		  </UAObject>
			<xsl:call-template name="FCDA">
				<xsl:with-param name="PLN"><xsl:value-of select="$PLN"/></xsl:with-param>
			</xsl:call-template>				
	  </xsl:for-each>
<!--
Parse Report Control Instances for instance tree 
-->
		<xsl:for-each select="nsSCL:ControlBlock">
			<xsl:call-template name="ControlBlock">
				<xsl:with-param name="PLN"><xsl:value-of select="$PLN"/></xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>
		
<!--
Parse DO and DA Instances for instance tree 
-->       
    <xsl:for-each select="nsSCL:DOI">
			<UAVariable>
				<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></xsl:attribute>
				<xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></xsl:attribute>
        <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="../@lnType"/>.<xsl:value-of select="@name"/>DT</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="../@lnType"/>.<xsl:value-of select="@name"/> DO</xsl:element>
        <xsl:element name="Description"><xsl:value-of select="../@lnType"/>.<xsl:value-of select="@name"/> Data Object Instance</xsl:element>
				<References>
					<Reference ReferenceType="ns=1;s=HasDO" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/></Reference>
					<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DOs</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="../@lnType"/>.<xsl:value-of select="@name"/>VT</Reference>
				</References>
			</UAVariable>
      <xsl:for-each select="nsSCL:DAI">
				<UAVariable>
					<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.<xsl:value-of select="@name"/></xsl:attribute>
					<xsl:attribute name="BrowseName">2:<xsl:value-of select="@name"/></xsl:attribute>
					<xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@name"/>DADT</xsl:attribute>
					<xsl:element name="DisplayName"><xsl:value-of select="@name"/> DA</xsl:element>
					<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.<xsl:value-of select="@name"/> Data Attribute Instance</xsl:element>
					<References>
						<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/></Reference>
						<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
						<Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="@name"/>DAVT</Reference>
					</References>
					<xsl:for-each select="nsSCL:Val">
						<Value>
              <String><xsl:value-of select="."/></String>
						</Value>
					</xsl:for-each>
				</UAVariable>
			</xsl:for-each>
    </xsl:for-each> 
  </xsl:template>
   
<!--
Section 8:
	This sub template implements CDC Basetypes defined within this script. 
	The script creates an association between Data objects(DOs) within a Logical node Datasets of the CID file and the defined CDCs within the script
	All DC and EX functional constraints are omited and SG and SV functionally constrained data is not implemented yet.
	
	Implemented CDCs with ST,MX,or SP functionally constrained data:
	WYE,CMV,DEL,MV,CMV,ACD,ACT,APC,BAC,BCR,BSC,DPC,ENC,ENS,INC,INS,ISC,RST,SAV,SEC, SEQ,SPC,SPS
	CDCs not yet implemented:HST,TAG
	CDCs with only SP,DC and EX funtionally constrained data(not yet implemented):ASG,ENG,ORG,TSG,VSG,SPG
	CDCs with no DOs:DPS	
	CDCs with only DC and EX funtionally constrained data:CSD,CURVE,DPL,LPL
	
-->   
	<xsl:template name="FCDA">
    <xsl:param name="PLN"/>
      <xsl:for-each-group select="nsSCL:FCDA" group-by="@doName">
        <!--<xsl:message>For DS <xsl:value-of select="../@name"/>, create objects for <xsl:value-of select="@doName"/> DO with <xsl:value-of select="@fc"/> FC for LN <xsl:value-of select="$PLN"/></xsl:message>-->
			  <xsl:if test="@lnClass=../../@lnClass">
          <UAVariable>
				    <!--<xsl:message>Create <xsl:value-of select="@doName"/> DO object</xsl:message>-->
            <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:attribute>
				    <xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:attribute>
            <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="../../@lnType"/>.<xsl:value-of select="@doName"/>DT</xsl:attribute>
				    <xsl:element name="DisplayName"><xsl:value-of select="../../@lnType"/>.<xsl:value-of select="@doName"/> DO</xsl:element>
				    <xsl:element name="Description"><xsl:value-of select="../../@lnType"/>.<xsl:value-of select="@doName"/> Data Object Variable</xsl:element>
				    <References>
					    <Reference ReferenceType="ns=1;s=HasDO" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/></Reference>
              <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DOs</Reference>
              <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="../../@lnType"/>.<xsl:value-of select="@doName"/>VT</Reference>
				    </References>
			    </UAVariable>
        </xsl:if>
			  <xsl:for-each select="current-group()">
				  <xsl:choose>
				  <!--DOs with generic CDC WYE:Phase to ground/neutral related measured values of a three-phase system-->		
				  <xsl:when test="@doName=&apos;A&apos;
							  or @doName=&apos;A1&apos;
							  or @doName=&apos;A2&apos;
							  or @doName=&apos;A3&apos;
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
					  <!--<xsl:message>Create CVMs for WYE CDC</xsl:message>-->
					  <xsl:call-template name="CMV">
              <xsl:with-param name="PPLN"><xsl:value-of select="$PLN"/></xsl:with-param>
              <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
              <xsl:with-param name="PType">CMV_MAG_FLOAT</xsl:with-param>
              <xsl:with-param name="SDOname">phsA</xsl:with-param>
            </xsl:call-template>	
					  <xsl:call-template name="CMV">
              <xsl:with-param name="PPLN"><xsl:value-of select="$PLN"/></xsl:with-param>
              <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
              <xsl:with-param name="PType">CMV_MAG_FLOAT</xsl:with-param>
              <xsl:with-param name="SDOname">phsB</xsl:with-param>
            </xsl:call-template>							
					  <xsl:call-template name="CMV">
              <xsl:with-param name="PPLN"><xsl:value-of select="$PLN"/></xsl:with-param>
              <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
              <xsl:with-param name="PType">CMV_MAG_FLOAT</xsl:with-param>
              <xsl:with-param name="SDOname">phsC</xsl:with-param>
            </xsl:call-template>
					  <xsl:call-template name="CMV">
              <xsl:with-param name="PPLN"><xsl:value-of select="$PLN"/></xsl:with-param>
              <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
              <xsl:with-param name="PType">CMV_MAG_ANG_FLOAT</xsl:with-param>
              <xsl:with-param name="SDOname">neut</xsl:with-param>
            </xsl:call-template>
					  <xsl:call-template name="CMV">
              <xsl:with-param name="PPLN"><xsl:value-of select="$PLN"/></xsl:with-param>
              <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
              <xsl:with-param name="PType">CMV_MAG_FLOAT</xsl:with-param>
              <xsl:with-param name="SDOname">net</xsl:with-param>
            </xsl:call-template>
					  <xsl:call-template name="CMV">
              <xsl:with-param name="PPLN"><xsl:value-of select="$PLN"/></xsl:with-param>
              <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
              <xsl:with-param name="PType">CMV_MAG_ANG_FLOAT</xsl:with-param>
              <xsl:with-param name="SDOname">res</xsl:with-param>
            </xsl:call-template>
          </xsl:when>
            
				  <!--DOs with generic CDC DEL:Phase to phase related measured values of a three-phase system-->
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
            <!--<xsl:message>Create CVMs for DEL CDC</xsl:message>-->
					  <xsl:call-template name="CMV">
              <xsl:with-param name="PPLN"><xsl:value-of select="$PLN"/></xsl:with-param>
              <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
              <xsl:with-param name="PType">CMV_MAG_ANG_FLOAT</xsl:with-param>
              <xsl:with-param name="SDOname">phsAB</xsl:with-param>
            </xsl:call-template>								
					  <xsl:call-template name="CMV">
              <xsl:with-param name="PPLN"><xsl:value-of select="$PLN"/></xsl:with-param>
              <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
              <xsl:with-param name="PType">CMV_MAG_ANG_FLOAT</xsl:with-param>
              <xsl:with-param name="SDOname">phsBC</xsl:with-param>
            </xsl:call-template>
					  <xsl:call-template name="CMV">
              <xsl:with-param name="PPLN"><xsl:value-of select="$PLN"/></xsl:with-param>
              <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
              <xsl:with-param name="PType">CMV_MAG_ANG_FLOAT</xsl:with-param>
              <xsl:with-param name="SDOname">phsCA</xsl:with-param>
            </xsl:call-template>
          </xsl:when>      
                
				  <!--DOs with generic CDC SEQ-Sequence. -->
				  <xsl:when test="@doName=&apos;SeqA&apos;
						  or	@doName=&apos;SeqV&apos;
						  or	@doName=&apos;DQ0Seq&apos;">		
					  <xsl:call-template name="CMV">
              <xsl:with-param name="PPLN"><xsl:value-of select="$PLN"/></xsl:with-param>
              <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
              <xsl:with-param name="PType">CMV_MAG_ANG_FLOAT</xsl:with-param>
              <xsl:with-param name="SDOname">c1</xsl:with-param>
            </xsl:call-template>
					  <xsl:call-template name="CMV">
              <xsl:with-param name="PPLN"><xsl:value-of select="$PLN"/></xsl:with-param>
              <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
              <xsl:with-param name="PType">CMV_MAG_ANG_FLOAT</xsl:with-param>
              <xsl:with-param name="SDOname">c2</xsl:with-param>
            </xsl:call-template>						
					  <xsl:call-template name="CMV">
              <xsl:with-param name="PPLN"><xsl:value-of select="$PLN"/></xsl:with-param>
              <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
              <xsl:with-param name="PType">CMV_MAG_ANG_FLOAT</xsl:with-param>
              <xsl:with-param name="SDOname">c3</xsl:with-param>
            </xsl:call-template> 
          </xsl:when> 
            
					  <!--DOs with generic CDC CMV:Complex Measured Value-->
            <xsl:when test="@doName=&apos;VolResoPt&apos;
								  or @doName=&apos;NeutVol&apos;
								  or @doName=&apos;Imp&apos;
								  or @doName=&apos;FltZ&apos;
								  or @doName=&apos;ColAEFN&apos;">
						  <!--<xsl:message>Create CVM for CMV CDC</xsl:message>-->
		          <UAVariable>
			          <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.cVal</xsl:attribute>
			          <xsl:attribute name="BrowseName">2:cVal</xsl:attribute>
                <xsl:attribute name="DataType">ns=1;s=VectorDADT</xsl:attribute>
			          <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.cVal FCDA</xsl:element>
			          <xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/> Deadbanded complex value Functionally Constrained Data Attribute data variable</xsl:element>
			          <References>
				          <Reference ReferenceType="HasTypeDefinition">ns=1;s=cValDAVT</Reference>
				          <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
				          <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=SDOs</Reference>
                </References>
		          </UAVariable>
              <UAVariable>
			          <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.cVal.mag</xsl:attribute>
			          <xsl:attribute name="BrowseName">2:cVal.mag</xsl:attribute>
                <xsl:attribute name="DataType">ns=1;s=AnalogueValueDADT</xsl:attribute>
			          <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.cVal.mag FCDA</xsl:element>
			          <xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/> Deadbanded complex value magnitude Functionally Constrained Data Attribute data variable</xsl:element>
			          <References>
				          <Reference ReferenceType="HasTypeDefinition">ns=1;s=magDAVT</Reference>
                  <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.cVal</Reference>
			          </References>
		          </UAVariable>
		          <UAVariable>
			          <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.cVal.mag.i</xsl:attribute>
			          <xsl:attribute name="BrowseName">2:cVal.mag.i</xsl:attribute>
			          <xsl:attribute name="DataType">ns=1;s=P_INT32</xsl:attribute>
			          <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.cVal.mag.i</xsl:element>
			          <xsl:element name="Description"> Deadbanded complex value magnitude integer value Functionally Constrained Data Attribute data variable</xsl:element>
			          <References>
			            <Reference ReferenceType="HasTypeDefinition">i=63</Reference>
			            <Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.cVal.mag</Reference>
			          </References>
		          </UAVariable>
		          <UAVariable>
			          <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.cVal.mag.f</xsl:attribute>
			          <xsl:attribute name="BrowseName">2:cVal.mag.f</xsl:attribute>
			          <xsl:attribute name="DataType">ns=1;s=P_FLOAT32</xsl:attribute>
			          <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.cVal.mag.f</xsl:element>
			          <xsl:element name="Description">Deadbanded complex value magnitude floating point value Functionally Constrained Data Attribute data variable</xsl:element>
			          <References>
			            <Reference ReferenceType="HasTypeDefinition">i=63</Reference>
			            <Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.cVal.mag</Reference>
			          </References>
		          </UAVariable>
					  </xsl:when>	
            
            <!--DOs with generic CDC MV:Measured Value-->
					  <xsl:when test="@doName=&apos;Ampor&apos;
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
						  or @doName=&apos;MaxAmps1&apos;
						  or @doName=&apos;MaxAmps2&apos;
						  or @doName=&apos;MaxAmps3&apos;
						  or @doName=&apos;MaxVAr&apos;
						  or @doName=&apos;MaxW&apos;
						  or @doName=&apos;TmpRl&apos;
						  or @doName=&apos;TotPF&apos;
						  or @doName=&apos;TotVA&apos;
						  or @doName=&apos;TotVAr&apos;
						  or @doName=&apos;TotW&apos;">
              <!--<xsl:message>Create variables for MV CDC with MX FC</xsl:message>-->
						  <xsl:choose>
					      <xsl:when test="@daName=&apos;q&apos;">
                  <xsl:call-template name="Quality">
                    <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="@daName=&apos;t&apos;">
                  <xsl:call-template name="Time">
                    <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
						    <xsl:otherwise>
                  <xsl:element name="UAVariable">
                    <!--<xsl:message>Create mag DA object for MV CDC</xsl:message>-->
								    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.mag</xsl:attribute>
								    <xsl:attribute name="BrowseName">2:mag</xsl:attribute>
								    <xsl:attribute name="DataType">ns=1;s=AnalogueValueDADT</xsl:attribute>
                    <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.mag FCDA</xsl:element>
								    <xsl:element name="Description">Magnitude Functionally Constrained Data Attribute data variable</xsl:element>
								    <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=magDAVT</Reference>
                      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
                    </References>
							    </xsl:element>
							    <xsl:element name="UAVariable">
                    <!--<xsl:message>Create integer mag variable for MV CDC</xsl:message>-->
								    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.mag.i</xsl:attribute>
								    <xsl:attribute name="BrowseName">2:mag.i</xsl:attribute>
								    <xsl:attribute name="DataType">ns=1;s=P_INT32</xsl:attribute>
								    <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.mag.i FCDA</xsl:element>
								    <xsl:element name="Description">Magnitude.Integer value Functionally Constrained Data Attribute data variable</xsl:element>
								    <References>
								      <Reference ReferenceType="HasTypeDefinition">i=63</Reference>
								      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.mag</Reference>
								      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								    </References>
							    </xsl:element>
							    <xsl:element name="UAVariable">
                    <!--<xsl:message>Create float mag variable for MV CDC</xsl:message>-->
								    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.mag.f</xsl:attribute>
								    <xsl:attribute name="BrowseName">2:mag.f</xsl:attribute>
								    <xsl:attribute name="DataType">ns=1;s=P_FLOAT32</xsl:attribute>
								    <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.mag.f FCDA</xsl:element>
								    <xsl:element name="Description">Magnitude Floating point value Functionally Constrained Data Attribute data variable</xsl:element>
								    <References>
								      <Reference ReferenceType="HasTypeDefinition">i=63</Reference>
								      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.mag</Reference>
								      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								    </References>
							    </xsl:element>
						    </xsl:otherwise>
              </xsl:choose>
					  </xsl:when>
						
            <!--DOs with generic CDC APC:Controllable analogue process value-->
					  <xsl:when test="@doName=&apos;ColPos&apos;
							  or	@doName=&apos;SptVal&apos;
							  or	@doName=&apos;RbPos&apos;
							  or	@doName=&apos;FlwSet&apos;
							  or	@doName=&apos;LevSet&apos;
							  or	@doName=&apos;SpdSpt&apos;
							  or	@doName=&apos;PosSpt&apos;
							  or	@doName=&apos;AmpSpt&apos;
							  or	@doName=&apos;VolSpt&apos;">
						  <!--<xsl:message>Create DA Object for APC CDC</xsl:message>-->
              <xsl:choose>
					      <xsl:when test="@daName=&apos;q&apos;">
                  <xsl:call-template name="Quality">
                    <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="@daName=&apos;t&apos;">
                  <xsl:call-template name="Time">
                    <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="@daName= &apos;stVal&apos;">
                </xsl:when>
                <xsl:when test="@daName= &apos;origin&apos;">
                  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:origin</xsl:attribute>
                    <xsl:attribute name="DataType">ns=1;s=originDT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.origin</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/> Originator</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=originDAVT</Reference>
                      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
                      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>
							    <!--<xsl:message>Create orCat variable for APC CDC</xsl:message>-->		
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:origin.orCat</xsl:attribute>
									  <xsl:attribute name="DataType">i=7</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.origin.orCat</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/> Originator Category</xsl:element>
									  <References>
									  <Reference ReferenceType="HasTypeDefinition">i=63</Reference>
									  <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</Reference>
									  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>
							    <!--<xsl:message>Create orIdent variable for APC CDC</xsl:message>-->								
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:origin.orIdent</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=P_VisString255</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.origin.orIdent</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/>Originator Identity</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">i=63</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>
                </xsl:when>
                <xsl:when test="@daName= &apos;setMag&apos;">
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.setMag</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:setMag</xsl:attribute>
									  <xsl:attribute name="DataType">i=1</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.setMag</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/> Set Magnitude</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=setMagDAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
						    <xsl:otherwise>
                  <xsl:message>Unexpected create APC DA variable for <xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:message>
                  <xsl:element name="UAVariable">
								    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="BrowseName">2:<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DADT</xsl:attribute>
                    <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/> DA variable</xsl:element>
								    <xsl:element name="Description"><xsl:value-of select="@daName"/> Functionally Constrained Data Attribute data variable</xsl:element>
								    <References>
								      <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DAVT</Reference>
                      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
                    </References>
                  </xsl:element>
						    </xsl:otherwise>
              </xsl:choose>
            </xsl:when>	
            
					  <!--DOs with generic CDC BAC-Binary controlled analog process value-->
					  <xsl:when test="@doName=&apos;BndCtrChg&apos;
							  or	@doName=&apos;SptChg&apos;
							  or	@doName=&apos;ColChg&apos;">
						  <!--<xsl:message>Create Variables for BAC CDC</xsl:message>-->	
              <xsl:choose>
					      <xsl:when test="@daName=&apos;q&apos;">
                  <xsl:call-template name="Quality">
                    <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="@daName=&apos;t&apos;">
                  <xsl:call-template name="Time">
                    <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="@daName= &apos;stVal&apos;">
                </xsl:when>
                <xsl:when test="@daName= &apos;origin&apos;">
                  <!--<xsl:message>Create origin variable for BAC CDC</xsl:message>-->	
                  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:origin</xsl:attribute>
                    <xsl:attribute name="DataType">ns=1;s=originDT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.origin</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/> Originator</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=originDAVT</Reference>
                      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
                      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>
							    <!--<xsl:message>Create orCat variable for BAC CDC</xsl:message>-->		
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:origin.orCat</xsl:attribute>
									  <xsl:attribute name="DataType">i=7</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.origin.orCat</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/> Originator Category</xsl:element>
									  <References>
									  <Reference ReferenceType="HasTypeDefinition">i=63</Reference>
									  <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</Reference>
									  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>
							  <!--<xsl:message>Create orIdent variable for BAC CDC</xsl:message>-->								
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:origin.orIdent</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=P_VisString255</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.origin.orIdent</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/> Orignator Identity</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">i=63</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>
                </xsl:when>
                <xsl:when test="@daName= &apos;ctlNum&apos;">
                  <!--<xsl:message>Create ctlNum variable for BAC CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:ctlNum</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=ctlNumDT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.ctlNum</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/>Control Number Functionally Constrained Data Attribute data variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=ctlNumDAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
                <xsl:when test="@daName= &apos;mxVal&apos;">
                  <!--<xsl:message>Create mxVal variable for BAC CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.mxVal</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:mxVal</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=mxValDT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.mxVal</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/> Maximum Value Functionally Constrained Data Attribute data variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=mxValDAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
                <xsl:when test="@daName= &apos;stSeld&apos;">
                  <!--<xsl:message>Create stSeld variable for BAC CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stSeld</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:stSeld</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=stSeldDT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.stSeld</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/> stSeld Functionally Constrained Data Attribute data variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=stSeldDAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
                <xsl:when test="@daName= &apos;ctlVal&apos;">
                  <!--<xsl:message>Create ctlVal variable for BAC CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:ctlVal</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=ctlValDT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.ctlVal</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/> Control Value Functionally Constrained Data Attribute data variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=ctlValDAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
						    <xsl:otherwise>
                  <xsl:message>Unexpected create BAC DA variable for <xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:message>
                  <xsl:element name="UAVariable">
								    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="BrowseName">2:<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DADT</xsl:attribute>
                    <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/> DA variable</xsl:element>
								    <xsl:element name="Description"><xsl:value-of select="@daName"/> Functionally Constrained Data Attribute data variable</xsl:element>
								    <References>
								      <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DAVT</Reference>
                      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
                    </References>
                  </xsl:element>
						    </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            
					  <!--DOs with generic CDC RST-Restriction-->
					  <xsl:when test="@doName=&apos;ClsLim&apos;
							  or	@doName=&apos;PwrRtgLim&apos;
							  or	@doName=&apos;VRtgLim&apos;
							  or	@doName=&apos;FlwRtgLim&apos;								
							  or	@doName=&apos;ClsLim&apos;">
						  <!--<xsl:message>Create ctlNum variable for RST CDC</xsl:message>-->	
              <xsl:choose>
					      <xsl:when test="@daName=&apos;q&apos;">
                  <xsl:call-template name="Quality">
                    <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="@daName= &apos;stVal&apos;">
                </xsl:when>
                <xsl:when test="@daName= &apos;ctlNum&apos;">
                  <!--<xsl:message>Create ctlNum variable for RST CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:ctlNum</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=ctlNumDT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.ctlNum</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/> Control Number Functionally Constrained Data Attribute data variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=ctlNumDAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
                <xsl:when test="@daName= &apos;mxVal&apos;">
                  <!--<xsl:message>Create mxVal variable for RST CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.mxVal</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:mxVal</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=mxValDT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.mxVal</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/> Maximum Value Functionally Constrained Data Attribute data variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=mxValDAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
						    <xsl:otherwise>
                  <xsl:message>Unexpected create RST DA variable for <xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:message>
                  <xsl:element name="UAVariable">
								    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="BrowseName">2:<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DADT</xsl:attribute>
                    <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/> DA variable</xsl:element>
								    <xsl:element name="Description"><xsl:value-of select="@daName"/> Functionally Constrained Data Attribute data variable</xsl:element>
								    <References>
								      <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DAVT</Reference>
                      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
                    </References>
                  </xsl:element>
						    </xsl:otherwise>
              </xsl:choose>
            </xsl:when>	
            
					  <!--DOs with generic CDC SAV-Sample Value-->
					  <xsl:when test="@doName=&apos;Amp1&apos;
							  or	@doName=&apos;Amp2&apos;
							  or	@doName=&apos;Amp3&apos;
							  or	@doName=&apos;Amp&apos;
							  or	@doName=&apos;Vol&apos;
							  or	@doName=&apos;AngRad&apos;
							  or	@doName=&apos;AngDgr&apos;
							  or	@doName=&apos;AxDsp&apos;
							  or	@doName=&apos;Dis&apos;								
							  or	@doName=&apos;Flw&apos;
							  or	@doName=&apos;Hmdt&apos;								
							  or	@doName=&apos;MagFld&apos;
							  or	@doName=&apos;MvmRte&apos;	
							  or	@doName=&apos;PosPc&apos;	
							  or	@doName=&apos;Pres&apos;
							  or	@doName=&apos;Spd&apos;
							  or	@doName=&apos;Snd&apos;
							  or	@doName=&apos;Tmp&apos;
							  or	@doName=&apos;Tns&apos;
							  or	@doName=&apos;Vbr&apos;
							  or	@doName=&apos;HydrPh&apos;">
						  <!--<xsl:message>Create instVal variable for SAV CDC</xsl:message>-->												
              <xsl:if test="@daName!=&apos;&apos;">
                <xsl:choose>
					        <xsl:when test="@daName=&apos;q&apos;">
                    <xsl:call-template name="Quality">
                      <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="@daName= &apos;stVal&apos;">
                  </xsl:when>
                  <xsl:when test="@daName= &apos;instVal&apos;">
                    <!--<xsl:message>Create instVal variable for SAV CDC</xsl:message>-->	
								    <xsl:element name="UAVariable">
									    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.instVal</xsl:attribute>
									    <xsl:attribute name="BrowseName">2:instVal</xsl:attribute>
									    <xsl:attribute name="DataType">ns=1;s=instValDT</xsl:attribute>
									    <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.instVal</xsl:element>
									    <xsl:element name="Description"><xsl:value-of select="@desc"/> Instantaneous Value Functionally Constrained Data Attribute data variable</xsl:element>
									    <References>
									      <Reference ReferenceType="HasTypeDefinition">ns=1;s=instValDAVT</Reference>
									      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									    </References>
								    </xsl:element>	
                  </xsl:when>
						      <xsl:otherwise>
                    <xsl:message>Unexpected create SAV DA variable for <xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:message>
                    <xsl:element name="UAVariable">
								      <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								      <xsl:attribute name="BrowseName">2:<xsl:value-of select="@daName"/></xsl:attribute>
								      <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DADT</xsl:attribute>
                      <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/> DA variable</xsl:element>
								      <xsl:element name="Description"><xsl:value-of select="@daName"/> Functionally Constrained Data Attribute data variable</xsl:element>
								      <References>
								        <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DAVT</Reference>
                        <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								        <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
                      </References>
                    </xsl:element>
						      </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
            </xsl:when>	
            
					  <!-- Create variables for ACD CDC with ST FC -->
            <xsl:when test="@doName=&apos;Str&apos;">
              <!--<xsl:message>Create general and dirGeneral phsA, B, C, and neut DA variables for ACD CDC with ST FC</xsl:message>-->
              <xsl:choose>
					      <xsl:when test="@daName=&apos;q&apos;">
                  <xsl:call-template name="Quality">
                    <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="@daName= &apos;stVal&apos;">
                </xsl:when>
                <xsl:when test="@daName= &apos;general&apos;">
                  <!--<xsl:message>Create general variable for ACD CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.general</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:general</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=generalDT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.general</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/> Logical "or" of the phase values (='phsA' | 'phsB' | 'phsC' | 'neut') Functionally Constrained Data Attribute data variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=generalDAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
                <xsl:when test="@daName= &apos;phsA&apos;">
                  <!--<xsl:message>Create phsA variable for ACD CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsA</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:phsA</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=phsADT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.phsA</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/> Phase A Functionally Constrained Data Attribute data variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=phsADAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
                <xsl:when test="@daName= &apos;phsB&apos;">
                  <!--<xsl:message>Create phsB variable for ACD CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsB</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:phsB</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=phsBDT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.phsB</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/> Phase B Functionally Constrained Data Attribute data variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=phsBDAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
                <xsl:when test="@daName= &apos;phsC&apos;">
                  <!--<xsl:message>Create phsC variable for ACD CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsC</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:phsC</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=phsCDT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.phsC</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/> Phase C Functionally Constrained Data Attribute data variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=phsCDAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
                <xsl:when test="@daName= &apos;neut&apos;">
                  <!--<xsl:message>Create neut variable for SAV CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.neut</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:neut</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=neutDT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.neut</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/> Neutral Functionally Constrained Data Attribute data variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=neutDAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
                <xsl:when test="@daName= &apos;dirGeneral&apos;">
                  <!--<xsl:message>Create dirGeneral variable for SAV CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirGeneral</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:dirGeneral</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=dirGeneralDT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.dirGeneral</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/> Direction of the fault regardless of phase Functionally Constrained Data Attribute data variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=dirGeneralDAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
                <xsl:when test="@daName= &apos;dirPhsA&apos;">
                  <!--<xsl:message>Create dirPhsA variable for SAV CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirPhsA</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:dirPhsA</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=dirPhsADT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.dirPhsA</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/>Direction of the fault for phase A Data Attribue variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=dirPhsADAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
                <xsl:when test="@daName= &apos;dirPhsB&apos;">
                  <!--<xsl:message>Create dirPhsB variable for SAV CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirPhsB</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:dirPhsB</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=dirPhsBDT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.dirPhsB</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/>Direction of the fault for phase B Data Attribue variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=dirPhsBDAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
                <xsl:when test="@daName= &apos;dirPhsC&apos;">
                  <!--<xsl:message>Create dirPhsC variable for SAV CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirPhsC</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:dirPhsC</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=dirPhsCDT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.dirPhsC</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/>Direction of the fault for phase C Data Attribue variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=dirPhsCDAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
                <xsl:when test="@daName= &apos;dirNeut&apos;">
                  <!--<xsl:message>Create dirNeut variable for SAV CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirNeut</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:dirNeut</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=dirNeutDT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.dirNeut</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/>Direction of the fault for neutral Functionally Constrained Data Attribute data variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=dirNeutDAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
						    <xsl:otherwise>
                  <xsl:message>Unexpected create ACD DA variable for <xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:message>
                  <xsl:element name="UAVariable">
								    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="BrowseName">2:<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DADT</xsl:attribute>
                    <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/> DA variable</xsl:element>
								    <xsl:element name="Description"><xsl:value-of select="@daName"/> Functionally Constrained Data Attribute data variable</xsl:element>
								    <References>
								      <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DAVT</Reference>
                      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
                    </References>
                  </xsl:element>
						    </xsl:otherwise>
              </xsl:choose>
					  </xsl:when>
            
					  <xsl:when test="@doName=&apos;AlmThm&apos;
						  or @doName=&apos;Op&apos;
						  or @doName=&apos;OpCls&apos;
						  or @doName=&apos;OpEx&apos;
						  or @doName=&apos;Tr&apos;">
              <xsl:choose>
					      <xsl:when test="@daName=&apos;q&apos;">
                  <xsl:call-template name="Quality">
                    <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="@daName= &apos;stVal&apos;">
                </xsl:when>
                <xsl:when test="@daName= &apos;operTmPhsA&apos;">
                  <!--<xsl:message>Create operTmPhsA variable for SAV CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.operTmPhsA</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:operTmPhsA</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=operTmPhsADT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.operTmPhsA</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/>Operation time for phase A Functionally Constrained Data Attribute data variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=operTmPhsADAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
                <xsl:when test="@daName= &apos;operTmPhsB&apos;">
                  <!--<xsl:message>Create operTmPhsB variable for SAV CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.operTmPhsB</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:operTmPhsB</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=operTmPhsBDT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.operTmPhsB</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/>Operation time for phase B Functionally Constrained Data Attribute data variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=operTmPhsBDAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
                <xsl:when test="@daName= &apos;operTmPhsC&apos;">
                  <!--<xsl:message>Create operTmPhsC variable for SAV CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.operTmPhsC</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:operTmPhsC</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=operTmPhsCDT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.operTmPhsC</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/>Operation time for phase C Functionally Constrained Data Attribute data variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=operTmPhsCDAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
						    <xsl:otherwise>
                  <xsl:message>Unexpected create ACT DA variable for <xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:message>
                  <xsl:element name="UAVariable">
								    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="BrowseName">2:<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DADT</xsl:attribute>
                    <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/> DA variable</xsl:element>
								    <xsl:element name="Description"><xsl:value-of select="@daName"/> Functionally Constrained Data Attribute data variable</xsl:element>
								    <References>
								      <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DAVT</Reference>
                      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
                    </References>
                  </xsl:element>
						    </xsl:otherwise>
              </xsl:choose>						
            </xsl:when>
            
					  <!--DOs with generic CDC DPC-Controllable double point-->
					  <xsl:when test="@doName=&apos;GnCtl&apos;
						  or @doName=&apos;Pos&apos;
						  or @doName=&apos;PosA&apos;
						  or @doName=&apos;PosB&apos;
						  or @doName=&apos;DPCSO1&apos;
						  or @doName=&apos;PosC&apos;">	
              <xsl:choose>
					      <xsl:when test="@daName=&apos;q&apos;">
                  <xsl:call-template name="Quality">
                    <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="@daName= &apos;stVal&apos;">
                </xsl:when>
						    <xsl:otherwise>
                  <xsl:message>Unexpected create DPC DA variable for <xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:message>
                  <xsl:element name="UAVariable">
								    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="BrowseName">2:<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DADT</xsl:attribute>
                    <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/> DA variable</xsl:element>
								    <xsl:element name="Description"><xsl:value-of select="@daName"/> Functionally Constrained Data Attribute data variable</xsl:element>
								    <References>
								      <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DAVT</Reference>
                      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
                    </References>
                  </xsl:element>
						    </xsl:otherwise>
              </xsl:choose>
            </xsl:when>	
						
            <!--DOs with generic CDC ENC-Controllable enumerated status-->
					  <xsl:when test="@doName=&apos;Mod&apos;
						  or @doName=&apos;PmpCtl&apos;
						  or @doName=&apos;FanCtlGen&apos;
						  or @doName=&apos;FanCtl&apos;
						  or @doName=&apos;OpModSyn&apos;">	
              <xsl:if test="@daName!=&apos;&apos;">
              <xsl:choose>
					        <xsl:when test="@daName=&apos;q&apos;">
                    <xsl:call-template name="Quality">
                      <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="@daName= &apos;stVal&apos;">
                      <xsl:element name="UAVariable">
								      <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								      <xsl:attribute name="BrowseName">2:stVal</xsl:attribute>
								      <xsl:attribute name="DataType">ns=1;s=P_INT32U</xsl:attribute>
								      <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.stVal FCDA</xsl:element>
								      <xsl:element name="Description">ENC EnumDA (Mod) Status Value Functionally Constrained Data Attribute data variable</xsl:element>
								      <References>
								        <Reference ReferenceType="HasTypeDefinition">i=63</Reference>
								        <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								        <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								        <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=ST</Reference>-->
								      </References>
							      </xsl:element>
                  </xsl:when>
                  <xsl:when test="@daName= &apos;ctlModel&apos;">
                  <!--<xsl:message>Create ctlModel variable for ENC CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlModel</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:ctlModel</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=ctlModelDT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.ctlModel</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/>ENC Control Model Functionally Constrained Data Attribute data variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=ctlModelDAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
						      <xsl:otherwise>
                    <xsl:message>Unexpected create ENC DA variable for <xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:message>
                    <xsl:element name="UAVariable">
								      <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								      <xsl:attribute name="BrowseName">2:<xsl:value-of select="@daName"/></xsl:attribute>
								      <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DADT</xsl:attribute>
                      <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/> DA variable</xsl:element>
								      <xsl:element name="Description"><xsl:value-of select="@daName"/> Functionally Constrained Data Attribute data variable</xsl:element>
								      <References>
								        <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DAVT</Reference>
                        <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								        <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
                      </References>
                    </xsl:element>
						      </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
					  </xsl:when>	
            
					  <!--DOs with generic CDC ENS-Controllable enumerated status-->
					  <xsl:when test="@doName=&apos;PhyHealth&apos;
						  or @doName=&apos;Beh&apos;
						  or @doName=&apos;Health&apos;
						  or @doName=&apos;TmSyn&apos;
						  or @doName=&apos;StClcTun&apos;
						  or @doName=&apos;RotDir&apos;
						  or @doName=&apos;AdjSt&apos;
						  or @doName=&apos;SptEndSt&apos;
						  or @doName=&apos;EEHealth&apos;
						  or @doName=&apos;FltLoop&apos;
						  or @doName=&apos;TrBeh&apos;
						  or @doName=&apos;AutoRecSt&apos;
						  or @doName=&apos;MechHealth&apos;">	
						  <!--<xsl:message>Create DA variables for ENS CDC with ST FC</xsl:message>-->	
              <xsl:if test="@daName!=&apos;&apos;">
						  <xsl:choose>
					        <xsl:when test="@daName=&apos;q&apos;">
                    <xsl:call-template name="Quality">
                      <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="@daName= &apos;stVal&apos;">
                    <xsl:element name="UAVariable">
								      <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								      <xsl:attribute name="BrowseName">2:stVal</xsl:attribute>
								      <xsl:attribute name="DataType">ns=1;s=P_INT32U</xsl:attribute>
								      <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.stVal FCDA</xsl:element>
								      <xsl:element name="Description">ENS EnumDA (Beh, Health, AutoRecSt) Status Value Functionally Constrained Data Attribute data variable</xsl:element>
								      <References>
								        <Reference ReferenceType="HasTypeDefinition">i=63</Reference>
								        <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								        <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								        <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=ST</Reference>-->
								      </References>
                    </xsl:element>
                  </xsl:when>
						      <xsl:otherwise>
                    <xsl:message>Unexpected create ENS DA variable for <xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:message>
                    <xsl:element name="UAVariable">
								      <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								      <xsl:attribute name="BrowseName">2:<xsl:value-of select="@daName"/></xsl:attribute>
								      <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DADT</xsl:attribute>
                      <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/> DA variable</xsl:element>
								      <xsl:element name="Description"><xsl:value-of select="@daName"/> Functionally Constrained Data Attribute data variable</xsl:element>
								      <References>
								        <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DAVT</Reference>
                        <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								        <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
                      </References>
                    </xsl:element>
						      </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
					  </xsl:when>	
            
					  <!--DOs with generic CDC SPS-Single point status-->
					  <xsl:when test="@doName=&apos;ACAlm&apos;
						  or @doName=&apos;Alm&apos;
						  or @doName=&apos;AlmLStOv&apos;
						  or @doName=&apos;AngInd&apos;
						  or @doName=&apos;AOfsCam&apos;
						  or @doName=&apos;Auto&apos;
						  or @doName=&apos;BatHi&apos;
						  or @doName=&apos;BatLo&apos;
						  or @doName=&apos;BlkA&apos;
						  or @doName=&apos;BlkAOv&apos;
						  or @doName=&apos;BlkSt&apos;
						  or @doName=&apos;BlkZn&apos;
						  or @doName=&apos;Blocked&apos;
						  or @doName=&apos;BrkOn&apos;
						  or @doName=&apos;BrkOff&apos;
						  or @doName=&apos;ClsPos&apos;
						  or @doName=&apos;CGAlm&apos;
						  or @doName=&apos;DenAlm&apos;
						  or @doName=&apos;DschBlk&apos;
						  or @doName=&apos;DeflOpn&apos;
						  or @doName=&apos;DirRot&apos;
						  or @doName=&apos;DschBlk&apos;
						  or @doName=&apos;DschBlk&apos;
						  or @doName=&apos;EnaCls&apos;
						  or @doName=&apos;EnaOpn&apos;
						  or @doName=&apos;EnaPosL&apos;
						  or @doName=&apos;EnaPosR&apos;
						  or @doName=&apos;FADet&apos;
						  or @doName=&apos;FanOvCur&apos;
						  or @doName=&apos;Flush&apos;
						  or @doName=&apos;FlwLevAlm&apos;
						  or @doName=&apos;FlwMax&apos;
						  or @doName=&apos;FlwMin&apos;
						  or @doName=&apos;FuFail&apos;
						  or @doName=&apos;GasFlwTr&apos;
						  or @doName=&apos;GasInsAlm&apos;
						  or @doName=&apos;GasInsTr&apos;
						  or @doName=&apos;GasFlwTr&apos;
						  or @doName=&apos;GrAlm&apos;
						  or @doName=&apos;GrdRx&apos;
						  or @doName=&apos;GrWrn&apos;
						  or @doName=&apos;GteBlk&apos;
						  or @doName=&apos;H2Alm&apos;
						  or @doName=&apos;HiLev&apos;
						  or @doName=&apos;HiLevDn&apos;
						  or @doName=&apos;HiLim&apos;
						  or @doName=&apos;HPTmpAlm&apos;
						  or @doName=&apos;HPTmpTr&apos;
						  or @doName=&apos;HzInd&apos;
						  or @doName=&apos;Ind&apos;
						  or @doName=&apos;InOv&apos;
						  or @doName=&apos;InsAlm&apos;
						  or @doName=&apos;InsBlk&apos;
						  or @doName=&apos;InsLevMax&apos;
						  or @doName=&apos;InsLevMin&apos;
						  or @doName=&apos;InsTr&apos;
						  or @doName=&apos;LHz&apos;
						  or @doName=&apos;LkgAlm&apos;
						  or @doName=&apos;Loc&apos;
						  or @doName=&apos;LoLev&apos;
						  or @doName=&apos;LoLevDn&apos;
						  or @doName=&apos;LoLim&apos;
						  or @doName=&apos;LoOfGrd&apos;
						  or @doName=&apos;LosOil&apos;
						  or @doName=&apos;LosVac&apos;
						  or @doName=&apos;LV&apos;
						  or @doName=&apos;MemOv&apos;
						  or @doName=&apos;MstAlm&apos;
						  or @doName=&apos;MotPro&apos;
						  or @doName=&apos;Mvm&apos;
						  or @doName=&apos;NeutAlm&apos;
						  or @doName=&apos;NdlMan&apos;
						  or @doName=&apos;OANL&apos;
						  or @doName=&apos;OilFil&apos;
						  or @doName=&apos;OilTmpHi&apos;
						  or @doName=&apos;Op&apos;
						  or @doName=&apos;OpB&apos;
						  or @doName=&apos;OpOvA&apos;
						  or @doName=&apos;OpOvExt&apos;
						  or @doName=&apos;OpOvV&apos;
						  or @doName=&apos;OPSA&apos;
						  or @doName=&apos;OpUnExt&apos;
						  or @doName=&apos;OpUnV&apos;
						  or @doName=&apos;OutOv&apos;
						  or @doName=&apos;OpLev&apos;
						  or @doName=&apos;OpnPos&apos;
						  or @doName=&apos;PosDn&apos;
						  or @doName=&apos;PosUp&apos;
						  or @doName=&apos;PaDschAlm&apos;
						  or @doName=&apos;PmpAlm&apos;
						  or @doName=&apos;PmpOvCur&apos;
						  or @doName=&apos;PresAlm&apos;
						  or @doName=&apos;PresTr&apos;
						  or @doName=&apos;ProRx&apos;
						  or @doName=&apos;ProTx&apos;
						  or @doName=&apos;Proxy&apos;
						  or @doName=&apos;PwrDn&apos;
						  or @doName=&apos;PwrSupAlm&apos;
						  or @doName=&apos;PwrUp&apos;
						  or @doName=&apos;RcdMade&apos;
						  or @doName=&apos;RcdStr&apos;
						  or @doName=&apos;Rel&apos;
						  or @doName=&apos;RHz&apos;
						  or @doName=&apos;RV&apos;
						  or @doName=&apos;RcdMade&apos;							
						  or @doName=&apos;Rel&apos;
						  or @doName=&apos;RotDir&apos;
						  or @doName=&apos;SpdBrk&apos;
						  or @doName=&apos;SpdCrp&apos;
						  or @doName=&apos;SpdExt&apos;
						  or @doName=&apos;SpdLft&apos;
						  or @doName=&apos;SpdLub&apos;
						  or @doName=&apos;SpdOvr&apos;
						  or @doName=&apos;SpdRB&apos;
						  or @doName=&apos;SpdSyn&apos;
						  or @doName=&apos;SpdStl&apos;
						  or @doName=&apos;SptDir&apos;
						  or @doName=&apos;SptDn&apos;
						  or @doName=&apos;SptDvAlm&apos;
						  or @doName=&apos;SptUp&apos;
						  or @doName=&apos;StrInh&apos;
						  or @doName=&apos;StrPOW&apos;
						  or @doName=&apos;SwArcDet&apos;
						  or @doName=&apos;SynFlt&apos;
						  or @doName=&apos;SynPrg&apos;
						  or @doName=&apos;SynRdy&apos;
						  or @doName=&apos;SynSetMod&apos;
						  or @doName=&apos;TestRsl&apos;
						  or @doName=&apos;TmExc&apos;
						  or @doName=&apos;TmpAlm&apos;
						  or @doName=&apos;Stuck&apos;
						  or @doName=&apos;TotFlwMax&apos;
						  or @doName=&apos;TotFlwMin&apos;
						  or @doName=&apos;Trip&apos;
						  or @doName=&apos;VInd&apos;
						  or @doName=&apos;VOvSt&apos;">
              <!--<xsl:message>Create .stVal DA variable for SPS CDC with ST FC</xsl:message>-->
              <xsl:choose>
					      <xsl:when test="@daName=&apos;q&apos;">
                  <xsl:call-template name="Quality">
                    <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="@daName= &apos;stVal&apos;">
                    <xsl:element name="UAVariable">
                    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								    <xsl:attribute name="BrowseName">2:stVal</xsl:attribute>
								    <xsl:attribute name="DataType">ns=1;s=P_BOOLEAN</xsl:attribute>
								    <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.stVal FCDA</xsl:element>
								    <xsl:element name="Description">SPS Status Value Functionally Constrained Data Attribute data variable</xsl:element>
								    <References>
								      <Reference ReferenceType="HasTypeDefinition">i=63</Reference>
								      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								      <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=ST</Reference>-->
								    </References>
                  </xsl:element>
                </xsl:when>
						    <xsl:otherwise>
                  <xsl:message>Unexpected create SPS DA variable for <xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:message>
                  <xsl:element name="UAVariable">
								    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="BrowseName">2:<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DADT</xsl:attribute>
                    <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/> DA variable</xsl:element>
								    <xsl:element name="Description"><xsl:value-of select="@daName"/> Functionally Constrained Data Attribute data variable</xsl:element>
								    <References>
								      <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DAVT</Reference>
                      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
                    </References>
                  </xsl:element>
						    </xsl:otherwise>
              </xsl:choose>
					  </xsl:when>
            
					  <!--DOs with Indication CDC SPS-Single point status-->
					  <xsl:when test="@doName=&apos;Alm1&apos;
						  or @doName=&apos;Alm2&apos;
						  or @doName=&apos;Alm3&apos;
						  or @doName=&apos;Alm4&apos;
						  or @doName=&apos;Alm5&apos;
						  or @doName=&apos;Alm6&apos;
						  or @doName=&apos;Alm7&apos;
						  or @doName=&apos;Alm8&apos;
						  or @doName=&apos;Alm9&apos;
              or @doName=&apos;Alm10&apos;
              or @doName=&apos;Alm11&apos;
						  or @doName=&apos;Alm12&apos;
						  or @doName=&apos;Alm13&apos;
						  or @doName=&apos;Alm14&apos;
						  or @doName=&apos;Alm15&apos;
						  or @doName=&apos;Alm16&apos;
						  or @doName=&apos;Alm17&apos;
						  or @doName=&apos;Alm18&apos;
						  or @doName=&apos;Alm19&apos;
              or @doName=&apos;Alm20&apos;
              or @doName=&apos;Alm21&apos;
						  or @doName=&apos;Alm22&apos;
						  or @doName=&apos;Alm23&apos;
						  or @doName=&apos;Alm24&apos;
						  or @doName=&apos;Alm25&apos;
						  or @doName=&apos;Alm26&apos;
						  or @doName=&apos;Alm27&apos;
						  or @doName=&apos;Alm28&apos;
						  or @doName=&apos;Alm29&apos;
              or @doName=&apos;Alm30&apos;
              or @doName=&apos;Alm31&apos;
						  or @doName=&apos;Alm32&apos;
						  or @doName=&apos;Alm33&apos;
						  or @doName=&apos;Alm34&apos;
						  or @doName=&apos;Alm35&apos;
						  or @doName=&apos;Alm36&apos;
						  or @doName=&apos;Alm37&apos;
						  or @doName=&apos;Alm38&apos;
						  or @doName=&apos;Alm39&apos;
              or @doName=&apos;Alm40&apos;
              or @doName=&apos;Alm41&apos;
						  or @doName=&apos;Alm42&apos;
						  or @doName=&apos;Alm43&apos;
						  or @doName=&apos;Alm44&apos;
						  or @doName=&apos;Alm45&apos;
						  or @doName=&apos;Alm46&apos;
						  or @doName=&apos;Alm47&apos;
						  or @doName=&apos;Alm48&apos;
						  or @doName=&apos;Alm49&apos;
              or @doName=&apos;Alm50&apos;
              or @doName=&apos;Alm51&apos;
						  or @doName=&apos;Alm52&apos;
						  or @doName=&apos;Alm53&apos;
						  or @doName=&apos;Alm54&apos;
						  or @doName=&apos;Alm55&apos;
						  or @doName=&apos;Alm56&apos;
						  or @doName=&apos;Alm57&apos;
						  or @doName=&apos;Alm58&apos;
						  or @doName=&apos;Alm59&apos;
              or @doName=&apos;Alm60&apos;
              or @doName=&apos;Alm61&apos;
						  or @doName=&apos;Alm62&apos;
						  or @doName=&apos;Alm63&apos;
						  or @doName=&apos;Alm64&apos;
						  or @doName=&apos;Alm65&apos;
						  or @doName=&apos;Alm66&apos;
						  or @doName=&apos;Alm67&apos;
						  or @doName=&apos;Alm68&apos;
						  or @doName=&apos;Alm69&apos;
              or @doName=&apos;Alm70&apos;
              or @doName=&apos;Alm71&apos;
						  or @doName=&apos;Alm72&apos;
						  or @doName=&apos;Alm73&apos;
						  or @doName=&apos;Alm74&apos;
						  or @doName=&apos;Alm75&apos;
						  or @doName=&apos;Alm76&apos;
						  or @doName=&apos;Alm77&apos;
						  or @doName=&apos;Alm78&apos;
						  or @doName=&apos;Alm79&apos;
              or @doName=&apos;Alm80&apos;
              or @doName=&apos;Alm81&apos;
						  or @doName=&apos;Alm82&apos;
						  or @doName=&apos;Alm83&apos;
						  or @doName=&apos;Alm84&apos;
						  or @doName=&apos;Alm85&apos;
						  or @doName=&apos;Alm86&apos;
						  or @doName=&apos;Alm87&apos;
						  or @doName=&apos;Alm88&apos;
						  or @doName=&apos;Alm89&apos;
              or @doName=&apos;Alm90&apos;
              or @doName=&apos;Alm91&apos;
						  or @doName=&apos;Alm92&apos;
						  or @doName=&apos;Alm93&apos;
						  or @doName=&apos;Alm94&apos;
						  or @doName=&apos;Alm95&apos;
						  or @doName=&apos;Alm96&apos;
						  or @doName=&apos;Alm97&apos;
						  or @doName=&apos;Alm98&apos;
						  or @doName=&apos;Alm99&apos;
              or @doName=&apos;Ind1&apos;
 						  or @doName=&apos;Ind2&apos;
						  or @doName=&apos;Ind3&apos;
						  or @doName=&apos;Ind4&apos;
						  or @doName=&apos;Ind5&apos;
						  or @doName=&apos;Ind6&apos;
						  or @doName=&apos;Ind7&apos;
						  or @doName=&apos;Ind8&apos;
						  or @doName=&apos;Ind9&apos;
              or @doName=&apos;Ind10&apos;
              or @doName=&apos;Ind11&apos;
						  or @doName=&apos;Ind12&apos;
						  or @doName=&apos;Ind13&apos;
						  or @doName=&apos;Ind14&apos;
						  or @doName=&apos;Ind15&apos;
						  or @doName=&apos;Ind16&apos;
						  or @doName=&apos;Ind17&apos;
						  or @doName=&apos;Ind18&apos;
						  or @doName=&apos;Ind19&apos;
              or @doName=&apos;Ind20&apos;
              or @doName=&apos;Ind21&apos;
						  or @doName=&apos;Ind22&apos;
						  or @doName=&apos;Ind23&apos;
						  or @doName=&apos;Ind24&apos;
						  or @doName=&apos;Ind25&apos;
						  or @doName=&apos;Ind26&apos;
						  or @doName=&apos;Ind27&apos;
						  or @doName=&apos;Ind28&apos;
						  or @doName=&apos;Ind29&apos;
              or @doName=&apos;Ind30&apos;
              or @doName=&apos;Ind31&apos;
						  or @doName=&apos;Ind32&apos;">
              <!--<xsl:message>Create .stVal DA variable for SPS CDC with ST FC</xsl:message>-->
              <xsl:choose>
					      <xsl:when test="@daName=&apos;q&apos;">
                  <xsl:call-template name="Quality">
                    <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="@daName= &apos;stVal&apos;">
                  <xsl:element name="UAVariable">
								    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								    <xsl:attribute name="BrowseName">2:stVal</xsl:attribute>
								    <xsl:attribute name="DataType">ns=1;s=P_BOOLEAN</xsl:attribute>
								    <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.stVal FCDA</xsl:element>
								    <xsl:element name="Description">SPS (Ind and Alm) Status Value Functionally Constrained Data Attribute data variable</xsl:element>
								    <References>
								      <Reference ReferenceType="HasTypeDefinition">i=63</Reference>
								      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								      <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=ST</Reference>-->
								    </References>
							    </xsl:element>
                </xsl:when>
						    <xsl:otherwise>
                  <xsl:message>Unexpected create SPS DA variable for <xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:message>
                  <xsl:element name="UAVariable">
								    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="BrowseName">2:<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DADT</xsl:attribute>
                    <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/> DA variable</xsl:element>
								    <xsl:element name="Description"><xsl:value-of select="@daName"/> Functionally Constrained Data Attribute data variable</xsl:element>
								    <References>
								      <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DAVT</Reference>
                      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
                    </References>
                  </xsl:element>
						    </xsl:otherwise>
              </xsl:choose>
					  </xsl:when>
            
            <xsl:when test="@fc=&apos;ST&apos; 
						  and	(@doName=&apos;Pos&apos;)">
              <xsl:choose>
					      <xsl:when test="@daName=&apos;q&apos;">
                  <xsl:call-template name="Quality">
                    <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="@daName= &apos;stVal&apos;">
                  <xsl:element name="UAVariable">
								    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								    <xsl:attribute name="BrowseName">2:stVal</xsl:attribute>
								    <xsl:attribute name="DataType">ns=1;s=DbposKind</xsl:attribute>
								    <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.stVal FCDA</xsl:element>
								    <xsl:element name="Description">DPC (pos) Status Value Functionally Constrained Data Attribute data variable</xsl:element>
								    <References>
								      <Reference ReferenceType="HasTypeDefinition">i=63</Reference>
								      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								      <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=ST</Reference>-->
								    </References>
                  </xsl:element>  
                </xsl:when>
						    <xsl:otherwise>
                  <xsl:message>Unexpected create Pos DA variable for <xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:message>
                  <xsl:element name="UAVariable">
								    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="BrowseName">2:<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DADT</xsl:attribute>
                    <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/> DA variable</xsl:element>
								    <xsl:element name="Description"><xsl:value-of select="@daName"/> Functionally Constrained Data Attribute data variable</xsl:element>
								    <References>
								      <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DAVT</Reference>
                      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
                    </References>
                  </xsl:element>
						    </xsl:otherwise>
              </xsl:choose>
					  </xsl:when>	
						
					  <!--DOs with generic CDC SPC-Single point control-->
						  <xsl:when test="@doName=&apos;ActPwrL&apos;
						  or @doName=&apos;ActPwrR&apos;
						  or @doName=&apos;Auto&apos;
						  or @doName=&apos;AutoUpLod&apos;
						  or @doName=&apos;AuxSCO&apos;
						  or @doName=&apos;BatTest&apos;
						  or @doName=&apos;Blk&apos;
						  or @doName=&apos;BlkCls&apos;
						  or @doName=&apos;BlkOpn&apos;
						  or @doName=&apos;BlkSyn&apos;
						  or @doName=&apos;BlkRec&apos;
						  or @doName=&apos;CapDS&apos;
						  or @doName=&apos;CECtl&apos;
						  or @doName=&apos;ChaMotEna&apos;
						  or @doName=&apos;ChkRec&apos;
						  or @doName=&apos;CntRs&apos;
						  or @doName=&apos;DExt&apos;
						  or @doName=&apos;DltRcd&apos;
						  or @doName=&apos;EvStr&apos;
						  or @doName=&apos;LCol&apos;
						  or @doName=&apos;LHz&apos;
						  or @doName=&apos;LTCBlk&apos;
						  or @doName=&apos;LTCDragRs&apos;
						  or @doName=&apos;LV&apos;
						  or @doName=&apos;MemClr&apos;
						  or @doName=&apos;MemRs&apos;
						  or @doName=&apos;NdlAutSl&apos;
						  or @doName=&apos;NdlManSl&apos;
						  or @doName=&apos;OfsCamEna&apos;
						  or @doName=&apos;Operate&apos;
						  or @doName=&apos;Stop&apos;
						  or @doName=&apos;OfsCamEna&apos;
						  or @doName=&apos;OfsCamEna&apos;
						  or @doName=&apos;OfsCamEna&apos;
						  or @doName=&apos;RcdTrg&apos;
						  or @doName=&apos;RCol&apos;
						  or @doName=&apos;ReactPwrL&apos;
						  or @doName=&apos;ReactPwrR&apos;
						  or @doName=&apos;RelDeaBus&apos;
						  or @doName=&apos;RHz&apos;
						  or @doName=&apos;RsStat&apos;
						  or @doName=&apos;RsSyn&apos;
						  or @doName=&apos;RV&apos;
						  or @doName=&apos;SPCSO&apos;
						  or @doName=&apos;StopSynPrg&apos;
						  or @doName=&apos;StopVlv&apos;
						  or @doName=&apos;StrSynPrg&apos;
						  or @doName=&apos;VRed1&apos;
						  or @doName=&apos;VRed2&apos;">  
						  <!--<xsl:message>Create origin DA variables for SPC CDC with ST FC</xsl:message>-->
              <xsl:choose>
					      <xsl:when test="@daName=&apos;q&apos;">
                  <xsl:call-template name="Quality">
                    <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="@daName= &apos;stVal&apos;">
                  <xsl:element name="UAVariable">
								    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								    <xsl:attribute name="BrowseName">2:stVal</xsl:attribute>
								    <xsl:attribute name="DataType">ns=1;s=P_INT32U</xsl:attribute>
								    <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.stVal FCDA</xsl:element>
								    <xsl:element name="Description">SPC (BlkOpen, BlkCls) Status Value Functionally Constrained Data Attribute data variable</xsl:element>
								    <References>
								      <Reference ReferenceType="HasTypeDefinition">i=63</Reference>
								      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								      <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=ST</Reference>-->
								    </References>
							    </xsl:element>
                </xsl:when>
						    <xsl:otherwise>
                  <xsl:message>Unexpected create SPC DA variable for <xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:message>
                  <xsl:element name="UAVariable">
								    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="BrowseName">2:<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DADT</xsl:attribute>
                    <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/> DA variable</xsl:element>
								    <xsl:element name="Description"><xsl:value-of select="@daName"/> Functionally Constrained Data Attribute data variable</xsl:element>
								    <References>
								      <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DAVT</Reference>
                      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
                    </References>
                  </xsl:element>
						    </xsl:otherwise>
              </xsl:choose>						
					  </xsl:when>
            
					  <!--DOs with generic CDC INC-Controllable integer status-->
					  <xsl:when test="@doName=&apos;ArcMod&apos;
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
						  or @doName=&apos;VtpMod&apos;">
						  <!--<xsl:message>Create origin DA variables for INC CDC with ST FC</xsl:message>-->
              <xsl:choose>
					      <xsl:when test="@daName=&apos;q&apos;">
                  <xsl:call-template name="Quality">
                    <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="@daName= &apos;stVal&apos;">
                <xsl:element name="UAVariable">
								  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								  <xsl:attribute name="BrowseName">2:stVal</xsl:attribute>
								  <xsl:attribute name="DataType">ns=1;s=P_INT32U</xsl:attribute>
								  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.stVal FCDA</xsl:element>
								  <xsl:element name="Description">INC Mod Status Value Functionally Constrained Data Attribute data variable</xsl:element>
								  <References>
								    <Reference ReferenceType="HasTypeDefinition">i=63</Reference>
								    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								    <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=ST</Reference>-->
								  </References>
							  </xsl:element>	
                </xsl:when>
						    <xsl:otherwise>
                  <xsl:message>Unexpected create INC DA variable for <xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:message>
                  <xsl:element name="UAVariable">
								    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="BrowseName">2:<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DADT</xsl:attribute>
                    <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/> DA variable</xsl:element>
								    <xsl:element name="Description"><xsl:value-of select="@daName"/> Functionally Constrained Data Attribute data variable</xsl:element>
								    <References>
								      <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DAVT</Reference>
                      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
                    </References>
                  </xsl:element>
						    </xsl:otherwise>
              </xsl:choose>														
					  </xsl:when>	
            
					  <!--DOs with generic CDC INS-Integer status-->
					  <xsl:when test="@doName=&apos;ArcBeh&apos;
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
							  or @doName=&apos;ThmBeh&apos;
							  or @doName=&apos;VtpBeh&apos;">					
              <!--<xsl:message>Create .stVal DA variable for INS CDC with ST FC</xsl:message>-->
              <xsl:choose>
					      <xsl:when test="@daName=&apos;q&apos;">
                  <xsl:call-template name="Quality">
                    <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="@daName= &apos;stVal&apos;">
                  <xsl:element name="UAVariable">
								    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								    <xsl:attribute name="BrowseName">2:stVal</xsl:attribute>
								    <xsl:attribute name="DataType">ns=1;s=P_INT32U</xsl:attribute>
								    <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.stVal FCDA</xsl:element>
								    <xsl:element name="Description">INS (Beh) Value Functionally Constrained Data Attribute data variable</xsl:element>
								    <References>
								      <Reference ReferenceType="HasTypeDefinition">i=63</Reference>
								      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								      <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=ST</Reference>-->
								    </References>
							    </xsl:element>
                </xsl:when>
						    <xsl:otherwise>
                  <xsl:message>Unexpected create INS DA variable for <xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:message>
                  <xsl:element name="UAVariable">
								    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="BrowseName">2:<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DADT</xsl:attribute>
                    <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/> DA variable</xsl:element>
								    <xsl:element name="Description"><xsl:value-of select="@daName"/> Functionally Constrained Data Attribute data variable</xsl:element>
								    <References>
								      <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DAVT</Reference>
                      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
                    </References>
                  </xsl:element>
						    </xsl:otherwise>
              </xsl:choose>
					  </xsl:when>
            
					  <!--DOs with generic CDC BSC-Binary controlled step position information-->
					  <xsl:when test="@fc=&apos;ST&apos; 
						  and	(@doName=&apos;TapChg&apos;
						  or @doName=&apos;PosChg&apos;)">
						  <!--<xsl:message>Create .stVal DA variable for BSC CDC with ST FC</xsl:message>-->
              <xsl:choose>
					      <xsl:when test="@daName=&apos;q&apos;">
                  <xsl:call-template name="Quality">
                    <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="@daName= &apos;stVal&apos;">
                  <xsl:element name="UAVariable">
								    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								    <xsl:attribute name="BrowseName">2:stVal</xsl:attribute>
								    <xsl:attribute name="DataType">ns=1;s=P_BOOLEAN</xsl:attribute>
								    <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.stVal FCDA</xsl:element>
								    <xsl:element name="Description">BSC (TabChg, PosChg) Status Value Functionally Constrained Data Attribute data variable</xsl:element>
								    <References>
								      <Reference ReferenceType="HasTypeDefinition">i=63</Reference>
								      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								      <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=ST</Reference>-->
								    </References>
							    </xsl:element>
                </xsl:when>
                <xsl:when test="@daName= &apos;valWTr&apos;">
                  <!--<xsl:message>Create valWTr variable for BSC CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.valWTr</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:valWTr</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=valWTrDT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.valWTr</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/> valWTr Functionally Constrained Data Attribute data variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=valWTrDAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
						    <xsl:otherwise>
                  <xsl:message>Unexpected create BSC DA variable for <xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:message>
                  <xsl:element name="UAVariable">
								    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="BrowseName">2:<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DADT</xsl:attribute>
                    <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/> DA variable</xsl:element>
								    <xsl:element name="Description"><xsl:value-of select="@daName"/> Functionally Constrained Data Attribute data variable</xsl:element>
								    <References>
								      <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DAVT</Reference>
                      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
                    </References>
                  </xsl:element>
						    </xsl:otherwise>
              </xsl:choose>
					  </xsl:when>	
            
					  <!--DOs with generic CDC BCR-Binary counter reading-->
					  <xsl:when test="@doName=&apos;TotVAh&apos;
							  or @doName=&apos;TotWh&apos;
							  or @doName=&apos;TotVArhSt&apos;
							  or @doName=&apos;SupWh&apos;
							  or @doName=&apos;SupVArh&apos;
							  or @doName=&apos;DmdWh&apos;
							  or @doName=&apos;DmdVArh&apos;
							  or @doName=&apos;SumSwARs&apos;
							  or @doName=&apos;Out&apos;">
              <!--<xsl:message>Create .actVal DA variable for BCR CDC with ST FC</xsl:message>-->
              <xsl:choose>
					      <xsl:when test="@daName=&apos;q&apos;">
                  <xsl:call-template name="Quality">
                    <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="@daName= &apos;stVal&apos;">
                </xsl:when>
                <xsl:when test="@daName= &apos;actVal&apos;">
                  <!--<xsl:message>Create actVal variable for BCR CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.actVal</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:actVal</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=actValDT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.actVal</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/>Actual Value Functionally Constrained Data Attribute data variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=actValDAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
                <xsl:when test="@daName= &apos;frVal&apos;">
                  <!--<xsl:message>Create frVal variable for BCR CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.frVal</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:frVal</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=frValDT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.frVal</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/> frVal Functionally Constrained Data Attribute data variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=frValDAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
						    <xsl:otherwise>
                  <xsl:message>Unexpected create BCR DA variable for <xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:message>
                  <xsl:element name="UAVariable">
								    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="BrowseName">2:<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DADT</xsl:attribute>
                    <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/> DA variable</xsl:element>
								    <xsl:element name="Description"><xsl:value-of select="@daName"/> Functionally Constrained Data Attribute data variable</xsl:element>
								    <References>
								      <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DAVT</Reference>
                      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
                    </References>
                  </xsl:element>
						    </xsl:otherwise>
              </xsl:choose>
					  </xsl:when>
            
					  <!--DOs with generic CDC ISC-Integer controlled step position information-->
					  <xsl:when test="@doName=&apos;ColTapPos&apos;
						  or @doName=&apos;TapPos&apos;">
							  <!--<xsl:message>Create Object for ISC CDC</xsl:message>-->	
              <xsl:choose>
					      <xsl:when test="@daName=&apos;q&apos;">
                  <xsl:call-template name="Quality">
                    <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="@daName= &apos;stVal&apos;">
                </xsl:when>
						    <xsl:otherwise>
                  <xsl:message>Unexpected create ISC DA variable for <xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:message>
                  <xsl:element name="UAVariable">
								    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="BrowseName">2:<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DADT</xsl:attribute>
                    <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/> DA variable</xsl:element>
								    <xsl:element name="Description"><xsl:value-of select="@daName"/> Functionally Constrained Data Attribute data variable</xsl:element>
								    <References>
								      <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DAVT</Reference>
                      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
                    </References>
                  </xsl:element>
						    </xsl:otherwise>
              </xsl:choose>
					  </xsl:when>	
            
					  <!--DOs with generic CDC SEC-Security violation counting"-->
					  <xsl:when test="@doName=&apos;AuthFail&apos;
						  or @doName=&apos;AcsCtlFail&apos;
						  or @doName=&apos;Ina&apos;
						  or @doName=&apos;SvcViol&apos;">
						  <!--<xsl:message>Create cnt DA variable for SEC CDC with ST FC</xsl:message>-->
              <xsl:choose>
					      <xsl:when test="@daName=&apos;q&apos;">
                  <xsl:call-template name="Quality">
                    <xsl:with-param name="PDO"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="@daName= &apos;stVal&apos;">
                </xsl:when>
                <xsl:when test="@daName= &apos;cnt&apos;">
                  <!--<xsl:message>Create cnt variable for SEC CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.cnt</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:cnt</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=cntDT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.cnt</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/> Count Functionally Constrained Data Attribute data variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=cntDAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
                <xsl:when test="@daName= &apos;sev&apos;">
                  <!--<xsl:message>Create sev variable for SEC CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.sev</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:sev</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=sevDT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.sev</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/> Severity Functionally Constrained Data Attribute data variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=sevDAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
                <xsl:when test="@daName= &apos;addr&apos;">
                  <!--<xsl:message>Create addr variable for SEC CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.addr</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:addr</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=addrDT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.addr</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/> Address Functionally Constrained Data Attribute data variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=addrDAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
                <xsl:when test="@daName= &apos;addInfo&apos;">
                  <!--<xsl:message>Create addInfo variable for SEC CDC</xsl:message>-->	
								  <xsl:element name="UAVariable">
									  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.addInfo</xsl:attribute>
									  <xsl:attribute name="BrowseName">2:addInfo</xsl:attribute>
									  <xsl:attribute name="DataType">ns=1;s=addInfoDT</xsl:attribute>
									  <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.addInfo</xsl:element>
									  <xsl:element name="Description"><xsl:value-of select="@desc"/> Addtional Information Functionally Constrained Data Attribute data variable</xsl:element>
									  <References>
									    <Reference ReferenceType="HasTypeDefinition">ns=1;s=addInfoDAVT</Reference>
									    <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  </References>
								  </xsl:element>	
                </xsl:when>
						    <xsl:otherwise>
                  <xsl:message>Unexpected create SEC DA variable for <xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:message>
                  <xsl:element name="UAVariable">
								    <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="BrowseName">2:<xsl:value-of select="@daName"/></xsl:attribute>
								    <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DADT</xsl:attribute>
                    <xsl:element name="DisplayName"><xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/> DA variable</xsl:element>
								    <xsl:element name="Description"><xsl:value-of select="@daName"/> Functionally Constrained Data Attribute data variable</xsl:element>
								    <References>
								      <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>DAVT</Reference>
                      <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								      <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
                    </References>
                  </xsl:element>
						    </xsl:otherwise>
              </xsl:choose>
            </xsl:when>	
					  <xsl:otherwise>
					  <xsl:message>ERROR MESSAGE: This Data Object <xsl:value-of select="@doName"/> is not supported within the CID2UANodeset script</xsl:message>
					  </xsl:otherwise>
				  </xsl:choose>
		  </xsl:for-each>
	  </xsl:for-each-group>
  </xsl:template>
  
<!--
Section 9: Complex Measured Values
-->  
  <xsl:template name="CMV">
    <xsl:param name="PPLN"/>
		<xsl:param name="PDO"/>
    <xsl:param name="PType"/>
    <xsl:param name="SDOname"/>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PDO"/>.<xsl:value-of select="$SDOname"/></xsl:attribute>
			<xsl:attribute name="BrowseName">2:<xsl:value-of select="$PDO"/>.<xsl:value-of select="$SDOname"/></xsl:attribute>
      <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="$PType"/>DODT</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PDO"/>.<xsl:value-of select="$SDOname"/> SDO </xsl:element>
			<xsl:element name="Description"><xsl:value-of select="$PDO"/>.<xsl:value-of select="$SDOname"/> Sub Data Object data variable</xsl:element>
      <!--<xsl:message>SDO Description: <xsl:value-of select="@desc"/></xsl:message>-->
			<References>
				<Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="$SDOname"/>DOVT</Reference>
        <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PDO"/></Reference>
				<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=SDOs</Reference>
      </References>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PDO"/>.<xsl:value-of select="$SDOname"/>.cVal</xsl:attribute>
			<xsl:attribute name="BrowseName">2:<xsl:value-of select="$PDO"/>.<xsl:value-of select="$SDOname"/>.cVal</xsl:attribute>
      <xsl:attribute name="DataType">ns=1;s=VectorDADT</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PDO"/>.<xsl:value-of select="$SDOname"/>.cVal FCDA</xsl:element>
			<xsl:element name="Description"><xsl:value-of select="$PDO"/>.<xsl:value-of select="$SDOname"/> Deadbanded complex value Functionally Constrained Data Attribute data variable</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">ns=1;s=cValDAVT</Reference>
				<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PDO"/>.<xsl:value-of select="$SDOname"/></Reference>
				<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=SDOs</Reference>
      </References>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PDO"/>.<xsl:value-of select="$SDOname"/>.cVal.mag</xsl:attribute>
			<xsl:attribute name="BrowseName">2:<xsl:value-of select="$PDO"/>.<xsl:value-of select="$SDOname"/>.cVal.mag</xsl:attribute>
      <xsl:attribute name="DataType">ns=1;s=AnalogueValueDADT</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PDO"/>.<xsl:value-of select="$SDOname"/>.cVal.mag FCDA</xsl:element>
			<xsl:element name="Description"><xsl:value-of select="$PDO"/>.<xsl:value-of select="$SDOname"/> Deadbanded complex value magnitude Functionally Constrained Data Attribute data variable</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">ns=1;s=magDAVT</Reference>
        <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PDO"/>.<xsl:value-of select="$SDOname"/>.cVal</Reference>
			</References>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PDO"/>.<xsl:value-of select="$SDOname"/>.cVal.mag.i</xsl:attribute>
			<xsl:attribute name="BrowseName">2:<xsl:value-of select="$PDO"/>.<xsl:value-of select="$SDOname"/>.cVal.mag.i</xsl:attribute>
			<xsl:attribute name="DataType">ns=1;s=P_INT32</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PDO"/>.<xsl:value-of select="$SDOname"/>.cVal.mag.i</xsl:element>
			<xsl:element name="Description"> Deadbanded complex value magnitude integer value Functionally Constrained Data Attribute data variable</xsl:element>
			<References>
			  <Reference ReferenceType="HasTypeDefinition">i=63</Reference>
			  <Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PDO"/>.<xsl:value-of select="$SDOname"/>.cVal.mag</Reference>
			</References>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PDO"/>.<xsl:value-of select="$SDOname"/>.cVal.mag.f</xsl:attribute>
			<xsl:attribute name="BrowseName">2:<xsl:value-of select="$PDO"/>.<xsl:value-of select="$SDOname"/>.cVal.mag.f</xsl:attribute>
			<xsl:attribute name="DataType">ns=1;s=P_FLOAT32</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PDO"/>.<xsl:value-of select="$SDOname"/>.cVal.mag.f</xsl:element>
			<xsl:element name="Description">Deadbanded complex value magnitude floating point value Functionally Constrained Data Attribute data variable</xsl:element>
			<References>
			  <Reference ReferenceType="HasTypeDefinition">i=63</Reference>
			  <Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PDO"/>.<xsl:value-of select="$SDOname"/>.cVal.mag</Reference>
			</References>
		</UAVariable>
	</xsl:template>
<!--
  Section 10:
  Report control template
-->  
  <xsl:template name="ControlBlock">
  <xsl:param name="PLN"/>
		<UAObject>
			<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></xsl:attribute>
			<xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="@name"/> RCB</xsl:element>
			<xsl:element name="Description"><xsl:value-of select="@desc"/>Report Control Block</xsl:element>
			<References>
				<Reference ReferenceType="ns=1;s=HasRCB" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/></Reference>
				<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Report Controls</Reference>
				<Reference ReferenceType="HasTypeDefinition">ns=1;s=ControlBlock</Reference>
			</References>
		</UAObject>
    <UAVariable>
			<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.RptID</xsl:attribute>
			<xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.RptID</xsl:attribute>
      <xsl:attribute name="DataType">ns=1;s=P_VisString129</xsl:attribute>
			<xsl:element name="DisplayName">RptID</xsl:element>
			<xsl:element name="Description">Unique ID for the report</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@datSet"/>
				</String>
			</Value>
		</UAVariable>
    <UAVariable>
			<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.RptEna</xsl:attribute>
			<xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.RptEna</xsl:attribute>
      <xsl:attribute name="DataType">ns=1;s=P_BOOLEAN</xsl:attribute>
			<xsl:element name="DisplayName">RptEna</xsl:element>
			<xsl:element name="Description">RptEna shall be set by the server if the subscription is enabled</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@datSet"/>
				</String>
			</Value>
		</UAVariable>
    <UAVariable>
			<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.datSet</xsl:attribute>
			<xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.datSet</xsl:attribute>
      <xsl:attribute name="DataType">ns=1;s=P_VisString255</xsl:attribute>
			<xsl:element name="DisplayName">datSet</xsl:element>
			<xsl:element name="Description">Data Set to be included in the Report</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@datSet"/>
				</String>
			</Value>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.confRev</xsl:attribute>
			<xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.confRev</xsl:attribute>
			<xsl:attribute name="DataType">ns=1;s=P_INT32U</xsl:attribute>
			<xsl:element name="DisplayName">confRev</xsl:element>
      <xsl:element name="Description">Configuraiton Revision</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@confRev"/>
				</String>
			</Value>
		</UAVariable>
    <UAVariable>
			<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.OptFields</xsl:attribute>
			<xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.OptFields</xsl:attribute>
			<xsl:attribute name="DataType">ns=1;s=ControlBlockOptFieldsDT</xsl:attribute>
			<xsl:element name="DisplayName">OptFlds</xsl:element>
			<xsl:element name="Description">Optional Fields</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></Reference>
			</References>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.buffered</xsl:attribute>
			<xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.buffered</xsl:attribute>
			<xsl:attribute name="DataType">ns=1;s=P_BOOLEAN</xsl:attribute>
			<xsl:element name="DisplayName">buffered</xsl:element>
			<xsl:element name="Description">If TRUE, Report is Buffered</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@buffered"/>
				</String>
			</Value>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.BufTm</xsl:attribute>
			<xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.BufTm</xsl:attribute>
			<xsl:attribute name="DataType">ns=1;s=P_INT32U</xsl:attribute>
			<xsl:element name="DisplayName">BufTm</xsl:element>
			<xsl:element name="Description">The Server shall set this Buffer Time to the Publishing Interval</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></Reference>
			</References>
		</UAVariable>
    		<UAVariable>
			<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.SqNum</xsl:attribute>
			<xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.SqNum</xsl:attribute>
			<xsl:attribute name="DataType">ns=1;s=P_INT16U</xsl:attribute>
			<xsl:element name="DisplayName">SqNum</xsl:element>
			<xsl:element name="Description">The Server shall set this Sequence Number</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@rptID"/>
				</String>
			</Value>
		</UAVariable>
    <UAVariable>
			<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.TrgOps</xsl:attribute>
			<xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.TrgOps</xsl:attribute>
			<xsl:attribute name="DataType">ns=1;s=ControlBlockTrgOpsDT</xsl:attribute>
			<xsl:element name="DisplayName">TrgOps</xsl:element>
			<xsl:element name="Description">Trigger Options</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></Reference>
			</References>
		</UAVariable>
    <UAVariable>
			<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.PurgeBuf</xsl:attribute>
			<xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.PurgeBuf</xsl:attribute>
			<xsl:attribute name="DataType">ns=1;s=P_BOOLEAN</xsl:attribute>
			<xsl:element name="DisplayName">PurgeBuf</xsl:element>
			<xsl:element name="Description">Purge Buffer</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></Reference>
			</References>
		</UAVariable>
    <UAVariable>
			<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.EntryID</xsl:attribute>
			<xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.EntryID</xsl:attribute>
			<xsl:attribute name="DataType">ns=1;s=P_INT32U</xsl:attribute>
			<xsl:element name="DisplayName">EntryID</xsl:element>
			<xsl:element name="Description">Entry ID</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></Reference>
			</References>
		</UAVariable>
    <UAVariable>
			<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.TimeOfEntry</xsl:attribute>
			<xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.TimeOfEntry</xsl:attribute>
			<xsl:attribute name="DataType">ns=1;s=P_INT32U</xsl:attribute>
			<xsl:element name="DisplayName">TimeOfEntry</xsl:element>
			<xsl:element name="Description">Time of last entry</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></Reference>
			</References>
		</UAVariable>
    <!--
		<UAVariable>
			<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.GI</xsl:attribute>
			<xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.GI</xsl:attribute>
			<xsl:attribute name="DataType">ns=1;s=P_VisString255</xsl:attribute>
			<xsl:element name="DisplayName">GI</xsl:element>
			<xsl:element name="Description">General Interrogation: If TRUE, TrgOp General Interrogation then the report is issued</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></Reference>
			</References>
			<Value>
				<String>False</String>
			</Value>
		</UAVariable>
    -->
    <!--
      <UAObject>
			  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps</xsl:attribute>
			  <xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps</xsl:attribute>
			  <DisplayName>TrgOps</DisplayName>
			  <Description>Report Trigger Options</Description>
			  <References>
				  <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/></Reference>
				  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Report Controls Trg Ops</Reference>
				  <Reference ReferenceType="HasTypeDefinition">ns=1;s=ControlBlockTrgOps</Reference>
			  </References>
		  </UAObject>
		  <UAVariable>
			  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps.dchg</xsl:attribute>
			  <xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps.dchg</xsl:attribute>
			  <xsl:attribute name="DataType">ns=1;s=P_VisString255</xsl:attribute>
			  <xsl:element name="DisplayName">TrgOps.dchg</xsl:element>
			  <xsl:element name="Description">Data-change</xsl:element>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps</Reference>
			  </References>
			  <Value>
			    <String>
				    <xsl:value-of select="@dchg"/>
			    </String>
			  </Value>
		  </UAVariable>
		  <UAVariable>
			  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps.qchg</xsl:attribute>
			  <xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps.qchg</xsl:attribute>
			  <xsl:attribute name="DataType">ns=1;s=P_VisString255</xsl:attribute>
			  <xsl:element name="DisplayName">TrgOps.qchg</xsl:element>
			  <xsl:element name="Description">Quality-change</xsl:element>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps</Reference>
			  </References>
			  <Value>
			    <String>
				    <xsl:value-of select="@qchg"/>
			    </String>
			  </Value>
		  </UAVariable>
		  <UAVariable>
			  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps.dudp</xsl:attribute>
			  <xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps.dudp</xsl:attribute>
			  <xsl:attribute name="DataType">ns=1;s=P_VisString255</xsl:attribute>
			  <xsl:element name="DisplayName">TrgOps.dudp</xsl:element>
			  <xsl:element name="Description">Data-update</xsl:element>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps</Reference>
			  </References>
			  <Value>
			    <String>
				    <xsl:value-of select="@dupd"/>
			    </String>
			  </Value>
		  </UAVariable>
		  <UAVariable>
			  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps.period</xsl:attribute>
			  <xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps.period</xsl:attribute>
			  <xsl:attribute name="DataType">ns=1;s=P_VisString255</xsl:attribute>
			  <xsl:element name="DisplayName">TrgOps.period</xsl:element>
			  <xsl:element name="Description">integrity Period</xsl:element>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps</Reference>
			  </References>
			  <Value>
			    <String>
				    <xsl:value-of select="@period"/>
			    </String>
			  </Value>
		  </UAVariable>

		  <UAObject>
			  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields</xsl:attribute>
			  <xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields</xsl:attribute>
			  <xsl:element name="DisplayName">OptFields</xsl:element>
			  <xsl:element name="Description">Report Optional Fields</xsl:element>
			  <References>
				  <Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/></Reference>
				  <Reference ReferenceType="HasTypeDefinition">ns=1;s=ControlBlockOptFields</Reference>
			  </References>
		  </UAObject>
		  <UAVariable>
			  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.seqNum</xsl:attribute>
			  <xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.seqNum</xsl:attribute>
			  <xsl:attribute name="DataType">ns=1;s=P_VisString255</xsl:attribute>
			  <xsl:element name="DisplayName">OptFields.seqNum</xsl:element>
			  <xsl:element name="Description">Sequence Number: If TRUE, SeqNum shall be included in the report</xsl:element>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields</Reference>
			  </References>
			  <Value>
			    <String>
				    <xsl:value-of select="@seqNum"/>
			    </String>
			  </Value>
		  </UAVariable>
		  <UAVariable>
			  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.timeStamp</xsl:attribute>
			  <xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.timeStamp</xsl:attribute>
			  <xsl:attribute name="DataType">ns=1;s=P_VisString255</xsl:attribute>
			  <xsl:element name="DisplayName">OptFields.timeStamp</xsl:element>
        <xsl:element name="Description">TimeStamp: If TRUE, TimeOfEntry shall be included in the report</xsl:element>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields</Reference>
			  </References>
			  <Value>
			    <String>
				    <xsl:value-of select="@timeStamp"/>
			    </String>
			  </Value>
		  </UAVariable>
		  <UAVariable>
			  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.dataSet</xsl:attribute>
			  <xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.dataSet</xsl:attribute>
			  <xsl:attribute name="DataType">ns=1;s=P_VisString255</xsl:attribute>
			  <xsl:element name="DisplayName">OptFields.dataSet</xsl:element>
			  <xsl:element name="Description">If TRUE, DatSet shall be included in the report</xsl:element>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields</Reference>
			  </References>
			  <Value>
			    <String>
				    <xsl:value-of select="@dataSet"/>
			    </String>
			  </Value>
		  </UAVariable>
		  <UAVariable>
			  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.reasonCode</xsl:attribute>
			  <xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.reasonCode</xsl:attribute>
			  <xsl:attribute name="DataType">ns=1;s=P_VisString255</xsl:attribute>
			  <xsl:element name="DisplayName">OptFields.reasonCode</xsl:element>
			  <xsl:element name="Description">If TRUE, ReasonCode shall be included in the report</xsl:element>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields</Reference>
			  </References>
			  <Value>
			    <String>
				    <xsl:value-of select="@ReasonCode"/>
			    </String>
			  </Value>
		  </UAVariable>
		  <UAVariable>
			  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.dataRef</xsl:attribute>
			  <xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.dataRef</xsl:attribute>
			  <xsl:attribute name="DataType">ns=1;s=P_VisString255</xsl:attribute>
			  <xsl:element name="DisplayName">OptFields.dataRef</xsl:element>
			  <xsl:element name="Description">If TRUE, DataRef or DataAttributeReference shall be included in the report</xsl:element>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields</Reference>
			  </References>
			  <Value>
			    <String>
				    <xsl:value-of select="@DataRef"/>
			    </String>
			  </Value>
		  </UAVariable>
		  <UAVariable>
			  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.bufOvfl</xsl:attribute>
			  <xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.bufOvfl</xsl:attribute>
			  <xsl:attribute name="DataType">ns=1;s=P_VisString255</xsl:attribute>
			  <xsl:element name="DisplayName">OptFields.bufOvfl</xsl:element>
			  <xsl:element name="Description">If TRUE, shall indicate that a buffer overflow has occurred</xsl:element>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields</Reference>
			  </References>
			  <Value>
			    <String>
				    <xsl:value-of select="@bufOvfl"/>
			    </String>
			  </Value>
		  </UAVariable>
		  <UAVariable>
			  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.entryID</xsl:attribute>
			  <xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.entryID</xsl:attribute>
			  <xsl:attribute name="DataType">ns=1;s=P_VisString255</xsl:attribute>
			  <xsl:element name="DisplayName">OptFields.entryID</xsl:element>
			  <xsl:element name="Description">if TRUE, EntryID shall be included in the report</xsl:element>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields</Reference>
			  </References>
			  <Value>
			    <String>
				    <xsl:value-of select="@EntryID"/>
			    </String>
			  </Value>
		  </UAVariable>
		  <UAVariable>
			  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.ConfigRef</xsl:attribute>
			  <xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.ConfigRef</xsl:attribute>
			  <xsl:attribute name="DataType">ns=1;s=P_VisString255</xsl:attribute>
			  <xsl:element name="DisplayName">OptFields.ConfigRef</xsl:element>
			  <xsl:element name="Description">if TRUE, Configuration Reference shall be included in the report</xsl:element>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields</Reference>
			  </References>
			  <Value>
			    <String>
				    <xsl:value-of select="@ConfigRef"/>
			    </String>
			  </Value>
		  </UAVariable>
		  <UAVariable>
			  <xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.segmentation</xsl:attribute>
			  <xsl:attribute name="BrowseName">2:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.segmentation</xsl:attribute>
			  <xsl:attribute name="DataType">ns=1;s=P_VisString255</xsl:attribute>
			  <xsl:element name="DisplayName">OptFields.segmentation</xsl:element>
			  <xsl:element name="Description">If TRUE, segmentation shall be included in the report)</xsl:element>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=2;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields</Reference>
			  </References>
			  <Value>
			    <String>
				    <xsl:value-of select="@segmentation"/>
			    </String>
			  </Value>
		  </UAVariable>
      -->
  </xsl:template>
  
  <xsl:template name="Quality">
    <xsl:param name="PDO"/>
  	<UAVariable>
    <!--<xsl:message>Create quality variable</xsl:message>-->
		<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PDO"/>.q</xsl:attribute>
		<xsl:attribute name="BrowseName">2:<xsl:value-of select="$PDO"/>.q</xsl:attribute>
		<xsl:attribute name="DataType">ns=1;s=P_Quality</xsl:attribute>
		<xsl:element name="DisplayName">q FCDA</xsl:element>
		<xsl:element name="Description">Quality Functionally Constrained Data Attribute data variable</xsl:element>
		<References>
			<Reference ReferenceType="HasTypeDefinition">i=63</Reference>
			<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PDO"/></Reference>
		</References>
		</UAVariable>
  </xsl:template>
  
  <xsl:template name="Time">
    <xsl:param name="PDO"/>
		<UAVariable>
      <!--<xsl:message>Create timestamp variable</xsl:message>-->
			<xsl:attribute name="NodeId">ns=2;s=<xsl:value-of select="$PDO"/>.t</xsl:attribute>
			<xsl:attribute name="BrowseName">2:<xsl:value-of select="$PDO"/>.t</xsl:attribute>
			<xsl:attribute name="DataType">ns=1;s=P_Timestamp</xsl:attribute>
			<xsl:element name="DisplayName">t FCDA</xsl:element>
			<xsl:element name="Description">Timestamp Functionally Constrained Data Attribute data variable</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=63</Reference>
				<Reference ReferenceType="HasComponent" IsForward="false">ns=2;s=<xsl:value-of select="$PDO"/></Reference>
			</References>
		</UAVariable>
  </xsl:template>
</xsl:stylesheet>

