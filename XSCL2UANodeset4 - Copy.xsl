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
            <xsl:with-param name="PLN"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/></xsl:with-param>
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
            <xsl:with-param name="PLN"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/></xsl:with-param>
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
            <xsl:with-param name="PLN"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/></xsl:with-param>
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
            <xsl:with-param name="PLN"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/></xsl:with-param>
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
        <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/></xsl:attribute>
        <xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/></xsl:attribute>
        <xsl:element name="DisplayName"><xsl:value-of select="@name"/> IED</xsl:element>
        <xsl:element name="Description"><xsl:value-of select="@desc"/> IED</xsl:element>
        <References>
          <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=IEDs</Reference>
          <Reference ReferenceType="HasTypeDefinition">ns=1;s=IED</Reference>
        </References>
      </UAObject>
      <UAVariable>
			  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>.type</xsl:attribute>
			  <xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/>.type</xsl:attribute>
			  <xsl:attribute name="DataType">i=12</xsl:attribute>
			  <xsl:element name="DisplayName">Type</xsl:element>
			  <Description/>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@name"/></Reference>
			  </References>
			  <Value>
				  <uax:String>
					  <xsl:value-of select="@type"/>
				  </uax:String>
			  </Value>
		  </UAVariable>
            <UAVariable>
			  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>.manufacturer</xsl:attribute>
			  <xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/>.manufacturer</xsl:attribute>
			  <xsl:attribute name="DataType">i=12</xsl:attribute>
			  <xsl:element name="DisplayName">Manufacturer</xsl:element>
			  <Description/>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@name"/></Reference>
			  </References>
			  <Value>
				  <uax:String>
					  <xsl:value-of select="@manufacturer"/>
				  </uax:String>
			  </Value>
		  </UAVariable>
      <UAVariable>
			  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>.configVersion</xsl:attribute>
			  <xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/>.configVersion</xsl:attribute>
			  <xsl:attribute name="DataType">i=12</xsl:attribute>
			  <xsl:element name="DisplayName">ConfigVersion</xsl:element>
			  <Description/>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@name"/></Reference>
			  </References>
			  <Value>
				  <uax:String>
					  <xsl:value-of select="@configVersion"/>
				  </uax:String>
			  </Value>
		  </UAVariable>
    </xsl:for-each>
      
    <xsl:for-each select="//nsSCL:IED">
      <xsl:for-each select="nsSCL:AccessPoint">
        <UAObject>
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/></xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/></xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@name"/> Access Point</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@desc"/> Access Point</xsl:element>
          <References>
            <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../@name"/></Reference>
            <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=IEC61850AccessPoints</Reference>
            <Reference ReferenceType="HasTypeDefinition">ns=1;s=IEC61850AccessPoint</Reference>
          </References>
        </UAObject>
        <UAVariable>
					<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/>.router</xsl:attribute>
					<xsl:attribute name="BrowseName">1:<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/>.router</xsl:attribute>
					<xsl:attribute name="DataType">i=12</xsl:attribute>
					<xsl:element name="DisplayName">Router</xsl:element>
					<Description/>
					<References>
						<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
						<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/></Reference>
					</References>
					<Value>
						<uax:String>
							<xsl:value-of select="@router"/>
						</uax:String>
					</Value>
				</UAVariable>
				<UAVariable>
					<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/>.clock</xsl:attribute>
					<xsl:attribute name="BrowseName">1:<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/>.clock</xsl:attribute>
					<xsl:attribute name="DataType">i=12</xsl:attribute>
					<xsl:element name="DisplayName">Clock</xsl:element>
					<Description/>
					<References>
						<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
						<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../@name"/>/<xsl:value-of select="@name"/></Reference>
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
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/>/Svr</xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/>/Svr</xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="../@name"/> Server</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="../../@name"/> Server</xsl:element>
          <References>
            <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/></Reference>
            <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=IEC61850Servers</Reference>
            <Reference ReferenceType="HasTypeDefinition">ns=1;s=IEC61850Server</Reference>
          </References>
        </UAObject>
        <UAVariable>
					<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/>/Svr.timeout</xsl:attribute>
					<xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/>/Svr.timeout</xsl:attribute>
					<xsl:attribute name="DataType">i=12</xsl:attribute>
					<xsl:element name="DisplayName">Timeout</xsl:element>
					<References>
						<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
						<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="../../@name"/>/<xsl:value-of select="../@name"/>/Svr</Reference>
					</References>
					<Value>
						<uax:String>
							<xsl:value-of select="@timeout"/>
						</uax:String>
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
          <xsl:element name="Description"><xsl:value-of select="@desc"/> Logical Device</xsl:element>
          <References>
            <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../../../@name"/>/<xsl:value-of select="../../@name"/>/Svr</Reference>
            <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=LDs</Reference>
            <Reference ReferenceType="HasTypeDefinition">ns=1;s=LD</Reference>
          </References>
        </UAObject>
        <xsl:for-each select="nsSCL:LN0">
					<UAObject>
						<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../@inst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@inst"/></xsl:attribute>
						<xsl:attribute name="BrowseName">1:<xsl:value-of select="../@inst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@inst"/></xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@inst"/> LN</xsl:element>
						<xsl:element name="Description"><xsl:value-of select="@desc"/> <xsl:value-of select="@lnType"/></xsl:element>
						<References>
							<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../@inst"/></Reference>
              <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=LNs</Reference>
							<Reference ReferenceType="HasTypeDefinition">ns=1;s=LN</Reference>
						</References>
					</UAObject>   
          <xsl:for-each select="nsSCL:DataSet">
            <UAObject>
					    <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@prefix"/><xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>.<xsl:value-of select="@name"/></xsl:attribute>
					    <xsl:attribute name="BrowseName">1:<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@prefix"/><xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>.<xsl:value-of select="@name"/></xsl:attribute>
					    <xsl:element name="DisplayName"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@prefix"/><xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/>.<xsl:value-of select="@name"/> Data Set</xsl:element>
					    <xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
					    <References>
						    <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@prefix"/><xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/></Reference>
						    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DataSets</Reference>
						    <Reference ReferenceType="HasTypeDefinition">ns=1;s=DataSet</Reference>
					    </References>
				    </UAObject>
            <!-- For each data set attach 7-3 CDC attributes to each DO -->
				    <xsl:call-template name="FCDA">
              <xsl:with-param name="PLN"><xsl:value-of select="../../@inst"/>/<xsl:value-of select="../@prefix"/><xsl:value-of select="../@lnClass"/><xsl:value-of select="../@inst"/></xsl:with-param>
            </xsl:call-template>
          </xsl:for-each>
          <!-- For each data set attach 7-2 attributes to each Report Control -->
          <xsl:for-each select="nsSCL:ReportControl">
            <xsl:call-template name="ReportControl">
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
        <!-- Create DO variable instances under the LNodeTypes-->
        <UAVariable>
          <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@name"/>Instance</xsl:attribute>
          <xsl:attribute name="BrowseName">1:<xsl:value-of select="@name"/>Instance</xsl:attribute>
          <xsl:element name="DisplayName"><xsl:value-of select="@name"/> DO</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@name"/> DO Variable Instance</xsl:element>
          <References>
            <!-- Subtype DO variable instances from their DOType variable type-->
            <Reference ReferenceType="HasTypeDefinition">ns=1;s=<xsl:value-of select="@type"/>VT</Reference>
          </References>
        </UAVariable>
	      <!-- Create DO variable type-->
        <UAVariableType>
					<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@type"/>VT</xsl:attribute>
					<xsl:attribute name="BrowseName">1:<xsl:value-of select="@type"/>VT</xsl:attribute>
          <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@type"/>DT</xsl:attribute>
					<xsl:element name="DisplayName"><xsl:value-of select="@type"/> DO</xsl:element>
          <xsl:element name="Description"><xsl:value-of select="@type"/> Data Object Variable Type</xsl:element>
				<References>
					<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=BaseDOVariableType</Reference>
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
            <xsl:attribute name="DataType">ns=1;s=<xsl:value-of select="@name"/>DT</xsl:attribute>
						<xsl:element name="DisplayName"><xsl:value-of select="@name"/> DA Variable Type</xsl:element>
            <xsl:element name="Description"><xsl:value-of select="@name"/> Data Attribute Variable Type</xsl:element>
					<References>
						<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=BaseDAVariableType</Reference>
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
            <xsl:element name="DisplayName"><xsl:value-of select="@name"/> DA Data Type</xsl:element>
            <xsl:element name="Description"><xsl:value-of select="@desc"/> Data Attribute Data Type</xsl:element>
            <References>
              <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=BaseDADataType</Reference>
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
              <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=IEC62541DataTypeDictionary</Reference>
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
						<Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=BaseDAVariableType</Reference>
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
					  <Reference ReferenceType="HasSubtype" IsForward="false">ns=1;s=BaseDADataType</Reference>
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
    <xsl:param name="PLNI"/>
    <xsl:param name="PLNC"/>
    <xsl:param name="PLND"/>
    <UAObject>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/></xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/></xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PLNI"/> LN</xsl:element>
			<xsl:element name="Description"><xsl:value-of select="$PLND"/> Logical Node</xsl:element>
			<References>
        <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="../@inst"/></Reference>
				<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=LNs</Reference>
				<Reference ReferenceType="HasTypeDefinition">ns=1;s=LN</Reference>
			</References>
	  </UAObject>
			<xsl:for-each select="nsSCL:DataSet">
		    <UAObject>
		    <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/><xsl:value-of select="@name"/></xsl:attribute>
		    <xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/><xsl:value-of select="@name"/> Data Set</xsl:attribute>
		    <xsl:element name="DisplayName"><xsl:value-of select="$PLN"/><xsl:value-of select="@name"/> Data Set</xsl:element>
		    <xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
		    <References>
			    <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/></Reference>
			    <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Data Sets</Reference>
			    <Reference ReferenceType="HasTypeDefinition">ns=1;s=DataSet</Reference>
			    </References>
		    </UAObject>
			  <xsl:call-template name="FCDA">
				  <xsl:with-param name="PLN"><xsl:value-of select="$PLN"/></xsl:with-param>
			  </xsl:call-template>				
		</xsl:for-each>
