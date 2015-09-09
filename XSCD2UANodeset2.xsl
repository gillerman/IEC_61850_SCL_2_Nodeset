<?xml version="1.0" encoding="utf-8"?>
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
<xsl:stylesheet xmlns="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:fn="http://www.w3.org/2005/xpath-functions"
                xmlns:nsSCL="http://www.iec.ch/61850/2006/SCL" 
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
             xsi:schemaLocation="http://opcfoundation.org/UA/2011/03/UANodeSet.xsd file:///Z:/Downloads/8-2%20Temp/HQ/UAnode%20set/UANodeSet.xsd">
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
Parse substation equipment instance data for instance tree
-->

    <xsl:for-each select="//nsSCL:Substation">
      <UAObject>
        <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/></xsl:attribute>
        <xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/></xsl:attribute>
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
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/></xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/></xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@name"/> Voltage Level</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@name"/> Voltage Level</xsl:element>
          <References>
            <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../@name"/></Reference>
            <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=VLs</Reference>
            <Reference ReferenceType="HasTypeDefinition">ns=1;s=VL</Reference>
          </References>
        </UAObject>
        <xsl:for-each select="nsSCL:Voltage">
          <UAObject>
            <xsl:attribute name="NodeId">ns=1;s=<xsl:sequence select="fn:string(.)"/>
              <xsl:value-of select="@multiplier"/>
              <xsl:value-of select="@unit"/>
            </xsl:attribute>
            <xsl:attribute name="BrowseName">1:<xsl:sequence select="fn:string(.)"/>
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
              <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/></Reference>
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
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/></xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/></xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@name"/> Power Transformer</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@type"/> Type Power Transformer</xsl:element>
          <References>
            <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/></Reference>
            <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=XFRs</Reference>
            <Reference ReferenceType="HasTypeDefinition">ns=1;s=XFR</Reference>
          </References>
        </UAObject>
        <xsl:for-each select="nsSCL:LNode">
          <xsl:call-template name="ProcessLNode">
            <xsl:with-param name="PLN"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/></xsl:with-param>
            <xsl:with-param name="PIED"><xsl:value-of select="@iedName"/></xsl:with-param>
            <xsl:with-param name="PSSeq"><xsl:value-of select="../../../@name"/>/<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/></xsl:with-param>
          </xsl:call-template>
       </xsl:for-each> 
        <xsl:for-each select="nsSCL:TransformerWinding">
          <UAObject>
            <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../../@name"/>/<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/></xsl:attribute>
            <xsl:attribute name="BrowseName">1:<xsl:value-of select="../../../@name"/>/<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/></xsl:attribute>
            <xsl:element name="DisplayName"><xsl:value-of select="@name"/> Transformer Winding</xsl:element>
              <xsl:element name="Description"><xsl:value-of select="@type"/> Transformer Winding</xsl:element>
            <References>
              <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../../../@name"/>/<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/></Reference>
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
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/></xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/></xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@name"/> Bay</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@name"/> Bay</xsl:element>
          <References>
              <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/></Reference>
              <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Bays</Reference>
              <Reference ReferenceType="HasTypeDefinition">ns=1;s=Bay</Reference>
          </References>
        </UAObject>
        <xsl:for-each select="nsSCL:LNode">
          <xsl:call-template name="ProcessLNode">
            <xsl:with-param name="PLN"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/></xsl:with-param>
            <xsl:with-param name="PIED"><xsl:value-of select="@iedName"/></xsl:with-param>
            <xsl:with-param name="PSSeq"><xsl:value-of select="../../../@name"/>/<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each> 
        <xsl:for-each select="nsSCL:ConductingEquipment">
          <UAObject>
            <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../../@name"/>/<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/></xsl:attribute>
            <xsl:attribute name="BrowseName">1:<xsl:value-of select="../../../@name"/>/<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/></xsl:attribute>
            <xsl:element name="DisplayName"><xsl:value-of select="@name"/> Conducting Equipment</xsl:element>
            <xsl:element name="Description"><xsl:value-of select="@type"/> Type Conducting Equipment</xsl:element>
            <References>
              <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../../../@name"/>/<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/></Reference>
              <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=CEs</Reference>
              <Reference ReferenceType="HasTypeDefinition">ns=1;s=CE</Reference>
            </References>
          </UAObject>
          <xsl:for-each select="nsSCL:LNode">
           <xsl:call-template name="ProcessLNode">
            <xsl:with-param name="PLN"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/></xsl:with-param>
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
          <xsl:with-param name="PLN"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/></xsl:with-param>
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
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../../../@name"/>/<xsl:value-of select="../../../@name"/>/<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/></xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="../../../../@name"/>/<xsl:value-of select="../../../@name"/>/<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/></xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@name"/> Sub Equipment</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@phase"/> Phase Sub Equipment</xsl:element>
          <References>
            <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../../../../@name"/>/<xsl:value-of select="../../../@name"/>/<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/></Reference>
            <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=SubEs</Reference>
            <Reference ReferenceType="HasTypeDefinition">ns=1;s=SubE</Reference>
          </References>
        </UAObject>
        <xsl:for-each select="nsSCL:LNode">
          <xsl:call-template name="ProcessLNode">
            <xsl:with-param name="PLN"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/></xsl:with-param>
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
    <xsl:for-each select="//nsSCL:IED">
      <UAObject>
        <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>IED</xsl:attribute>
        <xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/>IED</xsl:attribute>
        <xsl:element name="DisplayName"><xsl:value-of select="@name"/> IED</xsl:element>
        <xsl:element name="Description"><xsl:value-of select="@desc"/> IED</xsl:element>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=IEDs</Reference>
          <Reference ReferenceType="HasTypeDefinition">ns=1;s=IED</Reference>
        </References>
      </UAObject>
    </xsl:for-each>
      
    <xsl:for-each select="//nsSCL:IED">
      <xsl:for-each select="nsSCL:AccessPoint">
        <UAObject>
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../@name"/>IED/<xsl:value-of select="@name"/>AP</xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="../@name"/>IED/<xsl:value-of select="@name"/>AP</xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@name"/> Access Point</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@desc"/> Access Point</xsl:element>
          <References>
            <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../@name"/>IED</Reference>
            <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=IEC61850AccessPoints</Reference>
            <Reference ReferenceType="HasTypeDefinition">ns=1;s=IEC61850AccessPoint</Reference>
          </References>
        </UAObject>
        <UAVariable>
					<xsl:attribute name="NodeId">ns=1;s=AccessPoint.router</xsl:attribute>
					<xsl:attribute name="BrowseName">1:AccessPoint.router</xsl:attribute>
					<xsl:attribute name="DataType">i=12</xsl:attribute>
					<xsl:element name="DisplayName">AccessPoint.router</xsl:element>
					<Description/>
					<References>
						<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
						<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../@name"/>IED/<xsl:value-of select="@name"/>AP</Reference>
					</References>
					<Value>
						<uax:String>
							<xsl:value-of select="@router"/>
						</uax:String>
					</Value>
				</UAVariable>
				<UAVariable>
					<xsl:attribute name="NodeId">ns=1;s=AccessPoint.clock</xsl:attribute>
					<xsl:attribute name="BrowseName">1:AccessPoint.clock</xsl:attribute>
					<xsl:attribute name="DataType">i=12</xsl:attribute>
					<xsl:element name="DisplayName">AccessPoint.clock</xsl:element>
					<Description/>
					<References>
						<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
						<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../@name"/>IED/<xsl:value-of select="@name"/>AP</Reference>
					</References>
					<Value>
						<uax:String>
							<xsl:value-of select="@clock"/>
						</uax:String>
					</Value>
				</UAVariable>
      </xsl:for-each>
    </xsl:for-each>     

    <xsl:for-each select="//nsSCL:IED/nsSCL:AccessPoint">
      <xsl:for-each select="nsSCL:Server">
        <UAObject>
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@name"/>IED/<xsl:value-of select="../@name"/>AP/Server</xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@name"/>IED/<xsl:value-of select="../@name"/>AP/Server</xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="../@name"/>AP/Server</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="../../@name"/> Server</xsl:element>
          <References>
            <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../../@name"/>IED/<xsl:value-of select="../@name"/>AP</Reference>
            <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=IEC61850Servers</Reference>
            <Reference ReferenceType="HasTypeDefinition">ns=1;s=IEC61850Server</Reference>
          </References>
        </UAObject>
        <UAVariable>
					<xsl:attribute name="NodeId">ns=1;s=Server.timeout</xsl:attribute>
					<xsl:attribute name="BrowseName">1:Server.timeout</xsl:attribute>
					<xsl:attribute name="DataType">i=12</xsl:attribute>
					<xsl:element name="DisplayName">Server.timeout</xsl:element>
					<References>
						<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
						<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@name"/>IED/<xsl:value-of select="../@name"/>AP/Server</Reference>
					</References>
					<Value>
						<uax:String>900</uax:String>
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
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@inst"/></xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="@inst"/></xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@inst"/> Logical Device</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@inst"/> Logical Device</xsl:element>
          <References>
            <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../../../@name"/>IED/<xsl:value-of select="../../@name"/>AP/Server</Reference>
            <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=LDs</Reference>
            <Reference ReferenceType="HasTypeDefinition">ns=1;s=LD</Reference>
          </References>
        </UAObject>
        <xsl:for-each select="nsSCL:LN0">
					<UAObject>
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../@inst"/>/<xsl:value-of select="@lnClass"/><xsl:value-of select="@inst"/></xsl:attribute>
						<xsl:attribute name="BrowseName">1:<xsl:value-of select="../@inst"/>/<xsl:value-of select="@lnClass"/><xsl:value-of select="@inst"/></xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="../@inst"/>/<xsl:value-of select="@lnClass"/><xsl:value-of select="@inst"/> Logical Node 0</xsl:element>
						<xsl:element name="Description"><xsl:value-of select="../@inst"/>/<xsl:value-of select="@lnClass"/> Logical Node 0</xsl:element>
						<References>
							<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../@inst"/></Reference>
              <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=LNs</Reference>
							<Reference ReferenceType="HasTypeDefinition">ns=1;s=LN</Reference>
						</References>
					</UAObject>
        </xsl:for-each>
        <xsl:for-each select="nsSCL:LN">
          <xsl:call-template name="ProcessLN">
            <xsl:with-param name="PLN"><xsl:value-of select="../@inst"/>/<xsl:value-of select="@lnClass"/><xsl:value-of select="@inst"/></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
      </xsl:for-each>
    </xsl:for-each>
