<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile AsPractitionerRoleProfile
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:PractitionerRole</sch:title>
    <sch:rule context="f:PractitionerRole">
      <sch:assert test="count(f:extension[@url = 'https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-practitionerrole-contracted']) &lt;= 1">extension with URL = 'https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-practitionerrole-contracted': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-practitionerrole-hascas']) &lt;= 1">extension with URL = 'https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-practitionerrole-hascas': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-practitionerrole-vitale-accepted']) &lt;= 1">extension with URL = 'https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-practitionerrole-vitale-accepted': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:practitioner) &gt;= 1">practitioner: minimum cardinality of 'practitioner' is 1</sch:assert>
      <sch:assert test="count(f:specialty) &lt;= 0">specialty: maximum cardinality of 'specialty' is 0</sch:assert>
      <sch:assert test="count(f:healthcareService) &lt;= 0">healthcareService: maximum cardinality of 'healthcareService' is 0</sch:assert>
      <sch:assert test="count(f:availableTime) &lt;= 0">availableTime: maximum cardinality of 'availableTime' is 0</sch:assert>
      <sch:assert test="count(f:notAvailable) &lt;= 0">notAvailable: maximum cardinality of 'notAvailable' is 0</sch:assert>
      <sch:assert test="count(f:availabilityExceptions) &lt;= 0">availabilityExceptions: maximum cardinality of 'availabilityExceptions' is 0</sch:assert>
      <sch:assert test="count(f:endpoint) &lt;= 0">endpoint: maximum cardinality of 'endpoint' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:PractitionerRole/f:meta</sch:title>
    <sch:rule context="f:PractitionerRole/f:meta">
      <sch:assert test="count(f:extension[@url = 'https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-data-trace']) &lt;= 1">extension with URL = 'https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-data-trace': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