<!--
Parse Report Control Instances for instance tree 
-->
		<xsl:for-each select="nsSCL:ReportControl">
			<xsl:call-template name="ReportControl">
				<xsl:with-param name="PLN"><xsl:value-of select="$PLN"/></xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>
		
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
			<UAObject>
				<!--<xsl:message>Create <xsl:value-of select="@doName"/> DO object</xsl:message>-->
        <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:attribute>
				<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="@doName"/> DO</xsl:element>
				<xsl:element name="Description"><xsl:value-of select="@doName"/> Data Object object</xsl:element>
				<References>
					<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/></Reference>
					<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/></Reference>
          <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DOs</Reference>
				</References>
			</UAObject>
			<UAVariable>
        <!--<xsl:message>Create quality variable</xsl:message>-->
				<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.q</xsl:attribute>
				<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.q</xsl:attribute>
				<xsl:attribute name="DataType">i=12</xsl:attribute>
				<xsl:element name="DisplayName">q DA</xsl:element>
				<xsl:element name="Description">Quality Data Attribute variable</xsl:element>
				<References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
          <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@fc"/></Reference>-->
				</References>
        <!--
				<Value>
					<String/>
				</Value>
        -->
				</UAVariable>
				<UAVariable>
          <!--<xsl:message>Create timestamp variable</xsl:message>-->
					<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.t</xsl:attribute>
					<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.t</xsl:attribute>
					<xsl:attribute name="DataType">i=12</xsl:attribute>
					<xsl:element name="DisplayName">t DA</xsl:element>
					<xsl:element name="Description">Timestamp Data Attribute variable</xsl:element>
					<References>
						<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
						<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
            <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@fc"/></Reference>-->
					</References>
          <!--
				  <Value>
					  <String/>
				  </Value>
          -->
				</UAVariable>
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
						<!--<xsl:message>Create CVM for CMV CDC</xsl:message>-->
							<xsl:call-template name="CMV"><xsl:with-param name="PPLN"><xsl:value-of select="$PLN"/></xsl:with-param><xsl:with-param name="sdo"></xsl:with-param></xsl:call-template>
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
								<xsl:call-template name="CMV"><xsl:with-param name="PPLN"><xsl:value-of select="$PLN"/></xsl:with-param><xsl:with-param name="sdo">.phsAB</xsl:with-param></xsl:call-template>
								<xsl:call-template name="CMV"><xsl:with-param name="PPLN"><xsl:value-of select="$PLN"/></xsl:with-param><xsl:with-param name="sdo">.phsBC</xsl:with-param></xsl:call-template>							
								<xsl:call-template name="CMV"><xsl:with-param name="PPLN"><xsl:value-of select="$PLN"/></xsl:with-param><xsl:with-param name="sdo">.phsCA</xsl:with-param></xsl:call-template>
						</xsl:when>
						<!--DOs with generic CDC MV:Measured value-->
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
							<xsl:element name="UAObject" >
                <!--<xsl:message>Create DA Object for MV CDC with MX FC</xsl:message>-->
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/></xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/> DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="@daName"/> Data Attribute object</xsl:element>
								<References>
									<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>						
								</References>
							</xsl:element>
							<xsl:element name="UAObject" >
                <!--<xsl:message>Create mag DA object</xsl:message>-->
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.<xsl:value-of select="@daName"/>mag DA</xsl:element>
								<xsl:element name="Description"><xsl:value-of select="@daName"/>Magnitude Data Attribute object</xsl:element>
								<References>
									<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/><xsl:value-of select="@daName"/></Reference>
								</References>
							</xsl:element>
							<xsl:element name="UAVariable" >
                <!--<xsl:message>Create integer mag variable</xsl:message>-->
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.i</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.i</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.i DA</xsl:element>
								<xsl:element name="Description">Magnitude.Integer value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>-->
								</References>
                <!--
				        <Value>
					        <String/>
				        </Value>
                -->
							</xsl:element>
							<xsl:element name="UAVariable" >
                <!--<xsl:message>Create float mag variable</xsl:message>-->
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.f</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.f</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag.f DA</xsl:element>
								<xsl:element name="Description">Magnitude Floating point value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.<xsl:value-of select="@daName"/>.mag</Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>-->
								</References>
                <!--
				        <Value>
					        <String/>
				        </Value>
                -->
							</xsl:element>
							<!--<xsl:call-template name="QualityandTime"/>-->	
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
								<xsl:element name="UAObject" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									  <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									</References>
								</xsl:element>
							<!--<xsl:message>Create orCat variable for APC CDC</xsl:message>-->		
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
									<xsl:attribute name="DataType">i=7</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>-->
									<!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=SP</Reference>-->
									</References>
                  <!--
				          <Value>
					          <String/>
				          </Value>
                  -->
								</xsl:element>
							<!--<xsl:message>Create orIdent variable for APC CDC</xsl:message>-->								
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
									<xsl:attribute name="DataType">i=12</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>-->
									  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=SP</Reference>-->
									</References>
                  <!--
				          <Value>
					          <String/>
				          </Value>
                  -->
								</xsl:element>
							<!--<xsl:message>Create setMag variable for APC CDC</xsl:message>-->								
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.setMag</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.setMag</xsl:attribute>
									<xsl:attribute name="DataType">i=1</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.setMag</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>-->
									  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=SP</Reference>-->
									</References>
                  <!--
				          <Value>
					          <String/>
				          </Value>
                  -->
								</xsl:element>								
								<!--<xsl:call-template name="QualityandTime"/>-->	
							</xsl:when>	
							<!--DOs with generic CDC BAC-Binary controlled analog process value-->
							<xsl:when test="@doName=&apos;BndCtrChg&apos;
								or	@doName=&apos;SptChg&apos;
								or	@doName=&apos;ColChg&apos;">
							<!--<xsl:message>Create Object for BAC CDC</xsl:message>-->	
								<xsl:element name="UAObject" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									  <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									</References>
								</xsl:element>
							<!--<xsl:message>Create orCat variable for BAC CDC</xsl:message>-->		
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
									<xsl:attribute name="DataType">i=7</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>-->
									</References>
                  <!--
									<Value>
										<String/>
									</Value>
                  -->
								</xsl:element>
							<!--<xsl:message>Create orIdent variable for BAC CDC</xsl:message>-->										
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
									<xsl:attribute name="DataType">i=12</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>-->
									</References>
                  <!--
									<Value>
									  <String/>
									</Value>
                  -->
								</xsl:element>
							<!--<xsl:message>Create ctlNum variable for BAC CDC</xsl:message>-->	
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:attribute>
									<xsl:attribute name="DataType">i=2</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>-->
									</References>
                  <!--
									<Value>
									  <String/>
									</Value>
                  -->
								</xsl:element>	
							<!--<xsl:message>Create mxVal variable for BAC CDC</xsl:message>-->
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.mxVal</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.mxVal</xsl:attribute>
									<xsl:attribute name="DataType">i=7</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.mxVal</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>-->
									</References>
                  <!--
									<Value>
									  <String/>
									</Value>
                  -->
								</xsl:element>
							<!--<xsl:message>Create stSeld variable for BAC CDC</xsl:message>-->								
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stSeld</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stSeld</xsl:attribute>
									<xsl:attribute name="DataType">i=1</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stSeld</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>-->
									</References>
                  <!--
									<Value>
									  <String/>
									</Value>
                  -->
								</xsl:element>
							<!--<xsl:message>Create ctlVal variable for BAC CDC</xsl:message>-->								
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal</xsl:attribute>
									<xsl:attribute name="DataType">i=1</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal</xsl:element>
									<xsl:element name="Description">1 Control Value Data Attribute variable</xsl:element>
									<References>
									  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>-->
									  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=CO</Reference>-->
									</References>
                  <!--
								  <Value>
									  <String/>
									</Value>
                  -->
								</xsl:element>								
								<!--<xsl:call-template name="QualityandTime"/>-->	
							</xsl:when>	
							<!--DOs with generic CDC RST-Restriction-->
							<xsl:when test="@doName=&apos;ClsLim&apos;
								or	@doName=&apos;PwrRtgLim&apos;
								or	@doName=&apos;VRtgLim&apos;
								or	@doName=&apos;FlwRtgLim&apos;								
								or	@doName=&apos;ClsLim&apos;">
							<!--<xsl:message>Create ctlNum variable for RST CDC</xsl:message>-->	
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:attribute>
									<xsl:attribute name="DataType">i=2</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>-->
									</References>
                  <!--
									<Value>
									  <String/>
									</Value>
                  -->
								</xsl:element>							
								<xsl:element name="UAVariable" >
							<!--<xsl:message>Create mxVal variable for RST CDC</xsl:message>-->	
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.mxVal</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.mxVal</xsl:attribute>
									<xsl:attribute name="DataType">i=7</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.mxVal</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>-->
									</References>
                  <!--
									<Value>
									  <String/>
									</Value>
                  -->
								</xsl:element>						
								<!--<xsl:call-template name="QualityandTime"/>-->	
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
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.instVal</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.instVal</xsl:attribute>
									<xsl:attribute name="DataType">i=7</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.instVal</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>-->
									</References>
                  <!--
									<Value>
									  <String/>
									</Value>
                  -->
								</xsl:element>						
								<!--<xsl:call-template name="QualityandTime"/>-->	
							</xsl:when>	
							<!--DOs with generic CDC SEQ-Sequence-->
							<xsl:when test="@doName=&apos;SeqA&apos;
								or	@doName=&apos;SeqV&apos;
								or	@doName=&apos;DQ0Seq&apos;">
								
									<xsl:call-template name="CMV"><xsl:with-param name="sdo">.C1</xsl:with-param></xsl:call-template>
									<xsl:call-template name="CMV"><xsl:with-param name="sdo">.C2</xsl:with-param></xsl:call-template>							
									<xsl:call-template name="CMV"><xsl:with-param name="sdo">.C3</xsl:with-param></xsl:call-template>
							<!--<xsl:message>Create seqT variable for SAV CDC</xsl:message>-->										
								<xsl:element name="UAVariable" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.seqT</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.seqT</xsl:attribute>
									<xsl:attribute name="DataType">i=7</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.seqT</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
									<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
									<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
									<!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>-->
									</References>
                  <!--
									<Value>
									  <String/>
									</Value>
                  -->
								</xsl:element>						
								<!--<xsl:call-template name="QualityandTime"/>-->	
							</xsl:when>	
						<xsl:when test="@doName=&apos;Str&apos;">
							<xsl:element name="UAVariable" >
                <!--<xsl:message>Create general and dirGeneral phsA, B, C, and neut DA variables for ACD CDC with ST FC</xsl:message>-->
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.general</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.general</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.general DA</xsl:element>
								<xsl:element name="Description">Logical "or" of the phase values (='phsA' | 'phsB' | 'phsC' | 'neut') Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsA</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsA</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsA DA</xsl:element>
								<xsl:element name="Description">Phase A Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsB</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsB</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsB DA</xsl:element>
								<xsl:element name="Description">Phase B Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>	
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsC</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsC</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsC DA</xsl:element>
								<xsl:element name="Description">Phase C Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>	
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.neut</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.neut</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.neut DA</xsl:element>
								<xsl:element name="Description">Neutral Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
							<!--<xsl:call-template name="QualityandTime"/>-->
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirGeneral</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirGeneral</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirGeneral DA</xsl:element>
								<xsl:element name="Description">Direction of the fault regardless of phase Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>									
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirPhsA</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirPhsA</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.DirPhsA DA</xsl:element>
								<xsl:element name="Description">Direction of the fault for phase A Data Attribue variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>									
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirPhsB</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirPhsB</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirPhsB DA</xsl:element>
								<xsl:element name="Description">Direction of the fault for phase B Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>	
								<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirPhsC</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirPhsC</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirPhsC DA</xsl:element>
								<xsl:element name="Description">Direction of the fault for phase C Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                  <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>		
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirNeut</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirNeut</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.dirNeut DA</xsl:element>
								<xsl:element name="Description">Direction of the fault for neutral Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>										
						</xsl:when>
						<xsl:when test="@doName=&apos;ArcMod&apos;
							or @doName=&apos;AlmThm&apos;
							or @doName=&apos;Op&apos;
							or @doName=&apos;OpCls&apos;
							or @doName=&apos;OpEx&apos;
							or @doName=&apos;Tr&apos;">
							<xsl:element name="UAVariable" >
                <!--<xsl:message>Create origin DA object and DA variables for ACT CDC with ST FC</xsl:message>-->
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.general</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.general</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.general DA</xsl:element>
								<xsl:element name="Description">Logical "or" of the phase values (='phsA' | 'phsB' | 'phsC' | 'neut') Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsA</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsA</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsA DA</xsl:element>
								<xsl:element name="Description">Phase A Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsB</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsB</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsB DA</xsl:element>
								<xsl:element name="Description">Phase B Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>	
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsC</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsC</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.phsC DA</xsl:element>
								<xsl:element name="Description">Phase C Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>	
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.neut</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.neut</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.neut DA</xsl:element>
								<xsl:element name="Description">Neutral Data Attribute variable</xsl:element>
								  <References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
							<!--<xsl:call-template name="QualityandTime"/>-->
							<xsl:element name="UAObject" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin DA</xsl:element>
								<xsl:element name="Description">Originator Data Attribute object</xsl:element>
								<References>
								  <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.OrCat DA</xsl:element>
								<xsl:element name="Description">Originator Category Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
									<String/>
								</Value>
                -->
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.OrIdent DA</xsl:element>
								<xsl:element name="Description">Originator Identity Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>	
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.operTmPhsA</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.operTmPhsA</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.operTmPhsA DA</xsl:element>
								<xsl:element name="Description">Operation time for phase A Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>	
								<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.operTmPhsB</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.operTmPhsB</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.operTmPhsB DA</xsl:element>
								<xsl:element name="Description">Operation time for phase B Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>		
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.operTmPhsC</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.operTmPhsC</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.operTmPhsC DA</xsl:element>
								<xsl:element name="Description">Operation time for phase C Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>						
						</xsl:when>
						<!--DOs with generic CDC DPC-Controllable double point-->
						<xsl:when test="@doName=&apos;GnCtl&apos;
							or @doName=&apos;Pos&apos;
							or @doName=&apos;PosA&apos;
							or @doName=&apos;PosB&apos;
							or @doName=&apos;DPCSO1&apos;
							or @doName=&apos;PosC&apos;">	
							<xsl:element name="UAObject" >
                <!--<xsl:message>Create origin DA object and DA variables for DPC CDC with ST FC</xsl:message>-->
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin DA</xsl:element>
								<xsl:element name="Description">Originator Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								</References>
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.OrCat DA</xsl:element>
								<xsl:element name="Description">Originator Category Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
									<String/>
								</Value>
                -->
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.OrIdent DA</xsl:element>
								<xsl:element name="Description">Originator Identity Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>									
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:attribute>
								<xsl:attribute name="DataType">i=2</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum DA</xsl:element>
								<xsl:element name="Description">Control Number Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>							
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal DA</xsl:element>
								<xsl:element name="Description">1 Status Value Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								<!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stSeld</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stSeld</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stSeld DA</xsl:element>
								<xsl:element name="Description">Status Selected Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal DA</xsl:element>
								<xsl:element name="Description">2 Control Value Data Attribute variable</xsl:element>
								<References>
								<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=CO</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>								
							<!--<xsl:call-template name="QualityandTime"/>-->	
						</xsl:when>	
						<!--DOs with generic CDC ENC-Controllable enumerated status-->
						<xsl:when test="@doName=&apos;Mod&apos;
							or @doName=&apos;PmpCtl&apos;
							or @doName=&apos;FanCtlGen&apos;
							or @doName=&apos;FanCtl&apos;
							or @doName=&apos;OpModSyn&apos;">	
							<xsl:element name="UAObject" >
                <!--<xsl:message>Create origin DA object and DA variables for ENC CDC with ST FC</xsl:message>-->
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin DA</xsl:element>
								<xsl:element name="Description">Originator Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								</References>
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.OrCat DA</xsl:element>
								<xsl:element name="Description">Originator Category Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
									<String/>
								</Value>
                -->
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.OrIdent DA</xsl:element>
								<xsl:element name="Description">Originator Identity Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>									
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:attribute>
								<xsl:attribute name="DataType">i=2</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum DA</xsl:element>
								<xsl:element name="Description">Control Number Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>							
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal DA</xsl:element>
								<xsl:element name="Description">2 Status Value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>						
							<!--<xsl:call-template name="QualityandTime"/>-->	
						</xsl:when>	
						<!--DOs with generic CDC ENS-Controllable enumerated status-->
						<xsl:when test="@doName=&apos;TmSyn&apos;
							or @doName=&apos;StClcTun&apos;
							or @doName=&apos;RotDir&apos;
							or @doName=&apos;AdjSt&apos;
							or @doName=&apos;SptEndSt&apos;
							or @doName=&apos;FltLoop&apos;
							or @doName=&apos;TrBeh&apos;
							or @doName=&apos;MechHealth&apos;">	
						  <!--<xsl:message>Create .stVal DA variable for ENS CDC with ST FC</xsl:message>-->				
              <xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal DA</xsl:element>
								<xsl:element name="Description">3 Status Value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
            </xsl:when>  
							<!--<xsl:call-template name="QualityandTime"/>-->	
            <!--DOs with generic CDC ENS-Controllable enumerated status-->
						<xsl:when test="@doName=&apos;PhyHealth&apos;
							or @doName=&apos;Beh&apos;
							or @doName=&apos;Health&apos;
							or @doName=&apos;EEHealth&apos;
							or @doName=&apos;AutoRecSt&apos;
              and @daName=&apos;stVal&apos;">
              
						  <!--<xsl:message>Create DA variables for ENS CDC with ST FC</xsl:message>-->				
              <xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal DA</xsl:element>
								<xsl:element name="Description">3a Status Value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
              <xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.q</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.q</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.q DA</xsl:element>
								<xsl:element name="Description">Quality Value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
            </xsl:when>
            <!--DOs with generic CDC SPS-Single point status-->
						<xsl:when test="@doName=&apos;ACAlm&apos;
							or contains(@doName,&apos;Alm1&apos;)
							or contains(@doName,&apos;Alm2&apos;)
							or contains(@doName,&apos;Alm3&apos;)
							or contains(@doName,&apos;Alm4&apos;)
							or contains(@doName,&apos;Alm5&apos;)
							or contains(@doName,&apos;Alm6&apos;)
							or contains(@doName,&apos;Alm7&apos;)
							or contains(@doName,&apos;Alm8&apos;)
							or contains(@doName,&apos;Alm9&apos;)
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
							or contains(@doName,&apos;Ind1&apos;)
							or contains(@doName,&apos;Ind2&apos;)
							or contains(@doName,&apos;Ind3&apos;)
							or contains(@doName,&apos;Ind4&apos;)
							or contains(@doName,&apos;Ind5&apos;)
							or contains(@doName,&apos;Ind6&apos;)
							or contains(@doName,&apos;Ind7&apos;)
							or contains(@doName,&apos;Ind8&apos;)
							or contains(@doName,&apos;Ind9&apos;)
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

							<xsl:element name="UAVariable" >
                <!--<xsl:message>Create .stVal DA variable for SPS CDC with ST FC</xsl:message>-->
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal DA</xsl:element>
								<xsl:element name="Description">4 Status Value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
							<!--<xsl:call-template name="QualityandTime"/>-->	
						</xsl:when>
            <!--DOs with generic CDC SPS-Single point status-->
            <xsl:when test="@doName=&apos;AngInd&apos;
              or @doName=&apos;HzInd&apos;
              or @doName=&apos;Loc&apos;
							or @doName=&apos;Proxy&apos;
							or @doName=&apos;PwrUp&apos;
							or @doName=&apos;Rel&apos;
							or @doName=&apos;VInd&apos;
              and @daName=&apos;stVal&apos;">

              <!--<xsl:message>Create DA variables for SPS CDC with ST FC</xsl:message>-->
              <xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal DA</xsl:element>
								<xsl:element name="Description">4a Status Value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
              <xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.q</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.q</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.q DA</xsl:element>
								<xsl:element name="Description">Quality Value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
							<!--<xsl:call-template name="QualityandTime"/>-->	
						</xsl:when>
						<!--DOs with generic CDC SPS-Single point status-->
						<xsl:when test="@doName=&apos;ACAlm&apos;
							or contains(@doName,&apos;Alm1&apos;)
							or contains(@doName,&apos;Alm2&apos;)
							or contains(@doName,&apos;Alm3&apos;)
							or contains(@doName,&apos;Alm4&apos;)
							or contains(@doName,&apos;Alm5&apos;)
							or contains(@doName,&apos;Alm6&apos;)
							or contains(@doName,&apos;Alm7&apos;)
							or contains(@doName,&apos;Alm8&apos;)
							or contains(@doName,&apos;Alm9&apos;)
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
							or contains(@doName,&apos;Ind1&apos;)
							or contains(@doName,&apos;Ind2&apos;)
							or contains(@doName,&apos;Ind3&apos;)
							or contains(@doName,&apos;Ind4&apos;)
							or contains(@doName,&apos;Ind5&apos;)
							or contains(@doName,&apos;Ind6&apos;)
							or contains(@doName,&apos;Ind7&apos;)
							or contains(@doName,&apos;Ind8&apos;)
							or contains(@doName,&apos;Ind9&apos;)
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

							<xsl:element name="UAVariable" >
                <!--<xsl:message>Create .stVal DA variable for SPS CDC with ST FC</xsl:message>-->
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal DA</xsl:element>
								<xsl:element name="Description">5 Status Value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
							<!--<xsl:call-template name="QualityandTime"/>-->	
						</xsl:when>
            <xsl:when test="@fc=&apos;ST&apos; 
							and	(@doName=&apos;Pos&apos;)">
							<xsl:element name="UAObject" >
                <!--<xsl:message>Create origin DA object and DA variables for DPC CDC with ST FC</xsl:message>-->
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin DA</xsl:element>
								<xsl:element name="Description">Originator Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								</References>
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.OrCat DA</xsl:element>
								<xsl:element name="Description">Originator Category Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
									<String/>
								</Value>
                -->
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.OrIdent DA</xsl:element>
								<xsl:element name="Description">Originator Identity Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>									
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:attribute>
								<xsl:attribute name="DataType">i=2</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum DA</xsl:element>
								<xsl:element name="Description">Control Number Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>							
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal DA</xsl:element>
								<xsl:element name="Description">6 Status Value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stSeld</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stSeld</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stSeld DA</xsl:element>
								<xsl:element name="Description">Status Selected Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal DA</xsl:element>
								<xsl:element name="Description">3 Control Value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=CO</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>								
							<!--<xsl:call-template name="QualityandTime"/>-->	
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
							<xsl:element name="UAObject" >
                <!--<xsl:message>Create origin DA object and DA variables for SPC CDC with ST FC</xsl:message>-->
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin DA</xsl:element>
								<xsl:element name="Description">Originator Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								</References>
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.OrCat DA</xsl:element>
								<xsl:element name="Description">Originator Category Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
									<String/>
								</Value>
                -->
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.OrIdent DA</xsl:element>
								<xsl:element name="Description">Originator Identity Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>									
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:attribute>
								<xsl:attribute name="DataType">i=2</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum DA</xsl:element>
								<xsl:element name="Description">Control Number Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>							
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal DA</xsl:element>
								<xsl:element name="Description">7 Status Value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stSeld</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stSeld</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stSeld DA</xsl:element>
								<xsl:element name="Description">Status Selected Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal</xsl:attribute>
								<xsl:attribute name="DataType">i=1</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal DA</xsl:element>
								<xsl:element name="Description">4 Control Value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=CO</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>								
							<!--<xsl:call-template name="QualityandTime"/>-->	
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
							<xsl:element name="UAObject" >
                <!--<xsl:message>Create origin DA object and DA variables for INC CDC with ST FC</xsl:message>-->
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin DA</xsl:element>
								<xsl:element name="Description">Originator Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								</References>
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orCat</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.OrCat DA</xsl:element>
								<xsl:element name="Description">Originator Category Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
									<String/>
								</Value>
                -->
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.orIdent</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.origin.OrIdent DA</xsl:element>
								<xsl:element name="Description">Originator Identity Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>									
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum</xsl:attribute>
								<xsl:attribute name="DataType">i=3</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlNum DA</xsl:element>
								<xsl:element name="Description">Control Number Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>							
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal DA</xsl:element>
								<xsl:element name="Description">8 Status Value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal DA</xsl:element>
								<xsl:element name="Description">5 Control Value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=CO</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>									
							<!--<xsl:call-template name="QualityandTime"/>-->	
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
							<xsl:element name="UAVariable" >
                <!--<xsl:message>Create .stVal DA variable for INS CDC with ST FC</xsl:message>-->
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal DA</xsl:element>
								<xsl:element name="Description">9 Status Value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
							<!--<xsl:call-template name="QualityandTime"/>-->	
						</xsl:when>	
						<!--DOs with generic CDC BSC-Binary controlled step position information-->
						<xsl:when test="@fc=&apos;ST&apos; 
							and	(@doName=&apos;TapChg&apos;
							or @doName=&apos;PosChg&apos;)">
							<xsl:element name="UAVariable" >
							<!--<xsl:message>Create .stVal DA variable for BSC CDC with ST FC</xsl:message>-->
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal</xsl:attribute>
								<xsl:attribute name="DataType">String</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.stVal DA</xsl:element>
								<xsl:element name="Description">10 Status Value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
							<!--<xsl:message>Create stSeld variable for BSC CDC</xsl:message>-->								
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
									  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>-->
									</References>
                  <!--
									<Value>
									  <String/>
									</Value>
                  -->
							</xsl:element>
							<xsl:element name="UAVariable" >
							<!--<xsl:message>Create .valWTr DA variable for BSC CDC with ST FC</xsl:message>-->
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.valWTr</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.valWTr</xsl:attribute>
								<xsl:attribute name="DataType">String</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.valWTr DA</xsl:element>
								<xsl:element name="Description">WTr Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>	
							<!--<xsl:message>Create .ctlVal DA variable for BSC CDC with ST FC</xsl:message>-->
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal DA</xsl:element>
								<xsl:element name="Description">6 Control Value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=CO</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>								
							<!--<xsl:call-template name="QualityandTime"/>-->	
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
							<xsl:element name="UAVariable" >
                <!--<xsl:message>Create .actVal DA variable for BCR CDC with ST FC</xsl:message>-->
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.actVal</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.actVal</xsl:attribute>
								<xsl:attribute name="DataType">String</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.actVal DA</xsl:element>
								<xsl:element name="Description">Actual Value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
							<xsl:element name="UAVariable" >
							<!--<xsl:message>Create .frVal DA variable for BCR CDC with ST FC</xsl:message>-->
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.frVal</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.frVal</xsl:attribute>
								<xsl:attribute name="DataType">String</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.frVal DA</xsl:element>
								<xsl:element name="Description">frVal Value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
							<xsl:element name="UAVariable" >
							<!--<xsl:message>Create .frTm DA variable for BCR CDC with ST FC</xsl:message>-->
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.valWTr</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.valWTr</xsl:attribute>
								<xsl:attribute name="DataType">String</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.valWTr DA</xsl:element>
								<xsl:element name="Description">valWTr Value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
							<!--<xsl:call-template name="QualityandTime"/>-->	
						</xsl:when>
						<!--DOs with generic CDC ISC-Integer controlled step position information-->
						<xsl:when test="@doName=&apos;ColTapPos&apos;
							or @doName=&apos;TapPos&apos;">
							<!--<xsl:message>Create Object for ISC CDC</xsl:message>-->	
								<xsl:element name="UAObject" >
									<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
									<xsl:attribute name="BrowseName">1:<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin</xsl:attribute>
									<xsl:element name="DisplayName"><xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/>.origin</xsl:element>
									<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
									<References>
									  <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="@ldInst"/>/<xsl:value-of select="@prefix"/><xsl:value-of select="@lnClass"/><xsl:value-of select="@lnInst"/>.<xsl:value-of select="@doName"/></Reference>
									</References>
								</xsl:element>
							<!--<xsl:message>Create orCat variable for ISC CDC</xsl:message>-->		
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
									  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>-->
									</References>
                  <!--
									<Value>
										<String/>
									</Value>
                  -->
								</xsl:element>
	
							<!--<xsl:message>Create orIdent variable for ISC CDC</xsl:message>-->										
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
									  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>-->
									</References>
                  <!--
									<Value>
									  <String/>
									</Value>
                  -->
								</xsl:element>
							<!--<xsl:message>Create ctlNum variable for ISC CDC</xsl:message>-->	
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
									  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>-->
									</References>
                  <!--
									<Value>
									  <String/>
									</Value>
                  -->
								</xsl:element>	
							<!--<xsl:message>Create stSeld variable for ISC CDC</xsl:message>-->								
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
									  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>-->
									</References>
                  <!--
									<Value>
									  <String/>
									</Value>
                  -->
							</xsl:element>
							<xsl:element name="UAVariable" >	
							<!--<xsl:message>Create .valWTr DA variable for ISC CDC with ST FC</xsl:message>-->
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.valWTr</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.valWTr</xsl:attribute>
								<xsl:attribute name="DataType">String</xsl:attribute>
								<xsl:element name="DisplayName">xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.valWTr DA</xsl:element>
								<xsl:element name="Description">valWTr Value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>	
							<!--<xsl:message>Create .ctlVal DA variable for ISC CDC with ST FC</xsl:message>-->
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal</xsl:attribute>
								<xsl:attribute name="DataType">i=3</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.ctlVal DA</xsl:element>
								<xsl:element name="Description">7 Control Value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=CO</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>								
							<!--<xsl:call-template name="QualityandTime"/>-->	
						</xsl:when>	
						<!--DOs with generic CDC SEC-Security violation counting"-->
						<xsl:when test="@doName=&apos;AuthFail&apos;
							or @doName=&apos;AcsCtlFail&apos;
							or @doName=&apos;Ina&apos;
							or @doName=&apos;SvcViol&apos;">
							<xsl:element name="UAVariable" >
							<!--<xsl:message>Create cnt DA variable for SEC CDC with ST FC</xsl:message>-->
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.cnt</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.cnt</xsl:attribute>
								<xsl:attribute name="DataType">i=6</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.cnt DA</xsl:element>
								<xsl:element name="Description">Count Value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>	
							<!--<xsl:message>Create sev DA variable for SEC CDC with ST FC</xsl:message>-->							
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.sev</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.sev</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.sev DA</xsl:element>
								<xsl:element name="Description">sev Value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
							<!--<xsl:message>Create addr DA variable for SEC CDC with ST FC</xsl:message>-->							
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.addr</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.addr</xsl:attribute>
								<xsl:attribute name="DataType">i=7</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.addr DA</xsl:element>
								<xsl:element name="Description">addr Value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>
							<!--<xsl:message>Create addInfo DA variable for SEC CDC with ST FC</xsl:message>-->							
							<xsl:element name="UAVariable" >
								<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.addInfo</xsl:attribute>
								<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.addInfo</xsl:attribute>
								<xsl:attribute name="DataType">i=12</xsl:attribute>
								<xsl:element name="DisplayName"><xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/>.addInfo DA</xsl:element>
								<xsl:element name="Description">addInfo Value Data Attribute variable</xsl:element>
								<References>
								  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
								  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@fc"/>.<xsl:value-of select="@doName"/></Reference>
								  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
								  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=ST</Reference>-->
								</References>
                <!--
								<Value>
								  <String/>
								</Value>
                -->
							</xsl:element>		
							<!--<xsl:call-template name="QualityandTime"/>-->	
						</xsl:when>	
						<xsl:otherwise>
						<xsl:message>ERROR MESSAGE: This Data Object <xsl:value-of select="@doName"/> is not supported within the CID2UANodeset script</xsl:message>
						</xsl:otherwise>
					</xsl:choose>
			</xsl:for-each>
		</xsl:for-each-group>
	</xsl:template> 