<!--
Section 4:
Parse DataSet instances for instance tree
-->      
    <xsl:for-each select="//nsSCL:IED/nsSCL:AccessPoint/nsSCL:Server/nsSCL:LDevice/nsSCL:LN0">
			<xsl:for-each select="nsSCL:DataSet">
        <UAObject>
					<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>.<xsl:value-of select="@name"/></xsl:attribute>
					<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>.<xsl:value-of select="@name"/></xsl:attribute>
					<xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>.<xsl:value-of select="@name"/> Data Set</xsl:element>
					<xsl:element name="Description"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>.<xsl:value-of select="@name"/>Data Set</xsl:element>
					<References>
						<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/></Reference>
						<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DataSets</Reference>
						<Reference ReferenceType="HasTypeDefinition">ns=1;s=DataSet</Reference>
					</References>
				</UAObject>
        <!-- For each data set attach 7-3 CDC attributes to each DO -->
				<xsl:call-template name="FCDA">
          <xsl:with-param name="PLN"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      <!-- For each data set attach 7-2 attributes to each Report Control -->
      <xsl:for-each select="nsSCL:ReportControl">
        <xsl:call-template name="ReportControl">
          <xsl:with-param name="PLN"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/></xsl:with-param>
				</xsl:call-template> 
			</xsl:for-each>
    </xsl:for-each>

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
					<xsl:for-each select="nsSCL:DO">
						<!-- Add references from LNodeType object types to DO variable instance -->
            <Reference ReferenceType="HasComponent">ns=1;s=<xsl:value-of select="@name"/>Instance</Reference>
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
        <!-- Create DO variable instances-->
        <UAVariable>
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>Instance</xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/>Instance</xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@name"/> DO Instance</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@name"/> DO Variable Instance</xsl:element>
          <References>
            <!-- Subtype DO variable instances from their DOType-->
            <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="@type"/>VT</Reference>
          </References>
        </UAVariable>
	      <!-- Create DO variable type-->
        <UAVariableType>
					<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@type"/>VT</xsl:attribute>
					<xsl:attribute name="BrowseName">1:<xsl:value-of select="@type"/>VT</xsl:attribute>
          <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@type"/>DT</xsl:attribute>
					<xsl:element name="DisplayName"><xsl:value-of select="@type"/> DO Variable Type</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@type"/> Data Object Variable Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=Base DO Variable Type</Reference>
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
            <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=Composed CDC</Reference>
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
        <!-- Create data types for DOTypes -->
        <UADataType>
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>DT</xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/>DT</xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@id"/> DOType Data Type</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@desc"/> DOType Data Type</xsl:element>
          <References>
            <Reference ReferenceType="HasChild">ns=1;s=<xsl:value-of select="@id"/>.Binary</Reference>
            <Reference ReferenceType="HasEncoding">ns=1;s=<xsl:value-of select="@id"/>.Binary</Reference>
            <!-- Add references from DOType data type to CDC data type -->
            <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=<xsl:value-of select="@cdc"/>DT</Reference>
          </References>
          <!-- Add DA fields to DOType data types -->
          <Definition>
            <xsl:attribute name="Name">1:<xsl:value-of select="@id"/></xsl:attribute>
            <xsl:for-each select="nsSCL:SDO">
              <Field>
                <xsl:attribute name="Name"><xsl:value-of select="@name"/></xsl:attribute>
                <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@type"/></xsl:attribute>
              </Field>
            </xsl:for-each>
            <xsl:for-each select="nsSCL:DA">
              <Field>
                <xsl:attribute name="Name"><xsl:value-of select="@name"/></xsl:attribute>
                <xsl:call-template name="BaseTypes"/>
              </Field>
            </xsl:for-each>
          </Definition>
        </UADataType>          
        <!-- Create Binary Encoding Object for DOType data types-->
        <UAObject>
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>.Binary</xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/>.Binary</xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@id"/>.Binary</xsl:element>
          <xsl:element name="Description">Binary Data Type Encoding for Common Data Class Data Type ></xsl:element>
          <References>
            <Reference ReferenceType="HasTypeDefinition">i=76</Reference>
            <Reference ReferenceType="HasChild">ns=1;s=<xsl:value-of select="@id"/>.Schema</Reference>
            <Reference ReferenceType="HasDescription" IsForward="false">ns=1;s=<xsl:value-of select="@id"/>.Schema</Reference>
          </References>
        </UAObject>
        <!-- Create DTD to contain definition of each DOType data type-->
        <UAVariable>
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>.Schema</xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="@id"/>.Schema</xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@id"/>.Schema</xsl:element>
          <xsl:element name="Description">CDC Data Type Description></xsl:element>
          <References>
            <Reference ReferenceType="HasTypeDefinition">i=69</Reference>
            <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=IEC 62541 Data Type Dictionary</Reference>
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
            <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@name"/>DT</xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@name"/> DA Variable Type</xsl:element>
            <xsl:element name="Description"><xsl:value-of select="@name"/> Data Attribute Variable Type</xsl:element>
					<References>
						<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=Base DA Variable Type</Reference>
					</References>
					</UAVariableType>
          <!-- Create DA instance variables -->
          <UAVariable>
            <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>Instance</xsl:attribute>
            <xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/>Instance</xsl:attribute>
            <xsl:element name="DisplayName"><xsl:value-of select="@name"/> DA Instance</xsl:element>
            <xsl:element name="Description"><xsl:value-of select="@name"/> Data Attribute Variable Instance</xsl:element>
            <References>
              <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="@name"/>VT</Reference>
            </References>
          </UAVariable>
          <!-- Create data types for contained DAs -->
          <UADataType>
            <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>DT</xsl:attribute>
            <xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/>DT</xsl:attribute>
            <xsl:element name="DisplayName"><xsl:value-of select="@name"/> Data Type</xsl:element>
            <xsl:element name="Description"><xsl:value-of select="@desc"/> Data Attribute Data Type</xsl:element>
            <References>
              <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=Base DA Data Type</Reference>
            </References>
            <!-- Add data type fields to DA data types -->
            <Definition>
              <xsl:attribute name="Name"><xsl:value-of select="@id"/></xsl:attribute>
              <xsl:attribute name="BaseType"><xsl:value-of select="@cdc"/></xsl:attribute>
              <xsl:for-each select="nsSCL:BDA">
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
<!--
Section 6.2:
For SDOs within DOTypes
-->
        <!-- For each SDO in the DOType -->
        <xsl:for-each select="nsSCL:SDO">
					<!-- Create variable type for SDO -->
					<UAVariableType>
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/></xsl:attribute>
						<xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/></xsl:attribute>
            <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@name"/>DT Variable Type</xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@name"/> Data Attribute Variable Type</xsl:element>
					<References>
						<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=Base DA Variable Type</Reference>
					</References>
					</UAVariableType>
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
					  <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=Base DA Data Type</Reference>
				  </References>
				  <Definition>
					  <xsl:attribute name="Name"><xsl:value-of select="@id"/></xsl:attribute>
					  <xsl:attribute name="BaseType"><xsl:value-of select="@cdc"/></xsl:attribute>
					  <xsl:for-each select="nsSCL:BDA">
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
		  <xsl:for-each select="nsSCL:EnumType">
			  <UADataType>
				  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@id"/>DT</xsl:attribute>
				  <xsl:attribute name="BrowseName"><xsl:value-of select="@id"/>DT</xsl:attribute>
				  <DisplayName><xsl:value-of select="@id"/> Enum Data Type</DisplayName>
				  <Description><xsl:value-of select="@id"/> Enum Data Type</Description>
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
  
  
<!-- Aux Templates-->
<!-- Aux Templates-->
<!-- Aux Templates-->
<!-- Aux Templates-->
<!-- Aux Templates-->
<!-- Aux Templates-->
 
  <xsl:template name="ProcessLNode">
    <xsl:param name="PLN"/>
    <xsl:param name="PIED"/>
    <xsl:param name="PSSeq"/>
    <UAObject>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/></xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/></xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/> LNode</xsl:element>
			<xsl:element name="Description"><xsl:value-of select="$PLN"/> Logical Node in IED <xsl:value-of select="$PIED"/></xsl:element>
			<References>
				<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=LNs</Reference>
				<Reference ReferenceType="HasTypeDefinition">ns=1;s=LN</Reference>
        <Reference ReferenceType="ns=1;s=LNode.SSeq" IsForward="true">ns=1;s=<xsl:value-of select="$PSSeq"/></Reference>
			</References>
		</UAObject>
  </xsl:template>
  
  <xsl:template name="ProcessTerminal">
    <xsl:param name="PSSeq"/>
    <xsl:param name="PcNodeName"/>
    <xsl:param name="PconnectivityNode"/>
    <UAObject>
      <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PSSeq"/>/<xsl:value-of select="$PcNodeName"/></xsl:attribute>
      <xsl:attribute name="BrowseName">1:<xsl:value-of select="$PSSeq"/>/<xsl:value-of select="$PcNodeName"/></xsl:attribute>
      <xsl:element name="DisplayName"><xsl:value-of select="$PSSeq"/>/<xsl:value-of select="$PcNodeName"/> Terminal</xsl:element>
      <xsl:element name="Description"><xsl:value-of select="$PSSeq"/>/<xsl:value-of select="$PcNodeName"/> Terminal</xsl:element>
      <References>
        <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PSSeq"/></Reference>
        <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Ts</Reference>
        <Reference ReferenceType="HasTypeDefinition">ns=1;s=T</Reference>
        <Reference ReferenceType="ns=1;s=T.CN" IsForward="true">ns=1;s=<xsl:value-of select="$PconnectivityNode"/></Reference>
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
        <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PPconnectivityNode"/></xsl:attribute>
        <xsl:attribute name="BrowseName">1:<xsl:value-of select="$PPconnectivityNode"/></xsl:attribute>
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
    <UAObject>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/></xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/></xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/> LN</xsl:element>
			<xsl:element name="Description"><xsl:value-of select="$PLN"/> Logical Node</xsl:element>
			<References>
        <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../@inst"/></Reference>
				<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=LNs</Reference>
				<Reference ReferenceType="HasTypeDefinition">ns=1;s=LN</Reference>
			</References>
		</UAObject>
    <xsl:for-each select="nsSCL:DOI">
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></xsl:attribute>
				<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/> DOI</xsl:element>
        <xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/> DOI</xsl:element>
				<References>
					<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/></Reference>
					<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DOs</Reference>
					<Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="@name"/></Reference>
				</References>
			</UAObject>
      <xsl:for-each select="nsSCL:DAI">
				<UAVariable>
					<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.<xsl:value-of select="@name"/></xsl:attribute>
					<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.<xsl:value-of select="@name"/></xsl:attribute>
					<xsl:attribute name="DataType">i=12</xsl:attribute>
					<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.<xsl:value-of select="@name"/> DAI</xsl:element>
					<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.<xsl:value-of select="@name"/> DAI</xsl:element>
					<References>
						<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/></Reference>
						<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
						<Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="@name"/></Reference>
					</References>
					<xsl:for-each select="nsSCL:Val">
						<Value>
              <uax:String><xsl:value-of select="."/></uax:String>
						</Value>
					</xsl:for-each>
				</UAVariable>
			</xsl:for-each>
    </xsl:for-each>  
  </xsl:template>
   
