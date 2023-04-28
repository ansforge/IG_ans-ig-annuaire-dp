Profile: AsOrganizationProfile
Parent: FrOrganization
Id: as-organization
Title: "As Organization Profile"
Description: "Profil créé à partir de la ressource FrOrganization dans le contexte de l'Annuaire Santé pour décrire les organismes du domaine sanitaire, médico-social et social immatriculés dans le fichier national des établissements sanitaires et sociaux (FINESS) ou dans le Système Informatique pour le Répertoire des Entreprises et de leurs Établissements (SIRENE) dédié aux entreprises, associations et organismes du secteur public."
// metadata
* meta.lastUpdated 1..1
// profils references
* partOf only Reference(AsOrganizationProfile)
// extensions
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    $digitalCertificate named organization-digitalCertificate 0..1 MS and
    $organization-pharmacyLicence named organization-pharmacyLicence 0..* MS and
    AsMailboxMSSExtension named organization-mailboxMSS 0..* MS
// donnees
* identifier MS 
* identifier ^comment = "Une instance par identifiant (FINESS, SIREN, SIRET, idNat_Struct…)"
* identifier.use = #official (exactly)
* identifier.type ^comment = "Les codes FINEJ, FINEG, SIREN, SIRET, IDNST, INTRN proviennent du system  http://interopsante.org/CodeSystem/fr-v2-0203 ; Les codes 0,4 proviennent du system https://mos.esante.gouv.fr/NOS/TRE_G07-TypeIdentifiantStructure/FHIR/TRE-G07-TypeIdentifiantStructure"
* identifier.system ^comment = "« urn:oid:1.2.250.1.71.4.2.2 » si l’instance correspond à l’identification nationale des structures (idNat_Struct) ; « http://sirene.fr» si l’instance correspond à un identifiant SIREN ou SIRET ; « http://finess.sante.gouv.fr» si l’instance correspond à un identifiant FINESS EG ou EJ ; « urn:oid:1.2.250.1.213.1.6.4.3 » si l’instance correspond à un identifiant ADELI rang ou RPPS rang; « https://annuaire.sante.fr » si l’instance correspond à l’identifiant technique de la structure;"
// raisonSociale
* name MS
* name ^short = "Raison Sociale de la strcuture"
// complementRaisonSociale
* alias MS
* alias ^short = "Enseigne commerciale de la structure"
// periode d'activite
* extension[usePeriod] ^sliceName = "usePeriod"
* extension[usePeriod].valuePeriod ^sliceName = "valuePeriod"
* extension[usePeriod].valuePeriod.start ^short = "Date d'ouverture de la structure"
* extension[usePeriod].valuePeriod.end ^short = "Date de fermeture de la structure"
// numeroLicence pour les officines
* extension[organization-pharmacyLicence] only $organization-pharmacyLicence
* extension[organization-pharmacyLicence] ^sliceName = "pharmacyLicence"
* extension[organization-pharmacyLicence] ^isModifier = false
// digitalCertificate
* extension[organization-digitalCertificate] ^isModifier = false
* extension[organization-digitalCertificate] ^short = "[DR] : certificat"
// champ d'activite de la structure
* type contains
    activiteINSEE 0..*  MS and
    statutJuridiqueINSEE 0..* MS and 
    SPH 0..* MS
// typeEtablissement	
* type[organizationType] ^sliceName = "organizationType"
* type[organizationType] ^short = "typeEtablissement"
* type[organizationType] ^comment = "Entitité Juridique : LEGAL-ENTITY; \r\nEntité Géographique : GEOGRAPHICAL-ENTITY"
// secteurActivite
* type[secteurActiviteRASS] ^sliceName = "secteurActivite"
* type[secteurActiviteRASS] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* type[secteurActiviteRASS] ^binding.extension.valueString = "OrganizationType"
* type[secteurActiviteRASS] ^binding.strength = #required
* type[secteurActiviteRASS] ^binding.description = "Un secteur d'activité regroupe les établissements partageant la même activité de santé"
// categorieEtablissement
* type[categorieEtablissementRASS] ^sliceName = "categorieEtablissement"
* type[categorieEtablissementRASS] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* type[categorieEtablissementRASS] ^binding.extension.valueString = "OrganizationType"
* type[categorieEtablissementRASS] ^binding.strength = #required
* type[categorieEtablissementRASS] ^binding.description = "La catégorie d'établissement est le cadre réglementaire dans lequel s'exerce l'activité de l'entité géographique"
// activiteINSEE
* type[activiteINSEE] from $JDV-J99-InseeNAFrav2Niveau5-RASS (required)
* type[activiteINSEE] ^sliceName = "activiteINSEE"
* type[activiteINSEE] ^comment = "Toute entité juridique et chacun de ses établissements (EG) se voit attribuer par l'Insee, lors de son inscription au répertoire SIRENE, un code caractérisant son activité principale par référence à la nomenclature d'activités française (NAF rév. 2).\r\nPlus précisément, on distingue le code APET pour les EG."
* type[activiteINSEE] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* type[activiteINSEE] ^binding.extension.valueString = "OrganizationType"
* type[activiteINSEE] ^binding.description = "Sous-classes de la Nomenclature d'Activités Française - INSEE"
// statutJuridiqueINSEE
* type[statutJuridiqueINSEE] from $JDV-J100-FinessStatutJuridique-RASS (required)
* type[statutJuridiqueINSEE] ^sliceName = "statutJuridiqueINSEE"
* type[statutJuridiqueINSEE] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* type[statutJuridiqueINSEE] ^binding.extension.valueString = "OrganizationType"
* type[statutJuridiqueINSEE] ^binding.description = "Statut juridique FINESS qui caracterise la situation juridique de la personne morale"
// modaliteParticipationSPH
* type[SPH] from $JDV-J162-ESPIC-RASS (required)
* type[SPH] ^sliceName = "modaliteParticipationSPH"
* type[SPH] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* type[SPH] ^binding.extension.valueString = "OrganizationType"
* type[SPH] ^binding.description = "Modalités de participation au service public hospitalier"
// adresse
* address only AsAddressExtendedProfile
// telecommunication
* telecom MS
* telecom ^comment = "Différentes instances pour les téléphones, la télécopie et l’adresse mail."
* telecom.system ^comment = "https://www.hl7.org/fhir/valueset-contact-point-system.html"
* telecom.use ^comment = "« old » si les coordonnées de structure ont une date de fin"
// Point(s) de contact 
* contact MS
// 
* endpoint MS
// boiteLettresMSS
* extension[organization-mailboxMSS] only AsMailboxMSSExtension
* extension[organization-mailboxMSS] ^sliceName = "mailboxMSS"
* extension[organization-mailboxMSS] ^isModifier = false
* extension[organization-mailboxMSS].extension ^slicing.discriminator.type = #value
* extension[organization-mailboxMSS].extension ^slicing.discriminator.path = "url"
* extension[organization-mailboxMSS].extension ^slicing.rules = #open
* extension[organization-mailboxMSS].extension[responsible] ^short = "[DR] : mailBoxMSS.responsable"
* extension[organization-mailboxMSS].extension[phone] ^short = "[DR] : mailBoxMSS.phone"
// lien EG/EJ
* partOf ^short = "Référence vers la structure de rattachement (lien EG/ EJ)"
* partOf ^comment = "Chaque entité geographique et ratachée à une entité juridique. C'est l'id de la ressource de l'entité juridique à laquelle est ratachée la structure qui est remontée dans l'element de référence partOf de l'entité géographique."
