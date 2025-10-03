<xsl:template name="OverRideLVRDefaultPercentTemplate" xmlns:ns0="servlet.sam.edscs.eds.com" xmlns:ns1="http://wsto.sam.edscs.eds.com" xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0" xmlns:sa="urn:esb.fs.es.com/stax/crm/sa/v1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:element name="sa:Securities">
		<!--Looping Through Each SecurityLLVRTO-->
		<xsl:for-each select="//ns0:calculateLLVRResponse/ns0:calculateLLVRReturn/ns1:positionTO/ns1:requestTO/ns1:llvrSecurityTO/ns0:item" >
			<xsl:element name="sa:Security">
				<xsl:element name="sa:stax_SAMReference">
					<xsl:value-of select="ns1:securityId"/>

				</xsl:element>

				<xsl:variable name="var:lvpct_override" select="userCSharp:LogicalIsString(string(ns1:lvrPctOverrideReason/text()))" />
				<xsl:variable name="var:lvpct_default" select="userCSharp:LogicalNot(string($var:lvpct_override))" />

				<xsl:if test="string($var:lvpct_override)='true'">
					<xsl:variable name="var:lvpct_overrideval" select="ns1:lvrPctOverride/text()" />
					<xsl:element name="sa:stax_ResultantLvrPct">
						<xsl:value-of select="$var:lvpct_overrideval" />
					</xsl:element>
				</xsl:if>
				<xsl:if test="string($var:lvpct_default)='true'">
					<xsl:variable name="var:lvpct_defaultval" select="ns1:lvrPctDefault/text()" />
					<xsl:element name="sa:stax_ResultantLvrPct">
						<xsl:value-of select="$var:lvpct_defaultval" />
					</xsl:element>
				</xsl:if>

				<xsl:variable name="var:lv_override" select="userCSharp:LogicalIsString(string(ns1:lendingValueOverrideReason/text()))" />
				<xsl:variable name="var:lv_default" select="userCSharp:LogicalNot(string($var:lv_override))" />

				<xsl:if test="string($var:lv_override)='true'">
					<xsl:variable name="var:lv_overrideval" select="ns1:lendingValueOverride/text()" />
					<xsl:element name="sa:stax_ResultantLendingValue">
						<xsl:element name="sa:Value">
							<xsl:value-of select="$var:lv_overrideval" />
						</xsl:element>
					</xsl:element>
				</xsl:if>
				<xsl:if test="string($var:lv_default)='true'">
					<xsl:variable name="var:lv_defaultval" select="ns1:lendingValue/text()" />
					<xsl:element name="sa:stax_ResultantLendingValue">
						<xsl:element name="sa:Value">
							<xsl:value-of select="$var:lv_defaultval" />
						</xsl:element>
					</xsl:element>
				</xsl:if>
				<xsl:element name="sa:stax_ResultantAllocationAmount">
					<xsl:element name="sa:Value">
						<xsl:value-of select="ns1:securityExposureAmount"/>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:for-each>
	</xsl:element>
</xsl:template>