<!--
Section 8:
Sub template for Basetypes
Implements 7-3
Create association between a DO and a CDC
-->   
	<xsl:template name="FCDA">
    <xsl:param name="PLN"/>
    <xsl:for-each-group select="nsSCL:FCDA" group-by="@doName">
      <xsl:message>For DS <xsl:value-of select="../@name"/>, create objects for <xsl:value-of select="@doName"/> DO with <xsl:value-of select="@fc"/> FC for LN <xsl:value-of select="$PLN"/></xsl:message>
			<UAObject>
				<xsl:message>Create <xsl:value-of select="@doName"/> DO object</xsl:message>
        <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:attribute>
				<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/> DO</xsl:element>
				<xsl:element name="Description"><xsl:value-of select="@doName"/> Data Object object</xsl:element>
				<References>
					<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/></Reference>
					<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/></Reference>
          <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DOs</Reference>
				</References>
			</UAObject>
			<UAVariable>
        <xsl:message>Create quality variable</xsl:message>
				<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.q</xsl:attribute>
				<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.q</xsl:attribute>
				<xsl:attribute name="DataType">i=12</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.q DA</xsl:element>
				<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.q Data Attribute variable</xsl:element>
				<References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
          <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@fc"/></Reference>
				</References>
				<Value>
					<String/>
				</Value>
				</UAVariable>
				<UAVariable>
          <xsl:message>Create timestampt variable</xsl:message>
					<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.t</xsl:attribute>
					<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.t</xsl:attribute>
					<xsl:attribute name="DataType">i=12</xsl:attribute>
					<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.t DA</xsl:element>
					<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.t Data Attribute variable</xsl:element>
					<References>
						<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
						<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
            <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@fc"/></Reference>
					</References>
					<Value>
						<String/>
					</Value>
				</UAVariable>
			<xsl:for-each select="current-group()">
				<xsl:if test="not(@daName=&apos;q&apos; or @daName=&apos;t&apos;)">
					<xsl:choose>				
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
              <xsl:message>Create CVMs for WYE CDC</xsl:message>
							<xsl:call-template name="CMV"><xsl:with-param name="PPLN"><xsl:value-of select="$PLN"/></xsl:with-param><xsl:with-param name="sdo">.phsA</xsl:with-param></xsl:call-template>
							<xsl:call-template name="CMV"><xsl:with-param name="PPLN"><xsl:value-of select="$PLN"/></xsl:with-param><xsl:with-param name="sdo">.phsB</xsl:with-param></xsl:call-template>							
							<xsl:call-template name="CMV"><xsl:with-param name="PPLN"><xsl:value-of select="$PLN"/></xsl:with-param><xsl:with-param name="sdo">.phsC</xsl:with-param></xsl:call-template>
							<xsl:call-template name="CMV"><xsl:with-param name="PPLN"><xsl:value-of select="$PLN"/></xsl:with-param><xsl:with-param name="sdo">.neut</xsl:with-param></xsl:call-template>							
							<xsl:call-template name="CMV"><xsl:with-param name="PPLN"><xsl:value-of select="$PLN"/></xsl:with-param><xsl:with-param name="sdo">.net</xsl:with-param></xsl:call-template>
							<xsl:call-template name="CMV"><xsl:with-param name="PPLN"><xsl:value-of select="$PLN"/></xsl:with-param><xsl:with-param name="sdo">.res</xsl:with-param></xsl:call-template>
						</xsl:when>
						<xsl:when test="@doName=&apos;VolResoPt&apos;
								or @doName=&apos;NeutVol&apos;
								or @doName=&apos;Imp&apos;
								or @doName=&apos;FltZ&apos;
								or @doName=&apos;ColAEFN&apos;">
              <xsl:message>Create CVM for CMV CDC</xsl:message>
							<xsl:call-template name="CMV"><xsl:with-param name="PPLN"><xsl:value-of select="$PLN"/></xsl:with-param><xsl:with-param name="sdo"></xsl:with-param></xsl:call-template>
						</xsl:when>	
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
                <xsl:message>Create CVMs for DEL CDC</xsl:message>
								<xsl:call-template name="CMV"><xsl:with-param name="PPLN"><xsl:value-of select="$PLN"/></xsl:with-param><xsl:with-param name="sdo">.phsAB</xsl:with-param></xsl:call-template>
								<xsl:call-template name="CMV"><xsl:with-param name="PPLN"><xsl:value-of select="$PLN"/></xsl:with-param><xsl:with-param name="sdo">.phsBC</xsl:with-param></xsl:call-template>							
								<xsl:call-template name="CMV"><xsl:with-param name="PPLN"><xsl:value-of select="$PLN"/></xsl:with-param><xsl:with-param name="sdo">.phsCA</xsl:with-param></xsl:call-template>
						</xsl:when>
						<xsl:when test="@daName=&apos;MX&apos;">
						<UAObject>
              <xsl:message>Create DA Object for MX CDC</xsl:message>
							<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
							<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
							<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/> DA</xsl:element>
							<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/> Data Attribute object</xsl:element>
							<References>
								<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>									
							</References>
						</UAObject>
						<UAObject>
							<xsl:message>Create mag Object for MX CDC</xsl:message>
              <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</xsl:attribute>
							<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</xsl:attribute>
							<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag DA</xsl:element>
							<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag Data Attribute object</xsl:element>
							<References>
								<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/><xsl:value-of select="@daName"/>.mag</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/><xsl:value-of select="@daName"/></Reference>
							</References>
						</UAObject>
						<UAVariable>
              <xsl:message>Create integer mag variable for MX CDC</xsl:message>
							<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.i</xsl:attribute>
							<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.i</xsl:attribute>
							<xsl:attribute name="DataType">i=12</xsl:attribute>
							<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@daName"/>.<xsl:value-of select="@daName"/>.mag.i DA</xsl:element>
							<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@daName"/>.<xsl:value-of select="@daName"/>.mag.i Data Attribute variable</xsl:element>
							<References>
							<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
							<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</Reference>
							<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
							<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>
							</References>
							<Value>
							<String/>
							</Value>
						</UAVariable>
						<UAVariable>
              <xsl:message>Create float mag variable for MX CDC</xsl:message>
							<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.f</xsl:attribute>
							<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.f</xsl:attribute>
							<xsl:attribute name="DataType">i=12</xsl:attribute>
							<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.f</xsl:element>
							<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.f Data Attribute variable</xsl:element>
							<References>
							<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
							<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</Reference>
							<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
							<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>
							</References>
							<Value>
							<String/>
							</Value>
						</UAVariable>
						</xsl:when>
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
                <xsl:message>Create DA Object for MX CDC with MX FC</xsl:message>
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/> DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/> Data Attribute object</xsl:element>
								<References>
									<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>						
								</References>
							</xsl:element>
							<xsl:element name="UAObject" >
                <xsl:message>Create mag DA object</xsl:message>
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag Data Attribute object</xsl:element>
								<References>
									<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/><xsl:value-of select="@daName"/></Reference>
								</References>
							</xsl:element>
							<xsl:element name="UAVariable" >
                <xsl:message>Create integer mag variable</xsl:message>
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.i</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.i</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@daName"/>.<xsl:value-of select="@daName"/>.mag.i DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@daName"/>.<xsl:value-of select="@daName"/>.mag.i Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>
							<xsl:element name="UAVariable" >
                <xsl:message>Create float mag variable</xsl:message>
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.f</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.f</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.f DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.f Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>
							<!--<xsl:call-template name="QualityandTime"/>-->	
						</xsl:when>
						<xsl:when test="@fc=&apos;ST&apos; 
							and	(@doName=&apos;Str&apos;)">
							<xsl:element name="UAVariable" >
                <xsl:message>Create general and dirGeneral phsA, B, C, and neut DA variables for ACD CDC with ST FC</xsl:message>
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.general</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.general</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.general DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.general Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsA</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsA</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsA DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsA Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsB</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsB</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsB DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsB Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>	
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsC</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsC</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsC DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsC Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>	
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.neut</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.neut</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.neut DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.neut Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>
							<!--<xsl:call-template name="QualityandTime"/>-->
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirGeneral</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirGeneral</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirGeneral DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirGeneral Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>									
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirPhsA</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirPhsA</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirPhsA DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirPhsA Data Attribue variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>									
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirPhsB</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirPhsB</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirPhsB DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirPhsB Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>	
								<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirPhsC</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirPhsC</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirPhsC DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirPhsC Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>		
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirNeut</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirNeut</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirNeut DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirNeut Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>										
						</xsl:when>
						<xsl:when test="@fc=&apos;ST&apos; 
							and	(@doName=&apos;ArcMod&apos;
							or @doName=&apos;AlmThm&apos;
							or @doName=&apos;Op&apos;
							or @doName=&apos;OpCls&apos;
							or @doName=&apos;OpEx&apos;
							or @doName=&apos;Tr&apos;)">
							<xsl:element name="UAVariable" >
                <xsl:message>Create origin DA object and DA variables for ACT CDC with ST FC</xsl:message>
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.general</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.general</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.general DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.general Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsA</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsA</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsA DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsA Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsB</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsB</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsB DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsB Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>	
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsC</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsC</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsC DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsC Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>	
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.neut</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.neut</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.neut DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.neut Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>
							<!--<xsl:call-template name="QualityandTime"/>-->
							<xsl:element name="UAObject" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirPhsB Data Attribute object</xsl:element>
								<References>
								<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.orCat Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
									<String/>
								</Value>
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.orIdent Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>	
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.operTmPhsA</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.operTmPhsA</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.operTmPhsA DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.operTmPhsA Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>	
								<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.operTmPhsB</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.operTmPhsB</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.operTmPhsB DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.operTmPhsB Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>		
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.operTmPhsC</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.operTmPhsC</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.operTmPhsC DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.operTmPhsC Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>										
						</xsl:when>
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
                <xsl:message>Create .stVal DA variable for Alm, Ind CDC with ST FC</xsl:message>
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>
							<!--<xsl:call-template name="QualityandTime"/>-->	
						</xsl:when>
						<xsl:when test="@fc=&apos;ST&apos; 
							and	(@doName=&apos;Pos&apos;)">
							<xsl:element name="UAObject" >
                <xsl:message>Create origin DA object and DA variables for DPC CDC with ST FC</xsl:message>
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.orCat Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
									<String/>
								</Value>
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>									
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:attribute>
								<xsl:attribute name="DataType">i=2</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>							
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stSeld</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stSeld</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stSeld DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stSeld Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
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
                <xsl:message>Create origin DA object and DA variables for INC CDC with ST FC</xsl:message>
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.orCAt Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
									<String/>
								</Value>
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.orIdent Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>									
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:attribute>
								<xsl:attribute name="DataType">i=3</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>							
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>
								</References>
								<Value>
								<String/>
								</Value>
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
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
                <xsl:message>Create .stVal DA variable for INS CDC with ST FC</xsl:message>
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
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
Section 9
-->  
  <xsl:template name="CMV">
    <xsl:param name="PPLN" />
		<xsl:param name="sdo" />
		<xsl:if test="$sdo!=&apos;&apos;">
      <xsl:message>Creating CMV <xsl:value-of select="$sdo"/></xsl:message>
				<UAObject>
					<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/></xsl:attribute>
					<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/></xsl:attribute>
					<xsl:element name="DisplayName"><xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/> DO</xsl:element>
					<xsl:element name="Description"><xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/> Data Object object</xsl:element>
					<References>
					<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/></Reference>
					<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/></Reference>
					</References>
				</UAObject>
			</xsl:if>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal</xsl:attribute>
				<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal DA</xsl:element>
				<xsl:element name="Description"><xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal Data Attribute object</xsl:element>
				<References>
				<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/></Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag</xsl:attribute>
				<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag DA</xsl:element>
				<xsl:element name="Description"><xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.mag Data Attribute object</xsl:element>
				<References>
				<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal</Reference>
				</References>
			</UAObject>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag.i</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag.i</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag.i</xsl:element>
			<xsl:element name="Description"><xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>integer Data Attribute variable</xsl:element>
			<References>
			<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
			<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag</Reference>
			<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=DAs</Reference>
			<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@fc"/></Reference>
			</References>
			<Value>
			<String/>
			</Value>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag.f</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag.f</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag.f</xsl:element>
			<xsl:element name="Description"><xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>float Data Attribute variable</xsl:element>
			<References>
			<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
			<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag</Reference>
			<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=DAs</Reference>
			<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>
			</References>
			<Value>
			<String/>
			</Value>
		</UAVariable>
	</xsl:template>
