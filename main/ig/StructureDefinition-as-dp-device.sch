<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile AsDeviceProfile
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:Device</sch:title>
    <sch:rule context="f:Device">
      <sch:assert test="count(f:extension[@url = 'https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-authorization']) &lt;= 1">extension with URL = 'https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-authorization': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:definition) &lt;= 0">definition: maximum cardinality of 'definition' is 0</sch:assert>
      <sch:assert test="count(f:udiCarrier) &lt;= 0">udiCarrier: maximum cardinality of 'udiCarrier' is 0</sch:assert>
      <sch:assert test="count(f:status) &gt;= 1">status: minimum cardinality of 'status' is 1</sch:assert>
      <sch:assert test="count(f:statusReason) &lt;= 0">statusReason: maximum cardinality of 'statusReason' is 0</sch:assert>
      <sch:assert test="count(f:distinctIdentifier) &lt;= 0">distinctIdentifier: maximum cardinality of 'distinctIdentifier' is 0</sch:assert>
      <sch:assert test="count(f:manufactureDate) &lt;= 0">manufactureDate: maximum cardinality of 'manufactureDate' is 0</sch:assert>
      <sch:assert test="count(f:expirationDate) &lt;= 0">expirationDate: maximum cardinality of 'expirationDate' is 0</sch:assert>
      <sch:assert test="count(f:lotNumber) &lt;= 0">lotNumber: maximum cardinality of 'lotNumber' is 0</sch:assert>
      <sch:assert test="count(f:deviceName) &lt;= 0">deviceName: maximum cardinality of 'deviceName' is 0</sch:assert>
      <sch:assert test="count(f:modelNumber) &lt;= 0">modelNumber: maximum cardinality of 'modelNumber' is 0</sch:assert>
      <sch:assert test="count(f:partNumber) &lt;= 0">partNumber: maximum cardinality of 'partNumber' is 0</sch:assert>
      <sch:assert test="count(f:specialization) &lt;= 0">specialization: maximum cardinality of 'specialization' is 0</sch:assert>
      <sch:assert test="count(f:version) &lt;= 0">version: maximum cardinality of 'version' is 0</sch:assert>
      <sch:assert test="count(f:property) &lt;= 0">property: maximum cardinality of 'property' is 0</sch:assert>
      <sch:assert test="count(f:patient) &lt;= 0">patient: maximum cardinality of 'patient' is 0</sch:assert>
      <sch:assert test="count(f:contact) &lt;= 0">contact: maximum cardinality of 'contact' is 0</sch:assert>
      <sch:assert test="count(f:location) &lt;= 0">location: maximum cardinality of 'location' is 0</sch:assert>
      <sch:assert test="count(f:url) &lt;= 0">url: maximum cardinality of 'url' is 0</sch:assert>
      <sch:assert test="count(f:note) &lt;= 0">note: maximum cardinality of 'note' is 0</sch:assert>
      <sch:assert test="count(f:safety) &lt;= 0">safety: maximum cardinality of 'safety' is 0</sch:assert>
      <sch:assert test="count(f:parent) &lt;= 0">parent: maximum cardinality of 'parent' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Device/f:meta</sch:title>
    <sch:rule context="f:Device/f:meta">
      <sch:assert test="count(f:extension[@url = 'https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-data-trace']) &lt;= 1">extension with URL = 'https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-data-trace': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