<!--
Section 9
-->  
  <xsl:template name="CMV">
    <xsl:param name="PPLN"/>
		<xsl:param name="sdo"/>
		<xsl:if test="$sdo!=&apos;&apos;">
      <!--<xsl:message>Creating CMV <xsl:value-of select="$sdo"/></xsl:message>-->
				<UAObject>
					<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/></xsl:attribute>
					<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/></xsl:attribute>
					<xsl:element name="DisplayName"><xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/> DO</xsl:element>
					<xsl:element name="Description"><xsl:value-of select="$sdo"/> Data Object object</xsl:element>
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
				<xsl:element name="Description"><xsl:value-of select="$sdo"/>Deadbanded complex value Data Attribute object</xsl:element>
				<References>
				<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/></Reference>
				</References>
			</UAObject>
			<UAObject>
				<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag</xsl:attribute>
				<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag</xsl:attribute>
				<xsl:element name="DisplayName"><xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag DA</xsl:element>
				<xsl:element name="Description"><xsl:value-of select="$sdo"/>Deadbanded complex value magnitude Data Attribute object</xsl:element>
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
			<xsl:element name="Description">Deadbanded complex value magnitude integer value Data Attribute variable</xsl:element>
			<References>
			  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
			  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag</Reference>
			  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
			  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="@fc"/></Reference>-->
			</References>
      <!--
			<Value>
			  <String/>
			</Value>
      -->
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag.f</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag.f</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag.f</xsl:element>
			<xsl:element name="Description">Deadbanded complex value magnitude floating point value Data Attribute variable</xsl:element>
			<References>
			  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
			  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PPLN"/>.<xsl:value-of select="@doName"/><xsl:value-of select="$sdo"/>.cVal.mag</Reference>
			  <Reference ReferenceType="Organizes" IsForward="false">ns=1;s=DAs</Reference>
			  <!--<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=MX</Reference>-->
			</References>
      <!--
			<Value>
			  <String/>
			</Value>
      -->
		</UAVariable>
	</xsl:template>
