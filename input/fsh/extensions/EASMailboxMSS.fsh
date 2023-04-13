Extension: 		EASMailboxMSS
Id: 			as-ext-mailbox-mss
Title:			"EAS Mailbox MSS"
Description: 	"Extension créée dans le cadre de l'annuaire santé pour décrire les boîtes aux lettres du service de messagerie sécurisée de santé (MSSanté) rattachées aux professionnels et aux structures."

* ^context[0].type = #element
* ^context[=].expression = "Practitioner"
* ^context[+].type = #element
* ^context[=].expression = "PractitionerRole"
* ^context[+].type = #element
* ^context[=].expression = "Organization"

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension ^min = 0

* extension contains
    value 0..1 MS and
    type 0..1 MS and
    description 0..1 MS and
    responsible 0..1 MS and
    service 0..1 MS and
    phone 0..1 MS and
    digitization 0..1 MS and
    publication 0..1 MS and
    date 0..* MS

* extension[value] ^short = "BAL MSS"
* extension[value].value[x] only string

* extension[type].value[x] only CodeableConcept
* extension[type].value[x] from $JDV-J139-TypeBAL-RASS (required)
* extension[type].value[x] ^definition = "Valeurs possibles :\r\nORG pour une BAL organisationnelle;\r\nAPP pour une BAL applicative;\r\nPER pour une BAL personnelle, rattachée à une personne physique"
* extension[type].value[x] ^binding.description = "Type de  boîte aux lettre MSS"
* extension[type].value[x].coding.system = "https://mos.esante.gouv.fr/NOS/TRE_R257-TypeBAL/FHIR/TRE-R257-TypeBAL" (exactly)

* extension[description].value[x] only string
* extension[description].value[x] ^short = "Description fonctionnelle de la boîte aux lettres"
* extension[responsible].value[x] only string
* extension[responsible].value[x] ^short = "Texte libre donnant les coordonnées de la (ou des) personne(s) responsable(s) au niveau opérationnel de la boîte aux lettres. Non renseigné pour les types de boîte aux lettres \"PER\"."

* extension[service].value[x] only string
* extension[service].value[x] ^short = "Nom et description du service de rattachement de l’utilisateur de la boîte aux lettres dans l’organisation."

* extension[phone].value[x] only string
* extension[phone].value[x] ^short = "Coordonnées téléphoniques spécifiques à l’usage de la boîte aux lettres MSSanté"

* extension[digitization].value[x] only boolean
* extension[digitization].value[x] ^short = "Indicateur d’acceptation de la dématérialisation (ou « Zéro papier »"
* extension[digitization].value[x] ^comment = "- O : Dématérialisation acceptée \r\n- N : Dématérialisation refusée"

* extension[publication].value[x] only boolean
* extension[publication].value[x] ^short = "ndicateur liste rouge"
* extension[publication].value[x] ^comment = "O: Boîte aux lettres en liste rouge;\r\nN: La boîte aux lettres peut être publiée"

* extension[date] ^min = 0
* extension[date].value[x] only Meta