<!--
  Section 10:
  Report control template
-->  
  <xsl:template name="ReportControl">
  <xsl:param name="PLN" />
		<UAObject>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/></xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/></xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/></xsl:element>
			<xsl:element name="Description"><xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/></xsl:element>
			<References>
				<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/></Reference>
				<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Report Controls</Reference>
				<Reference ReferenceType="HasTypeDefinition">ns=1;s=ReportControl</Reference>
			</References>
		</UAObject>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.datSet</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.datSet</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.datSet</xsl:element>
			<xsl:element name="Description">datSet shall be derived from the respective attribute in the BRCB</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/></Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@datSet"/>
				</String>
			</Value>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.rptID</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.rptID</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.rptID</xsl:element>
			<xsl:element name="Description">Report ID</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/></Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@rptID"/>
				</String>
			</Value>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.confRev</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.confRev</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.confRev</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/></Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@confRev"/>
				</String>
			</Value>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.buffered</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.buffered</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.buffered</xsl:element>
			<xsl:element name="Description">Buffered (if TRUE Report is Buffered)</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/></Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@buffered"/>
				</String>
			</Value>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.GI</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.GI</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.GI</xsl:element>
			<xsl:element name="Description">General Interrogation (if TRUE TrgOp General Interrogation then the report is issued)</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/></Reference>
			</References>
			<Value>
				<String>False</String>
			</Value>
		</UAVariable>
		<UAObject>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.TrgOps</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.TrgOps</xsl:attribute>
			<DisplayName><xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.TrgOps</DisplayName>
			<Description>Controls Logical Device Report Control Block Trigger Options</Description>
			<References>
				<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/></Reference>
				<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Report Controls Trg Ops</Reference>
				<Reference ReferenceType="HasTypeDefinition">ns=1;s=ReportControlTrgOps</Reference>
			</References>
		</UAObject>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.TrgOps.dchg</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.TrgOps.dchg</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.TrgOps.dchg</xsl:element>
			<xsl:element name="Description">data-change</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.TrgOps</Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@dchg"/>
				</String>
			</Value>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.TrgOps.qchg</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.TrgOps.qchg</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.TrgOps.qchg</xsl:element>
			<xsl:element name="Description">quality-change</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.TrgOps</Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@qchg"/>
				</String>
			</Value>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.TrgOps.qchg</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.TrgOps.dudp</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.TrgOps.dudp</xsl:element>
			<xsl:element name="Description">data-update</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.TrgOps</Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@dudp"/>
				</String>
			</Value>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.TrgOps.period</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.TrgOps.period</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.TrgOps.period</xsl:element>
			<xsl:element name="Description">integrity</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.TrgOps</Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@period"/>
				</String>
			</Value>
		</UAVariable>
		<UAObject>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields</xsl:attribute>
			<DisplayName><xsl:value-of select="$PLN"/>.RP..OptFields</DisplayName>
			<Description>Controls Logical Device Report Control Block Trigger Options</Description>
			<References>
				<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>
				</Reference>
				<Reference ReferenceType="HasTypeDefinition">ns=1;s=ReportControlOptFields</Reference>
			</References>
		</UAObject>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.seqNum</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.seqNum</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.seqNum</xsl:element>
			<xsl:element name="Description">sequence-number (if TRUE SqNum shall be included in the report)</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields</Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@seqNum"/>
				</String>
			</Value>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.timeStamp</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.timeStamp</xsl:attribute>
			<xsl:attribute name="DataType">String</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.timeStamp</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields</Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@timeStamp"/>report-time-stamp (if TRUE TimeOfEntry shall be included in the report);
				</String>
			</Value>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.dataSet</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.dataSet</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.dataSet</xsl:element>
			<xsl:element name="Description"/>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields</Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@dataSet"/>data-set-name (if TRUE DatSet shall be included in the report)
				</String>
			</Value>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.ReasonCode</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.ReasonCode</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.ReasonCode</xsl:element>
			<xsl:element name="Description"/>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields</Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@reasonCode"/>reason-for-inclusion (if TRUE ReasonCode shall be included in the report)
				</String>
			</Value>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.DataRef</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.DataRef</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.DataRef</xsl:element>
			<xsl:element name="Description">data-reference (if TRUE DataRef or DataAttributeReference shall be included in the report)</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields</Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@dataRef"/>
				</String>
			</Value>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.bufOvfl</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.bufOvfl</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.bufOvfl</xsl:element>
			<xsl:element name="Description">buffer-overflow (if TRUE shall indicate that a buffer overflow has occurred)</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields</Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@dataRef"/>
				</String>
			</Value>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.EntryID</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.EntryID</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.EntryID</xsl:element>
			<xsl:element name="Description">entryID (if TRUE EntryID shall be included in the report)</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields</Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@entryID"/>
				</String>
			</Value>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.ConfigRef</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.ConfigRef</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.ConfigRef</xsl:element>
			<xsl:element name="Description">config-reference (if TRUE ConfRef shall be included in the report)</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields</Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@ConfigRef"/>
				</String>
			</Value>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.segmentation</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.segmentation</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields.segmentation</xsl:element>
			<xsl:element name="Description">segmentation (if TRUE segmentation shall be included in the report)</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.RP.<xsl:value-of select="@name"/>.OptFields</Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@segmentation"/>
				</String>
			</Value>
		</UAVariable>
  </xsl:template>

<!--
Section 11
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
</xsl:stylesheet>