<!--
  Section 10:
  Report control template
-->  
  <xsl:template name="ReportControl">
  <xsl:param name="PLN"/>
		<UAObject>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></xsl:attribute>
			<xsl:element name="DisplayName"><xsl:value-of select="@name"/> Report Control</xsl:element>
			<xsl:element name="Description"><xsl:value-of select="@desc"/></xsl:element>
			<References>
				<Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/></Reference>
				<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Report Controls</Reference>
				<Reference ReferenceType="HasTypeDefinition">ns=1;s=ReportControl</Reference>
			</References>
		</UAObject>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.datSet</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.datSet</xsl:attribute>
			<xsl:element name="DisplayName">datSet</xsl:element>
			<xsl:element name="Description">data Set shall be derived from the respective attribute in the BRCB</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@datSet"/>
				</String>
			</Value>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.rptID</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.rptID</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName">rptID</xsl:element>
			<xsl:element name="Description">Unique ID for the report</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@rptID"/>
				</String>
			</Value>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.confRev</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.confRev</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName">confRev</xsl:element>
      <xsl:element name="Description">Configuraiton Revision</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@confRev"/>
				</String>
			</Value>
		</UAVariable>
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.buffered</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.buffered</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName">buffered</xsl:element>
			<xsl:element name="Description">If TRUE, Report is Buffered</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></Reference>
			</References>
			<Value>
				<String>
					<xsl:value-of select="@buffered"/>
				</String>
			</Value>
		</UAVariable>
    <!--
		<UAVariable>
			<xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.GI</xsl:attribute>
			<xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/>.GI</xsl:attribute>
			<xsl:attribute name="DataType">i=12</xsl:attribute>
			<xsl:element name="DisplayName">GI</xsl:element>
			<xsl:element name="Description">General Interrogation: If TRUE, TrgOp General Interrogation then the report is issued</xsl:element>
			<References>
				<Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				<Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="@name"/></Reference>
			</References>
			<Value>
				<String>False</String>
			</Value>
		</UAVariable>
    -->
		<xsl:for-each select="nsSCL:TrgOps">
      <UAObject>
			  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps</xsl:attribute>
			  <xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps</xsl:attribute>
			  <DisplayName>TrgOps</DisplayName>
			  <Description>Report Trigger Options</Description>
			  <References>
				  <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/></Reference>
				  <!--<Reference ReferenceType="Organizes" IsForward="false">ns=1;s=Report Controls Trg Ops</Reference>-->
				  <Reference ReferenceType="HasTypeDefinition">ns=1;s=ReportControlTrgOps</Reference>
			  </References>
		  </UAObject>
		  <UAVariable>
			  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps.dchg</xsl:attribute>
			  <xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps.dchg</xsl:attribute>
			  <xsl:attribute name="DataType">i=12</xsl:attribute>
			  <xsl:element name="DisplayName">TrgOps.dchg</xsl:element>
			  <xsl:element name="Description">Data-change</xsl:element>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps</Reference>
			  </References>
			  <Value>
			    <uax:String>
				    <xsl:value-of select="@dchg"/>
			    </uax:String>
			  </Value>
		  </UAVariable>
		  <UAVariable>
			  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps.qchg</xsl:attribute>
			  <xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps.qchg</xsl:attribute>
			  <xsl:attribute name="DataType">i=12</xsl:attribute>
			  <xsl:element name="DisplayName">TrgOps.qchg</xsl:element>
			  <xsl:element name="Description">Quality-change</xsl:element>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps</Reference>
			  </References>
			  <Value>
			    <uax:String>
				    <xsl:value-of select="@qchg"/>
			    </uax:String>
			  </Value>
		  </UAVariable>
		  <UAVariable>
			  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps.dudp</xsl:attribute>
			  <xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps.dudp</xsl:attribute>
			  <xsl:attribute name="DataType">i=12</xsl:attribute>
			  <xsl:element name="DisplayName">TrgOps.dudp</xsl:element>
			  <xsl:element name="Description">Data-update</xsl:element>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps</Reference>
			  </References>
			  <Value>
			    <uax:String>
				    <xsl:value-of select="@dupd"/>
			    </uax:String>
			  </Value>
		  </UAVariable>
		  <UAVariable>
			  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps.period</xsl:attribute>
			  <xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps.period</xsl:attribute>
			  <xsl:attribute name="DataType">i=12</xsl:attribute>
			  <xsl:element name="DisplayName">TrgOps.period</xsl:element>
			  <xsl:element name="Description">integrity Period</xsl:element>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.TrgOps</Reference>
			  </References>
			  <Value>
			    <uax:String>
				    <xsl:value-of select="@period"/>
			    </uax:String>
			  </Value>
		  </UAVariable>
    </xsl:for-each>
    <xsl:for-each select="nsSCL:OptFields">
		  <UAObject>
			  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields</xsl:attribute>
			  <xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields</xsl:attribute>
			  <xsl:element name="DisplayName">OptFields</xsl:element>
			  <xsl:element name="Description">Report Optional Fields</xsl:element>
			  <References>
				  <Reference ReferenceType="HasComponent" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/></Reference>
				  <Reference ReferenceType="HasTypeDefinition">ns=1;s=ReportControlOptFields</Reference>
			  </References>
		  </UAObject>
		  <UAVariable>
			  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.seqNum</xsl:attribute>
			  <xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.seqNum</xsl:attribute>
			  <xsl:attribute name="DataType">i=12</xsl:attribute>
			  <xsl:element name="DisplayName">OptFields.seqNum</xsl:element>
			  <xsl:element name="Description">Sequence Number: If TRUE, SeqNum shall be included in the report</xsl:element>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields</Reference>
			  </References>
			  <Value>
			    <uax:String>
				    <xsl:value-of select="@seqNum"/>
			    </uax:String>
			  </Value>
		  </UAVariable>
		  <UAVariable>
			  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.timeStamp</xsl:attribute>
			  <xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.timeStamp</xsl:attribute>
			  <xsl:attribute name="DataType">String</xsl:attribute>
			  <xsl:element name="DisplayName">OptFields.timeStamp</xsl:element>
        <xsl:element name="Description">TimeStamp: If TRUE, TimeOfEntry shall be included in the report</xsl:element>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields</Reference>
			  </References>
			  <Value>
			    <uax:String>
				    <xsl:value-of select="@timeStamp"/>
			    </uax:String>
			  </Value>
		  </UAVariable>
		  <UAVariable>
			  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.dataSet</xsl:attribute>
			  <xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.dataSet</xsl:attribute>
			  <xsl:attribute name="DataType">i=12</xsl:attribute>
			  <xsl:element name="DisplayName">OptFields.dataSet</xsl:element>
			  <xsl:element name="Description">If TRUE, DatSet shall be included in the report</xsl:element>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields</Reference>
			  </References>
			  <Value>
			    <uax:String>
				    <xsl:value-of select="@dataSet"/>
			    </uax:String>
			  </Value>
		  </UAVariable>
		  <UAVariable>
			  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.reasonCode</xsl:attribute>
			  <xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.reasonCode</xsl:attribute>
			  <xsl:attribute name="DataType">i=12</xsl:attribute>
			  <xsl:element name="DisplayName">OptFields.reasonCode</xsl:element>
			  <xsl:element name="Description">If TRUE, ReasonCode shall be included in the report</xsl:element>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields</Reference>
			  </References>
			  <Value>
			    <uax:String>
				    <xsl:value-of select="@ReasonCode"/>
			    </uax:String>
			  </Value>
		  </UAVariable>
		  <UAVariable>
			  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.dataRef</xsl:attribute>
			  <xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.dataRef</xsl:attribute>
			  <xsl:attribute name="DataType">i=12</xsl:attribute>
			  <xsl:element name="DisplayName">OptFields.dataRef</xsl:element>
			  <xsl:element name="Description">If TRUE, DataRef or DataAttributeReference shall be included in the report</xsl:element>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields</Reference>
			  </References>
			  <Value>
			    <uax:String>
				    <xsl:value-of select="@DataRef"/>
			    </uax:String>
			  </Value>
		  </UAVariable>
      <!--
		  <UAVariable>
			  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.bufOvfl</xsl:attribute>
			  <xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.bufOvfl</xsl:attribute>
			  <xsl:attribute name="DataType">i=12</xsl:attribute>
			  <xsl:element name="DisplayName">OptFields.bufOvfl</xsl:element>
			  <xsl:element name="Description">If TRUE, shall indicate that a buffer overflow has occurred</xsl:element>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields</Reference>
			  </References>
			  <Value>
			    <uax:String>
				    <xsl:value-of select="@bufOvfl"/>
			    </uax:String>
			  </Value>
		  </UAVariable>
      -->
		  <UAVariable>
			  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.entryID</xsl:attribute>
			  <xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.entryID</xsl:attribute>
			  <xsl:attribute name="DataType">i=12</xsl:attribute>
			  <xsl:element name="DisplayName">OptFields.entryID</xsl:element>
			  <xsl:element name="Description">if TRUE, EntryID shall be included in the report</xsl:element>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields</Reference>
			  </References>
			  <Value>
			    <uax:String>
				    <xsl:value-of select="@EntryID"/>
			    </uax:String>
			  </Value>
		  </UAVariable>
		  <UAVariable>
			  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.ConfigRef</xsl:attribute>
			  <xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.ConfigRef</xsl:attribute>
			  <xsl:attribute name="DataType">i=12</xsl:attribute>
			  <xsl:element name="DisplayName">OptFields.ConfigRef</xsl:element>
			  <xsl:element name="Description">if TRUE, Configuration Reference shall be included in the report</xsl:element>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields</Reference>
			  </References>
			  <Value>
			    <uax:String>
				    <xsl:value-of select="@ConfigRef"/>
			    </uax:String>
			  </Value>
		  </UAVariable>
      <!--
		  <UAVariable>
			  <xsl:attribute name="NodeId">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.segmentation</xsl:attribute>
			  <xsl:attribute name="BrowseName">1:<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields.segmentation</xsl:attribute>
			  <xsl:attribute name="DataType">i=12</xsl:attribute>
			  <xsl:element name="DisplayName">OptFields.segmentation</xsl:element>
			  <xsl:element name="Description">If TRUE, segmentation shall be included in the report)</xsl:element>
			  <References>
				  <Reference ReferenceType="HasTypeDefinition">i=68</Reference>
				  <Reference ReferenceType="HasProperty" IsForward="false">ns=1;s=<xsl:value-of select="$PLN"/>.<xsl:value-of select="../@name"/>.OptFields</Reference>
			  </References>
			  <Value>
			    <uax:String>
				    <xsl:value-of select="@segmentation"/>
			    </uax:String>
			  </Value>
		  </UAVariable>
      -->
    </xsl:for-each>
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
			<xsl:attribute name="DataType">i=3</xsl:attribute>
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

