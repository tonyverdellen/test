<xsl:template name="SecurityAllocations" xmlns:ns0="servlet.sam.edscs.eds.com" xmlns:ns1="http://wsto.sam.edscs.eds.com" xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0" xmlns:sa="urn:esb.fs.es.com/stax/crm/sa/v1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:element name="sa:SecurityAllocations">
		<!--Looping Through Each securityAllocation-->
		<xsl:for-each select="//ns0:calculateLLVRResponse/ns0:calculateLLVRReturn/ns1:positionTO/ns1:requestTO/ns1:securityAllocation/ns0:item" >
			<xsl:element name="sa:SecurityAllocation">
				<xsl:element name="sa:stax_loanref">
					<xsl:value-of select="ns1:loanId"/>
				</xsl:element>
				<xsl:element name="sa:stax_securityref">
					<xsl:value-of select="ns1:securityId"/>
				</xsl:element>
				<xsl:element name="sa:stax_resultantallocationamount">
					<xsl:choose>
						<xsl:when test="((not(ns1:allocationAmountDefault/@xsi:nil='true')) and (not(ns1:allocationAmountDefault='0.0')))">
							<xsl:element name="sa:Value">
								<xsl:value-of select="ns1:allocationAmountDefault"/>
							</xsl:element>
						</xsl:when>
						<xsl:otherwise>
							<xsl:element name="sa:Value">
								<xsl:value-of select="'0.0'"/>
							</xsl:element>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:element>
				<xsl:element name="sa:stax_debtclassificationcode">
					<xsl:value-of select="ns1:debtClassificationCd"	/>
				</xsl:element>
				<xsl:element name="sa:stax_instrumentid">
					<xsl:value-of select="ns1:instrumentId"/>
				</xsl:element>
				<xsl:element name="sa:stax_sourcebusinessactivityid">
					<xsl:value-of select="ns1:srceBusinessActivityId	" />
				</xsl:element>
			</xsl:element>
		</xsl:for-each>
	</xsl:element>
</xsl:template>