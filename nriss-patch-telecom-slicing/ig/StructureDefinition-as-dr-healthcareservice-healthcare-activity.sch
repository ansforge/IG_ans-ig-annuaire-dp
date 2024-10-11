<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile AsHealthcareServiceHealthcareActivityProfile
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:HealthcareService</sch:title>
    <sch:rule context="f:HealthcareService">
      <sch:assert test="count(f:specialty) &lt;= 0">specialty: maximum cardinality of 'specialty' is 0</sch:assert>
      <sch:assert test="count(f:location) &lt;= 0">location: maximum cardinality of 'location' is 0</sch:assert>
      <sch:assert test="count(f:name) &lt;= 0">name: maximum cardinality of 'name' is 0</sch:assert>
      <sch:assert test="count(f:comment) &lt;= 0">comment: maximum cardinality of 'comment' is 0</sch:assert>
      <sch:assert test="count(f:extraDetails) &lt;= 0">extraDetails: maximum cardinality of 'extraDetails' is 0</sch:assert>
      <sch:assert test="count(f:photo) &lt;= 0">photo: maximum cardinality of 'photo' is 0</sch:assert>
      <sch:assert test="count(f:telecom) &lt;= 0">telecom: maximum cardinality of 'telecom' is 0</sch:assert>
      <sch:assert test="count(f:coverageArea) &lt;= 0">coverageArea: maximum cardinality of 'coverageArea' is 0</sch:assert>
      <sch:assert test="count(f:serviceProvisionCode) &lt;= 0">serviceProvisionCode: maximum cardinality of 'serviceProvisionCode' is 0</sch:assert>
      <sch:assert test="count(f:eligibility) &lt;= 0">eligibility: maximum cardinality of 'eligibility' is 0</sch:assert>
      <sch:assert test="count(f:program) &lt;= 0">program: maximum cardinality of 'program' is 0</sch:assert>
      <sch:assert test="count(f:communication) &lt;= 0">communication: maximum cardinality of 'communication' is 0</sch:assert>
      <sch:assert test="count(f:referralMethod) &lt;= 0">referralMethod: maximum cardinality of 'referralMethod' is 0</sch:assert>
      <sch:assert test="count(f:appointmentRequired) &lt;= 0">appointmentRequired: maximum cardinality of 'appointmentRequired' is 0</sch:assert>
      <sch:assert test="count(f:availableTime) &lt;= 0">availableTime: maximum cardinality of 'availableTime' is 0</sch:assert>
      <sch:assert test="count(f:notAvailable) &lt;= 0">notAvailable: maximum cardinality of 'notAvailable' is 0</sch:assert>
      <sch:assert test="count(f:availabilityExceptions) &lt;= 0">availabilityExceptions: maximum cardinality of 'availabilityExceptions' is 0</sch:assert>
      <sch:assert test="count(f:endpoint) &lt;= 0">endpoint: maximum cardinality of 'endpoint' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:HealthcareService/f:meta</sch:title>
    <sch:rule context="f:HealthcareService/f:meta">
      <sch:assert test="count(f:extension[@url = 'https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-data-trace']) &lt;= 1">extension with URL = 'https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-data-trace': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:HealthcareService/f:meta/f:extension</sch:title>
    <sch:rule context="f:HealthcareService/f:meta/f:extension">
      <sch:assert test="count(f:extension[@url = 'autorite-enregistrement']) &lt;= 1">extension with URL = 'autorite-enregistrement': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'systeme-information']) &lt;= 1">extension with URL = 'systeme-information': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'date-maj-ae']) &lt;= 1">extension with URL = 'date-maj-ae': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
